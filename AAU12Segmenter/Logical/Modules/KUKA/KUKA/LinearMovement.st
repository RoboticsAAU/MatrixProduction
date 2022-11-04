
ACTION LinearMovement:

	CASE KUKAs[i].cm.state OF
	
		0:
			// Waiting for robot 1 to be ready to move
			IF 	KUKAs[i].status.P_ AND KUKAs[i].status.S_ AND KUKAs[i].status.I_ AND KUKAs[i].status.R_ AND KUKAs[i].status.EXT_ THEN			
				KUKAs[i].cm.state := 10;
			END_IF
			
		10: 
			toolCover.X := 0;
			toolCover.Y := 0;
			toolCover.Z := 100;
			toolCover.A := 0;
			toolCover.B := 0;
			toolCover.C := 0;
				
				
		20: 
				
			//Set frames as coordsys
			mxa_ValuesToCOORDSYS_0.Tool 	:= 1; // Change to 1 when it works 
			mxa_ValuesToCOORDSYS_0.Base 	:= 1; 
			mxa_ValuesToCOORDSYS_0.IPO_Mode := 0;
		
			KUKAs[i].cm.state := 30; 
			
		30: 
				
			coordSys := mxa_ValuesToCOORDSYS_0.COORDSYS;
			
			KUKAs[i].motion.KRC_MoveLinearAbsolute.AxisGroupIdx 		:= KUKAs[i].AxisGroupIdx;
			KUKAs[i].motion.KRC_MoveLinearAbsolute.KRC_AxisGroupRefArr	:= ADR(AxisRef);
			KUKAs[i].motion.KRC_MoveLinearAbsolute.Velocity				:= 10; 
			KUKAs[i].motion.KRC_MoveLinearAbsolute.Acceleration  		:= 20; 
			KUKAs[i].motion.KRC_MoveLinearAbsolute.CoordinateSystem		:= coordSys;
			KUKAs[i].motion.KRC_MoveLinearAbsolute.OriType 				:= 0;
			KUKAs[i].motion.KRC_MoveLinearAbsolute.BufferMode			:= 2;
			
			KUKAs[i].cm.state := 40;
			
		40:
			endPOS.X := 302; 
			endPOS.Y := -2; 
			endPOS.Z := 527; 
			endPOS.A := -178;
			endPOS.B := 26; 
			endPOS.C := -178; 
			endPOS.Status := 2; //010
			endPOS.Turn := 2; //000010
			
			KUKAs[i].motion.KRC_MoveLinearAbsolute.Position			:= endPOS;

			KUKAs[i].motion.KRC_MoveLinearAbsolute.ExecuteCmd 		:= TRUE;
			IF KUKAs[i].motion.KRC_MoveLinearAbsolute.Done THEN 
				KUKAs[i].motion.KRC_MoveLinearAbsolute.ExecuteCmd 	:= FALSE;
				KUKAs[i].cm.state := 50; 
			END_IF
		
		50:
			endPOS.X := 430; 
			endPOS.Y := -2; 
			endPOS.Z := 527; 
			endPOS.A := -178;
			endPOS.B := 26; 
			endPOS.C := -178; 
			endPOS.Status := 2; //010
			endPOS.Turn := 2; //000010
			
			KUKAs[i].motion.KRC_MoveLinearAbsolute.Position			:= endPOS;
			
			KUKAs[i].motion.KRC_MoveLinearAbsolute.ExecuteCmd 		:= TRUE;
			IF KUKAs[i].motion.KRC_MoveLinearAbsolute.Done THEN 
				KUKAs[i].motion.KRC_MoveLinearAbsolute.ExecuteCmd 	:= FALSE;
				KUKAs[i].cm.state 	:= 40; 
			END_IF
	
	END_CASE
	
	mxa_ValuesToCOORDSYS_0();
	KUKAs[i].motion.KRC_MoveLinearAbsolute();

END_ACTION
