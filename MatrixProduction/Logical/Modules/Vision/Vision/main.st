
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
	mappView.wsPort 			:= 8084;
	mappView();	
	
END_PROGRAM

PROGRAM _CYCLIC
	
	//// Vision function configuration ////
	hwMatch.out.common.enable := TRUE;
	hwMatch.out.common.numSearchMax := 1;
	hwMatch.out.common.alignment := 0; // Alignment is not supported with smart sensor
	hwMatch.out.common.offsetROI.x := 0;
	hwMatch.out.common.offsetROI.y := 0;
	hwMatch.out.minScore := 90; // In percent
	hwMatch.out.maxOverlap := 0; // In percent
	hwMatch.out.timeout := 110; // Limit in milliseconds for match search 
	
	//// Camera configuration ////
	gVisionImage.CFG.EthDevice				:= 'IF2';			// Ethernet interface for the PLC, this is the IF where you go online
	
	gVisionSensor[0].CFG.VisionFunction		:= enumMatch;		// Used to run specific code for this vision function
	gVisionSensor[0].CFG.PowerlinkNode		:= 8;				// Powerlink node number
	gVisionSensor[0].CFG.DataStructure		:= ADR(gMatch);		// Global structures that holds all data related to this function
	gVisionSensor[0].CFG.ComponentLink		:= gCamera;			// Vision component name defined under mappVision in the configuration view
	
	//// Capturing image if requested and compensating for network delay ////
	PowerlinkCycle_us 		:= NettimeCurrent_us - NettimeLastCycle_us;
	NettimeLastCycle_us		:= NettimeCurrent_us;
	
	
	IF gVisionNettime.CMD.Activate THEN
		
		FOR camIdx := 0 TO NUM_CAMS DO
			
			imgTrigger[camIdx].pCameraHw := ADR(hwCam[camIdx]);
			
			//// Camera data (output from PLC) ////
			SetCamSettings_0.hwCamRef := ADR(hwCam[camIdx]);
			SetCamSettings_0.camIdx := camIdx;
			
			
			CASE visState[camIdx] OF 
							
				0: // Check if new image has been requested, indicated by rising edge
					IF EDGEPOS(imageRequested[camIdx]) THEN
						
						requestTimeStamp[camIdx] := NettimeCurrent_us;
						

						SetCamSettings_0.coverType := imgCoverType;
						
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
								// Create empty svg contour of the found shape, which is used as overlay in the HMI page
								overlay := '';
								additionArguments := ''; // Maybe change back to nothing
								
								// Check if blobs were found
								IF hwMatch.in.common.numResults <> 0 THEN
									// Assign bool depending on placement of detected shape
									flipProduct := (DINT_TO_INT(hwMatch.in.results[0].positionY/100) > cameraHeight/2);
									
									shapeCenterPoint.x := DINT_TO_LREAL(hwMatch.in.results[0].positionX/100);
									shapeCenterPoint.y := DINT_TO_LREAL(hwMatch.in.results[0].positionY/100);
								
									brdkViGeom_drawSvgCircle(shapeCenterPoint, 15, ADR(overlay), ADR(additionArguments));
									
								END_IF
									
						END_CASE
						
						resultReady[camIdx] := TRUE;
						visState[camIdx] := 0;
						
					END_IF
					
			END_CASE
			
			IF imgTrigger[camIdx].newImage AND camIdx = 0 THEN
				// Display image for camera 0 via mappView server
				mappView.updateImage := TRUE;
			END_IF
			
			// -----------------------------------------------------------------------------------------------------------
			// Display camera status in hex - documentation is also in hex
			// -----------------------------------------------------------------------------------------------------------
			IF hwCam[camIdx].in.status.cameraStatus = 0 THEN // Display only a single 0
				statusText[camIdx] := '0';
			ELSIF gVisionSensor[camIdx].DAT.Status = 16#00000001 THEN
				statusText[camIdx] := 'Image acquisition';
			ELSIF hwCam[camIdx].in.status.cameraStatus = 16#00000002 THEN
				statusText[camIdx] := 'Waiting trigger';
			ELSIF hwCam[camIdx].in.status.cameraStatus = 16#00000010 THEN
				statusText[camIdx] := 'Searching settings';
			ELSIF hwCam[camIdx].in.status.cameraStatus = 16#00000080 THEN
				statusText[camIdx] := 'Setting focus';
			ELSIF hwCam[camIdx].in.status.cameraStatus = 16#00000090 THEN
				statusText[camIdx] := 'Searching settings';
			ELSIF hwCam[camIdx].in.status.cameraStatus = 16#00000800 THEN
				statusText[camIdx] := 'Cam CPU not ready';
			ELSIF hwCam[camIdx].in.status.cameraStatus = 16#00001000 THEN
				statusText[camIdx] := 'Cam sensor not ready';
			ELSIF hwCam[camIdx].in.status.cameraStatus = 16#02000000 THEN
				statusText[camIdx] := 'OS check/update';
			ELSIF hwCam[camIdx].in.status.cameraStatus = 16#80000000 THEN
				statusText[camIdx] := 'Vision cockpit active';
			ELSE // Display the status in hex format 0x02000800
				statusText[camIdx] := '';
				FOR i := 0 TO 28 BY 4 DO
					statusText[camIdx] := CONCAT(MID(HexTab, 1, LIMIT(1, UDINT_TO_INT((SHR(hwCam[camIdx].in.status.cameraStatus, i) AND 16#0000000F) + 1), 16)), statusText[camIdx]);
				END_FOR
				statusText[camIdx] := CONCAT('0x', statusText[camIdx]);
			END_IF			
			
			IF TOF_Light[camIdx].Q THEN
				
				TOF_Light[camIdx].IN := FALSE;
				hwCam[camIdx].out.par.statusLED	:= 4; // BRDKVIBASE_CAM_STATUS_BLUE does not match datasheet
				
			ELSIF hwCam[camIdx].in.status.imageAcquisitionReady AND hwCam[camIdx].in.common.moduleOk THEN
				
				hwCam[camIdx].out.par.statusLED	:= BRDKVIBASE_CAM_STATUS_GREEN;
				
			ELSE
				
				hwCam[camIdx].out.par.statusLED	:= 3; // BRDKVIBASE_CAM_STATUS_RED does not match datasheet
				
			END_IF
			
			// FB calls
			TOF_Light[camIdx]();
			imgTrigger[camIdx]();
			SetCamSettings_0();
			
			mappView.pMappLink := ADR(gCamera);
			mappView();

		END_FOR
	
	END_IF	

	
END_PROGRAM

PROGRAM _EXIT
	mappView(enable := FALSE);
	 
END_PROGRAM

