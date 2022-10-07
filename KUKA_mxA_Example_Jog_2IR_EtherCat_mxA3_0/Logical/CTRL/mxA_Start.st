
ACTION mxA_Start: 
	

	/////////////////////////////////////////////////////
	// Logic to call the KRC_Initialize				   //
	// KRC_Initialize gives back the Status of the	   //
	// like, online, Initialized,.......			   //
	/////////////////////////////////////////////////////

	KRC_Initialize_0.AxisGroupIdx 			:= 1; 
	KRC_Initialize_0.KRC_AxisGroupRefArr 	:= ADR(AxisRef);
	HMI_R1_Init_Done 						:=	KRC_Initialize_0.Done;
	HMI_R1_Init_Error 						:=	KRC_Initialize_0.Error;
	HMI_R1_Init_Error_ID 					:=	KRC_Initialize_0.ErrorID;

	KRC_Initialize_0();

		
	KRC_Initialize_1.AxisGroupIdx 			:= 2; 
	KRC_Initialize_1.KRC_AxisGroupRefArr 	:= ADR(AxisRef);
	HMI_R2_Init_Done 						:=	KRC_Initialize_1.Done;
	HMI_R2_Init_Error 						:=	KRC_Initialize_1.Error;
	HMI_R2_Init_Error_ID 					:=	KRC_Initialize_1.ErrorID;

	KRC_Initialize_1();
	
	
	
	/////////////////////////////////////////////////////
	// Logic to call the KRC_Error     			       //
	// KRC_Error gives back the Status of the Robot    //
	// like, online, Initialized,.......			   //
	/////////////////////////////////////////////////////
	
	KRC_Error_0.AxisGroupIdx 				:= 1;
	KRC_Error_0.MessageReset 				:= HMI_R1_MessageReset;
	KRC_Error_0.KRC_AxisGroupRefArr			:= ADR(AxisRef);
	HMI_R1_Error_General					:= KRC_Error_0.Error;
	HMI_R1_Error_General_ID					:= KRC_Error_0.ErrorID;
	HMI_R1_Error_Activ						:= KRC_Error_0.KrcErrorActive;
	HMI_R1_Error_DrivesNotReady				:= KRC_Error_0.DrivesNotReady;
	
	KRC_Error_0();
	
	
	KRC_Error_1.AxisGroupIdx 				:= 2;
	KRC_Error_1.MessageReset 				:= HMI_R2_MessageReset;
	KRC_Error_1.KRC_AxisGroupRefArr			:= ADR(AxisRef);
	HMI_R2_Error_General					:= KRC_Error_1.Error;
	HMI_R2_Error_General_ID					:= KRC_Error_1.ErrorID;
	HMI_R2_Error_Activ						:= KRC_Error_1.KrcErrorActive;
	HMI_R2_Error_DrivesNotReady				:= KRC_Error_1.DrivesNotReady;

	KRC_Error_1();
	
	
	//////////////////////////////////////////////////////
	// KRC_AutomaticExternal allows to control the 		//
	// Robot with the SPS								//
	//////////////////////////////////////////////////////
	
	KRC_AutomaticExternal_0.AxisGroupIdx 		:= 1;
	KRC_AutomaticExternal_0.MOVE_ENABLE 		:= TRUE;
	KRC_AutomaticExternal_0.DRIVES_OFF 			:= TRUE;
	KRC_AutomaticExternal_0.KRC_AxisGroupRefArr	:= ADR(AxisRef);
	KRC_AutomaticExternal_0.EXT_START 			:= HMI_R1_EXT_START;
	KRC_AutomaticExternal_0.ENABLE_T1 			:= TRUE;  
	KRC_AutomaticExternal_0.ENABLE_EXT 			:= TRUE;

	KRC_AutomaticExternal_0();
	
	
	KRC_AutomaticExternal_1.AxisGroupIdx 		:= 2;
	KRC_AutomaticExternal_1.MOVE_ENABLE 		:= TRUE;
	KRC_AutomaticExternal_1.DRIVES_OFF 			:= TRUE;
	KRC_AutomaticExternal_1.KRC_AxisGroupRefArr := ADR(AxisRef);
	KRC_AutomaticExternal_1.EXT_START			:= HMI_R2_EXT_START;
	KRC_AutomaticExternal_1.ENABLE_T1 			:= TRUE;  
	KRC_AutomaticExternal_1.ENABLE_EXT 			:= TRUE;

	KRC_AutomaticExternal_1();
	
	
	
	//////////////////////////////////////////////////////
	//Function Block for StartUp of Robot				//
	//////////////////////////////////////////////////////

	KRC_AutoStart_0.AxisGroupIdx 				:= 1; 
	KRC_AutoStart_0.KRC_AxisGroupRefArr 		:= ADR(AxisRef);
	KRC_AutoStart_0.ExecuteReset 				:= HMI_R1_AutoStart ;

	KRC_AutoStart_0();
	
	
	KRC_AutoStart_1.AxisGroupIdx 				:= 2; 
	KRC_AutoStart_1.KRC_AxisGroupRefArr 		:= ADR(AxisRef);
	KRC_AutoStart_1.ExecuteReset 				:= HMI_R2_AutoStart ;

	KRC_AutoStart_1();
	
	
		
	//////////////////////////////////////////////////////
	// KRC_SetOverride used to set the Override 		//
	// for the Robot Velocity							//
	//////////////////////////////////////////////////////

	KRC_SetOverride_0.AxisGroupIdx 				:= 1;
	KRC_SetOverride_0.KRC_AxisGroupRefArr 		:= ADR(AxisRef); 
	KRC_SetOverride_0.Override 					:=HMI_R1_Override;

	KRC_SetOverride_0();
	
	
	KRC_SetOverride_1.AxisGroupIdx 				:= 2;
	KRC_SetOverride_1.KRC_AxisGroupRefArr 		:= ADR(AxisRef); 
	KRC_SetOverride_1.Override 					:=HMI_R2_Override;

	KRC_SetOverride_1();
	
	
	
	//////////////////////////////////////////////////////
	//KRC_Diag gives back some information about the 	//
	//axis and robot									//
	//////////////////////////////////////////////////////

	KRC_Diag_0.AxisGroupIdx 					:= 1;
	KRC_Diag_0.KRC_AxisGroupRefArr 				:= ADR(AxisRef); 
	KRC_Diag_0.ShowTrace 						:= FALSE;
	
	KRC_Diag_0();
	
	
	KRC_Diag_1.AxisGroupIdx 					:= 2;
	KRC_Diag_1.KRC_AxisGroupRefArr 				:= ADR(AxisRef); 
	KRC_Diag_1.ShowTrace 						:= FALSE;
	
	KRC_Diag_1();
	
	
	
	//////////////////////////////////////////////////////
	//Checking status of KRC and PLC for creating the   //
	//signals for the HMI 								//
	//										 			//
	//////////////////////////////////////////////////////

	CASE HMI_AxisGroup OF
		
	//////////////////////////////////////////////////////	
	//ROBOT 1											//
	//////////////////////////////////////////////////////	
	
		1: 
			IF KRC_Diag_0.ProconosCyc_Act = -1 OR KRC_Error_0.NoHeartbeatPCOS THEN	
				Status_P := FALSE;	
			ELSE
				Status_P := TRUE;
			END_IF
	
	
	
			IF KRC_Diag_0.SubmitCyc_Act = -1 OR KRC_Error_0.NoHeartbeatKRC THEN
				Status_S := FALSE;	
			ELSE
				Status_S := TRUE;
			END_IF
										
	
			IF KRC_AutomaticExternal_0.EXT THEN
				Status_EXT := 1;
			ELSE
				Status_EXT := 0;
			END_IF
	
			
			IF NOT KRC_Error_0.DrivesNotReady AND KRC_AutomaticExternal_0.RC_RDY1 THEN
				Status_I := 1;
			ELSE
				Status_I := 0;
			END_IF
		
			
			IF KRC_AutoStart_0.DispActive THEN
				Status_R	:= 1;
			ELSE	
				Status_R	:= 0;
			END_IF
		
		
	//////////////////////////////////////////////////////	
	//ROBOT 2											//
	//////////////////////////////////////////////////////	
		
		2:
			IF KRC_Diag_1.ProconosCyc_Act = -1 OR KRC_Error_1.NoHeartbeatPCOS THEN	
				Status_P := FALSE;	
			ELSE
				Status_P := TRUE;
			END_IF
	
	
	
			IF KRC_Diag_1.SubmitCyc_Act = -1 OR KRC_Error_1.NoHeartbeatKRC THEN
				Status_S := FALSE;	
			ELSE
				Status_S := TRUE;
			END_IF
										
	
			IF KRC_AutomaticExternal_1.EXT THEN
				Status_EXT := 1;
			ELSE
				Status_EXT := 0;
			END_IF
	
			
			IF NOT KRC_Error_1.DrivesNotReady AND KRC_AutomaticExternal_1.RC_RDY1 THEN
				Status_I := 1;
			ELSE
				Status_I := 0;
			END_IF
		
			
			IF KRC_AutoStart_1.DispActive THEN
				Status_R	:= 1;
			ELSE	
				Status_R	:= 0;
			END_IF

			
	//////////////////////////////////////////////////////	
	//ROBOT 3,4,5										//
	//////////////////////////////////////////////////////	
	
		3,4,5:
			
			Status_P := FALSE;
			Status_S := FALSE;
			Status_I := 0;
			Status_R := 0;
			Status_EXT := 0;
		

	END_CASE;
	

END_ACTION
