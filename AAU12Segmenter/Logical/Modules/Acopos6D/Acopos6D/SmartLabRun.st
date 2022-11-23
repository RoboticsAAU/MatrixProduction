
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
			IF ShuttlesAtPositions_0.isAtCheckPos  THEN
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
						gShuttles[pWorkstation.par.tempShuttleID].cm.state := 10;
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
				
				// Begin robot operation
				robotExecute[i] := TRUE;
				robotExecute[5] := FALSE; // To avoid robot 1 and 5 moving
				
				IF pWorkstation.par.landBeforeProcess THEN
					cm.state := 30;
				ELSE
					cm.state := 40;
				END_IF
			END_IF
			
		30:
			cm.description := 'Land shuttle if required';
			IF gAcp6DCtrl.Status.ShuttleInfo[pWorkstation.par.tempShuttleID].State = mcACP6D_SH_STATE_IDLING THEN
				pWorkstation.MC_BR_ShLevitation_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[pWorkstation.par.tempShuttleID].shuttleRef);
				pWorkstation.MC_BR_ShLevitation_Acp6D_0.Parameters.Level := 0; //Land
				pWorkstation.MC_BR_ShLevitation_Acp6D_0.Parameters.Speed := 0;
				pWorkstation.MC_BR_ShLevitation_Acp6D_0.Execute := TRUE;
			END_IF
			IF pWorkstation.MC_BR_ShLevitation_Acp6D_0.Done THEN
				pWorkstation.MC_BR_ShLevitation_Acp6D_0.Execute := FALSE;
				cm.state := 40;
			END_IF
			
			
		40:
			cm.description := 'Wait for robot to finish operation';
			IF robotDone[i] THEN
				robotExecute[i] := FALSE;
				IF pWorkstation.par.landBeforeProcess THEN
					cm.state := 50;
				ELSE
					// Make current shuttle move to the next workstation and make workstation go back to wait for new shuttle
					gShuttles[pWorkstation.par.tempShuttleID].cm.state := 10;
					cm.state := 60;
				END_IF
			END_IF
			
			
		50:
			cm.description := 'Leviate shuttle if landed before process';
			pWorkstation.MC_BR_ShLevitation_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[pWorkstation.par.tempShuttleID].shuttleRef);
			pWorkstation.MC_BR_ShLevitation_Acp6D_0.Parameters.Level := 1; //Leviate
			pWorkstation.MC_BR_ShLevitation_Acp6D_0.Parameters.Speed := 0;
			pWorkstation.MC_BR_ShLevitation_Acp6D_0.Execute := TRUE;
			IF pWorkstation.MC_BR_ShLevitation_Acp6D_0.Done THEN
				pWorkstation.MC_BR_ShLevitation_Acp6D_0.Execute := FALSE;
				
				gShuttles[pWorkstation.par.tempShuttleID].cm.state := 10;
				cm.state := 60;
			END_IF
			
			
		60:
			// Go back to wait for shuttle at workstation if the current shuttle has begun moving (avoids bugs)
			IF gAcp6DCtrl.Status.ShuttleInfo[pWorkstation.par.tempShuttleID].State = mcACP6D_SH_STATE_MOTION THEN
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
			pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Parameters.Mode := 0; //Absolute
			
			
		10:
			cm.description := 'Determine where to move next';	
			
			// Set the next workstation ID (either from routing sheet for active shuttles and next in row for inactive shuttles)
			IF pShuttlePlan.isActive THEN
				pShuttle.par.tempNextWorkstationID := pShuttlePlan.routingSheet[pShuttlePlan.progressIndex];
				
				// If the next workstation is 0 reset the progress index and set the shuttleplan to be inactive, otherwise increment progress index by 1
				IF pShuttlePlan.routingSheet[pShuttlePlan.progressIndex] = 0 THEN
					pShuttlePlan.progressIndex := 0;
					pShuttlePlan.isActive := FALSE;
					activeShuttles := activeShuttles - 1;
				ELSE
					pShuttlePlan.progressIndex := pShuttlePlan.progressIndex + 1;
				END_IF
			ELSE
				pShuttle.par.tempNextWorkstationID := (pShuttle.par.tempWorkstationID + 1) MOD smartLabNumWorkstations;
			END_IF
			
			// If the workstations are opposite each other, go directly to the approach point of next workstation (no need to occupy column when it only moves in row)
			IF AreWorkstationsOpposite(workstationID1 := pShuttle.par.tempWorkstationID, workstationID2 := pShuttle.par.tempNextWorkstationID) THEN
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
			
			// If a column has not been selected yet
			IF pShuttle.par.tempHighwayColumn = -1 THEN
				// Select the closest column that is available (no other shuttles using column or movement direction is opposite)
				MovementColumnSelection_0.startWorkstation := gWorkstations[pShuttle.par.tempWorkstationID];
				MovementColumnSelection_0.endWorkstation := gWorkstations[pShuttle.par.tempNextWorkstationID];
				MovementColumnSelection_0();
				
				pShuttle.par.tempHighwayColumn := MovementColumnSelection_0.selectedColumn;
				
			// Move to the specified column if any is available (-1 if no column is available)
			ELSE
				// Position of the selected column
				pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := QuadrantIdxToPos(quadrantIdx := (1 + pShuttle.par.tempHighwayColumn)); // Add 1 because the first column is not a highway
				pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := gWorkstations[pShuttle.par.tempWorkstationID].par.departPosY;
				
				pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
				IF pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Done THEN
					pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
						
					cm.state := 30;
				END_IF
			END_IF
			
			
		30:
			cm.description := 'Move from depart point (or free row) of current workstation to approach point of next workstation';
			pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[pShuttle.par.shuttleID].shuttleRef);
			pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 2; // Y THEN X
			
			// Move to approach point of next workstation specified in the routing sheet (or just the next workstation if the shuttle is inactive)
			pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := gWorkstations[pShuttle.par.tempNextWorkstationID].par.approachPosX;
			pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := gWorkstations[pShuttle.par.tempNextWorkstationID].par.approachPosY;
			
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
			
			// Move to next workstation
			pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := gWorkstations[pShuttle.par.tempNextWorkstationID].par.xLocation;
			pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := gWorkstations[pShuttle.par.tempNextWorkstationID].par.yLocation;
			
			pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
				pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				
				// Go back to wait for new workstation to send the shuttle on
				cm.state := 0;
			END_IF
		
	END_CASE
	
	// Function block calls
	pShuttle.function.MC_BR_MoveInPlane_Acp6D_0();
	cm();
	
END_ACTION
