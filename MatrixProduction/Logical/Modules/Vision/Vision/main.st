
PROGRAM _INIT
	// Reset variables
	FOR camIdx := 0 TO NUM_CAMS DO
		imageRequested[camIdx] := FALSE;
		requestTimeStamp[camIdx] := 0;
		durationToCamera[camIdx] := 0;
		resultReady[camIdx] := FALSE;
		visState[camIdx] := 0;
	END_FOR
		
	gVisionNettime.CMD.Activate					:= TRUE;
	gVisionNettime.CFG.AxisPeriod				:= 360; // Needs also to be set in the axis configuration
	gVisionNettime.CFG.AxisPositionDelay_Cycles	:= 1; 	// Number of PLK cycles which the axis position is old when it comes to this task (Time from encoder to now in this task)
	gVisionNettime.CFG.VisionPreTrigger_Cycles	:= 8; 	// Number of powerlink cycles the trigger has to be send ahead, 4 is a good value.
	
	mappView.enable 			:= TRUE;

	mappView.getImageArray 		:= FALSE;
	mappView.imageFormat 		:= BRDKVIIMG_IMG_TYPE_JPEG;
	mappView.jpegQuality 		:= 50;
	mappView.timeout 			:= 3000;
	mappView.wsPort 			:= 18000;
	mappView();	
	
END_PROGRAM

PROGRAM _CYCLIC
	
	// -----------------------------------------------------------------------------------------------------------
	// Vision Function Configuration 
	// -----------------------------------------------------------------------------------------------------------
	blobInput.enable := TRUE;
	blobInput.numSearchMax := 1;
	blobInput.offsetROIX := 0;
	blobInput.offsetROIY := 0;
	
	// -----------------------------------------------------------------------------------------------------------
	// Vision Sensor Configuration.
	// -----------------------------------------------------------------------------------------------------------
	
	gVisionImage.CFG.EthDevice				:= 'IF2';			// Ethernet interface for the PLC, this is the IF where you go online
	
	// Camera configuration
	gVisionSensor[0].CFG.VisionFunction		:= enumBlob;		// Used to run specific code for this vision function
	gVisionSensor[0].CFG.PowerlinkNode		:= 8;				// Powerlink node number
	gVisionSensor[0].CFG.DataStructure		:= ADR(gBlob);		// Global structures that holds all data related to this function
	gVisionSensor[0].CFG.ComponentLink		:= gCamera;			// Vision component name defined under mappVision in the configuration view
	
	// Camera data
	hwCam.out.par.exposureTime			:= 1000; 	// SUSCEPTIBLE TO CHANGE
	hwCam.out.par.flashColor			:= 4; 		// 4: LIME (See help function "Image acquisition parameters (cyclic write)" for other alternatives)
	hwCam.out.par.flashSegment		:= 15; 		// Binary 1111 (all segments are turned on)
	hwCam.out.par.focus				:= 460; 	// SUSCEPTIBLE TO CHANGE - Camera FocusScale is defined in mm
	hwCam.out.par.gainLevel				:= 1; 	
	hwCam.out.par.statusLED :=  BRDKVIBASE_CAM_STATUS_RED; // Gain factor 1
	//gVisionSensor[0].DAT.MaxItemCnt		:= RecipeData.Cam[i].MaxItemCnt; 	// Already has default value
	//gVisionSensor[0].DAT.Timeout			:= RecipeData.Cam[i].Timeout; 		// Already has default value
	
	// -----------------------------------------------------------------------------------------------------------
	// Capturing image if requested and compensating for network delay
	// -----------------------------------------------------------------------------------------------------------
	PowerlinkCycle_us			:= NettimeCurrent_us - NettimeLastCycle_us;
	NettimeLastCycle_us			:= NettimeCurrent_us;
	
	IF gVisionNettime.CMD.Activate THEN
		
		FOR camIdx := 0 TO NUM_CAMS DO
		
			CASE visState[camIdx] OF 
						
				0: // Check if new image has been requested
					IF EDGEPOS(imageRequested[camIdx]) THEN
						requestTimeStamp[camIdx] := NettimeCurrent_us;
						resultReady[camIdx] := FALSE;
						visState[camIdx] := 10;
					END_IF
						
				10: // Capture image at the right time window, which is determined by pretrigger cycles using current estimation of PowerlinkCycle_us
					TriggerTimeDelta_us[camIdx] := (durationToCamera[camIdx]) - (NettimeCurrent_us - requestTimeStamp[camIdx]);
				
					IF (TriggerTimeDelta_us[camIdx] >= (gVisionNettime.CFG.VisionPreTrigger_Cycles) * PowerlinkCycle_us)  AND
						(TriggerTimeDelta_us[camIdx] <= (gVisionNettime.CFG.VisionPreTrigger_Cycles + 1) * PowerlinkCycle_us) THEN
					
						gVisionNettime.DAT.NettimeNext_us	:= NettimeCurrent_us + TriggerTimeDelta_us[camIdx];
						gVisionNettime.DAT.NettimeDelta_us	:= TriggerTimeDelta_us[camIdx];
					
						// Transfer nettime to sensor and fire trigger
						IF gVisionSensor[camIdx].HW.Ready AND NOT gVisionSensor[camIdx].DAT.ImageProcessingActive THEN
							imgTrigger.trigger	:= TRUE;
							imgTrigger.delayNettime	:= gVisionNettime.DAT.NettimeNext_us;
						ELSE
							gVisionNettime.DAT.Overflow := gVisionNettime.DAT.Overflow + 1;
						END_IF
						
						visState[camIdx] := 0;
					
					END_IF	
				
						
			END_CASE
			
			IF imgTrigger.newImage THEN
				// NEW RESULTS READY'
				mappView.updateImage := TRUE;
				CASE camIdx OF
					0: 
						// Check if bottom cover must be flipped
							IF DINT_TO_INT(blobOutput.positionX/100) > cameraWidth/2 THEN
								flipOrder := TRUE;
							END_IF
					END_CASE
						
					resultReady[camIdx] := TRUE;
					visState[camIdx] := 0;				
			END_IF
			
			// ImageNettime is the total image processing and processing time of the captured image. 
			// ImageNettime changes with each additional captured image, so we compare with oldImageNettime and update mappView if it is different from current
		
							
	

			// -----------------------------------------------------------------------------------------------------------
			// Display camera status in hex - documentation is also in hex
			// -----------------------------------------------------------------------------------------------------------
			IF gVisionSensor[camIdx].DAT.Status = 0 THEN // Display only a single 0
				gVisionSensor[camIdx].DAT.StatusText := '0';
			ELSIF gVisionSensor[camIdx].DAT.Status = 16#00000001 THEN
				gVisionSensor[camIdx].DAT.StatusText := 'Image acquisition';
			ELSIF gVisionSensor[camIdx].DAT.Status = 16#00000002 THEN
				gVisionSensor[camIdx].DAT.StatusText := 'Waiting trigger';
			ELSIF gVisionSensor[camIdx].DAT.Status = 16#00000010 THEN
				gVisionSensor[camIdx].DAT.StatusText := 'Searching settings';
			ELSIF gVisionSensor[camIdx].DAT.Status = 16#00000080 THEN
				gVisionSensor[camIdx].DAT.StatusText := 'Setting focus';
			ELSIF gVisionSensor[camIdx].DAT.Status = 16#00000090 THEN
				gVisionSensor[camIdx].DAT.StatusText := 'Searching settings';
			ELSIF gVisionSensor[camIdx].DAT.Status = 16#00000800 THEN
				gVisionSensor[camIdx].DAT.StatusText := 'Cam CPU not ready';
			ELSIF gVisionSensor[camIdx].DAT.Status = 16#00001000 THEN
				gVisionSensor[camIdx].DAT.StatusText := 'Cam sensor not ready';
			ELSIF gVisionSensor[camIdx].DAT.Status = 16#02000000 THEN
				gVisionSensor[camIdx].DAT.StatusText := 'OS check/update';
			ELSIF gVisionSensor[camIdx].DAT.Status = 16#80000000 THEN
				gVisionSensor[camIdx].DAT.StatusText := 'Vision cockpit active';
			ELSE // Display the status in hex format 0x02000800
				gVisionSensor[camIdx].DAT.StatusText := '';
				FOR i := 0 TO 28 BY 4 DO
					gVisionSensor[camIdx].DAT.StatusText := CONCAT(MID(HexTab, 1, LIMIT(1, UDINT_TO_INT((SHR(gVisionSensor[camIdx].DAT.Status, i) AND 16#0000000F) + 1), 16)), gVisionSensor[camIdx].DAT.StatusText);
				END_FOR
				gVisionSensor[camIdx].DAT.StatusText := CONCAT('0x', gVisionSensor[camIdx].DAT.StatusText);
			END_IF

			// -----------------------------------------------------------------------------------------------------------
			// Check if vision cockpit is open
			// -----------------------------------------------------------------------------------------------------------
			//gVisionSensor[camIdx].DAT.CockpitIsActive := (gVisionSensor[camIdx].DAT.Status AND 16#8000_0000) > 0;
			
			// -----------------------------------------------------------------------------------------------------------
			// Reset trigger when timed out
			// -----------------------------------------------------------------------------------------------------------
//			IF gVisionSensor[camIdx].CMD.ImageTrigger THEN
//				TriggerTimeout[camIdx].IN := TRUE;
//				TriggerTimeout[camIdx].PT := REAL_TO_TIME(gVisionSensor[camIdx].DAT.Timeout * 1.25);
//				IF TriggerTimeout[camIdx].Q THEN
//					gVisionSensor[camIdx].CMD.ImageTrigger			:= FALSE;
//					gVisionSensor[camIdx].CMD.ImageTriggerReset		:= TRUE;
//					gVisionSensor[camIdx].DAT.Active				:= FALSE;
//				END_IF
//			ELSE
//				TriggerTimeout[camIdx].IN := FALSE;
//				gVisionSensor[camIdx].CMD.ImageTriggerReset := FALSE;
//			END_IF
			imgTrigger();
			TriggerTimeout[camIdx]();
			mappView.pMappLink 			:= ADR(gCamera);
			mappView();
			
			//overlay='';
			//brdkViGeom_drawSvgRect(

		END_FOR
	
	END_IF	

	
END_PROGRAM

PROGRAM _EXIT
	mappView(enable := FALSE);
	 
END_PROGRAM

