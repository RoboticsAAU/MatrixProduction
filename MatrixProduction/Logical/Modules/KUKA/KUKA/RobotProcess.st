
ACTION RobotProcess :

	CASE cm.state OF

		1000:
			cm.description := 'Define order-specific approach point at workstation';

			IF robotExecute[i] THEN
				robotBusy[i] := TRUE;
				pKuka.convert.ValuesToPosition.posType := APPROACH_WORKSTATION;
				pKuka.convert.ValuesToPosition.opt_isFlipped := isProductFlipped[i]; // Determine if product is flipped (not necesary anymore)
				pKuka.convert.ValuesToPosition();

				pKuka.tempPosition := pKuka.convert.ValuesToPosition.outputPos;

				CASE pKuka.axisGroupIdx OF
					2 : // Drilling robot
						// Make it go backwards if order is flipped
						IF isProductFlipped[i] THEN
							drillYOffset := - drillYOffset;
						END_IF

						// Seen from ACOPOS 6D frame: Bottom right -> bottom left -> top left -> top right
						CASE numDoneHoles OF
							0, 1 : // Simply default approach position

								IF isProductFlipped[i] THEN
									pKuka.tempPosition.Status := 2; // 010
									pKuka.tempPosition.Turn := 35; // 10011
								END_IF

							2, 3 :
								pKuka.tempPosition.Y := pKuka.tempPosition.Y + drillYOffset;

								// Configuration changes here (after first two holes)
								IF NOT isProductFlipped[i] THEN
									pKuka.tempPosition.Status := 6; // 110
									pKuka.tempPosition.Turn := 51; // 110011
								END_IF

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
				2: pKuka.tempPosition.Z := - (relativeDrillDistance + 6);
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
			pKuka.tempPosition.Z := -1 * pKuka.tempPosition.Z; // go back
			// Status and turn is already set from moving to approach point

			pKuka.motion.KRC_MoveLinearRelative.Position := pKuka.tempPosition;

			pKuka.motion.KRC_MoveLinearRelative.ExecuteCmd := TRUE;
			IF pKuka.motion.KRC_MoveLinearRelative.Done THEN
				pKuka.motion.KRC_MoveLinearRelative.ExecuteCmd := FALSE;
				
				CASE pKuka.axisGroupIdx OF
					2: numDoneHoles := numDoneHoles + 1;
				END_CASE
				
				cm.state := 1035;
			END_IF

		1035:
			cm.description := 'Assign movements to the shuttle at the drilling workstation';

			CASE pKuka.axisGroupIdx OF
				2:
					pKuka.motion.MC_BR_MoveInPlane_Acp6D.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[drillStationShuttleID].shuttleRef);
					pKuka.motion.MC_BR_MoveInPlane_Acp6D.Parameters.Path := 0; // Direct

					pKuka.motion.MC_BR_MoveInPlane_Acp6D.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
					pKuka.motion.MC_BR_MoveInPlane_Acp6D.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
					pKuka.motion.MC_BR_MoveInPlane_Acp6D.Parameters.Mode := 1; // Relative movement
					pKuka.motion.MC_BR_MoveInPlane_Acp6D.Parameters.Position.X := pKuka.motion.MC_BR_MoveInPlane_Acp6D.Parameters.Position.Y := 0;
					
					CASE numDoneHoles OF
						1:
							pKuka.motion.MC_BR_MoveInPlane_Acp6D.Parameters.Position.X := -(drillXOffset / 1000); // Converted to m
							// Occupy the highway position that the shuttles moves to
							IF NOT occupiedPosition[3, 3] THEN
								occupiedPosition[3, 3] := TRUE;
								cm.state := 1036;
							END_IF

						2: // No shuttle movement
							IF orderSpec[i] = 2 THEN
								pKuka.motion.MC_BR_MoveInPlane_Acp6D.Parameters.Position.X := (drillXOffset / 1000); // Converted to m
								cm.state := 1036;
							ELSE // No shuttle movement
								cm.state := 1040;
							END_IF

						3:
							pKuka.motion.MC_BR_MoveInPlane_Acp6D.Parameters.Position.X := (drillXOffset / 1000); // Converted to m
							cm.state := 1036;

						4: // No shuttle movement
							cm.state := 1040;
						
					END_CASE
			END_CASE

		1036:
			cm.description := 'Move the shuttle at the drilling workstation';
			
			pKuka.motion.MC_BR_MoveInPlane_Acp6D.Execute := TRUE;
			IF pKuka.motion.MC_BR_MoveInPlane_Acp6D.Done THEN
				pKuka.motion.MC_BR_MoveInPlane_Acp6D.Execute := FALSE;

				cm.state := 1040;
			END_IF


		1040:
			cm.description := 'Check if the drill has performed the correct number of holes';
			
			CASE pKuka.axisGroupIdx OF
				2: // Drilling robot
					
					// Check if more holes are needed for the specific order
					IF numDoneHoles < orderSpec[i] THEN
						// Define next order-specific approach point
						cm.state := 1000;
					// Order is completed, we move back to mint approach point (APPROACH_WORKSTATION)
					ELSE
						// Make position available for use again
						IF occupiedPosition[3, 3] THEN
							occupiedPosition[3, 3] := FALSE;
						END_IF
						
						numDoneHoles := 0;
						robotDone[i] := TRUE;
						cm.state := 1050;
					END_IF
			END_CASE


		1050 :
			cm.description := 'Move back to home position';

			RobotHoming;

	END_CASE

	pKuka.motion.MC_BR_MoveInPlane_Acp6D();

END_ACTION
