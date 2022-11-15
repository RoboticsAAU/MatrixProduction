
ACTION RobotProcess: 

	CASE cm.state OF
		
		1000:
			cm.description := 'Define order-specific approach point at magazine';
			
			cm.state := 1010;
			
			CASE pKuka.axisGroupIdx OF
				2: //Drilling robot

					// Index i corresponds to robot, and thus also the correct entry in orderSpec   
					// The following order-specific adjustments are possible since we at this point know that the robot has returned to home position (main approach point) in cm.state = 500
					IF orderSpec[i] <> 0 THEN
						pKuka.tempPosition.X := pKuka.tempPosition.X + (-1)*(numDoneHoles MOD 2)*27*2;
						pKuka.tempPosition.Y := pKuka.tempPosition.Y + BOOL_TO_INT(numDoneHoles >= 2)*53*2;
					ELSE
						//Do nothing
						cm.state := 1030;
					END_IF

			END_CASE
			
		1010:
			cm.description := 'Perform order-specific motion with relative linear movement';
				
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
				cm.state := 1020;
			END_IF
			
			
		1020:
			
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
							robotOperating[i] := FALSE;
							cm.state := 1030;
						END_IF
				END_CASE
				
			END_IF
			
			
		1030:
			RobotHoming;
		
		
	END_CASE
	
	
END_ACTION
