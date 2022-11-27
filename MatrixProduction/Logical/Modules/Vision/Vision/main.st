
PROGRAM _INIT

	//// Reset variables ////
	FOR camIdx := 0 TO NUM_CAMS DO
		imageRequested[camIdx] := FALSE;
		requestTimeStamp[camIdx] := 0;
		durationToCamera[camIdx] := 0;
		resultReady[camIdx] := FALSE;
		TOF_Light[camIdx].IN := FALSE;
		TOF_Light[camIdx].PT := REAL_TO_TIME(500);
		visState[camIdx] := 0;
	END_FOR
	
	
	//// gVisionNettime Configuration ////
	gVisionNettime.CMD.Activate					:= TRUE;
	gVisionNettime.CFG.AxisPeriod				:= 360; // Needs also to be set in the axis configuration
	gVisionNettime.CFG.AxisPositionDelay_Cycles	:= 1; 	// Number of PLK cycles which the axis position is old when it comes to this task (Time from encoder to now in this task)
	gVisionNettime.CFG.VisionPreTrigger_Cycles	:= 8; 	// Number of powerlink cycles the trigger has to be send ahead, 4 is a good value.
	
	
	//// mappView Configuration ////
	mappView.enable 			:= TRUE;
	mappView.getImageArray 		:= FALSE;
	mappView.imageFormat 		:= BRDKVIIMG_IMG_TYPE_JPEG;
	mappView.jpegQuality 		:= 50;
	mappView.timeout 			:= 3000;
	mappView.wsPort 			:= 18000;
	mappView();	
	
END_PROGRAM

PROGRAM _CYCLIC
	
	//// Vision function configuration ////
	hwBlob.out.common.enable := TRUE;
	hwBlob.out.common.numSearchMax := 1;
	hwBlob.out.common.offsetROI.x := 0;
	hwBlob.out.common.offsetROI.y := 0;
	hwBlob.out.enhancedBlobInformation := 0;
	hwBlob.out.regionFeatures := TRUE;
	
	
	//// Camera configuration ////
	gVisionSensor[0].CFG.VisionFunction		:= enumBlob;		// Used to run specific code for this vision function
	gVisionSensor[0].CFG.PowerlinkNode		:= 8;				// Powerlink node number
	gVisionSensor[0].CFG.DataStructure		:= ADR(gBlob);		// Global structures that holds all data related to this function
	gVisionSensor[0].CFG.ComponentLink		:= gCamera;			// Vision component name defined under mappVision in the configuration view
	
	gVisionImage.CFG.EthDevice				:= 'IF2';			// Ethernet interface for the PLC, this is the IF where you go online
	
	
	//// Camera data (output from PLC) ////
	hwCam[0].out.par.exposureTime			:= 1000; 	// SUSCEPTIBLE TO CHANGE
	hwCam[0].out.par.flashColor				:= 4; 		// 4: LIME (See help function "Image acquisition parameters (cyclic write)" for other alternatives)
	hwCam[0].out.par.flashSegment			:= 15; 		// Binary 1111 (all segments are turned on)
	hwCam[0].out.par.focus					:= 460; 	// Camera FocusScale is defined in mm
	hwCam[0].out.par.gainLevel				:= 1; 		// Gain factor	
	
	
	//// Capturing image if requested and compensating for network delay ////
	PowerlinkCycle_us 		:= NettimeCurrent_us - NettimeLastCycle_us;
	NettimeLastCycle_us		:= NettimeCurrent_us;
	
	
	IF gVisionNettime.CMD.Activate THEN
		
		FOR camIdx := 0 TO NUM_CAMS DO
			
			imgTrigger[camIdx].pCameraHw := ADR(hwCam[camIdx]);
			
			CASE visState[camIdx] OF 
							
				0: // Check if new image has been requested, indicated by rising edge
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
						IF hwCam[camIdx].in.status.imageAcquisitionReady AND NOT hwCam[camIdx].in.status.imageProcessingActive THEN
							
							imgTrigger[camIdx].trigger := TRUE;
							imgTrigger[camIdx].delayNettime	:= gVisionNettime.DAT.NettimeNext_us;
							TOF_Light[camIdx].IN := TRUE;
						
						ELSE
							
							gVisionNettime.DAT.Overflow := gVisionNettime.DAT.Overflow + 1;
						
						END_IF
						
						visState[camIdx] := 30;
					
					END_IF
				
				30: // Return data when image has been processed and update image
									
					// Check if image processing is completed, indicated by falling edge
					IF EDGENEG(hwCam[camIdx].in.status.imageProcessingActive) THEN
				
						CASE camIdx OF
							
							0: 
								// Assign bool depending on placement of BLOB
								flipOrder := (DINT_TO_INT(hwBlob.in.results[0].positionX/100) > cameraWidth/2);
							
								// Create svg contour of the found blob, which is used as overlay in the HMI page
								overlay := '';
								additionArguments := '';
								
								cornerA.x := DINT_TO_LREAL(hwBlob.in.results[0].xMin);
								cornerA.y := DINT_TO_LREAL(hwBlob.in.results[0].yMin);
								
								cornerB.x := DINT_TO_LREAL(hwBlob.in.results[0].xMax);
								cornerB.y := DINT_TO_LREAL(hwBlob.in.results[0].yMin);
								
								cornerC.x := DINT_TO_LREAL(hwBlob.in.results[0].xMax);
								cornerC.y := DINT_TO_LREAL(hwBlob.in.results[0].yMax);
								
								cornerD.x := DINT_TO_LREAL(hwBlob.in.results[0].xMin);
								cornerD.y := DINT_TO_LREAL(hwBlob.in.results[0].yMax);
								
								brdkViGeom_drawSvgRect(cornerA, cornerB, cornerC, cornerD, ADR(overlay), ADR(additionArguments));
					
						END_CASE
						
						resultReady[camIdx] := TRUE;
						visState[camIdx] := 0;
						
					END_IF
					
				END_CASE
			
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

			// imgTrigger.newImage is true for one cycle if new results are ready. Currently we only display image for first (and currently only) camera
			IF imgTrigger[0].newImage THEN
				
				mappView.updateImage := TRUE;
				
			END_IF
			
			
			TOF_Light[camIdx].IN := FALSE;
			
			IF TOF_Light[camIdx].Q THEN
				
				hwCam[camIdx].out.par.statusLED	:= BRDKVIBASE_CAM_STATUS_BLUE;  
				
			ELSE
				
				hwCam[camIdx].out.par.statusLED	:= BRDKVIBASE_CAM_STATUS_GREEN;
				
			END_IF
			
			TOF_Light[camIdx]();
			
			imgTrigger[camIdx]();
			
			mappView.pMappLink := ADR(gCamera);
			mappView();

		END_FOR
	
	END_IF	

	
END_PROGRAM

PROGRAM _EXIT
	mappView(enable := FALSE);
	 
END_PROGRAM

