
ACTION RobotAssembly: 
	
	CASE cm.state OF
	
		1000:
			cm.description := 'Define order-specific approach point at magazine';
				
			cm.state := 1010;
			
			// The following order-specific adjustments are possible since we at this point know that the robot has returned to home position (main approach point) in cm.state = 500
			CASE pKuka.axisGroupIdx OF
				1:
					CASE orderSpec[i] OF
						0: // Black cover
							pKuka.tempPosition.X := pKuka.tempPosition.X + 0; // Change when ready
					
						1: // White cover
							pKuka.tempPosition.X := pKuka.tempPosition.X + 80; // Change when ready
					
						2: // Blue cover
							pKuka.tempPosition.X := pKuka.tempPosition.X + 160; // Change when ready
					END_CASE
				3:
					// Do Nothing
					cm.state := 1020;
					
				4:
					CASE orderSpec[i] OF
						2: // 1 fuse
							pKuka.tempPosition.X := pKuka.tempPosition.X + 13; // Change when ready
					
						4: // 2 fuses
							pKuka.tempPosition.X := pKuka.tempPosition.X; // Change when ready
					END_CASE
			
				5:
					CASE orderSpec[i] OF
						0: // Black cover
							pKuka.tempPosition.X := pKuka.tempPosition.X + 0; // Change when ready
					
						1: // White cover
							pKuka.tempPosition.X := pKuka.tempPosition.X + 80; // Change when ready
					
						2: // Blue cover
							pKuka.tempPosition.X := pKuka.tempPosition.X + 160; // Change when ready
					END_CASE
				6:
					// Do Nothing
					cm.state := 1020;
				
			END_CASE
			
		
		1010:
			cm.description := 'Move to order-specific approach point at magazine';
			pKuka.convert.ValuesToCOORDSYS.IPO_Mode := 0; // #BASE
			pKuka.convert.ValuesToCOORDSYS();
				
			pKuka.motion.KRC_MoveDirectAbsolute.CoordinateSystem := pKuka.convert.ValuesToCOORDSYS.COORDSYS;
				
			pKuka.motion.KRC_MoveDirectAbsolute.Position := pKuka.tempPosition;
				
			pKuka.motion.KRC_MoveDirectAbsolute.ExecuteCmd := TRUE;
			IF pKuka.motion.KRC_MoveDirectAbsolute.Done THEN
				pKuka.motion.KRC_MoveDirectAbsolute.ExecuteCmd := FALSE;
				cm.state := 1020;
			END_IF
				
				
		1020:	
			cm.description := 'Move to pickup point with relative linear movement';
				
			pKuka.convert.ValuesToCOORDSYS.IPO_Mode := 1; // #TOOL
			pKuka.convert.ValuesToCOORDSYS();
				
			pKuka.motion.KRC_MoveLinearRelative.CoordinateSystem := pKuka.convert.ValuesToCOORDSYS.COORDSYS;
				
			pKuka.tempPosition.X := pKuka.tempPosition.Y := pKuka.tempPosition.Z := pKuka.tempPosition.A := pKuka.tempPosition.B := pKuka.tempPosition.C
			:= 0;
			pKuka.tempPosition.Z := -relativeDistance; 
			// Status and turn is already set from moving to approach point
				
			pKuka.motion.KRC_MoveLinearRelative.Position := pKuka.tempPosition;
				
			pKuka.motion.KRC_MoveLinearRelative.ExecuteCmd := TRUE;
			IF pKuka.motion.KRC_MoveLinearRelative.Done THEN
				pKuka.motion.KRC_MoveLinearRelative.ExecuteCmd := FALSE;
				cm.state := 1030;
			END_IF
				
				
		1030:	
			cm.description := 'Close gripper and wait a little before moving to ensure proper grip';
				
			pKuka.gripperAction.action := CLOSE;
				
			pKuka.TON.PT := REAL_TO_TIME(200); // in ms
			pKuka.TON.IN := TRUE;
			IF pKuka.TON.Q THEN
				pKuka.TON.IN := FALSE;
				cm.state := 1040;
			END_IF	
				
		1040:
			cm.description := 'Move to approach point with relative linear movement';
				
			pKuka.tempPosition.X := pKuka.tempPosition.Y := pKuka.tempPosition.Z := pKuka.tempPosition.A := pKuka.tempPosition.B := pKuka.tempPosition.C
			:= 0;
			pKuka.tempPosition.Z := relativeDistance; 
			// Status and turn is already set from moving to approach point
				
			pKuka.motion.KRC_MoveLinearRelative.Position := pKuka.tempPosition;
				
			pKuka.motion.KRC_MoveLinearRelative.ExecuteCmd := TRUE;
			IF pKuka.motion.KRC_MoveLinearRelative.Done THEN
				pKuka.motion.KRC_MoveLinearRelative.ExecuteCmd := FALSE;
				cm.state := 1050;
			END_IF
				
		1050:	
			cm.description := 'Move to approach point of workstation with absolute linear movement';
				
			pKuka.convert.ValuesToCOORDSYS.Base := 1; // ACOPOS6D frame
			pKuka.convert.ValuesToCOORDSYS.IPO_Mode := 0; // #BASE
			pKuka.convert.ValuesToCOORDSYS();
				
			pKuka.convert.ValuesToPosition.posType := APPROACH_WORKSTATION;
			pKuka.convert.ValuesToPosition();
				
			pKuka.tempPosition := pKuka.convert.ValuesToPosition.outputPos;
				
			pKuka.motion.KRC_MoveLinearAbsolute.CoordinateSystem := pKuka.convert.ValuesToCOORDSYS.COORDSYS;
			pKuka.motion.KRC_MoveLinearAbsolute.Position := pKuka.tempPosition;
				
			pKuka.motion.KRC_MoveLinearAbsolute.ExecuteCmd := TRUE;
			IF pKuka.motion.KRC_MoveLinearAbsolute.Done THEN 
				pKuka.motion.KRC_MoveLinearAbsolute.ExecuteCmd := FALSE;
				cm.state := 1060;
			END_IF
			
		1060:
			cm.description := 'Move to placement point at workstation with relative linear movement';
			
			pKuka.convert.ValuesToCOORDSYS.IPO_Mode := 1; // #TOOL
			pKuka.convert.ValuesToCOORDSYS();
			
			pKuka.motion.KRC_MoveLinearRelative.CoordinateSystem := pKuka.convert.ValuesToCOORDSYS.COORDSYS;
			
			pKuka.tempPosition.X := pKuka.tempPosition.Y := pKuka.tempPosition.Z := pKuka.tempPosition.A := pKuka.tempPosition.B := pKuka.tempPosition.C
			:= 0;
			pKuka.tempPosition.Z := -relativeDistance; // Move 100 mm forwards to placement position
			// Status and turn is already set from moving to approach point
			
			pKuka.motion.KRC_MoveLinearRelative.Position := pKuka.tempPosition;
			
			pKuka.motion.KRC_MoveLinearRelative.ExecuteCmd := TRUE;
			IF pKuka.motion.KRC_MoveLinearRelative.Done THEN
				pKuka.motion.KRC_MoveLinearRelative.ExecuteCmd := FALSE;
				cm.state := 1070;
			END_IF
			
			
		1070:
			cm.description := 'Open gripper and wait a little before moving to ensure proper grip';
			
			pKuka.gripperAction.action := OPEN;
			
			pKuka.TON.PT := REAL_TO_TIME(200); // in ms
			pKuka.TON.IN := TRUE;
			IF pKuka.TON.Q THEN
				pKuka.TON.IN := FALSE;
				cm.state := 1080;
			END_IF
			
		1080:
			cm.description := 'Move back to approach point at workstation with relative linear movement';
			
			pKuka.convert.ValuesToCOORDSYS.IPO_Mode := 1; // #TOOL
			pKuka.convert.ValuesToCOORDSYS();
			
			pKuka.motion.KRC_MoveLinearRelative.CoordinateSystem := pKuka.convert.ValuesToCOORDSYS.COORDSYS;
			
			pKuka.tempPosition.X := pKuka.tempPosition.Y := pKuka.tempPosition.Z := pKuka.tempPosition.A := pKuka.tempPosition.B := pKuka.tempPosition.C
			:= 0;
			pKuka.tempPosition.Z := relativeDistance;
			// Status and turn is already set from moving to approach point
			
			pKuka.motion.KRC_MoveLinearRelative.Position := pKuka.tempPosition;
			
			pKuka.motion.KRC_MoveLinearRelative.ExecuteCmd := TRUE;
			IF pKuka.motion.KRC_MoveLinearRelative.Done THEN
				pKuka.motion.KRC_MoveLinearRelative.ExecuteCmd := FALSE;
				robotOperating[i] := FALSE;
				cm.state := 1090;
			END_IF
			
		1090:
			RobotHoming;
		
	END_CASE
		
END_ACTION
