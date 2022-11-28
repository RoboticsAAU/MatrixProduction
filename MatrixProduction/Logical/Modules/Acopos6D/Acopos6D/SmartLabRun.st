
ACTION smartLabWorkstationOperation:
	CASE cm.state OF
		0:
			cm.description := 'Setting parameters for the workstations'; // None right now
			
			// Function block reference information
			ShuttlesAtPositions_0.shuttleInfo := ADR(gAcp6DCtrl.Status.ShuttleInfo); // Maybe need to run FB?
			ShuttlesInRange_0.shuttleInfo := ADR(gAcp6DCtrl.Status.ShuttleInfo);
			ShuttlesInWorkstationBuffer_0.shuttleInfo := ADR(gAcp6DCtrl.Status.ShuttleInfo);
			MovementColumnSelection_0.occupiedPosition := ADR(occupiedPosition);
			
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
					shuttlePlans[pWorkstation.par.tempShuttleID].isActive := TRUE;
					shuttlePlans[pWorkstation.par.tempShuttleID].progressIndex := 0;
					shuttlePlans[pWorkstation.par.tempShuttleID].routingSheet := CreateRouteSheet_0.outputRouteSheet;
					shuttlePlans[pWorkstation.par.tempShuttleID].productOrder := productOrder;
					shuttlePlans[pWorkstation.par.tempShuttleID].productID := productOrder.amount - remainingOrderAmount;
					
					remainingOrderAmount := remainingOrderAmount - 1;
					cm.state := 20;
				ELSIF NOT bufferEmpty THEN
					// Go back to read new order in read state
					em.substate := 17015;
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
						gShuttles[pWorkstation.par.tempShuttleID].cm.state := 10;
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
			
			IF NOT robotBusy[i] THEN
				CASE pWorkstation.par.workstationID OF
					// Send type of bottom cover (converted to int)
					0: orderSpec[0] := COVER_TYPE_TO_USINT(shuttlePlans[pWorkstation.par.tempShuttleID].productOrder.bottomCover);
					
					// Send amount of holes
					1: orderSpec[1] := shuttlePlans[pWorkstation.par.tempShuttleID].productOrder.Holes;
					
					// Send whether a PCB is specified or not (converted to int)
					2: orderSpec[2] := BOOL_TO_USINT(shuttlePlans[pWorkstation.par.tempShuttleID].productOrder.PCB);
					
					// Send amount of fuses
					3: orderSpec[3] := shuttlePlans[pWorkstation.par.tempShuttleID].productOrder.Fuses;
						
					// Send type of top cover (converted to int)
					4: orderSpec[4] := COVER_TYPE_TO_USINT(shuttlePlans[pWorkstation.par.tempShuttleID].productOrder.topCover);
					
					// Send ID of order
					5: 
						orderSpec[5] := shuttlePlans[pWorkstation.par.tempShuttleID].productOrder.ID;
						orderAmount := shuttlePlans[pWorkstation.par.tempShuttleID].productOrder.amount;
					
				END_CASE
				
				// Send if order is flipped or not (not sent to robots - fixed on ACOPOS side instead)
//				isProductFlipped[i] := pShuttlePlan.isFlipped;
				
				// If robot is enabled, begin robot operation
				IF robotEnabled[i] THEN
					robotExecute[i] := TRUE;
					shuttlePlans[pWorkstation.par.tempShuttleID].startTimeAtWorkstation[pWorkstation.par.workstationID] := TIME_TO_REAL(clock_ms()) / 1000;
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
//				pWorkstation.MC_BR_ShLevitation_Acp6D_0.Parameters.Level := 0; //Land
//				pWorkstation.MC_BR_ShLevitation_Acp6D_0.Parameters.Speed := 0;
//				pWorkstation.MC_BR_ShLevitation_Acp6D_0.Execute := TRUE;
//			END_IF
//			IF pWorkstation.MC_BR_ShLevitation_Acp6D_0.Done THEN
//				pWorkstation.MC_BR_ShLevitation_Acp6D_0.Execute := FALSE;
//				cm.state := 40;
//			END_IF
			
			
		40:
			cm.description := 'Wait for robot to finish operation';
			
			IF robotDone[i] THEN
				robotExecute[i] := FALSE;
				
				// Calculate the workstation cycle time
				shuttlePlans[pWorkstation.par.tempShuttleID].workstationCycleTime[pWorkstation.par.workstationID] := (TIME_TO_REAL(clock_ms()) / 1000) - shuttlePlans[pWorkstation.par.tempShuttleID].startTimeAtWorkstation[pWorkstation.par.workstationID];
				
				// Make current shuttle move to the next workstation and make workstation go back to wait for new shuttle
				moveShuttle[pWorkstation.par.tempShuttleID] := TRUE;
				cm.state := 60;
			END_IF
			
			
//		50:
//			cm.description := 'Leviate shuttle if landed before process';
//			
//			pWorkstation.MC_BR_ShLevitation_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[pWorkstation.par.tempShuttleID].shuttleRef);
//			pWorkstation.MC_BR_ShLevitation_Acp6D_0.Parameters.Level := 1; //Leviate
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
				
				gShuttles[pWorkstation.par.tempShuttleID].par.tempCameraStationID := pWorkstation.par.cameraID;
				
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


ACTION smartLabShuttleMovement:		
	
	CASE cm.state OF
		0:
			cm.description := 'Set parameters for the shuttles and wait for workstation to set new state';
			pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
			pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
			pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Parameters.Mode := 0; // Absolute
			
			pShuttle.function.MC_BR_RotaryMotion_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.rotationAcceleration;
			pShuttle.function.MC_BR_RotaryMotion_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.rotationVelocity; // in rpm
			pShuttle.function.MC_BR_RotaryMotion_Acp6D_0.Parameters.Mode := 1; // CCW
			
			// If the shuttlePlan is active, get the shuttle payload
			IF pShuttlePlan.isActive THEN
				pShuttle.function.MC_BR_ShGetPayload_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[pShuttle.par.shuttleID].shuttleRef);
				pShuttle.function.MC_BR_ShGetPayload_Acp6D_0.Execute := TRUE;
				IF pShuttle.function.MC_BR_ShGetPayload_Acp6D_0.Done THEN
					pShuttlePlan.currentProductWeight := (pShuttle.function.MC_BR_ShGetPayload_Acp6D_0.Payload * 1000) - pShuttle.par.initialWeight;
					
					IF moveShuttle[pShuttle.par.shuttleID] THEN
						moveShuttle[pShuttle.par.shuttleID] := FALSE;
						cm.state := 10;
					END_IF
				END_IF
			ELSE
				IF moveShuttle[pShuttle.par.shuttleID] THEN
					moveShuttle[pShuttle.par.shuttleID] := FALSE;
					cm.state := 10;
				END_IF
			END_IF
		
			
		10:
			cm.description := 'Determine the next workstation and set parameters based on this';	
			
			// Set the next workstation ID (either from routing sheet for active shuttles and next in row for inactive shuttles)
			IF pShuttlePlan.isActive THEN
				pShuttle.par.tempNextWorkstationID := pShuttlePlan.routingSheet[pShuttlePlan.progressIndex];
				pShuttlePlan.progressIndex := pShuttlePlan.progressIndex + 1;
				
				CASE pShuttle.par.tempNextWorkstationID OF
					// If the next workstation is 0 (first workstation), reset the progress index and set the shuttleplan to be inactive
					0:
						pShuttlePlan.progressIndex := 0;
						pShuttlePlan.isActive := FALSE;
						activeShuttles := activeShuttles - 1;
						amountProductsFinished := amountProductsFinished + 1;
						pOrderHistory.finishedProductCount := pOrderHistory.finishedProductCount + 1;
						
						// Update the average workstation cycle times of the order (and reset for the shuttlePlan)
						FOR j := 0 TO (smartLabNumWorkstations - 1) DO
							pOrderHistory.avgCycleTime[j] := (pOrderHistory.avgCycleTime[j] * USINT_TO_REAL(pOrderHistory.finishedProductCount - 1) + pShuttlePlan.workstationCycleTime[j]) / USINT_TO_REAL(pOrderHistory.finishedProductCount);
							pShuttlePlan.workstationCycleTime[j] := pShuttlePlan.startTimeAtWorkstation[j] := 0.0;
						END_FOR
						
						// Set the product time and determine if order is finished
						pOrderHistory.product[pShuttlePlan.productID].finishTime := DT_TO_REAL(DTGetTime_0.DT1) - DT_TO_REAL(orderHistory[pShuttlePlan.productOrder.ID].orderStartingTime);
						
						IF pOrderHistory.finishedProductCount = pOrderHistory.productOrder.amount THEN
							pOrderHistory.orderFinishTime := DTGetTime_0.DT1;
							pOrderHistory.status := FINISHED;
						END_IF
					
					// If the next workstation is 5 (last workstation), set the final weight of the product
					5:
						orderHistory[pShuttlePlan.productOrder.ID].product[pShuttlePlan.productID].weight := pShuttlePlan.currentProductWeight;
					
				END_CASE
			ELSE
				pShuttle.par.tempNextWorkstationID := (pShuttle.par.tempWorkstationID + 1) MOD smartLabNumWorkstations;
			END_IF
			
			cm.state := 11;
			
			
		11:
			cm.description := 'Determine the next state, depending on where the next workstation is';
			
			IF pShuttle.par.tempWorkstationID = 0 THEN
				cm.state := 20;
			// If the workstations are opposite each other, go directly to the approach point of next workstation (no need to occupy column when it only moves in row)
			ELSIF AreWorkstationsOpposite(workstationID1 := pShuttle.par.tempWorkstationID, workstationID2 := pShuttle.par.tempNextWorkstationID) THEN
				cm.state := 30;
			// If the workstations are adjacent to each other and the buffer to the next workstation is empty, move directly to the workstation
			ELSIF AreWorkstationsAdjacent(workstationID1 := pShuttle.par.tempWorkstationID, workstationID2 := pShuttle.par.tempNextWorkstationID) THEN
				// Define the next workstation
				ShuttlesInWorkstationBuffer_0.workstation := gWorkstations[pShuttle.par.tempNextWorkstationID];
				ShuttlesInWorkstationBuffer_0();
				
				IF ShuttlesInWorkstationBuffer_0.isInBuffer THEN
					cm.state := 20;
				ELSE
					cm.state := 40;
				END_IF
			// Else move using original method (find free column to use)
			ELSE
				cm.state := 20;
			END_IF	
			
			
		20:
			cm.description := 'Move from workstation to depart point (or next free column)';
			pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[pShuttle.par.shuttleID].shuttleRef);
			pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 2; // Y THEN X
			
			// If the workstation is connected with a camera station, set the column to the workstations depart position
			IF pShuttle.par.tempCameraStationID <> -1 THEN // Maybe not how it should be done (not all stations connected to a camera may want the shuttle to move to some new position)
				IF pShuttle.par.tempWorkstationID <= 2 THEN
					pShuttle.par.tempHighwayColumn := 3;
				ELSE
					pShuttle.par.tempHighwayColumn := 0;
				END_IF
			END_IF
			
			// If a column has not been selected yet
			IF pShuttle.par.tempHighwayColumn = -1 THEN	
				// Select the closest column that is available (no other shuttles using column or movement direction is opposite)
				MovementColumnSelection_0.startWorkstation := gWorkstations[pShuttle.par.tempWorkstationID];
				MovementColumnSelection_0.endWorkstation := gWorkstations[pShuttle.par.tempNextWorkstationID];
				MovementColumnSelection_0();
				
				pShuttle.par.tempHighwayColumn := MovementColumnSelection_0.selectedColumn;
				
			// Move to the specified column if any is available (-1 if no column is available)
			ELSE
				
				// Start position is set to current position
				pShuttle.par.tempStartPos.xPos := gAcp6DCtrl.Status.ShuttleInfo[pShuttle.par.shuttleID].Position.X;
				pShuttle.par.tempStartPos.yPos := gAcp6DCtrl.Status.ShuttleInfo[pShuttle.par.shuttleID].Position.Y;
				
				// Position of the selected column
				pShuttle.par.tempDestinationPos.xPos := QuadrantIdxToPos(quadrantIdx := (1 + pShuttle.par.tempHighwayColumn)); // Add 1 because the first column is not a highway
				pShuttle.par.tempDestinationPos.yPos := gWorkstations[pShuttle.par.tempWorkstationID].par.departPosY;
				
				pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := pShuttle.par.tempDestinationPos.xPos;
				pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := pShuttle.par.tempDestinationPos.yPos;
				
				pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
				IF pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Done THEN
					pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
					
					IF pShuttle.par.tempCameraStationID <> -1 THEN
						cm.state := 25;
					ELSE
						cm.state := 30;
					END_IF
				END_IF
			END_IF
			
			
		25:
			cm.description := 'Move to position for operation correlated to camera';
			pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[pShuttle.par.shuttleID].shuttleRef);
			pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 1; // X THEN Y
			
			// If the position is on the highway set occupied positions on the highway around shuttle
			IF 0 < PosToQuadrantIdx(cameraOperationPosition[pShuttle.par.tempCameraStationID].xPos) OR PosToQuadrantIdx(cameraOperationPosition[pShuttle.par.tempCameraStationID].xPos) < 5 THEN
				ShuttleTouchQuadrantPos_0.shuttlePos := cameraOperationPosition[pShuttle.par.tempCameraStationID];
				ShuttleTouchQuadrantPos_0();
				
				FOR j := 0 TO ShuttleTouchQuadrantPos_0.numTouches DO
					occupiedPosition[ShuttleTouchQuadrantPos_0.quadrantPosX[j] - 1, ShuttleTouchQuadrantPos_0.quadrantPosY[j]] := TRUE;
				END_FOR
				// NOTE: Should maybe also occupy positions for the movement itself
			END_IF
			
			pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := cameraOperationPosition[pShuttle.par.tempCameraStationID].xPos;
			pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := cameraOperationPosition[pShuttle.par.tempCameraStationID].yPos;
			
			pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Done THEN
				pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				
				IF pShuttle.par.tempCameraStationID <> -1 THEN
					cm.state := 26;
				END_IF
			END_IF
		
		26:
			cm.description := 'Perform camera specific operation';
			
			CASE pShuttle.par.tempCameraStationID OF
				// Rotate shuttle
				0:
					// Determine the touches again to make the columns available after done using them
					ShuttleTouchQuadrantPos_0.shuttlePos := cameraOperationPosition[pShuttle.par.tempCameraStationID];
					ShuttleTouchQuadrantPos_0();
					
					IF pShuttlePlan.isFlipped THEN
						pShuttle.function.MC_BR_RotaryMotion_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[pShuttle.par.shuttleID].shuttleRef);
						
						pShuttle.function.MC_BR_RotaryMotion_Acp6D_0.Parameters.Angle := brmPI; // 180 degrees (try pShuttlePlan.isFlipped * brmPI)
						
						pShuttle.function.MC_BR_RotaryMotion_Acp6D_0.Execute := TRUE;
						IF pShuttle.function.MC_BR_RotaryMotion_Acp6D_0.Done THEN
							pShuttle.function.MC_BR_RotaryMotion_Acp6D_0.Execute := FALSE;
							
							// Make occupied positioons available for use again
							FOR j := 0 TO ShuttleTouchQuadrantPos_0.numTouches DO
								occupiedPosition[ShuttleTouchQuadrantPos_0.quadrantPosX[j] - 1, ShuttleTouchQuadrantPos_0.quadrantPosY[j]] := FALSE;
							END_FOR
							
							cm.state := 30;
						END_IF
					ELSE
						// Make occupied positioons available for use again
						FOR j := 0 TO ShuttleTouchQuadrantPos_0.numTouches DO
							occupiedPosition[ShuttleTouchQuadrantPos_0.quadrantPosX[j] - 1, ShuttleTouchQuadrantPos_0.quadrantPosY[j]] := FALSE;
						END_FOR
						
						cm.state := 30;
					END_IF
				
			END_CASE
			
			
		30:
			cm.description := 'Move from depart point (or free row) of current workstation to approach point of next workstation';
			pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[pShuttle.par.shuttleID].shuttleRef);
			pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 2; // Y THEN X
			
			// Start position is set to current position
			pShuttle.par.tempStartPos.xPos := gAcp6DCtrl.Status.ShuttleInfo[pShuttle.par.shuttleID].Position.X;
			pShuttle.par.tempStartPos.yPos := gAcp6DCtrl.Status.ShuttleInfo[pShuttle.par.shuttleID].Position.Y;
			
			// Move to approach point of next workstation specified in the routing sheet (or just the next workstation if the shuttle is inactive)
			pShuttle.par.tempDestinationPos.xPos := gWorkstations[pShuttle.par.tempNextWorkstationID].par.approachPosX;
			pShuttle.par.tempDestinationPos.yPos := gWorkstations[pShuttle.par.tempNextWorkstationID].par.approachPosY;
			
			pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := pShuttle.par.tempDestinationPos.xPos;
			pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := pShuttle.par.tempDestinationPos.yPos;
			
			pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Done THEN
				pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				
				// Make the positions available for use again if any were occupied by the movement
				IF NOT AreWorkstationsOpposite(workstationID1 := pShuttle.par.tempWorkstationID, workstationID2 := pShuttle.par.tempNextWorkstationID) THEN
					MovementColumnSelection_0.startWorkstation := gWorkstations[pShuttle.par.tempWorkstationID];
					MovementColumnSelection_0.endWorkstation := gWorkstations[pShuttle.par.tempNextWorkstationID];
					MovementColumnSelection_0.opt_movementDone := TRUE;
					MovementColumnSelection_0.opt_resetColumn := pShuttle.par.tempHighwayColumn;
					MovementColumnSelection_0();
					
					pShuttle.par.tempHighwayColumn := -1;
				END_IF
				
				cm.state := 40;
			END_IF
			
			
		40:
			cm.description := 'Move from approach point to workstation';
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
		cm ACCESS ADR (gCameraStations[pShuttle.par.tempCameraStationID].cm);
		cm.setup.parent.name := 'SmartLabRun';
		
		CASE cm.state OF
				
			0: // Calculate and send the time it takes for the shuttle to go from current to camera position. This is used by vision program to account for network delay
				
				pCameraStation.tempShuttleID := USINT_TO_SINT(pShuttle.par.shuttleID);
				
				CASE pShuttle.par.tempCameraStationID OF
					
					0: // Camera after workstation 0, so the distances are specified in y-direction
						
						// The assumption behind these calculations is that the camera is located on the path until the first direction change in the Manhattan path
						ParabolicBlend_0.absAcceleration 	:= gAcp6DCtrl.Par.Acceleration;
						ParabolicBlend_0.absVelocity 		:= gAcp6DCtrl.Par.Velocity;
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
							ParabolicBlend_0.startPos 	:= pShuttle.par.tempStartPos.yPos;
							ParabolicBlend_0.endPos 	:= pShuttle.par.tempDestinationPos.yPos;
							ParabolicBlend_0.evalPos 	:= gAcp6DCtrl.Status.ShuttleInfo[pShuttle.par.shuttleID].Position.Y;
							ParabolicBlend_0();
							
							durationStartToCurrent := REAL_TO_DINT(ParabolicBlend_0.durationAtEvalDist * 1000000); // Converted to microseconds
							
							durationToCamera[pShuttle.par.tempCameraStationID] := durationStartToCamera - durationStartToCurrent; // Converted to microseconds
						
						END_IF
						
				END_CASE
				
				// Send request if no error occurred in parabolic blend calculation. (Implement error handling in the future)
				IF ParabolicBlend_0.durationAtEvalDist <> -1 THEN
					requestImage[pShuttle.par.tempCameraStationID] := TRUE;
					cm.state := 10;
					
				ELSE
					
					pShuttle.par.acquireImage := FALSE;	
					
				END_IF	
				
			// Currently implemented as if all cameras follow the same visionResultReady implementation. However, camera-specific approach is possible with multiple cameras are used	
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
