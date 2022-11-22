
PROGRAM _INIT
	
	gVisionNettime.CMD.Activate					:= TRUE;
	gVisionNettime.CFG.AxisPeriod				:= 360; // Needs also to be set in the axis configuration
	gVisionNettime.CFG.AxisPositionTrigger		:= 0.180;
	gVisionNettime.CFG.AxisPositionDelay_Cycles	:= 1; 	// Number of PLK cycles which the axis position is old when it comes to this task (Time from encoder to now in this task)
	gVisionNettime.CFG.VisionPreTrigger_Cycles	:= 8; 	// Number of powerlink cycles the trigger has to be send ahead, 4 is a good value.
	
	mappView.maxSvgImageLength := SIZEOF(imageSvg);
	mappView.enable 		:= TRUE;
	mappView.cameraIp 		:= '192.168.200.8';
	mappView.getImageArray := FALSE;
	mappView.timeout 		:= 3000;
	
	mappView();		
	
	//TON_Wait.PT := REAL_TO_TIME(154.92);
	TON_Wait.PT := REAL_TO_TIME(3000);
	
END_PROGRAM

PROGRAM _CYCLIC
	PowerlinkCycle_us			:= NettimeCurrent_us - NettimeLastCycle_us;
	NettimeLastCycle_us			:= NettimeCurrent_us;
	lightValue := 1;
	IF gVisionNettime.CMD.Activate THEN
		//AxisPositionNow			:= ShuttleYPos_m + (-1* ShuttleYSpeed_ms) * PowerlinkCycle_us * gVisionNettime.CFG.AxisPositionDelay_Cycles / 1000000; // When the MpAxis gives us the read position, it is old. So calculate the "now" position
		//TriggerPosDelta			:= gVisionNettime.CFG.AxisPositionTrigger - AxisPositionNow;
		//TriggerTimeDelta_us		:= LREAL_TO_DINT((TriggerPosDelta / ShuttleYSpeed_ms) * 1000000);
		TON_Wait.IN := TRUE;
		// Wait for the moment that axis is in the send trigger window depend on delay by topology and the actual powerlink cycle
		IF TON_Wait.Q THEN
			TON_Wait.IN := FALSE;
			gVisionNettime.DAT.NettimeNext_us	:= NettimeCurrent_us + TriggerTimeDelta_us;
			gVisionNettime.DAT.NettimeDelta_us	:= TriggerTimeDelta_us;
			// Transfer nettime to sensor and fire trigger
			IF gVisionSensor[visSelectedSensor].HW.Ready AND NOT gVisionSensor[visSelectedSensor].DAT.ImageProcessingActive THEN
				gVisionSensor[visSelectedSensor].CMD.ImageTrigger	:= TRUE;
				
				gVisionSensor[visSelectedSensor].DAT.NettimeDelay	:= 0;
			ELSE
				gVisionNettime.DAT.Overflow := gVisionNettime.DAT.Overflow + 1;
			END_IF
		END_IF
	END_IF
	
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

