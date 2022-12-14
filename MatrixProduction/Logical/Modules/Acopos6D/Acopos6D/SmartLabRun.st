
ACTION smartLabWorkstationOperation :
	
	CASE cm.state OF
		0:
			cm.description := 'Setting parameters for the workstations'; // None right now

			// Function block reference information
			ShuttlesAtPositions_0.shuttleInfo := ADR(gAcp6DCtrl.Status.ShuttleInfo); // Maybe need to run FB?
			ShuttlesInRange_0.shuttleInfo := ADR(gAcp6DCtrl.Status.ShuttleInfo);
			ShuttlesInWorkstationBuffer_0.shuttleInfo := ADR(gAcp6DCtrl.Status.ShuttleInfo);
			
			cm.state := 10;


		10:
			cm.description := 'Check what shuttle is on top of workstation';

			// Workstation position
			ShuttlesAtPositions_0.checkPosX[0] := pWorkstation.par.xLocation;
			ShuttlesAtPositions_0.checkPosY[0] := pWorkstation.par.yLocation;
			ShuttlesAtPositions_0.opt_checkShuttleState[0] := mcACP6D_SH_STATE_IDLING;
			ShuttlesAtPositions_0.numCheckedPos := 1;
			ShuttlesAtPositions_0();

			// Check if a shuttle is on the workstation and it is idle (meaning not in motion)
			IF ShuttlesAtPositions_0.isAtCheckPos THEN
				pWorkstation.par.tempShuttleID := ShuttlesAtPositions_0.shuttleID;
				gShuttles[pWorkstation.par.tempShuttleID].par.tempWorkstationID := pWorkstation.par.workstationID;
				gShuttles[pWorkstation.par.tempShuttleID].par.tempCameraStationID := -1; // Set no camera as default
				
				// If the shuttle is active, perform the operation
				IF shuttlePlans[pWorkstation.par.tempShuttleID].isActive THEN
					cm.state := 20;
				// If the shuttle is not active, go to wait for either new order or another shuttle in buffer
				ELSE
					cm.state := 15;
				END_IF
			END_IF


		15:
			cm.description := 'Wait for other shuttle to arrive at approach point or shuttle at workstation becomes part of new order';
			
			// Check if the shuttle should become part of a new order
			IF pWorkstation.par.workstationID = 0 THEN
				// New order has been read and must begin execution
				IF remainingOrderAmount > 0 THEN
					pShuttlePlan.isActive := TRUE;
					pShuttlePlan.progressIndex := 0;
					pShuttlePlan.routingSheet := CreateRouteSheet_0.outputRouteSheet;
					pShuttlePlan.productOrder := productOrder;
					pShuttlePlan.productID := productOrder.amount - remainingOrderAmount;

					remainingOrderAmount := remainingOrderAmount - 1;
					cm.state := 20;
				ELSIF NOT bufferEmpty THEN
					// Go back to read new order in read state
					em.substate := 17025;
				END_IF
			END_IF
			
			// Move to next workstation if another shuttle has arrived in the buffer of the workstation
			CASE pWorkstation.par.workstationID OF // For different workstations, you should look at differen positions
				0: // See if more than 2 shuttles are in queue
					// Position where at least 3 shuttles are in queue
					ShuttlesAtPositions_0.checkPosX[0] := pWorkstation.par.approachPosX - 0.240;
					ShuttlesAtPositions_0.checkPosY[0] := pWorkstation.par.approachPosY;
					ShuttlesAtPositions_0.opt_checkShuttleState[0] := mcACP6D_SH_STATE_OBSTACLE;
					ShuttlesAtPositions_0.numCheckedPos := 1;
					ShuttlesAtPositions_0();

					IF ShuttlesAtPositions_0.isAtCheckPos THEN
						// Set shuttle state to move to next workstation and go back to wait for new shuttle at workstation
						moveShuttle[pWorkstation.par.tempShuttleID] := TRUE;
						cm.state := 60;
					END_IF

				1..5: // See if any shuttles are in the buffer
					ShuttlesInWorkstationBuffer_0.workstation := pWorkstation;
					ShuttlesInWorkstationBuffer_0();

					IF ShuttlesInWorkstationBuffer_0.isInBuffer THEN
						// Set shuttle state to move to next workstation and go back to wait for new shuttle at workstation
						moveShuttle[pWorkstation.par.tempShuttleID] := TRUE;
						cm.state := 60;
					END_IF
			END_CASE


		20:
			cm.description := 'Send data to robot through mapping and begin robot operation';

			gShuttles[pWorkstation.par.tempShuttleID].par.tempCameraStationID := pWorkstation.par.cameraID;

			IF NOT robotBusy[i] THEN
				CASE pWorkstation.par.workstationID OF
					// Send type of bottom cover (converted to int)
					0: orderSpec[0] := COVER_TYPE_TO_USINT(pShuttlePlan.productOrder.bottomCover);

					// Send amount of holes
					1:  orderSpec[1] := pShuttlePlan.productOrder.Holes;
						drillStationShuttleID := pWorkstation.par.tempShuttleID;  // Send ID of the shuttle currently at the drilling station.

					// Send whether a PCB is specified or not (converted to int)
					2: orderSpec[2] := BOOL_TO_USINT(pShuttlePlan.productOrder.PCB);

					// Send amount of fuses
					3: orderSpec[3] := pShuttlePlan.productOrder.Fuses;

					// Send type of top cover (converted to int)
					4: orderSpec[4] := COVER_TYPE_TO_USINT(pShuttlePlan.productOrder.topCover);

					// Send ID of order
					5:
						orderSpec[5] := UINT_TO_SINT(pShuttlePlan.productOrder.ID);
						orderAmount := pShuttlePlan.productOrder.amount;
				
				END_CASE

				// Send if order is flipped or not (not sent to robots - fixed on ACOPOS side instead)
//				isProductFlipped[i] := pShuttlePlan.isFlipped;

				// If robot is enabled, begin robot operation
				IF robotEnabled[i] THEN
					robotExecute[i] := TRUE;
					pShuttlePlan.startTimeAtWorkstation[pWorkstation.par.workstationID] := TIME_TO_REAL(clock_ms()) / 1000;
				ELSE
					robotExecute[i] := FALSE;
				END_IF

				cm.state := 40;
			END_IF


//		30:
//			cm.description := 'Land shuttle if required';
//
//			IF gAcp6DCtrl.Status.ShuttleInfo[pWorkstation.par.tempShuttleID].State = mcACP6D_SH_STATE_IDLING THEN
//				pWorkstation.MC_BR_ShLevitation_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[pWorkstation.par.tempShuttleID].shuttleRef);
//				pWorkstation.MC_BR_ShLevitation_Acp6D_0.Parameters.Level := 0; // Land
//				pWorkstation.MC_BR_ShLevitation_Acp6D_0.Parameters.Speed := 0;
//				pWorkstation.MC_BR_ShLevitation_Acp6D_0.Execute := TRUE;
//			END_IF
//			IF pWorkstation.MC_BR_ShLevitation_Acp6D_0.Done THEN
//				pWorkstation.MC_BR_ShLevitation_Acp6D_0.Execute := FALSE;
//				cm.state := 40;
//			END_IF


		40:
			cm.description := 'Wait for robot to finish operation';
			
			// If the robot is enabled, move on when robotDone signal is received
			IF robotEnabled[i] THEN
				IF robotDone[i] THEN
					robotExecute[i] := FALSE;
					
					// Calculate the workstation cycle time
					pShuttlePlan.workstationCycleTime[pWorkstation.par.workstationID] := (TIME_TO_REAL(clock_ms()) / 1000) - pShuttlePlan.startTimeAtWorkstation[pWorkstation.par.workstationID];
					
					// If it is the last workstation, go set a lot of parameters for the order history
					IF pWorkstation.par.workstationID = 5 THEN
						cm.state := 45;
					ELSE
						moveShuttle[pWorkstation.par.tempShuttleID] := TRUE;
						cm.state := 60;
					END_IF
				END_IF
			ELSE
				// If it is the last workstation, go set a lot of parameters for the order history
				IF pWorkstation.par.workstationID = 5 THEN
					cm.state := 45;
				ELSE
					pWorkstation.TON_0.PT := T#1S;
					pWorkstation.TON_0.IN := TRUE;
					IF pWorkstation.TON_0.Q THEN
						pWorkstation.TON_0.IN := FALSE;
						
						moveShuttle[pWorkstation.par.tempShuttleID] := TRUE;
						cm.state := 60;
					END_IF
				END_IF
			END_IF

		42:
			cm.description := 'Measure weight to see if final product has been removed from shuttle';
			
			MC_BR_ShGetPayload_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[pWorkstation.par.tempShuttleID].shuttleRef);
			MC_BR_ShGetPayload_Acp6D_0.Execute := TRUE;
			IF MC_BR_ShGetPayload_Acp6D_0.Done THEN
				MC_BR_ShGetPayload_Acp6D_0.Execute := FALSE;
				
				IF setWeight THEN
					setWeight := FALSE;
					pShuttlePlan.currentProductWeight := (MC_BR_ShGetPayload_Acp6D_0.Payload * 1000) - pShuttle.par.initialWeight;
					
					// Set the weight of the product
					pOrderHistory.product[pShuttlePlan.productID].weight := pShuttlePlan.currentProductWeight;
				END_IF
				
				IF (MC_BR_ShGetPayload_Acp6D_0.Payload * 1000 - pShuttle.par.initialWeight) < 30 THEN
					setWeight := TRUE;
					moveShuttle[pWorkstation.par.tempShuttleID] := TRUE;
					cm.state := 60;
				ELSE
					cm.state := 43;
				END_IF
			END_IF
		
		43:
			cm.description := 'Wait before getting new weight';
			
			pWorkstation.TON_0.PT := T#1S;
			pWorkstation.TON_0.IN := TRUE;
			IF pWorkstation.TON_0.Q THEN
				pWorkstation.TON_0.IN := FALSE;
				
				cm.state := 42;
			END_IF
		
		45:
			cm.description := 'Set data since product is finished';

			amountProductsFinished := amountProductsFinished + 1;
			pOrderHistory.finishedProductCount := pOrderHistory.finishedProductCount + 1;
	
			// Update the average workstation cycle times of the order (and reset for the shuttlePlan)
			FOR j := 0 TO (smartLabNumWorkstations - 1) DO
				pOrderHistory.avgCycleTime[j] := (pOrderHistory.avgCycleTime[j] * USINT_TO_REAL(pOrderHistory.finishedProductCount - 1) + pShuttlePlan.workstationCycleTime[j]) / USINT_TO_REAL(pOrderHistory.finishedProductCount);
				pShuttlePlan.workstationCycleTime[j] := pShuttlePlan.startTimeAtWorkstation[j] := 0.0;
			END_FOR
			
			// Set the product time and determine if order is finished
			pOrderHistory.product[pShuttlePlan.productID].finishTime := DT_TO_REAL(DTGetTime_0.DT1) - DT_TO_REAL(pOrderHistory.orderStartingTime);
			
			IF pOrderHistory.finishedProductCount = pOrderHistory.productOrder.amount THEN
				amountOrdersFinished := amountOrdersFinished + 1;
				pOrderHistory.orderFinishTime := DTGetTime_0.DT1; 
				pOrderHistory.status := FINISHED;
			END_IF
			
			// If KUKA6 is not enabled, go to wait for shuttle to be removed
			IF robotEnabled[5] THEN
				moveShuttle[pWorkstation.par.tempShuttleID] := TRUE;
				cm.state := 60;
			ELSE
				cm.state := 43;
			END_IF
			
			
//		50:
//			cm.description := 'Leviate shuttle if landed before process';
//
//			pWorkstation.MC_BR_ShLevitation_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[pWorkstation.par.tempShuttleID].shuttleRef);
//			pWorkstation.MC_BR_ShLevitation_Acp6D_0.Parameters.Level := 1; // Leviate
//			pWorkstation.MC_BR_ShLevitation_Acp6D_0.Parameters.Speed := 0;
//			pWorkstation.MC_BR_ShLevitation_Acp6D_0.Execute := TRUE;
//			IF pWorkstation.MC_BR_ShLevitation_Acp6D_0.Done THEN
//				pWorkstation.MC_BR_ShLevitation_Acp6D_0.Execute := FALSE;
			//
//				moveShuttle[pWorkstation.par.tempShuttleID] := TRUE;
//				cm.state := 60;
//			END_IF


		60:
			cm.description := 'Wait for shuttle to start moving before going back to wait for new shuttle';

			// Go back to wait for shuttle at workstation if the current shuttle has begun moving (avoids bugs)
			IF gAcp6DCtrl.Status.ShuttleInfo[pWorkstation.par.tempShuttleID].State = mcACP6D_SH_STATE_MOTION THEN

				// We set flag to acquire image if upcoming path has a camera station and if the shuttle is active (has been assigned an order)
				IF shuttlePlans[pWorkstation.par.tempShuttleID].isActive AND pWorkstation.par.cameraID <> -1 THEN
					gShuttles[pWorkstation.par.tempShuttleID].par.acquireImage := TRUE;
				END_IF
				
				cm.state := 10;

			END_IF

	END_CASE

	// Function block calls
	pWorkstation.MC_BR_ShLevitation_Acp6D_0();
	pWorkstation.TON_0();
	cm();

END_ACTION


ACTION smartLabShuttleMovement :

	CASE cm.state OF
		0:
			cm.description := 'Set parameters for the shuttles and wait for workstation to set new state';
			pShuttle.function.MovementColumnSelection.occupiedPosition := ADR(occupiedPosition);
			
			pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity := shuttleSmartLabVelocity;
			pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := shuttleSmartLabAcceleration;
			pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Parameters.Mode := 0; // Absolute

			pShuttle.function.MC_BR_RotaryMotion_Acp6D_0.Parameters.Velocity := shuttleSmartLabRotVelocity;
			pShuttle.function.MC_BR_RotaryMotion_Acp6D_0.Parameters.Acceleration := shuttleSmartLabRotAcceleration;
			pShuttle.function.MC_BR_RotaryMotion_Acp6D_0.Parameters.Mode := 1; // CCW

			// If the shuttlePlan is active, get the shuttle payload
			IF moveShuttle[pShuttle.par.shuttleID] THEN
				moveShuttle[pShuttle.par.shuttleID] := FALSE;
				cm.state := 10;
			END_IF


		10:
			cm.description := 'Determine the next workstation and set parameters based on this';

			// Set the next workstation ID (either from routing sheet for active shuttles and next in row for inactive shuttles)
			IF pShuttlePlan.isActive THEN
				pShuttle.par.tempNextWorkstationID := pShuttlePlan.routingSheet[pShuttlePlan.progressIndex];
				pShuttlePlan.progressIndex := pShuttlePlan.progressIndex + 1;
				
				// If the next workstation is 0 (first workstation), reset the progress index and set the shuttleplan to be inactive
				IF pShuttle.par.tempNextWorkstationID = 0 THEN
					pShuttlePlan.progressIndex := 0;
					pShuttlePlan.isActive := FALSE;
					activeShuttles := activeShuttles - 1;
				END_IF
			ELSE
				pShuttle.par.tempNextWorkstationID := (pShuttle.par.tempWorkstationID + 1) MOD smartLabNumWorkstations;
			END_IF

			cm.state := 11;


		11:
			cm.description := 'Determine the next state, depending on where the next workstation is';
			
			// Set default state
			cm.state := 20;
			
			// If the shuttle has a camera station set, always move to state 20
			IF pShuttle.par.tempCameraStationID <> -1 THEN
				// Do nothing
			// If workstation and next approach point is on the same row, move straight to it
			ELSIF ArePositionsOnSameRow(yPos1 := gWorkstations[pShuttle.par.tempWorkstationID].par.xLocation, yPos2 := gWorkstations[pShuttle.par.tempNextWorkstationID].par.approachPosX) THEN
				cm.state := 40;
			// If the workstations are on the same column and the buffer to the next workstation is empty, move directly to the workstation
			ELSIF ArePositionsOnSameColumn(xPos1 := gWorkstations[pShuttle.par.tempWorkstationID].par.xLocation, xPos2 := gWorkstations[pShuttle.par.tempNextWorkstationID].par.xLocation) THEN
				// Define the next workstation
				ShuttlesInWorkstationBuffer_0.workstation := gWorkstations[pShuttle.par.tempNextWorkstationID];
				ShuttlesInWorkstationBuffer_0();
				
				IF NOT ShuttlesInWorkstationBuffer_0.isInBuffer THEN
					cm.state := 40;
				END_IF
			END_IF
		
			
		20:
			cm.description := 'Move to depart position of current workstation';
			pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[pShuttle.par.shuttleID].shuttleRef);
			pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 2; // Y THEN X
			
			// Start position is set to current position
			pShuttle.par.tempStartPos.xPos := gAcp6DCtrl.Status.ShuttleInfo[pShuttle.par.shuttleID].Position.X;
			pShuttle.par.tempStartPos.yPos := gAcp6DCtrl.Status.ShuttleInfo[pShuttle.par.shuttleID].Position.Y;
			
			pShuttle.par.tempDestinationPos.xPos := gWorkstations[pShuttle.par.tempWorkstationID].par.departPosX;
			pShuttle.par.tempDestinationPos.yPos := gWorkstations[pShuttle.par.tempWorkstationID].par.departPosY;
			
			pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := pShuttle.par.tempDestinationPos.xPos;
			pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := pShuttle.par.tempDestinationPos.yPos;
			
			pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Done THEN
				pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				
				// If the shuttle is associated with a camera go to wait for camera station position to be available
				IF pShuttle.par.tempCameraStationID <> -1 THEN
					cm.state := 28;
				// If the workstations are on the same row move directly to the next workstation
				ELSIF ArePositionsOnSameRow(yPos1 := gWorkstations[pShuttle.par.tempWorkstationID].par.departPosY, yPos2 := gWorkstations[pShuttle.par.tempNextWorkstationID].par.approachPosY) THEN
					cm.state := 40;
				// Else go select a free column for movement on highway
				ELSE
					cm.state := 29;
				END_IF
			
			END_IF
			
			
		28:
			cm.description := 'Wait for camera station position to be available';	
			
			// Check if the camera is reserved
			ShuttleTouchQuadrantPos_0.shuttlePos := awaitingCameraResultPosition[pShuttle.par.tempCameraStationID];
			ShuttleTouchQuadrantPos_0();
			
			tempAwaitingCamPosOccupied := FALSE;
			
			FOR j := 0 TO ShuttleTouchQuadrantPos_0.numTouches DO
				// If the quadrant is on the highway
				IF 0 < ShuttleTouchQuadrantPos_0.quadrantPosX[j] AND ShuttleTouchQuadrantPos_0.quadrantPosX[j] < 5 THEN 
					IF occupiedPosition[ShuttleTouchQuadrantPos_0.quadrantPosX[j] - 1, ShuttleTouchQuadrantPos_0.quadrantPosY[j]] THEN
						tempAwaitingCamPosOccupied := TRUE;
						EXIT;
					END_IF
				END_IF
			END_FOR
			
			IF NOT (gCameraStations[pShuttle.par.tempCameraStationID].reserved OR tempAwaitingCamPosOccupied) THEN
				gCameraStations[pShuttle.par.tempCameraStationID].reserved := TRUE;
				pShuttle.par.cameraOperationDone := FALSE;
				
				cm.state := 29;
			END_IF
			
		29:
			cm.description := 'Determine a free column to move along from the starting and ending positions';
			
			// Select the closest column that is available (no other shuttles using positions in column)
			pShuttle.function.MovementColumnSelection.startPosY := gWorkstations[pShuttle.par.tempWorkstationID].par.departPosY;
			pShuttle.function.MovementColumnSelection.endPosY := gWorkstations[pShuttle.par.tempNextWorkstationID].par.approachPosY;
			pShuttle.function.MovementColumnSelection.prioritiseLowColumns := (gWorkstations[pShuttle.par.tempWorkstationID].par.workstationID >= 3);
			
			// If the shuttle is connected to a camera adjust the position according to whether camera operation is done or not
			IF pShuttle.par.tempCameraStationID <> -1 THEN
				IF NOT pShuttle.par.cameraOperationDone THEN					
					pShuttle.function.MovementColumnSelection.endPosY := awaitingCameraResultPosition[pShuttle.par.tempCameraStationID].yPos;
				ELSE
					pShuttle.function.MovementColumnSelection.startPosY := awaitingCameraResultPosition[pShuttle.par.tempCameraStationID].yPos;
					pShuttle.function.MovementColumnSelection.prioritiseLowColumns := (gWorkstations[pShuttle.par.tempNextWorkstationID].par.workstationID >= 3);
				END_IF
			END_IF
			pShuttle.function.MovementColumnSelection();
			
			// Set highway column
			pShuttle.par.tempHighwayColumn := pShuttle.function.MovementColumnSelection.selectedHighwayColumn;
			
			// If a highway column was available for use
			IF pShuttle.par.tempHighwayColumn <> -1 THEN
				// Occupy camera position
				IF pShuttle.par.tempCameraStationID <> -1 AND NOT pShuttle.par.cameraOperationDone THEN
					ShuttleTouchQuadrantPos_0.shuttlePos := awaitingCameraResultPosition[pShuttle.par.tempCameraStationID];
					ShuttleTouchQuadrantPos_0();
					
					FOR j := 0 TO ShuttleTouchQuadrantPos_0.numTouches DO
						// Occupy the position if it is on the highway
						IF 0 < ShuttleTouchQuadrantPos_0.quadrantPosX[j] AND ShuttleTouchQuadrantPos_0.quadrantPosX[j] < 5 THEN 
							occupiedPosition[ShuttleTouchQuadrantPos_0.quadrantPosX[j] - 1, ShuttleTouchQuadrantPos_0.quadrantPosY[j]] := TRUE;
						END_IF
					END_FOR
				END_IF
				
				// Set destination position
				pShuttle.par.tempDestinationPos.xPos := QuadrantIdxToPos(quadrantIdx := (1 + pShuttle.par.tempHighwayColumn)); // Add 1 because the first column is not a highway
				pShuttle.par.tempDestinationPos.yPos := pShuttle.function.MovementColumnSelection.endPosY;
				
				cm.state := 30;
			END_IF
		
		30:
			cm.description := 'Move to the end position at the selected column';
			pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[pShuttle.par.shuttleID].shuttleRef);
			pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 1; // X THEN Y
			
			// Start position is set to current position
			pShuttle.par.tempStartPos.xPos := gAcp6DCtrl.Status.ShuttleInfo[pShuttle.par.shuttleID].Position.X;
			pShuttle.par.tempStartPos.yPos := gAcp6DCtrl.Status.ShuttleInfo[pShuttle.par.shuttleID].Position.Y;
			
			pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := pShuttle.par.tempDestinationPos.xPos;
			pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := pShuttle.par.tempDestinationPos.yPos;
			
			pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Done THEN
				pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				
				pShuttle.function.MovementColumnSelection.opt_movementDone := TRUE;
				pShuttle.function.MovementColumnSelection.opt_resetColumn := pShuttle.par.tempHighwayColumn;
				pShuttle.function.MovementColumnSelection();
				
				IF pShuttle.par.tempCameraStationID <> -1 AND NOT pShuttle.par.cameraOperationDone THEN
					cm.state := 35;
				ELSE
					cm.state := 40;
				END_IF
			END_IF
		

		35:
			cm.description := 'Move to position for operation correlated to camera';
			pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[pShuttle.par.shuttleID].shuttleRef);
			pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 2; // Y THEN X
			
			pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := awaitingCameraResultPosition[pShuttle.par.tempCameraStationID].xPos;
			pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := awaitingCameraResultPosition[pShuttle.par.tempCameraStationID].yPos;
			
			pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Done THEN
				pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				
				cm.state := 36;
			END_IF

		36:
			cm.description := 'Perform camera specific operation';

			CASE pShuttle.par.tempCameraStationID OF
				// Rotate shuttle
				0:
					IF pShuttlePlan.isFlipped THEN
						pShuttle.function.MC_BR_RotaryMotion_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[pShuttle.par.shuttleID].shuttleRef);
						
						// Check if shuttle already has been rotated
						IF gAcp6DCtrl.Status.ShuttleInfo[pShuttle.par.shuttleID].Position.Rz > brmPI_2 THEN
							pShuttle.function.MC_BR_RotaryMotion_Acp6D_0.Parameters.Angle := 0; // 0 degrees because shuttle already is rotated by 180
						ELSE 
							pShuttle.function.MC_BR_RotaryMotion_Acp6D_0.Parameters.Angle := brmPI; // 180 degrees
						END_IF

						pShuttle.function.MC_BR_RotaryMotion_Acp6D_0.Execute := TRUE;
						IF pShuttle.function.MC_BR_RotaryMotion_Acp6D_0.Done THEN
							pShuttle.function.MC_BR_RotaryMotion_Acp6D_0.Execute := FALSE;
							
							cm.state := 37;
						END_IF
					ELSE
						cm.state := 37;
					END_IF

			END_CASE
		
		37: 
			cm.description := 'Reset occupied positions';
			
			// Make occupied positions available for use again
			ShuttleTouchQuadrantPos_0.shuttlePos := awaitingCameraResultPosition[pShuttle.par.tempCameraStationID];
			ShuttleTouchQuadrantPos_0();
			
			FOR j := 0 TO ShuttleTouchQuadrantPos_0.numTouches DO
				// If the quadrant is on the highway
				IF 0 < ShuttleTouchQuadrantPos_0.quadrantPosX[j] AND ShuttleTouchQuadrantPos_0.quadrantPosX[j] < 5 THEN 
					occupiedPosition[ShuttleTouchQuadrantPos_0.quadrantPosX[j] - 1, ShuttleTouchQuadrantPos_0.quadrantPosY[j]] := FALSE;
				END_IF
			END_FOR
			
			pShuttle.par.cameraOperationDone := TRUE;
			
			cm.state := 38;
			
		38:
			cm.description := 'Move to column depending on next workstation';	
			pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[pShuttle.par.shuttleID].shuttleRef);
			pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 2; // Y THEN X
			
			// Start position is set to current position
			pShuttle.par.tempStartPos.xPos := gAcp6DCtrl.Status.ShuttleInfo[pShuttle.par.shuttleID].Position.X;
			pShuttle.par.tempStartPos.yPos := gAcp6DCtrl.Status.ShuttleInfo[pShuttle.par.shuttleID].Position.Y;
			
			// Set goal position depending on next workstation
			pShuttle.par.tempDestinationPos.xPos := awaitingCameraResultPosition[pShuttle.par.tempCameraStationID].xPos;
			IF (gWorkstations[pShuttle.par.tempNextWorkstationID].par.workstationID >= 3) THEN
				pShuttle.par.tempDestinationPos.yPos := awaitingCameraResultPosition[pShuttle.par.tempCameraStationID].yPos + 0.060;
			ELSE
				pShuttle.par.tempDestinationPos.yPos := awaitingCameraResultPosition[pShuttle.par.tempCameraStationID].yPos - 0.060;
			END_IF
			
			pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := pShuttle.par.tempDestinationPos.xPos;
			pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := pShuttle.par.tempDestinationPos.yPos;
			
			pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Done THEN
				pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				
				gCameraStations[pShuttle.par.tempCameraStationID].reserved := FALSE;
				
				// Go back to select a new column for movement to next workstation
				IF ArePositionsOnSameRow(yPos1 := pShuttle.par.tempDestinationPos.yPos, yPos2 := gWorkstations[pShuttle.par.tempNextWorkstationID].par.approachPosY) THEN
					cm.state := 40;
				ELSE
					cm.state := 29;
				END_IF
			END_IF
			
			
		40:
			cm.description := 'Move to next workstation';
			pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[pShuttle.par.shuttleID].shuttleRef);
			pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 1; // X THEN Y

			// Start position is set to current position
			pShuttle.par.tempStartPos.xPos := gAcp6DCtrl.Status.ShuttleInfo[pShuttle.par.shuttleID].Position.X;
			pShuttle.par.tempStartPos.yPos := gAcp6DCtrl.Status.ShuttleInfo[pShuttle.par.shuttleID].Position.Y;

			// Move to next workstation
			pShuttle.par.tempDestinationPos.xPos := gWorkstations[pShuttle.par.tempNextWorkstationID].par.xLocation;
			pShuttle.par.tempDestinationPos.yPos := gWorkstations[pShuttle.par.tempNextWorkstationID].par.yLocation;

			pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := pShuttle.par.tempDestinationPos.xPos;
			pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := pShuttle.par.tempDestinationPos.yPos;

			pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
				pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				
				// Go back to wait for new workstation to send the shuttle on
				cm.state := 0;
			END_IF

	END_CASE

	// Function block calls
	pShuttle.function.MC_BR_MoveInPlane_Acp6D_0();
	pShuttle.function.MC_BR_ShGetPayload_Acp6D_0();
	pShuttle.function.MC_BR_RotaryMotion_Acp6D_0();
	cm();

END_ACTION


ACTION smartLabCameraProcess:

	// The following approach assumes that the shuttle is not obstructed throughout its path, and allows more than one shuttle to be "queued" based on FIFO.

	IF pShuttle.par.acquireImage THEN

		pCameraStation ACCESS ADR(gCameraStations[pShuttle.par.tempCameraStationID]);
		cm ACCESS ADR(gCameraStations[pShuttle.par.tempCameraStationID].cm);
		cm.setup.parent.name := 'SmartLabRun';

		CASE cm.state OF

			0: // Calculate and send the time it takes for the shuttle to go from current to camera position. This is used by vision program to account for network delay

				pCameraStation.tempShuttleID := USINT_TO_SINT(pShuttle.par.shuttleID);

				CASE pShuttle.par.tempCameraStationID OF

					0: // Camera after workstation 0, so the distances are specified in y-direction

						// The assumption behind these calculations is that the camera is located on the path until the first direction change in the Manhattan path
						ParabolicBlend_0.absVelocity 		:= shuttleSmartLabVelocity;
						ParabolicBlend_0.absAcceleration 	:= shuttleSmartLabAcceleration;
						ParabolicBlend_0.startPos 			:= pShuttle.par.tempStartPos.yPos;
						ParabolicBlend_0.endPos 			:= pShuttle.par.tempDestinationPos.yPos;
						ParabolicBlend_0.evalPos 			:= pCameraStation.camPosY;
						ParabolicBlend_0();

						durationStartToCamera := REAL_TO_DINT(ParabolicBlend_0.durationAtEvalDist * 1000000); // Converted to microseconds

						// Check if the shuttle is at start position to avoid errors due to position inaccuracies
						IF ABS(pShuttle.par.tempStartPos.yPos - gAcp6DCtrl.Status.ShuttleInfo[pShuttle.par.shuttleID].Position.Y) < 0.001 AND
						   ABS(pShuttle.par.tempStartPos.xPos - gAcp6DCtrl.Status.ShuttleInfo[pShuttle.par.shuttleID].Position.X) < 0.001 THEN

							durationToCamera[pShuttle.par.tempCameraStationID] := durationStartToCamera;

						ELSE // The shuttle has an offset from start position and the new current position must be accounted for

							// Calculate how far in time the shuttle has moved from the starting point. Start and end must be set again since ParabolicBlend can manipulate these inputs
							ParabolicBlend_0.evalPos 	:= gAcp6DCtrl.Status.ShuttleInfo[pShuttle.par.shuttleID].Position.Y;
							ParabolicBlend_0();

							durationStartToCurrent := REAL_TO_DINT(ParabolicBlend_0.durationAtEvalDist * 1000000); // Converted to microseconds

							durationToCamera[pShuttle.par.tempCameraStationID] := durationStartToCamera - durationStartToCurrent; // Converted to microseconds

						END_IF

				END_CASE

				// Send request if no error occurred in parabolic blend calculation. (Implement error handling in the future),
				// and if the shuttle still has time to arrive at the camera
				IF ParabolicBlend_0.durationAtEvalDist <> -1 THEN
					imgCoverType := COVER_TYPE_TO_USINT(pShuttlePlan.productOrder.bottomCover);
					requestImage[pShuttle.par.tempCameraStationID] := TRUE;
					cm.state := 10;
				ELSE
					pShuttle.par.acquireImage := FALSE;
				END_IF

			// Currently implemented as if all cameras follow the same visionResultReady implementation. However, camera-specific approach is possible if multiple cameras are used
			10: // Wait for request from vision program, indicated by rising edge
				IF EDGEPOS(visionResultReady[pShuttle.par.tempCameraStationID]) AND pCameraStation.tempShuttleID = USINT_TO_SINT(pShuttle.par.shuttleID) THEN
					requestImage[pShuttle.par.tempCameraStationID] := FALSE;
					pShuttle.par.acquireImage := FALSE;

					pShuttlePlan.isFlipped := flipProduct;
					pOrderHistory.product[pShuttlePlan.productID].flipped := pShuttlePlan.isFlipped;

					cm.state := 0;
				END_IF

		END_CASE
	END_IF

	cm();

END_ACTION
