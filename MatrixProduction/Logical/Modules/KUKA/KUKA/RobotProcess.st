
ACTION RobotProcess: 

	CASE cm.state OF
		
		1000:
			cm.description := 'Define order-specific approach point at magazine';
			
			IF robotExecute[i] THEN
				robotBusy[i] := TRUE;
				pKuka.convert.ValuesToPosition.posType := APPROACH_WORKSTATION;
				IF isOrderFlipped[i] THEN
					pKuka.convert.ValuesToPosition.opt_isFlipped := TRUE;
				END_IF
				pKuka.convert.ValuesToPosition();
				
				pKuka.tempPosition := pKuka.convert.ValuesToPosition.outputPos;
				
				CASE pKuka.axisGroupIdx OF
					2: //Drilling robot
						// Make it go backwards if order is flipped
						IF isOrderFlipped[i] THEN
							drillYOffset := -drillYOffset;
						END_IF
						
						// Seen from ACOPOS 6D frame: Bottom right -> bottom left -> top left -> top right
						CASE numDoneHoles OF
							0: // Simply default approach position
								
							1:
								pKuka.tempPosition.X := pKuka.tempPosition.X - drillXOffset;
							
							2:	
								pKuka.tempPosition.X := pKuka.tempPosition.X - drillXOffset;
								pKuka.tempPosition.Y := pKuka.tempPosition.Y + drillYOffset;
								
								// Configuration changes here (after first two holes)
								IF isOrderFlipped[i] THEN
									pKuka.tempPosition.Status := 2; // 010
									pKuka.tempPosition.Turn := 35; // 100011
								ELSE
									pKuka.tempPosition.Status := 6; // 110
									pKuka.tempPosition.Turn := 51; // 110011
								END_IF
							
							3:
								pKuka.tempPosition.Y := pKuka.tempPosition.Y + drillYOffset;
								
						END_CASE
						
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
			CASE pKuka.axisGroupIdx OF
				2: pKuka.tempPosition.Z := -(relativeDrillDistance + 6);
			END_CASE
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
				
			pKuka.tempPosition.X := pKuka.tempPosition.Y := pKuka.tempPosition.A := pKuka.tempPosition.B := pKuka.tempPosition.C
			:= 0;
			pKuka.tempPosition.Z := -1*pKuka.tempPosition.Z; // go back
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
