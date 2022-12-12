
ACTION JointMovement:	

	
	CASE pKuka.cm.state OF
			
		0: 
			// Set initial parameters for movement
			pKuka.motion.KRC_MoveAxisAbsolute.ExecuteCmd 			:= FALSE; 
			pKuka.motion.KRC_MoveAxisAbsolute.AxisGroupIdx 			:= pKuka.axisGroupIdx;
			pKuka.motion.KRC_MoveAxisAbsolute.KRC_AxisGroupRefArr	:= ADR(AxisRef);
			pKuka.motion.KRC_MoveAxisAbsolute.Velocity 				:= 10;
			pKuka.motion.KRC_MoveAxisAbsolute.Acceleration 			:= 20;
			pKuka.motion.KRC_MoveAxisAbsolute.BufferMode 			:= 2;
			
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
			
			pKuka.cm.state := 10;
			
		10: // Set initial position	
			pKuka.motion.KRC_MoveAxisAbsolute.AxisPosition := position1;
			
			pKuka.motion.KRC_MoveAxisAbsolute.ExecuteCmd 	:= TRUE; 
			IF pKuka.motion.KRC_MoveAxisAbsolute.Done THEN
				pKuka.motion.KRC_MoveAxisAbsolute.ExecuteCmd := FALSE;
				pKuka.cm.state := 20;
			END_IF
		
		20:	// Set second position
			pKuka.motion.KRC_MoveAxisAbsolute.AxisPosition := position2;

			pKuka.motion.KRC_MoveAxisAbsolute.ExecuteCmd	:= TRUE;
			IF pKuka.motion.KRC_MoveAxisAbsolute.Done THEN
				pKuka.motion.KRC_MoveAxisAbsolute.ExecuteCmd	:= FALSE;
				pKuka.cm.state := 10;
			END_IF 
	
	END_CASE
	
	pKuka.motion.KRC_MoveAxisAbsolute();

END_ACTION
