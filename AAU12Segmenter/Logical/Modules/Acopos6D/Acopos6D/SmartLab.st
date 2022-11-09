
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
	
	
	gWorkStations[0].par.xLocation										:= quadrantIdxToPos(5);
	gWorkStations[0].par.yLocation										:= quadrantIdxToPos(0);
	gWorkStations[0].par.approachPosX									:= quadrantIdxToPos(4);
	gWorkStations[0].par.approachPosY									:= quadrantIdxToPos(0);
	gWorkStations[0].par.departPosX										:= quadrantIdxToPos(4);
	gWorkStations[0].par.departPosY										:= quadrantIdxToPos(1);
	gWorkStations[0].par.nextStationSelector							:= '1';
	gWorkStations[0].par.processTime									:= 1.0;
	gWorkStations[0].par.pathRouting									:= 2; //Direct routing 
	gWorkStations[0].par.ArcMovement									:= FALSE;
	gWorkStations[0].par.landBeforeProcess								:= FALSE;
	
	gWorkStations[1].par.xLocation										:= quadrantIdxToPos(5);
	gWorkStations[1].par.yLocation										:= quadrantIdxToPos(3);
	gWorkStations[1].par.approachPosX									:= quadrantIdxToPos(4);
	gWorkStations[1].par.approachPosY									:= quadrantIdxToPos(2);
	gWorkStations[1].par.departPosX										:= quadrantIdxToPos(4);
	gWorkStations[1].par.departPosY										:= quadrantIdxToPos(4);
	gWorkStations[1].par.nextStationSelector							:= '2';
	gWorkStations[1].par.processTime									:= 1.0;
	gWorkStations[1].par.pathRouting									:= 2;
	gWorkStations[1].par.ArcMovement									:= FALSE;
	gWorkStations[1].par.landBeforeProcess								:= FALSE;
	
	gWorkStations[2].par.xLocation										:= quadrantIdxToPos(5);
	gWorkStations[2].par.yLocation										:= quadrantIdxToPos(6);
	gWorkStations[2].par.approachPosX									:= quadrantIdxToPos(4);
	gWorkStations[2].par.approachPosY									:= quadrantIdxToPos(5);
	gWorkStations[2].par.departPosX										:= quadrantIdxToPos(4);
	gWorkStations[2].par.departPosY										:= quadrantIdxToPos(7);
	gWorkStations[2].par.nextStationSelector							:= '3';
	gWorkStations[2].par.processTime									:= 1.0;
	gWorkStations[2].par.pathRouting									:= 1;
	gWorkStations[2].par.ArcMovement									:= FALSE;
	gWorkStations[2].par.landBeforeProcess								:= FALSE;
	
	gWorkStations[3].par.xLocation										:= quadrantIdxToPos(0);
	gWorkStations[3].par.yLocation										:= quadrantIdxToPos(6);
	gWorkStations[3].par.approachPosX									:= quadrantIdxToPos(1);
	gWorkStations[3].par.approachPosY									:= quadrantIdxToPos(7);
	gWorkStations[3].par.departPosX										:= quadrantIdxToPos(1);
	gWorkStations[3].par.departPosY										:= quadrantIdxToPos(5);
	gWorkStations[3].par.nextStationSelector							:= '4';
	gWorkStations[3].par.processTime									:= 1.0;
	gWorkStations[3].par.pathRouting									:= 2;
	gWorkStations[3].par.ArcMovement									:= FALSE;
	gWorkStations[3].par.landBeforeProcess								:= FALSE;
	
	gWorkStations[4].par.xLocation										:= quadrantIdxToPos(0);
	gWorkStations[4].par.yLocation										:= quadrantIdxToPos(3);
	gWorkStations[4].par.approachPosX									:= quadrantIdxToPos(1);
	gWorkStations[4].par.approachPosY									:= quadrantIdxToPos(4);
	gWorkStations[4].par.departPosX										:= quadrantIdxToPos(1);
	gWorkStations[4].par.departPosY										:= quadrantIdxToPos(2);
	gWorkStations[4].par.nextStationSelector							:= '5';
	gWorkStations[4].par.processTime									:= 1.0;
	gWorkStations[4].par.pathRouting									:= 2;
	gWorkStations[4].par.ArcMovement									:= FALSE;
	gWorkStations[4].par.landBeforeProcess								:= TRUE;
	
	gWorkStations[5].par.xLocation										:= quadrantIdxToPos(0);
	gWorkStations[5].par.yLocation										:= quadrantIdxToPos(0);
	gWorkStations[5].par.approachPosX									:= quadrantIdxToPos(1);
	gWorkStations[5].par.approachPosY									:= quadrantIdxToPos(1);
	gWorkStations[5].par.departPosX										:= quadrantIdxToPos(1);
	gWorkStations[5].par.departPosY										:= quadrantIdxToPos(0);
	gWorkStations[5].par.nextStationSelector							:= '-1';
	gWorkStations[5].par.processTime									:= 1.0;
	gWorkStations[5].par.pathRouting									:= 1;
	gWorkStations[5].par.ArcMovement									:= FALSE;
	gWorkStations[5].par.landBeforeProcess								:= FALSE;
	
END_ACTION
	
ACTION smartLabSetup: 
	
	positionContainerSmartLabProgram[0].initXPos := 0.420;
	positionContainerSmartLabProgram[0].initYPos := 0.300;
	
	positionContainerSmartLabProgram[2].initXPos := 0.420;
	positionContainerSmartLabProgram[2].initYPos := 0.420;
	
	positionContainerSmartLabProgram[4].initXPos := 0.420;
	positionContainerSmartLabProgram[4].initYPos := 0.540;
	
	positionContainerSmartLabProgram[6].initXPos := 0.420;
	positionContainerSmartLabProgram[6].initYPos := 0.660;
	
	positionContainerSmartLabProgram[1].initXPos := 0.300;
	positionContainerSmartLabProgram[1].initYPos := 0.300;
	
	positionContainerSmartLabProgram[3].initXPos := 0.300;
	positionContainerSmartLabProgram[3].initYPos := 0.420;
	
	positionContainerSmartLabProgram[5].initXPos := 0.300;
	positionContainerSmartLabProgram[5].initYPos := 0.540;
	
	positionContainerSmartLabProgram[7].initXPos := 0.300;
	positionContainerSmartLabProgram[7].initYPos := 0.660;

	smartLabWorkstationSetup; // Setup workstations
	
	FOR i := 0 TO NUM_SHUTTLES DO
		shuttleIndexAtPosition[i] := i;
		gShuttles[i].cm.state := 0;
		gWorkStations[i].cm.state := 0;
	END_FOR
	tempShuttleIndexAtPosition := shuttleIndexAtPosition;
	TON_0.IN := FALSE;
	bufferSize := SIZEOF(orderBuffer)/SIZEOF(orderBuffer[0]);
	
	CASE em.substate OF
		17000:
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

ACTION smartLabInitialMovement:		
	
	cm.description := 'Initiate movement to first workstation';
	IF moveToStartWorkstation[shuttleIndexAtPosition[i]] THEN
		pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[pShuttle.par.shuttleID].shuttleRef);
		pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
		pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
		pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := gWorkStations[0].par.xLocation;
		pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := gWorkStations[0].par.yLocation;
		pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 2;
		pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Parameters.Mode := 0;
		
		pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
		IF pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
			pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
			
			moveToStartWorkstation[shuttleIndexAtPosition[i]] := FALSE;
			//cm.state := 10;
		END_IF
	END_IF
	
	

	// Calls
	pShuttle.function.MC_BR_MoveInPlane_Acp6D_0();
	cm();
	
END_ACTION

ACTION smartLabWorkstationMovement:
	CASE cm.state OF
		0:
			cm.description := 'Check what shuttle is on top of workstation';
			FOR k := 0 TO (productOrder.amount - 1) DO
				IF (gAcp6DCtrl.Status.ShuttleInfo[shuttleIndexAtPosition[k]].Position.X > pWorkStations.par.xLocation - MARGIN AND gAcp6DCtrl.Status.ShuttleInfo[shuttleIndexAtPosition[k]].Position.X < pWorkStations.par.xLocation + MARGIN) AND
					(gAcp6DCtrl.Status.ShuttleInfo[shuttleIndexAtPosition[k]].Position.Y > pWorkStations.par.yLocation - MARGIN AND gAcp6DCtrl.Status.ShuttleInfo[shuttleIndexAtPosition[k]].Position.Y < pWorkStations.par.yLocation + MARGIN) THEN
					IF gAcp6DCtrl.Status.ShuttleInfo[shuttleIndexAtPosition[k]].State = mcACP6D_SH_STATE_IDLING THEN
						pWorkStations.par.tempShuttleID := shuttleIndexAtPosition[k];
						
						cm.state := 5;
					END_IF
				END_IF
			END_FOR
		
		5:
			cm.description := 'Send data to robot through mapping';
			CASE i OF
				0:
					orderSpec[0] := COVER_TYPE_TO_USINT(shuttlePlans[pWorkStations.par.tempShuttleID].productOrder.bottomCover);
				
				1: 
					orderSpec[1] := shuttlePlans[pWorkStations.par.tempShuttleID].productOrder.Holes;
					
				2: 
					orderSpec[2] := BOOL_TO_USINT(shuttlePlans[pWorkStations.par.tempShuttleID].productOrder.PCB);
				
				3: 
					orderSpec[3] := shuttlePlans[pWorkStations.par.tempShuttleID].productOrder.Fuses;
					
				4: 
					orderSpec[4] := COVER_TYPE_TO_USINT(shuttlePlans[pWorkStations.par.tempShuttleID].productOrder.topCover);
				
			END_CASE
			
			robotOperating[i] := TRUE; // Begin robot operation
			
			pWorkStations.TON_0.PT := REAL_TO_TIME(500); // Timer is needed for robot to start motion before shuttles moves away
			pWorkStations.TON_0.IN := TRUE;
			IF pWorkStations.TON_0.Q THEN
				pWorkStations.TON_0.IN := FALSE;
				IF pWorkStations.par.landBeforeProcess THEN
				cm.state := 10;
				ELSE
					cm.state := 20;
				END_IF
			END_IF
			
		10:
			cm.description := 'Land shuttle if required';
			IF gAcp6DCtrl.Status.ShuttleInfo[pWorkStations.par.tempShuttleID].State = mcACP6D_SH_STATE_IDLING THEN
				pWorkStations.MC_BR_ShLevitation_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[pWorkStations.par.tempShuttleID].shuttleRef);
				pWorkStations.MC_BR_ShLevitation_Acp6D_0.Parameters.Level := 0; //Land
				pWorkStations.MC_BR_ShLevitation_Acp6D_0.Parameters.Speed := 0;
				pWorkStations.MC_BR_ShLevitation_Acp6D_0.Execute := TRUE;
			END_IF
			IF pWorkStations.MC_BR_ShLevitation_Acp6D_0.Done THEN
				pWorkStations.MC_BR_ShLevitation_Acp6D_0.Execute := FALSE;
				cm.state := 20;
			END_IF
			
		20:
//			cm.description := 'Wait for process to finish';
//			pWorkStations.TON_0.PT := REAL_TO_TIME(pWorkStations.par.processTime*1000);
//			pWorkStations.TON_0.IN := TRUE;
//			IF pWorkStations.TON_0.Q THEN
//				pWorkStations.TON_0.IN := FALSE;
//				IF pWorkStations.par.landBeforeProcess THEN
//					cm.state := 30;
//				ELSE
//					cm.state := 40;
//				END_IF
			//			END_IF
			
			
			IF NOT robotOperating[i] THEN
				IF pWorkStations.par.landBeforeProcess THEN
					cm.state := 30;
				ELSE
					cm.state := 40;
				END_IF
			END_IF
			
		30:
			cm.description := 'Leviate shuttle if landed before process';
			pWorkStations.MC_BR_ShLevitation_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[pWorkStations.par.tempShuttleID].shuttleRef);
			pWorkStations.MC_BR_ShLevitation_Acp6D_0.Parameters.Level := 1; //Leviate
			pWorkStations.MC_BR_ShLevitation_Acp6D_0.Parameters.Speed := 0;
			pWorkStations.MC_BR_ShLevitation_Acp6D_0.Execute := TRUE;
			IF pWorkStations.MC_BR_ShLevitation_Acp6D_0.Done THEN
				pWorkStations.MC_BR_ShLevitation_Acp6D_0.Execute := FALSE;
				cm.state := 40;
			END_IF
			
		40:
			cm.description := 'Move to next workstation';
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[pWorkStations.par.tempShuttleID].shuttleRef);
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Mode := 0; //Absolute
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := pWorkStations.par.pathRouting; //0 Diagonal, 1 First X then Y, 2 First Y then X
			
			pTempShuttlePlan ACCESS ADR(shuttlePlans[pWorkStations.par.tempShuttleID]);
			pWorkStations.par.nextStationSelector := pTempShuttlePlan.routingSheet[pTempShuttlePlan.progressIndex];
			
			IF pWorkStations.par.nextStationSelector <> '-1' THEN
				pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := gWorkStations[STRING_TO_UDINT(pWorkStations.par.nextStationSelector)].par.xLocation;
				pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := gWorkStations[STRING_TO_UDINT(pWorkStations.par.nextStationSelector)].par.yLocation;
				
				pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
				IF pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
					pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
					pTempShuttlePlan.progressIndex := pTempShuttlePlan.progressIndex + 1;
					cm.state := 0;
				END_IF
			ELSE
				pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := positionContainerSmartLabProgram[parkingSpotIndex].initXPos;
				pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := positionContainerSmartLabProgram[parkingSpotIndex].initYPos;
				
				pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
				IF pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Done THEN
					pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
					
					amountProductsFinished := amountProductsFinished + 1;
					tempShuttleIndexAtPosition[parkingSpotIndex] := pWorkStations.par.tempShuttleID; // Make the shuttle index correspond to the given position (see Smart Lab page for reference)
					parkingSpotIndex := parkingSpotIndex - 1;
					IF parkingSpotIndex = -1 THEN
						cm.state := 50;
					ELSE
						cm.state := 0;
					END_IF
					
				END_IF
				
			END_IF
			
		50:
			cm.description := 'Current product order has finished';
			orderFinished := TRUE;
			shuttleIndexAtPosition := tempShuttleIndexAtPosition;
			cm.state := 0;
			IF bufferEmpty THEN
				em.substate := 17010;
			ELSE
				em.substate := 17015;
			END_IF
			
	END_CASE
	
	//Calls
	pWorkStations.MC_BR_MoveInPlane_Acp6D_0();
	pWorkStations.MC_BR_MoveArc_Acp6D_0();
	pWorkStations.MC_BR_ShLevitation_Acp6D_0();
	pWorkStations.TON_0();
	cm();
	
END_ACTION