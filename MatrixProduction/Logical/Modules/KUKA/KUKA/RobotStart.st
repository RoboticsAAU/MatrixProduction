
ACTION RobotStart: 
	
	CASE pKuka.startState OF
			
		0: // Configuring KUKA FBs once
			
			// Logic to call the KRC_Initialize	
			pKuka.start.KRC_Initialize.AxisGroupIdx 				:= pKuka.axisGroupIdx; 
			pKuka.start.KRC_Initialize.KRC_AxisGroupRefArr 			:= ADR(AxisRef);
			
			// Logic to call the KRC_Error 
			pKuka.start.KRC_Error.AxisGroupIdx 						:= pKuka.axisGroupIdx;
			pKuka.start.KRC_Error.MessageReset 						:= FALSE; // REMEMBER TO CHANGE LATER
			pKuka.start.KRC_Error.KRC_AxisGroupRefArr				:= ADR(AxisRef);
			
			// Logic to call KRC_AutomaticExternal
			pKuka.start.KRC_AutomaticExternal.AxisGroupIdx 			:= pKuka.axisGroupIdx;
			pKuka.start.KRC_AutomaticExternal.MOVE_ENABLE 			:= TRUE;
			pKuka.start.KRC_AutomaticExternal.DRIVES_OFF 			:= TRUE;
			pKuka.start.KRC_AutomaticExternal.KRC_AxisGroupRefArr	:= ADR(AxisRef);
			pKuka.start.KRC_AutomaticExternal.EXT_START 			:= FALSE; // Binded to Continue Prog in original program
			pKuka.start.KRC_AutomaticExternal.ENABLE_T1 			:= TRUE;  
			pKuka.start.KRC_AutomaticExternal.ENABLE_EXT 			:= TRUE;
			
			// Logic for startup of robot
			pKuka.start.KRC_AutoStart.AxisGroupIdx 					:= pKuka.axisGroupIdx; 
			pKuka.start.KRC_AutoStart.KRC_AxisGroupRefArr 			:= ADR(AxisRef);
			pKuka.start.KRC_AutoStart.ExecuteReset 					:= FALSE;
			
			// Logic to set override for robot velocity
			pKuka.start.KRC_SetOverride.AxisGroupIdx 				:= pKuka.axisGroupIdx;
			pKuka.start.KRC_SetOverride.KRC_AxisGroupRefArr 		:= ADR(AxisRef);
			
			// Logic to set 
			pKuka.start.KRC_Abort.AxisGroupIdx 						:= pKuka.axisGroupIdx;
			pKuka.start.KRC_Abort.KRC_AxisGroupRefArr				:= ADR(AxisRef);
			pKuka.start.KRC_Abort.ExecuteCmd						:= FALSE; // Used to be set by HMI - Remember to incorporate it later
			
			// Logic to set KRC_Diag
			pKuka.start.KRC_Diag.AxisGroupIdx 						:= pKuka.axisGroupIdx;
			pKuka.start.KRC_Diag.KRC_AxisGroupRefArr 				:= ADR(AxisRef); 
			pKuka.start.KRC_Diag.ShowTrace 							:= FALSE;
			
			pKuka.startState := 1;

			
		1: // Wait for P, S and EXT
			IF pKuka.status.P_ AND pKuka.status.S_ AND pKuka.status.EXT_ THEN
				pKuka.startState := 2;
			END_IF
		
		2: // Reset KRC errors and autostart
			pKuka.start.KRC_Error.MessageReset := TRUE;
			pKuka.start.KRC_AutoStart.ExecuteReset := TRUE;
			
			IF pKuka.status.R_ AND pKuka.status.I_ THEN
				pKuka.start.KRC_Error.MessageReset := FALSE;
				pKuka.start.KRC_AutoStart.ExecuteReset := FALSE;
				pKuka.startState := 3;
			END_IF
		
		3: // Check if any error occurred  
			IF 	NOT pKuka.status.P_ OR 
				NOT pKuka.status.S_ OR 
				NOT pKuka.status.EXT_ OR
				NOT pKuka.status.R_ OR
				NOT pKuka.status.I_ THEN
				
				pKuka.startState := 0;
			
			END_IF
		
	END_CASE
	

	
	// Logic to call the KRC_Initialize
	// KRC_Initialize gives back the Status OF the like, online, Initialized,.......
	pKuka.start.KRC_Initialize();
	
	// Logic to call the KRC_Error. 
	// KRC_Error gives back the Status OF the Robot like, online, Initialized,.......
	pKuka.start.KRC_Error();
	
	// KRC_AutomaticExternal allows to control the Robot with the PLC
	pKuka.start.KRC_AutomaticExternal();
	
	//Function Block for StartUp of Robot
	pKuka.start.KRC_AutoStart();
	
	// KRC_SetOverride used to set the Override for the Robot Velocity
	pKuka.start.KRC_SetOverride();
	
	// KRC_Abort cancels all active and buffered statements and motions
	pKuka.start.KRC_Abort();	
	
	// KRC_Diag gives back some information about the axis and robot
	pKuka.start.KRC_Diag();
	
	
	//Checking status of KRC and PLC for creating the signals for the HMI 
	IF pKuka.start.KRC_Diag.ProconosCyc_Act = -1 OR pKuka.start.KRC_Error.NoHeartbeatPCOS THEN	
		pKuka.status.P_ := FALSE;	
	ELSE
		pKuka.status.P_ := TRUE;
	END_IF
	
	
	IF pKuka.start.KRC_Diag.SubmitCyc_Act = -1 OR pKuka.start.KRC_Error.NoHeartbeatKRC THEN
		pKuka.status.S_ := FALSE;	
	ELSE
		pKuka.status.S_ := TRUE;
	END_IF
	
	
	IF pKuka.start.KRC_AutomaticExternal.EXT THEN
		pKuka.status.EXT_ := TRUE;
	ELSE
		pKuka.status.EXT_ := FALSE;
	END_IF
	
	
	IF NOT pKuka.start.KRC_Error.DrivesNotReady AND pKuka.start.KRC_AutomaticExternal.RC_RDY1 THEN
		pKuka.status.I_ := TRUE;
	ELSE
		pKuka.status.I_ := FALSE;
	END_IF
	
	
	IF pKuka.start.KRC_AutoStart.DispActive THEN
		pKuka.status.R_	:= TRUE;
	ELSE	
		pKuka.status.R_	:= FALSE;
	END_IF	
	
END_ACTION
