
PROGRAM _INIT
		
	//	gVisionNettime.CMD.Activate					:= TRUE;
	//	gVisionNettime.CFG.AxisPeriod				:= 360; // Needs also to be set in the axis configuration
	//	gVisionNettime.CFG.AxisPositionTrigger		:= 0.180;
	//	gVisionNettime.CFG.AxisPositionDelay_Cycles	:= 1; 	// Number of PLK cycles which the axis position is old when it comes to this task (Time from encoder to now in this task)
	//	gVisionNettime.CFG.VisionPreTrigger_Cycles	:= 8; 	// Number of powerlink cycles the trigger has to be send ahead, 4 is a good value.
	
	mappView.maxSvgImageLength 	:= SIZEOF(imageSvg);
	mappView.enable 			:= TRUE;
	mappView.cameraIp 			:= '192.168.200.8';
	mappView.getImageArray 		:= FALSE;
	mappView.timeout 			:= 3000;
	
	mappView();
		
	//TON_Wait.PT := REAL_TO_TIME(154.92);
	TON_Wait.PT := REAL_TO_TIME(3000);
	
END_PROGRAM

PROGRAM _CYCLIC
	
	////// Vision Function Configuration //////
	blobInput.enable := TRUE;
	blobInput.numSearchMax := 1;
	blobInput.offsetROIX := 0;
	blobInput.offsetROIY := 0;
	
	////// Vision sensor configuration /////
	
	gVisionImage.CFG.EthDevice								:= 'IF2';			// Ethernet interface for the PLC, this is the IF where you go online
	
	// Configuration for blob
	gVisionSensor[visSelectedSensor].CFG.VisionFunction		:= enumBlob;		// Used to run specific code for this vision function
	gVisionSensor[visSelectedSensor].CFG.PowerlinkNode		:= 8;				// Powerlink node number
	gVisionSensor[visSelectedSensor].CFG.DataStructure		:= ADR(gBlob);		// Global structures that holds all data related to this function
	gVisionSensor[visSelectedSensor].CFG.ComponentLink		:= gCamera;			// Vision component name defined under mappVision in the configuration view
	//gVisionSensor[visSelectedSensor].CFG.ResolutionWidth_X	:= 1280;
	//gVisionSensor[visSelectedSensor].CFG.ResolutionHeight_Y	:= 1024;
	
	// Camera configuration
	gVisionSensor[visSelectedSensor].FCT.ApplicationName	:= 'ViApp_WhiteBottomCover';
	gVisionSensor[visSelectedSensor].DAT.Exposure			:= 1000; 	// SUSCEPTIBLE TO CHANGE
	gVisionSensor[visSelectedSensor].DAT.FlashColor			:= 4; 		// 4: LIME (See help function "Image acquisition parameters (cyclic write)" for other alternatives)
	gVisionSensor[visSelectedSensor].DAT.FlashSegment		:= 15; 		// Binary 1111 (all segments are turned on)
	gVisionSensor[visSelectedSensor].DAT.Focus				:= 430; 	// SUSCEPTIBLE TO CHANGE - Camera FocusScale is defined in mm
	gVisionSensor[visSelectedSensor].DAT.Gain				:= 1; 								// Gain factor 1
	//gVisionSensor[visSelectedSensor].DAT.MaxItemCnt		:= RecipeData.Cam[i].MaxItemCnt; 	// Already has default value
	//gVisionSensor[visSelectedSensor].DAT.Timeout			:= RecipeData.Cam[i].Timeout; 		// Already has default value
	
	// Switch vision application when recipe for blob was loaded
	//gVisionSensor[visSelectedSensor].CMD.VaSwitchApplication := TRUE; //Do we need this???
	
	////////////////////////////////////////
	
	
	PowerlinkCycle_us			:= NettimeCurrent_us - NettimeLastCycle_us;
	NettimeLastCycle_us			:= NettimeCurrent_us;
	
	//IF gVisionNettime.CMD.Activate THEN
		//AxisPositionNow			:= ShuttleYPos_m + (-1* ShuttleYSpeed_ms) * PowerlinkCycle_us * gVisionNettime.CFG.AxisPositionDelay_Cycles / 1000000; // When the MpAxis gives us the read position, it is old. So calculate the "now" position
		//TriggerPosDelta			:= gVisionNettime.CFG.AxisPositionTrigger - AxisPositionNow;
		//TriggerTimeDelta_us		:= LREAL_TO_DINT((TriggerPosDelta / ShuttleYSpeed_ms) * 1000000);
	gVisionSensor[visSelectedSensor].CMD.ImageTrigger	:= FALSE;
	TON_Wait.IN := TRUE;
	
		// Wait for the moment that axis is in the send trigger window depend on delay by topology and the actual powerlink cycle
		IF TON_Wait.Q THEN
			TON_Wait.IN := FALSE;
			//gVisionNettime.DAT.NettimeNext_us	:= NettimeCurrent_us + TriggerTimeDelta_us;
			//gVisionNettime.DAT.NettimeDelta_us	:= TriggerTimeDelta_us;
			// Transfer nettime to sensor and fire trigger
			IF gVisionSensor[visSelectedSensor].HW.Ready AND NOT gVisionSensor[visSelectedSensor].DAT.ImageProcessingActive THEN
				gVisionSensor[visSelectedSensor].CMD.ImageTrigger	:= TRUE;
				
				gVisionSensor[visSelectedSensor].DAT.NettimeDelay	:= 0;
			ELSE
				//gVisionNettime.DAT.Overflow := gVisionNettime.DAT.Overflow + 1;
			END_IF
		END_IF
	//END_IF
	
	IF gVisionSensor[visSelectedSensor].DAT.ImageNettime <> oldImageNettime THEN
		oldImageNettime := gVisionSensor[visSelectedSensor].DAT.ImageNettime;
		brdkStrMemCpy(ADR(visionResultString),ADR(visionResults),SIZEOF(visionResults));
		mappView.updateImage := TRUE;
	END_IF

	mappView.imageFormat 	:= BRDKVIIMG_IMG_TYPE_JPEG;
	mappView.jpegQuality 	:= 50;
	mappView.pSvgImage 		:= ADR(imageSvg);
	//mappView.pImageArray 	:= ADR(this.imgArr);
	//mappView.simulateConfig.activate := DiagCpuIsSimulated(); // true if PLC is simulated
	mappView();
	TON_Wait();
	
END_PROGRAM

PROGRAM _EXIT
	mappView(enable := FALSE);
	 
END_PROGRAM

