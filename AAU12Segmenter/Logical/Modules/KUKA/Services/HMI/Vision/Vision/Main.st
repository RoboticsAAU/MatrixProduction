// --------------------------------------------------------------------------------------------------------------------
// This task calculates the nettime depending on a drive velocity
// - This task must run at the same cycle as the Powerlink bus
// - Make sure that nettime is selected in the vision application (Image aquisition -> Aquisition configuration -> Trigger Source -> Trigger delay
// --------------------------------------------------------------------------------------------------------------------
PROGRAM _INIT
	(* Insert code here *)
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
	
	
	//WHILE mappView.internal. = 0 DO
		mappView();		
	//END_WHILE
	//	mappView.simulateConfig.appendNumber := TRUE;
//	mappView.simulateConfig.minNumber := 1;
//	mappView.simulateConfig.maxNumber := 3;
//	mappView.simulateConfig.autoIncrementNumber := TRUE;
//	mappView.simulateConfig.pDevice := ADR(this.simFileDevice);
//	mappView.simulateConfig.pFile := ADR(this.simFilename);
END_PROGRAM

PROGRAM _CYCLIC
	PowerlinkCycle_us			:= NettimeCurrent_us - NettimeLastCycle_us;
	NettimeLastCycle_us			:= NettimeCurrent_us;
	ShuttleYSpeed_ms			:= ((ShuttleYPos_m - ShuttleYPosOld_m[LAST_IDX_SH_POS_OLD]) / (LAST_IDX_SH_POS_OLD + 1) / MAX(PowerlinkCycle_us, 400) * 1000000)*(-1) ;
	brsmemmove(ADR(ShuttleYPosOld_m[1]), ADR(ShuttleYPosOld_m[0]), SIZEOF(ShuttleYPosOld_m) - SIZEOF(ShuttleYPosOld_m[0]));
	ShuttleYPosOld_m[0]			:= ShuttleYPos_m;
	
	IF gVisionNettime.CMD.Activate AND ShuttleYSpeed_ms > 0 THEN //AND gVisionNettime.DAT.AxisInVelocity AND gVisionNettime.DAT.AxisVelocity > 0 THEN
		AxisPositionNow			:= ShuttleYPos_m + (-1* ShuttleYSpeed_ms) * PowerlinkCycle_us * gVisionNettime.CFG.AxisPositionDelay_Cycles / 1000000; // When the MpAxis gives us the read position, it is old. So calculate the "now" position
		TriggerPosDelta			:= gVisionNettime.CFG.AxisPositionTrigger - AxisPositionNow;
		TriggerTimeDelta_us		:= LREAL_TO_DINT((TriggerPosDelta / ShuttleYSpeed_ms) * 1000000);
		// Wait for the moment that axis is in the send trigger window depend on delay by topology and the actual powerlink cycle
		IF (TriggerTimeDelta_us >= (gVisionNettime.CFG.VisionPreTrigger_Cycles)     * PowerlinkCycle_us)  AND
			(TriggerTimeDelta_us <= (gVisionNettime.CFG.VisionPreTrigger_Cycles + 1) * PowerlinkCycle_us) AND
			NOT Wait
			THEN
			Wait := TRUE;
			gVisionNettime.DAT.NettimeNext_us	:= NettimeCurrent_us + TriggerTimeDelta_us;
			gVisionNettime.DAT.NettimeDelta_us	:= TriggerTimeDelta_us;
			// Transfer nettime to sensor and fire trigger
			IF gVisionSensor[visSelectedSensor].HW.Ready AND NOT gVisionSensor[visSelectedSensor].DAT.ImageProcessingActive THEN
				gVisionSensor[visSelectedSensor].CMD.ImageTrigger	:= TRUE;
				gVisionSensor[visSelectedSensor].DAT.NettimeDelay	:= gVisionNettime.DAT.NettimeNext_us;
			ELSE
				gVisionNettime.DAT.Overflow := gVisionNettime.DAT.Overflow + 1;
			END_IF
			TON_Wait.IN := TRUE;	
		END_IF
	END_IF
	TON_Wait(PT := T#1s);
	IF TON_Wait.Q THEN
		TON_Wait.IN := FALSE;
		Wait := FALSE;
	END_IF
	

	
	
//	IF visionResults[0] = 52 THEN
//		visionResultString := 'Shuttle 1';
//	ELSIF visionResults[0] = 51 THEN
//		visionResultString := 'Shuttle 2';
//	ELSIF visionResults[0] = 50 THEN
//		visionResultString := 'Shuttle 3';
//	ELSIF visionResults[0] = 49 THEN
//		visionResultString := 'Shuttle 4';
	//	END_IF
	
	IF gVisionSensor[3].DAT.ImageNettime <> oldImageNettime THEN
		oldImageNettime := gVisionSensor[3].DAT.ImageNettime;
		brdkStrMemCpy(ADR(visionResultString),ADR(visionResults),SIZEOF(visionResults));
		mappView.updateImage := TRUE;
	END_IF

	mappView.imageFormat 	:= BRDKVIIMG_IMG_TYPE_JPEG;
	mappView.jpegQuality 	:= 50;
	mappView.pSvgImage 		:= ADR(imageSvg);
	//mappView.pImageArray 	:= ADR(this.imgArr);
	//mappView.simulateConfig.activate := DiagCpuIsSimulated(); // true if PLC is simulated
	mappView();
	
END_PROGRAM

PROGRAM _EXIT
	mappView(enable := FALSE);
	 
END_PROGRAM

