
ACTION smartLabWorkstationSetup:
	// Reset all workstations
	FOR i := 0 TO NR_OF_WORKSTATIONS DO
		gWorkStations[i].par.xLocation										:= 0.0;
		gWorkStations[i].par.yLocation										:= 0.0;
		gWorkStations[i].par.approachPosX									:= 0.0;
		gWorkStations[i].par.approachPosY									:= 0.0;
		gWorkStations[i].par.departPosX										:= 0.0;
		gWorkStations[i].par.departPosY										:= 0.0;
		gWorkStations[i].par.nextStationSelector							:= '0';
		gWorkStations[i].par.processTime									:= 0;
		gWorkStations[i].par.pathRouting									:= 0;
		gWorkStations[i].par.ArcMovement									:= FALSE;
		gWorkStations[i].par.landBeforeProcess								:= FALSE;
	END_FOR
	
	
	gWorkStations[0].par.xLocation										:= QuadrantIdxToPos(5);
	gWorkStations[0].par.yLocation										:= QuadrantIdxToPos(0);
	gWorkStations[0].par.approachPosX									:= QuadrantIdxToPos(4);
	gWorkStations[0].par.approachPosY									:= QuadrantIdxToPos(0);
	gWorkStations[0].par.departPosX										:= QuadrantIdxToPos(4);
	gWorkStations[0].par.departPosY										:= QuadrantIdxToPos(1);
	gWorkStations[0].par.nextStationSelector							:= '1';
	gWorkStations[0].par.processTime									:= 1.0;
	gWorkStations[0].par.pathRouting									:= 2; //Direct routing 
	gWorkStations[0].par.ArcMovement									:= FALSE;
	gWorkStations[0].par.landBeforeProcess								:= FALSE;
	
	gWorkStations[1].par.xLocation										:= QuadrantIdxToPos(5);
	gWorkStations[1].par.yLocation										:= QuadrantIdxToPos(3);
	gWorkStations[1].par.approachPosX									:= QuadrantIdxToPos(4);
	gWorkStations[1].par.approachPosY									:= QuadrantIdxToPos(2);
	gWorkStations[1].par.departPosX										:= QuadrantIdxToPos(4);
	gWorkStations[1].par.departPosY										:= QuadrantIdxToPos(4);
	gWorkStations[1].par.nextStationSelector							:= '2';
	gWorkStations[1].par.processTime									:= 1.0;
	gWorkStations[1].par.pathRouting									:= 2;
	gWorkStations[1].par.ArcMovement									:= FALSE;
	gWorkStations[1].par.landBeforeProcess								:= FALSE;
	
	gWorkStations[2].par.xLocation										:= QuadrantIdxToPos(5);
	gWorkStations[2].par.yLocation										:= QuadrantIdxToPos(6);
	gWorkStations[2].par.approachPosX									:= QuadrantIdxToPos(4);
	gWorkStations[2].par.approachPosY									:= QuadrantIdxToPos(5);
	gWorkStations[2].par.departPosX										:= QuadrantIdxToPos(4);
	gWorkStations[2].par.departPosY										:= QuadrantIdxToPos(7);
	gWorkStations[2].par.nextStationSelector							:= '3';
	gWorkStations[2].par.processTime									:= 1.0;
	gWorkStations[2].par.pathRouting									:= 1;
	gWorkStations[2].par.ArcMovement									:= FALSE;
	gWorkStations[2].par.landBeforeProcess								:= FALSE;
	
	gWorkStations[3].par.xLocation										:= QuadrantIdxToPos(0);
	gWorkStations[3].par.yLocation										:= QuadrantIdxToPos(6);
	gWorkStations[3].par.approachPosX									:= QuadrantIdxToPos(1);
	gWorkStations[3].par.approachPosY									:= QuadrantIdxToPos(7);
	gWorkStations[3].par.departPosX										:= QuadrantIdxToPos(1);
	gWorkStations[3].par.departPosY										:= QuadrantIdxToPos(5);
	gWorkStations[3].par.nextStationSelector							:= '4';
	gWorkStations[3].par.processTime									:= 1.0;
	gWorkStations[3].par.pathRouting									:= 2;
	gWorkStations[3].par.ArcMovement									:= FALSE;
	gWorkStations[3].par.landBeforeProcess								:= FALSE;
	
	gWorkStations[4].par.xLocation										:= QuadrantIdxToPos(0);
	gWorkStations[4].par.yLocation										:= QuadrantIdxToPos(3);
	gWorkStations[4].par.approachPosX									:= QuadrantIdxToPos(1);
	gWorkStations[4].par.approachPosY									:= QuadrantIdxToPos(4);
	gWorkStations[4].par.departPosX										:= QuadrantIdxToPos(1);
	gWorkStations[4].par.departPosY										:= QuadrantIdxToPos(2);
	gWorkStations[4].par.nextStationSelector							:= '5';
	gWorkStations[4].par.processTime									:= 1.0;
	gWorkStations[4].par.pathRouting									:= 2;
	gWorkStations[4].par.ArcMovement									:= FALSE;
	gWorkStations[4].par.landBeforeProcess								:= TRUE;
	
	gWorkStations[5].par.xLocation										:= QuadrantIdxToPos(0);
	gWorkStations[5].par.yLocation										:= QuadrantIdxToPos(0);
	gWorkStations[5].par.approachPosX									:= QuadrantIdxToPos(1);
	gWorkStations[5].par.approachPosY									:= QuadrantIdxToPos(1);
	gWorkStations[5].par.departPosX										:= QuadrantIdxToPos(1);
	gWorkStations[5].par.departPosY										:= QuadrantIdxToPos(0);
	gWorkStations[5].par.nextStationSelector							:= '-1';
	gWorkStations[5].par.processTime									:= 1.0;
	gWorkStations[5].par.pathRouting									:= 1;
	gWorkStations[5].par.ArcMovement									:= FALSE;
	gWorkStations[5].par.landBeforeProcess								:= FALSE;
	
END_ACTION
	
ACTION smartLabSetup: 
	
	positionContainerSmartLabProgram[0].initXPos := gWorkStations[0].par.xLocation;
	positionContainerSmartLabProgram[0].initYPos := gWorkStations[0].par.yLocation;
	
	positionContainerSmartLabProgram[1].initXPos := gWorkStations[0].par.xLocation - 1*0.120;
	positionContainerSmartLabProgram[1].initYPos := gWorkStations[0].par.yLocation;
	
	positionContainerSmartLabProgram[2].initXPos := gWorkStations[0].par.xLocation - 2*0.120;
	positionContainerSmartLabProgram[2].initYPos := gWorkStations[0].par.yLocation;
	
	positionContainerSmartLabProgram[3].initXPos := gWorkStations[1].par.xLocation;
	positionContainerSmartLabProgram[3].initYPos := gWorkStations[1].par.yLocation;
	
	positionContainerSmartLabProgram[4].initXPos := gWorkStations[2].par.xLocation;
	positionContainerSmartLabProgram[4].initYPos := gWorkStations[2].par.yLocation;
	
	positionContainerSmartLabProgram[5].initXPos := gWorkStations[3].par.xLocation;
	positionContainerSmartLabProgram[5].initYPos := gWorkStations[3].par.yLocation;
	
	positionContainerSmartLabProgram[6].initXPos := gWorkStations[4].par.xLocation;
	positionContainerSmartLabProgram[6].initYPos := gWorkStations[4].par.yLocation;
	
	positionContainerSmartLabProgram[7].initXPos := gWorkStations[5].par.xLocation;
	positionContainerSmartLabProgram[7].initYPos := gWorkStations[5].par.yLocation;

	smartLabWorkstationSetup; // Setup workstations	
	
	CASE em.substate OF
		17000:
			em.description := 'Resetting parameters';
			FOR i := 0 TO NUM_SHUTTLES DO
				gShuttles[i].cm.state := 0;
				gWorkStations[i].cm.state := 0;
				
				gShuttles[i].par.tempHighwayColumn := -1;
				shuttlePlans[i].isActive := FALSE;
			END_FOR
			
			FOR i := 0 TO 3 DO
				availableColumn[i] := TRUE;
			END_FOR

			TON_0.IN := FALSE;
			bufferSize := SIZEOF(orderBuffer)/SIZEOF(orderBuffer[0]);
			activeShuttles := 0;
			em.substate := 17005;
			
		
		17005:
			em.description := 'Move shuttles to pre pos';
			MC_BR_MoveInPlaneAsync_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
			MC_BR_MoveInPlaneAsync_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
			FOR i := 0 TO UINT_TO_USINT(localCurrentNumShuttles-1) DO
				MC_BR_MoveInPlaneAsync_Acp6D_0.Parameters.AsyncPar[i].Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[i].shuttleRef);
				MC_BR_MoveInPlaneAsync_Acp6D_0.Parameters.AsyncPar[i].X := positionContainerSmartLabProgram[i].initXPos;
				MC_BR_MoveInPlaneAsync_Acp6D_0.Parameters.AsyncPar[i].Y := positionContainerSmartLabProgram[i].initYPos;
			END_FOR
			MC_BR_MoveInPlaneAsync_Acp6D_0.Execute := TRUE;
			IF MC_BR_MoveInPlaneAsync_Acp6D_0.Done THEN
				MC_BR_MoveInPlaneAsync_Acp6D_0.Execute := FALSE;
				em.substate := 17010;
			END_IF
		
	END_CASE
END_ACTION


ACTION smartLabWorkstationOperation:
	CASE cm.state OF
		0:
			cm.description := 'Setting parameters for the workstations';
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Mode := 0; //Absolute
			cm.state := 10;
		
		10:
			cm.description := 'Check what shuttle is on top of workstation';
			// Workstation position
			ShuttleAtPosition_0.checkPosX := pWorkStations.par.xLocation;
			ShuttleAtPosition_0.checkPosY := pWorkStations.par.yLocation;
			
			FOR k := 0 TO (smartLabNumShuttles - 1) DO
				// Shuttle position
				ShuttleAtPosition_0.shuttlePos := gAcp6DCtrl.Status.ShuttleInfo[k].Position;
				ShuttleAtPosition_0();
				
				// Check if a shuttle is on the workstation and it is idle (meaning not in motion)
				IF ShuttleAtPosition_0.isAtCheckPos AND gAcp6DCtrl.Status.ShuttleInfo[k].State = mcACP6D_SH_STATE_IDLING THEN
					pWorkStations.par.tempShuttleID := k;
					gShuttles[k].par.tempWorkstationID := pWorkStations.par.workstationID;
					
					IF shuttlePlans[pWorkStations.par.tempShuttleID].isActive THEN
						cm.state := 20;
					ELSE
						cm.state := 15;
					END_IF
					EXIT;
				END_IF
			END_FOR
			
		15:
			cm.description := 'Wait for other shuttle to arrive at approach point or shuttle at workstation becomes part of new order';
			
			// Check if the shuttle should become part of a new order 
			IF pWorkStations.par.workstationID = '0' THEN
				// New order has been read and must begin execution
				IF remainingOrderAmount > 0 THEN
					shuttlePlans[pWorkStations.par.tempShuttleID].isActive := TRUE;
					shuttlePlans[pWorkStations.par.tempShuttleID].progressIndex := 0;
					shuttlePlans[pWorkStations.par.tempShuttleID].routingSheet := CreateRouteSheet_0.outputRouteSheet;
					shuttlePlans[pWorkStations.par.tempShuttleID].productOrder := productOrder;
					
					remainingOrderAmount := remainingOrderAmount - 1;
					cm.state := 20;
				ELSE
					// Go back to read new order in read state
					em.substate := 17015;
				END_IF
			END_IF
			
			// Move to next workstation if another shuttle has arrived at the approach point to the station
			FOR k := 0 TO (smartLabNumShuttles - 1) DO
				// Shuttle position
				ShuttleAtPosition_0.shuttlePos := gAcp6DCtrl.Status.ShuttleInfo[k].Position;
				
				// For workstation 0, the shuttle should only move on if there are more than two shuttles in queue
				IF pWorkStations.par.workstationID = '0' THEN
					// Position where at least 3 shuttles is in queue
					ShuttleAtPosition_0.checkPosX := pWorkStations.par.approachPosX - 0.120;
					ShuttleAtPosition_0.checkPosY := pWorkStations.par.approachPosY;
				ELSE
					// Workstation approach position
					ShuttleAtPosition_0.checkPosX := pWorkStations.par.approachPosX;
					ShuttleAtPosition_0.checkPosY := pWorkStations.par.approachPosY;
				END_IF
				ShuttleAtPosition_0();
				
				// If there is a shuttle at the checked position and it is either in IDLE or OBSTACLE state
				IF ShuttleAtPosition_0.isAtCheckPos AND (gAcp6DCtrl.Status.ShuttleInfo[k].State = mcACP6D_SH_STATE_IDLING OR gAcp6DCtrl.Status.ShuttleInfo[k].State = mcACP6D_SH_STATE_OBSTACLE) THEN
					// Set shuttle state to move to next workstation
					gShuttles[pWorkStations.par.tempShuttleID].cm.state := 10;
				END_IF
			END_FOR
				
		
		20:
			cm.description := 'Send data to robot through mapping and begin robot operation';
			CASE i OF
				0: orderSpec[0] := COVER_TYPE_TO_USINT(shuttlePlans[pWorkStations.par.tempShuttleID].productOrder.bottomCover);
				
				1: orderSpec[1] := shuttlePlans[pWorkStations.par.tempShuttleID].productOrder.Holes;
					
				2: orderSpec[2] := BOOL_TO_USINT(shuttlePlans[pWorkStations.par.tempShuttleID].productOrder.PCB);
				
				3: orderSpec[3] := shuttlePlans[pWorkStations.par.tempShuttleID].productOrder.Fuses;
					
				4: orderSpec[4] := COVER_TYPE_TO_USINT(shuttlePlans[pWorkStations.par.tempShuttleID].productOrder.topCover);
				
				5: orderSpec[5] := 1; // Should always unload
			END_CASE
			
			// Begin robot operation
			robotOperating[i] := TRUE;
			
			IF pWorkStations.par.landBeforeProcess THEN
				cm.state := 30;
			ELSE
				cm.state := 40;
			END_IF

			
		30:
			cm.description := 'Land shuttle if required';
			IF gAcp6DCtrl.Status.ShuttleInfo[pWorkStations.par.tempShuttleID].State = mcACP6D_SH_STATE_IDLING THEN
				pWorkStations.MC_BR_ShLevitation_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[pWorkStations.par.tempShuttleID].shuttleRef);
				pWorkStations.MC_BR_ShLevitation_Acp6D_0.Parameters.Level := 0; //Land
				pWorkStations.MC_BR_ShLevitation_Acp6D_0.Parameters.Speed := 0;
				pWorkStations.MC_BR_ShLevitation_Acp6D_0.Execute := TRUE;
			END_IF
			IF pWorkStations.MC_BR_ShLevitation_Acp6D_0.Done THEN
				pWorkStations.MC_BR_ShLevitation_Acp6D_0.Execute := FALSE;
				cm.state := 40;
			END_IF
			
			
		40:
			cm.description := 'Wait for robot to finish operation';
			pWorkStations.TON_0.PT := REAL_TO_TIME(200); // Timer is needed for robot to start motion before shuttles moves away
			pWorkStations.TON_0.IN := TRUE;
			IF pWorkStations.TON_0.Q THEN
				pWorkStations.TON_0.IN := FALSE;
				IF NOT robotOperating[i] THEN
					IF pWorkStations.par.landBeforeProcess THEN
						cm.state := 50;
					ELSE
						// Make workstation go back to wait for new shuttle and make current shuttle move to the next workstation
						cm.state := 10;
						gShuttles[pWorkStations.par.tempShuttleID].cm.state := 10;
					END_IF
				END_IF
			END_IF
			
			
		50:
			cm.description := 'Leviate shuttle if landed before process';
			pWorkStations.MC_BR_ShLevitation_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[pWorkStations.par.tempShuttleID].shuttleRef);
			pWorkStations.MC_BR_ShLevitation_Acp6D_0.Parameters.Level := 1; //Leviate
			pWorkStations.MC_BR_ShLevitation_Acp6D_0.Parameters.Speed := 0;
			pWorkStations.MC_BR_ShLevitation_Acp6D_0.Execute := TRUE;
			IF pWorkStations.MC_BR_ShLevitation_Acp6D_0.Done THEN
				pWorkStations.MC_BR_ShLevitation_Acp6D_0.Execute := FALSE;
				
				cm.state := 10;
				gShuttles[pWorkStations.par.tempShuttleID].cm.state := 10;
			END_IF
			
	END_CASE
	
	//Calls
	pWorkStations.MC_BR_ShLevitation_Acp6D_0();
	pWorkStations.TON_0();
	cm();
	
END_ACTION


ACTION smartLabShuttleMovement:		
	
	CASE cm.state OF
		0:
			cm.description := 'Wait for workstation to set new state';
			
			
		10:
			cm.description := 'Move from workstation to depart point (or next free column)';	
			pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[pShuttle.par.shuttleID].shuttleRef);
			pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 2; // Y THEN X
			
			// If the next workstation is 0 set the shuttle plan to be inactive
			IF pShuttlePlan.routingSheet[pShuttlePlan.progressIndex] = '0' THEN
				pShuttlePlan.isActive := FALSE;
				activeShuttles := activeShuttles - 1;
			END_IF
			
			// Select the closest column that is available
			FOR k := 0 TO 3 DO
				IF STRING_TO_USINT(pShuttle.par.tempWorkstationID) <= 2 THEN // First three workstations (all on the same side)
					IF availableColumn[3-k] THEN
						pShuttle.par.tempHighwayColumn := 3-k;
						availableColumn[pShuttle.par.tempHighwayColumn] := FALSE;
						EXIT;
					END_IF
				ELSE
					IF availableColumn[k] THEN
						pShuttle.par.tempHighwayColumn := k;
						availableColumn[pShuttle.par.tempHighwayColumn] := FALSE;
						EXIT;
					END_IF
				END_IF
			END_FOR
			
			// Move to the specified column if any is available (-1 if no column is available)
			IF pShuttle.par.tempHighwayColumn <> -1 THEN
				pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := QuadrantIdxToPos(quadrantIdx := (1 + pShuttle.par.tempHighwayColumn)); // Add 1 because the first column is not a highway
				pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := gWorkStations[STRING_TO_INT(pShuttle.par.tempWorkstationID)].par.departPosY;
				
				pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
				IF pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Done THEN
					pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
					
					cm.state := 20;
				END_IF
			END_IF
			
			
		20:
			cm.description := 'Move from depart point (or free row) of current workstation to approach point of next workstation';
			pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[pShuttle.par.shuttleID].shuttleRef);
			pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 2; // Y THEN X
			
			// Move to approach point of next workstation specified in the routing sheet
			pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := gWorkStations[STRING_TO_USINT(pShuttlePlan.routingSheet[pShuttlePlan.progressIndex])].par.approachPosX;
			pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := gWorkStations[STRING_TO_USINT(pShuttlePlan.routingSheet[pShuttlePlan.progressIndex])].par.approachPosY;
			
			pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Done THEN
				pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				
				// Make the column available for use again
				availableColumn[pShuttle.par.tempHighwayColumn] := TRUE;
				pShuttle.par.tempHighwayColumn := -1;
				
				// If the product is finished set parameters
				IF pShuttlePlan.routingSheet[pShuttlePlan.progressIndex] = '0' THEN 
					pShuttlePlan.progressIndex := 0;
					pShuttlePlan.isActive := FALSE;
					//amountProductsFinished := amountProductsFinished + 1;
					activeShuttles := activeShuttles - 1;
				END_IF
				
				cm.state := 30;
			END_IF
			
			
		30:
			cm.description := 'Move from approach point to workstation';
			pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[pShuttle.par.shuttleID].shuttleRef);
			pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 1; // X THEN Y
			
			// Move to next workstation
			pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := gWorkStations[STRING_TO_USINT(pShuttlePlan.routingSheet[pShuttlePlan.progressIndex])].par.xLocation;
			pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := gWorkStations[STRING_TO_USINT(pShuttlePlan.routingSheet[pShuttlePlan.progressIndex])].par.yLocation;
			
			pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
				pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				
				IF pShuttlePlan.isActive THEN
					pShuttlePlan.progressIndex := pShuttlePlan.progressIndex + 1;
				END_IF
				
				// Go back to waiting for workstation to send the shuttle on
				cm.state := 0;
			END_IF
	END_CASE
	
	// Calls
	pShuttle.function.MC_BR_MoveInPlane_Acp6D_0();
	cm();
	
END_ACTION
