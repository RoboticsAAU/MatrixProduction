
ACTION RobotProcess: 

	CASE cm.state OF
		
		1000:
			cm.description := 'Define order-specific approach point at magazine';
			
			IF robotExecute[i] THEN
				
				pKuka.convert.ValuesToPosition.posType := APPROACH_WORKSTATION;
				pKuka.convert.ValuesToPosition();
						
				pKuka.tempPosition := pKuka.convert.ValuesToPosition.outputPos;
				
				CASE pKuka.axisGroupIdx OF
					2: //Drilling robot
		
						// Index i corresponds to robot, and thus also the correct entry in orderSpec   
						
						pKuka.tempPosition.X := pKuka.tempPosition.X - (numDoneHoles MOD 2)*27*2;
						pKuka.tempPosition.Y := pKuka.tempPosition.Y + brmfloor(numDoneHoles/2)*53*2;
		
				END_CASE
				
				cm.state := 1010;
			
			END_IF
			
			
		1010: 
			cm.description := 'Move to order-specific approach point';
			
			pKuka.convert.ValuesToCOORDSYS.Base := pKuka.convert.ValuesToPosition.baseNo;
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
			cm.description := 'Perform order-specific motion with relative linear movement';
			
			// Relative movement w.r.t tool does not require defining base
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
			
			cm.description := 'Move back to approach point with relative linear movement';
			
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
				
				CASE pKuka.axisGroupIdx OF
					2: //Drilling robot
						numDoneHoles := numDoneHoles + 1;
						
						// Check if more holes are needed for the specific order
						IF numDoneHoles < orderSpec[i] THEN
							// Define next order-specific approach point
							cm.state := 1000;
						ELSE 
							// Order is completed, we move back to mint approach point (APPROACH_WORKSTATION)
							numDoneHoles := 0;
							robotDone[i] := TRUE;
							cm.state := 1040;
						END_IF
				END_CASE
				
			END_IF
			
			
		1040:
			cm.description := 'Move back to home position';
			
			RobotHoming;
		
	END_CASE
	
	
END_ACTION
