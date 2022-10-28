
ACTION mxA_JointMovement:	

	
	CASE pState OF
		
		0: 	
			// Waiting for robot 1 to be ready to move
			IF 	Status_P > 0 AND Status_S > 0 AND Status_I > 0 AND Status_R > 0 AND Status_EXT > 0 THEN			
				pState := 10;		
			END_IF
			
		10: 
			// Set initial parameters for movement
			KRC_MoveAxisAbsolute_0.ExecuteCmd 			:= FALSE; 
			KRC_MoveAxisAbsolute_0.AxisGroupIdx 		:= HMI_AxisGroup;
			KRC_MoveAxisAbsolute_0.KRC_AxisGroupRefArr	:= ADR(AxisRef);
			KRC_MoveAxisAbsolute_0.Velocity 			:= 10;
			KRC_MoveAxisAbsolute_0.Acceleration 		:= 20;
			KRC_MoveAxisAbsolute_0.BufferMode 			:= 2;
			
			position1.A1 := 0;
			position1.A2 := -70;
			position1.A3 := 90;
			position1.A4 := 0;
			position1.A5 := -90;
			position1.A6 := 0;
			
			position2.A1 := 0;
			position2.A2 := -90;
			position2.A3 := 90;
			position2.A4 := 0;
			position2.A5 := 80;
			position2.A6 := 0;
			
			pState := 20;
			
		20: // Set initial position	
			KRC_MoveAxisAbsolute_0.AxisPosition := position1;
			
			KRC_MoveAxisAbsolute_0.ExecuteCmd 	:= TRUE; 
			IF KRC_MoveAxisAbsolute_0.Done THEN
				KRC_MoveAxisAbsolute_0.ExecuteCmd := FALSE;
				pState := 30;
			END_IF
		
		30:	// Set second position
			KRC_MoveAxisAbsolute_0.AxisPosition := position2;

			KRC_MoveAxisAbsolute_0.ExecuteCmd	:= TRUE;
			IF KRC_MoveAxisAbsolute_0.Done THEN
				KRC_MoveAxisAbsolute_0.ExecuteCmd	:= FALSE;
				pState := 20;
			END_IF 
	
	END_CASE
	
	mxa_ValuesToCOORDSYS_0();
	KRC_MoveAxisAbsolute_0();

END_ACTION
