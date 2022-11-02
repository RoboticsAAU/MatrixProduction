
ACTION mxA_JointMovement:	

	
	CASE KUKAs[i].cm.state OF
		
		0: 	
			// Waiting for robot 1 to be ready to move
			IF 	KUKAs[i].status.P_ AND KUKAs[i].status.S_ AND KUKAs[i].status.R_ AND KUKAs[i].status.I_ AND KUKAs[i].status.EXT_ THEN			
				KUKAs[i].cm.state := 10;		
			END_IF
			
		10: 
			// Set initial parameters for movement
			KUKAs[i].motion.KRC_MoveAxisAbsolute.ExecuteCmd 			:= FALSE; 
			KUKAs[i].motion.KRC_MoveAxisAbsolute.AxisGroupIdx 			:= KUKAs[i].AxisGroupIdx;
			KUKAs[i].motion.KRC_MoveAxisAbsolute.KRC_AxisGroupRefArr	:= ADR(AxisRef);
			KUKAs[i].motion.KRC_MoveAxisAbsolute.Velocity 				:= 10;
			KUKAs[i].motion.KRC_MoveAxisAbsolute.Acceleration 			:= 20;
			KUKAs[i].motion.KRC_MoveAxisAbsolute.BufferMode 			:= 2;
			
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
			
			KUKAs[i].cm.state := 20;
			
		20: // Set initial position	
			KUKAs[i].motion.KRC_MoveAxisAbsolute.AxisPosition := position1;
			
			KUKAs[i].motion.KRC_MoveAxisAbsolute.ExecuteCmd 	:= TRUE; 
			IF KUKAs[i].motion.KRC_MoveAxisAbsolute.Done THEN
				KUKAs[i].motion.KRC_MoveAxisAbsolute.ExecuteCmd := FALSE;
				KUKAs[i].cm.state := 30;
			END_IF
		
		30:	// Set second position
			KUKAs[i].motion.KRC_MoveAxisAbsolute.AxisPosition := position2;

			KUKAs[i].motion.KRC_MoveAxisAbsolute.ExecuteCmd	:= TRUE;
			IF KUKAs[i].motion.KRC_MoveAxisAbsolute.Done THEN
				KUKAs[i].motion.KRC_MoveAxisAbsolute.ExecuteCmd	:= FALSE;
				KUKAs[i].cm.state := 20;
			END_IF 
	
	END_CASE
	
	mxa_ValuesToCOORDSYS_0();
	KUKAs[i].motion.KRC_MoveAxisAbsolute();

END_ACTION
