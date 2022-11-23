
PROGRAM _INIT
		
	gVisionNettime.CMD.Activate					:= TRUE;
	gVisionNettime.CFG.AxisPeriod				:= 360; // Needs also to be set in the axis configuration
	gVisionNettime.CFG.AxisPositionDelay_Cycles	:= 1; 	// Number of PLK cycles which the axis position is old when it comes to this task (Time from encoder to now in this task)
	gVisionNettime.CFG.VisionPreTrigger_Cycles	:= 8; 	// Number of powerlink cycles the trigger has to be send ahead, 4 is a good value.
	
	mappView.maxSvgImageLength 	:= SIZEOF(imageSvg);
	mappView.enable 			:= TRUE;
	mappView.cameraIp 			:= '192.168.200.8';
	mappView.getImageArray 		:= FALSE;
	mappView.timeout 			:= 3000;
	
	mappView();
	
	TON_Wait.PT := REAL_TO_TIME(1000);
	
END_PROGRAM

PROGRAM _CYCLIC
	
	//Determine duration from workstation 2 to departure point using equation of motion
	durationWs2ToDeparture := REAL_TO_DINT(2*SQRT((2*0.060)/shuttleAcceleration)*1000000); // in microseconds
	
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
	
	gVisionImage.CFG.EthDevice								:= 'IF2';			// Ethernet interface for the PLC, this is the IF where you go online
	
	// Configuration for blob
	gVisionSensor[visSelectedSensor].CFG.VisionFunction		:= enumBlob;		// Used to run specific code for this vision function
	gVisionSensor[visSelectedSensor].CFG.PowerlinkNode		:= 8;				// Powerlink node number
	gVisionSensor[visSelectedSensor].CFG.DataStructure		:= ADR(gBlob);		// Global structures that holds all data related to this function
	gVisionSensor[visSelectedSensor].CFG.ComponentLink		:= gCamera;			// Vision component name defined under mappVision in the configuration view
	
	// Camera configuration
	gVisionSensor[visSelectedSensor].FCT.ApplicationName	:= 'ViApp_WhiteBottomCover';
	gVisionSensor[visSelectedSensor].DAT.Exposure			:= 1000; 	// SUSCEPTIBLE TO CHANGE
	gVisionSensor[visSelectedSensor].DAT.FlashColor			:= 4; 		// 4: LIME (See help function "Image acquisition parameters (cyclic write)" for other alternatives)
	gVisionSensor[visSelectedSensor].DAT.FlashSegment		:= 15; 		// Binary 1111 (all segments are turned on)
	gVisionSensor[visSelectedSensor].DAT.Focus				:= 430; 	// SUSCEPTIBLE TO CHANGE - Camera FocusScale is defined in mm
	gVisionSensor[visSelectedSensor].DAT.Gain				:= 1; 								// Gain factor 1
	//gVisionSensor[visSelectedSensor].DAT.MaxItemCnt		:= RecipeData.Cam[i].MaxItemCnt; 	// Already has default value
	//gVisionSensor[visSelectedSensor].DAT.Timeout			:= RecipeData.Cam[i].Timeout; 		// Already has default value
	
	// -----------------------------------------------------------------------------------------------------------
	// Capturing image if requested and compensating for network delay
	// -----------------------------------------------------------------------------------------------------------
	PowerlinkCycle_us			:= NettimeCurrent_us - NettimeLastCycle_us;
	NettimeLastCycle_us			:= NettimeCurrent_us;
	
	TON_Wait.IN := TRUE;
	
	IF gVisionNettime.CMD.Activate AND TON_Wait.Q THEN
		
		IF EDGEPOS(imageRequested) AND NOT processingImage THEN
			requestTimeStamp := NettimeCurrent_us;
			processingImage := TRUE;
		END_IF
		
		IF processingImage THEN
			TriggerTimeDelta_us := durationWs2ToDeparture - (NettimeCurrent_us - requestTimeStamp);
			
			IF (TriggerTimeDelta_us >= (gVisionNettime.CFG.VisionPreTrigger_Cycles) * PowerlinkCycle_us)  AND
				(TriggerTimeDelta_us <= (gVisionNettime.CFG.VisionPreTrigger_Cycles + 1) * PowerlinkCycle_us) THEN
				
				gVisionNettime.DAT.NettimeNext_us	:= NettimeCurrent_us + TriggerTimeDelta_us;
				gVisionNettime.DAT.NettimeDelta_us	:= TriggerTimeDelta_us;
				
				// Transfer nettime to sensor and fire trigger
				IF gVisionSensor[visSelectedSensor].HW.Ready AND NOT gVisionSensor[visSelectedSensor].DAT.ImageProcessingActive THEN
					gVisionSensor[visSelectedSensor].CMD.ImageTrigger	:= TRUE;
					gVisionSensor[visSelectedSensor].DAT.NettimeDelay	:= gVisionNettime.DAT.NettimeNext_us;
				ELSE
					gVisionNettime.DAT.Overflow := gVisionNettime.DAT.Overflow + 1;
				END_IF
				
				processingImage := FALSE;
				TON_Wait.IN := FALSE;
				
			END_IF
		END_IF
	END_IF
	
	// ImageNettime is the total image processing and processing time of the captured image. 
	// ImageNettime changes with each additional captured image, so we compare with oldImageNettime and update mappView if it is different from current
	IF gVisionSensor[visSelectedSensor].DAT.ImageNettime <> oldImageNettime THEN
		oldImageNettime := gVisionSensor[visSelectedSensor].DAT.ImageNettime;
		mappView.updateImage := TRUE;
	END_IF

	mappView.imageFormat 	:= BRDKVIIMG_IMG_TYPE_JPEG;
	mappView.jpegQuality 	:= 50;
	mappView.pSvgImage 		:= ADR(imageSvg);	
	
	// -----------------------------------------------------------------------------------------------------------
	// Display camera status in hex - documentation is also in hex
	// -----------------------------------------------------------------------------------------------------------
	IF gVisionSensor[visSelectedSensor].DAT.Status = 0 THEN // Display only a single 0
		gVisionSensor[visSelectedSensor].DAT.StatusText := '0';
	ELSIF gVisionSensor[visSelectedSensor].DAT.Status = 16#00000001 THEN
		gVisionSensor[visSelectedSensor].DAT.StatusText := 'Image acquisition';
	ELSIF gVisionSensor[visSelectedSensor].DAT.Status = 16#00000002 THEN
		gVisionSensor[visSelectedSensor].DAT.StatusText := 'Waiting trigger';
	ELSIF gVisionSensor[visSelectedSensor].DAT.Status = 16#00000010 THEN
		gVisionSensor[visSelectedSensor].DAT.StatusText := 'Searching settings';
	ELSIF gVisionSensor[visSelectedSensor].DAT.Status = 16#00000080 THEN
		gVisionSensor[visSelectedSensor].DAT.StatusText := 'Setting focus';
	ELSIF gVisionSensor[visSelectedSensor].DAT.Status = 16#00000090 THEN
		gVisionSensor[visSelectedSensor].DAT.StatusText := 'Searching settings';
	ELSIF gVisionSensor[visSelectedSensor].DAT.Status = 16#00000800 THEN
		gVisionSensor[visSelectedSensor].DAT.StatusText := 'Cam CPU not ready';
	ELSIF gVisionSensor[visSelectedSensor].DAT.Status = 16#00001000 THEN
		gVisionSensor[visSelectedSensor].DAT.StatusText := 'Cam sensor not ready';
	ELSIF gVisionSensor[visSelectedSensor].DAT.Status = 16#02000000 THEN
		gVisionSensor[visSelectedSensor].DAT.StatusText := 'OS check/update';
	ELSIF gVisionSensor[visSelectedSensor].DAT.Status = 16#80000000 THEN
		gVisionSensor[visSelectedSensor].DAT.StatusText := 'Vision cockpit active';
	ELSE // Display the status in hex format 0x02000800
		gVisionSensor[visSelectedSensor].DAT.StatusText := '';
		FOR i := 0 TO 28 BY 4 DO
			gVisionSensor[visSelectedSensor].DAT.StatusText := CONCAT(MID(HexTab, 1, LIMIT(1, UDINT_TO_INT((SHR(gVisionSensor[visSelectedSensor].DAT.Status, i) AND 16#0000000F) + 1), 16)), gVisionSensor[visSelectedSensor].DAT.StatusText);
		END_FOR
		gVisionSensor[visSelectedSensor].DAT.StatusText := CONCAT('0x', gVisionSensor[visSelectedSensor].DAT.StatusText);
	END_IF
	
	// -----------------------------------------------------------------------------------------------------------
	// Check if vision cockpit is open
	// -----------------------------------------------------------------------------------------------------------
	gVisionSensor[visSelectedSensor].DAT.CockpitIsActive := (gVisionSensor[visSelectedSensor].DAT.Status AND 16#8000_0000) > 0;
				
	// -----------------------------------------------------------------------------------------------------------
	// Reset trigger when timed out
	// -----------------------------------------------------------------------------------------------------------
	IF gVisionSensor[visSelectedSensor].CMD.ImageTrigger THEN
		TriggerTimeout[visSelectedSensor].IN := TRUE;
		TriggerTimeout[visSelectedSensor].PT := REAL_TO_TIME(gVisionSensor[visSelectedSensor].DAT.Timeout * 1.25);
		IF TriggerTimeout[visSelectedSensor].Q THEN
			gVisionSensor[visSelectedSensor].CMD.ImageTrigger			:= FALSE;
			gVisionSensor[visSelectedSensor].CMD.ImageTriggerReset	:= TRUE;
			gVisionSensor[visSelectedSensor].DAT.Active				:= FALSE;
		END_IF
	ELSE
		TriggerTimeout[visSelectedSensor].IN := FALSE;
		gVisionSensor[visSelectedSensor].CMD.ImageTriggerReset := FALSE;
	END_IF
	
	
	
	TriggerTimeout[visSelectedSensor]();
	mappView();
	TON_Wait();
	
END_PROGRAM

PROGRAM _EXIT
	mappView(enable := FALSE);
	 
END_PROGRAM

