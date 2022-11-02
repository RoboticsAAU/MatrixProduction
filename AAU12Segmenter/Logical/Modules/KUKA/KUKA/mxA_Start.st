
ACTION mxA_Start: 
	

	/////////////////////////////////////////////////////
	// Logic to call the KRC_Initialize				   //
	// KRC_Initialize gives back the Status of the	   //
	// like, online, Initialized,.......			   //
	/////////////////////////////////////////////////////

	KUKAs[i].start.KRC_Initialize.AxisGroupIdx 			:= KUKAs[i].AxisGroupIdx; 
	KUKAs[i].start.KRC_Initialize.KRC_AxisGroupRefArr 	:= ADR(AxisRef);

	KUKAs[i].start.KRC_Initialize();
	
	
	/////////////////////////////////////////////////////
	// Logic to call the KRC_Error     			       //
	// KRC_Error gives back the Status of the Robot    //
	// like, online, Initialized,.......			   //
	/////////////////////////////////////////////////////
	
	KUKAs[i].start.KRC_Error.AxisGroupIdx 				:= KUKAs[i].AxisGroupIdx;
	KUKAs[i].start.KRC_Error.MessageReset 				:= FALSE; // REMEMBER TO CHANGE LATER
	KUKAs[i].start.KRC_Error.KRC_AxisGroupRefArr		:= ADR(AxisRef);
	
	KUKAs[i].start.KRC_Error();
	
	//////////////////////////////////////////////////////
	// KRC_AutomaticExternal allows to control the 		//
	// Robot with the PLC								//
	//////////////////////////////////////////////////////
	
	
	KUKAs[i].start.KRC_AutomaticExternal.AxisGroupIdx 			:= KUKAs[i].AxisGroupIdx;
	KUKAs[i].start.KRC_AutomaticExternal.MOVE_ENABLE 			:= TRUE;
	KUKAs[i].start.KRC_AutomaticExternal.DRIVES_OFF 			:= TRUE;
	KUKAs[i].start.KRC_AutomaticExternal.KRC_AxisGroupRefArr	:= ADR(AxisRef);
	KUKAs[i].start.KRC_AutomaticExternal.EXT_START 				:= FALSE; // Binded to Continue Prog in original program
	KUKAs[i].start.KRC_AutomaticExternal.ENABLE_T1 				:= TRUE;  
	KUKAs[i].start.KRC_AutomaticExternal.ENABLE_EXT 			:= TRUE;

	KUKAs[i].start.KRC_AutomaticExternal();
	
	
	//////////////////////////////////////////////////////
	//Function Block for StartUp of Robot				//
	//////////////////////////////////////////////////////

	KUKAs[i].start.KRC_AutoStart.AxisGroupIdx 				:= KUKAs[i].AxisGroupIdx; 
	KUKAs[i].start.KRC_AutoStart.KRC_AxisGroupRefArr 		:= ADR(AxisRef);
	KUKAs[i].start.KRC_AutoStart.ExecuteReset 				:= FALSE; // REMEMBER TO CHANGE LATER

	KUKAs[i].start.KRC_AutoStart();
		
		
	//////////////////////////////////////////////////////
	// KRC_SetOverride used to set the Override 		//
	// for the Robot Velocity							//
	//////////////////////////////////////////////////////

	
	KUKAs[i].start.KRC_SetOverride.AxisGroupIdx 				:= KUKAs[i].AxisGroupIdx;
	KUKAs[i].start.KRC_SetOverride.KRC_AxisGroupRefArr 			:= ADR(AxisRef); 
	KUKAs[i].start.KRC_SetOverride.Override 					:= 5; // REMEMBER TO CHANGE LATER

	KUKAs[i].start.KRC_SetOverride();
	
	
	//////////////////////////////////////////////////////
	//KRC_Diag gives back some information about the 	//
	//axis and robot									//
	//////////////////////////////////////////////////////

	KUKAs[i].start.KRC_Diag.AxisGroupIdx 						:= KUKAs[i].AxisGroupIdx;
	KUKAs[i].start.KRC_Diag.KRC_AxisGroupRefArr 				:= ADR(AxisRef); 
	KUKAs[i].start.KRC_Diag.ShowTrace 							:= FALSE;
	
	KUKAs[i].start.KRC_Diag();
	
	
	//////////////////////////////////////////////////////
	//Checking status of KRC and PLC for creating the   //
	//signals for the HMI 								//
	//										 			//
	//////////////////////////////////////////////////////

	IF KUKAs[i].start.KRC_Diag.ProconosCyc_Act = -1 OR KUKAs[i].start.KRC_Error.NoHeartbeatPCOS THEN	
		KUKAs[i].status.P_ := FALSE;	
	ELSE
		KUKAs[i].status.P_ := TRUE;
	END_IF



	IF KUKAs[i].start.KRC_Diag.SubmitCyc_Act = -1 OR KUKAs[i].start.KRC_Error.NoHeartbeatKRC THEN
		KUKAs[i].status.S_ := FALSE;	
	ELSE
		KUKAs[i].status.S_ := TRUE;
	END_IF
								

	IF KUKAs[i].start.KRC_AutomaticExternal.EXT THEN
		KUKAs[i].status.EXT_ := TRUE;
	ELSE
		KUKAs[i].status.EXT_ := FALSE;
	END_IF

	
	IF NOT KUKAs[i].start.KRC_Error.DrivesNotReady AND KUKAs[i].start.KRC_AutomaticExternal.RC_RDY1 THEN
		KUKAs[i].status.I_ := TRUE;
	ELSE
		KUKAs[i].status.I_ := FALSE;
	END_IF

	
	IF KUKAs[i].start.KRC_AutoStart.DispActive THEN
		KUKAs[i].status.R_	:= TRUE;
	ELSE	
		KUKAs[i].status.R_	:= FALSE;
	END_IF	

	

END_ACTION
