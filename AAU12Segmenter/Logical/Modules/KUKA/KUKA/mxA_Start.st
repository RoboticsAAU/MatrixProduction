
ACTION mxA_Start: 
	

	/////////////////////////////////////////////////////
	// Logic to call the KRC_Initialize				   //
	// KRC_Initialize gives back the Status of the	   //
	// like, online, Initialized,.......			   //
	/////////////////////////////////////////////////////

	KUKAs[i].init.KRC_Initialize.AxisGroupIdx 			:= KUKAs[i].AxisGroupIdx; 
	KUKAs[i].init.KRC_Initialize.KRC_AxisGroupRefArr 	:= ADR(AxisRef);
	HMI_R1_Init_Done 									:= KUKAs[i].init.KRC_Initialize.Done;
	HMI_R1_Init_Error 									:= KUKAs[i].init.KRC_Initialize.Error;
	HMI_R1_Init_Error_ID 								:= KUKAs[i].init.KRC_Initialize.ErrorID;

	KUKAs[i].init.KRC_Initialize();
	
	
	/////////////////////////////////////////////////////
	// Logic to call the KRC_Error     			       //
	// KRC_Error gives back the Status of the Robot    //
	// like, online, Initialized,.......			   //
	/////////////////////////////////////////////////////
	
	KUKAs[i].init.KRC_Error.AxisGroupIdx 				:= KUKAs[i].AxisGroupIdx;
	KUKAs[i].init.KRC_Error.MessageReset 				:= HMI_R1_MessageReset; // REMEMBER TO CHANGE LATER
	KUKAs[i].init.KRC_Error.KRC_AxisGroupRefArr			:= ADR(AxisRef);
	HMI_R1_Error_General								:= KRC_Error_0.Error;
	HMI_R1_Error_General_ID								:= KRC_Error_0.ErrorID;
	HMI_R1_Error_Activ									:= KRC_Error_0.KrcErrorActive;
	HMI_R1_Error_DrivesNotReady							:= KRC_Error_0.DrivesNotReady;
	
	KUKAs[i].init.KRC_Error();
	
	//////////////////////////////////////////////////////
	// KRC_AutomaticExternal allows to control the 		//
	// Robot with the PLC								//
	//////////////////////////////////////////////////////
	
	
	KUKAs[i].init.KRC_AutomaticExternal.AxisGroupIdx 		:= KUKAs[i].AxisGroupIdx;
	KUKAs[i].init.KRC_AutomaticExternal.MOVE_ENABLE 		:= TRUE;
	KUKAs[i].init.KRC_AutomaticExternal.DRIVES_OFF 			:= TRUE;
	KUKAs[i].init.KRC_AutomaticExternal.KRC_AxisGroupRefArr	:= ADR(AxisRef);
	KUKAs[i].init.KRC_AutomaticExternal.EXT_START 			:= HMI_R1_EXT_START; // REMEMBER TO CHANGE LATER
	KUKAs[i].init.KRC_AutomaticExternal.ENABLE_T1 			:= TRUE;  
	KUKAs[i].init.KRC_AutomaticExternal.ENABLE_EXT 			:= TRUE;

	KUKAs[i].init.KRC_AutomaticExternal();
	
	
	//////////////////////////////////////////////////////
	//Function Block for StartUp of Robot				//
	//////////////////////////////////////////////////////

	KUKAs[i].init.KRC_AutoStart.AxisGroupIdx 				:= KUKAs[i].AxisGroupIdx; 
	KUKAs[i].init.KRC_AutoStart.KRC_AxisGroupRefArr 		:= ADR(AxisRef);
	KUKAs[i].init.KRC_AutoStart.ExecuteReset 				:= HMI_R1_AutoStart; // REMEMBER TO CHANGE LATER

	KUKAs[i].init.KRC_AutoStart();
		
		
	//////////////////////////////////////////////////////
	// KRC_SetOverride used to set the Override 		//
	// for the Robot Velocity							//
	//////////////////////////////////////////////////////

	
	KUKAs[i].init.KRC_SetOverride.AxisGroupIdx 				:= KUKAs[i].AxisGroupIdx;
	KUKAs[i].init.KRC_SetOverride.KRC_AxisGroupRefArr 		:= ADR(AxisRef); 
	KUKAs[i].init.KRC_SetOverride.Override 					:= HMI_R1_Override; // REMEMBER TO CHANGE LATER

	KUKAs[i].init.KRC_SetOverride();
	
	
	//////////////////////////////////////////////////////
	//KRC_Diag gives back some information about the 	//
	//axis and robot									//
	//////////////////////////////////////////////////////

	KUKAs[i].init.KRC_Diag.AxisGroupIdx 					:= KUKAs[i].AxisGroupIdx;
	KUKAs[i].init.KRC_Diag.KRC_AxisGroupRefArr 				:= ADR(AxisRef); 
	KUKAs[i].init.KRC_Diag.ShowTrace 						:= FALSE;
	
	KUKAs[i].init.KRC_Diag();
	
	
	//////////////////////////////////////////////////////
	//Checking status of KRC and PLC for creating the   //
	//signals for the HMI 								//
	//										 			//
	//////////////////////////////////////////////////////

	IF KUKAs[i].init.KRC_Diag.ProconosCyc_Act = -1 OR KUKAs[i].init.KRC_Error.NoHeartbeatPCOS THEN	
		KUKAs[i].status.P_ := FALSE;	
	ELSE
		KUKAs[i].status.P_ := TRUE;
	END_IF



	IF KUKAs[i].init.KRC_Diag.SubmitCyc_Act = -1 OR KUKAs[i].init.KRC_Error.NoHeartbeatKRC THEN
		KUKAs[i].status.S_ := FALSE;	
	ELSE
		KUKAs[i].status.S_ := TRUE;
	END_IF
								

	IF KUKAs[i].init.KRC_AutomaticExternal.EXT THEN
		KUKAs[i].status.EXT_ := TRUE;
	ELSE
		KUKAs[i].status.EXT_ := FALSE;
	END_IF

	
	IF NOT KUKAs[i].init.KRC_Error.DrivesNotReady AND KUKAs[i].init.KRC_AutomaticExternal.RC_RDY1 THEN
		KUKAs[i].status.I_ := TRUE;
	ELSE
		KUKAs[i].status.I_ := FALSE;
	END_IF

	
	IF KUKAs[i].init.KRC_AutoStart.DispActive THEN
		KUKAs[i].status.R_	:= TRUE;
	ELSE	
		KUKAs[i].status.R_	:= FALSE;
	END_IF	

	

END_ACTION
