
ACTION smartLabWorkstationSetup:
	// Reset all workstations
	FOR i := 0 TO NR_OF_WORKSTATIONS DO
		gWorkStations[i].par.xLocation										:= 0.0;
		gWorkStations[i].par.yLocation										:= 0.0;
		gWorkStations[i].par.nextStationSelector							:= '0';
		gWorkStations[i].par.processTime									:= 0;
		gWorkStations[i].par.pathRouting									:= 0;
		gWorkStations[i].par.ArcMovement									:= FALSE;
		gWorkStations[i].par.landBeforeProcess								:= FALSE;
	END_FOR
	
	gWorkStations[0].par.xLocation										:= 0.660;
	gWorkStations[0].par.yLocation										:= 0.060;
	gWorkStations[0].par.nextStationSelector							:= '1';
	gWorkStations[0].par.processTime									:= 1.0;
	gWorkStations[0].par.pathRouting									:= 2;
	gWorkStations[0].par.ArcMovement									:= FALSE;
	gWorkStations[0].par.landBeforeProcess								:= FALSE;
	
	gWorkStations[1].par.xLocation										:= 0.900;
	gWorkStations[1].par.yLocation										:= 0.300;
	gWorkStations[1].par.nextStationSelector							:= '2';
	gWorkStations[1].par.processTime									:= 1.0;
	gWorkStations[1].par.pathRouting									:= 2;
	gWorkStations[1].par.ArcMovement									:= FALSE;
	gWorkStations[1].par.landBeforeProcess								:= TRUE;
	
	gWorkStations[2].par.xLocation										:= 0.780;
	gWorkStations[2].par.yLocation										:= 0.900;
	gWorkStations[2].par.nextStationSelector							:= '3';
	gWorkStations[2].par.processTime									:= 1.0;
	gWorkStations[2].par.pathRouting									:= 1;
	gWorkStations[2].par.ArcMovement									:= FALSE;
	gWorkStations[2].par.landBeforeProcess								:= FALSE;
	
	gWorkStations[3].par.xLocation										:= 0.300;
	gWorkStations[3].par.yLocation										:= 0.900;
	gWorkStations[3].par.nextStationSelector							:= 'END';
	gWorkStations[3].par.processTime									:= 1.0;
	gWorkStations[3].par.pathRouting									:= 2;
	gWorkStations[3].par.ArcMovement									:= FALSE;
	gWorkStations[3].par.landBeforeProcess								:= FALSE;
	
END_ACTION
	
ACTION smartLabSetup: 
	
	positionContainerSmartLabProgram[0].initXPos := 0.180;
	positionContainerSmartLabProgram[0].initYPos := 0.060;
	
	positionContainerSmartLabProgram[1].initXPos := 0.180;
	positionContainerSmartLabProgram[1].initYPos := 0.180;
	
	positionContainerSmartLabProgram[2].initXPos := 0.180;
	positionContainerSmartLabProgram[2].initYPos := 0.300;
	
	positionContainerSmartLabProgram[3].initXPos := 0.180;
	positionContainerSmartLabProgram[3].initYPos := 0.420;
	
	positionContainerSmartLabProgram[4].initXPos := 0.060;
	positionContainerSmartLabProgram[4].initYPos := 0.060;
	
	positionContainerSmartLabProgram[5].initXPos := 0.060;
	positionContainerSmartLabProgram[5].initYPos := 0.180;
	
	positionContainerSmartLabProgram[6].initXPos := 0.060;
	positionContainerSmartLabProgram[6].initYPos := 0.300;
	
	positionContainerSmartLabProgram[7].initXPos := 0.060;
	positionContainerSmartLabProgram[7].initYPos := 0.420;

	smartLabWorkstationSetup; // Setup workstations
	
	FOR i := 0 TO 7 DO
		shuttleIndexAtPosition[i] := i;
	END_FOR
	
	
	CASE em.substate OF
		17000:
			em.description := 'Move shuttles to pre pos';
			tempShuttleCounter := 0;
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
	CASE cm.state OF
		0:
			cm.description := 'Initiate movement to first workstation';
			IF moveToStartWorkstation THEN
				pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[pShuttle.par.shuttleID].shuttleRef);
				pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
				pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
				pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := gWorkStations[0].par.xLocation;
				pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := gWorkStations[0].par.yLocation;
				pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 2; //Y then X
				pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Parameters.Mode := 0;
				
				pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
				IF pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
					pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
					//cm.state := 10;
				END_IF
			END_IF
	END_CASE

	// Calls
	pShuttle.function.MC_BR_MoveInPlane_Acp6D_0();
	cm();
	
END_ACTION

ACTION smartLabWorkstationMovement:
	CASE cm.state OF
		0:
			cm.description := 'Check what shuttle is on top of workstation';
			FOR k := 0 TO (productOrder.amount - 1) DO
				IF (gAcp6DCtrl.Status.ShuttleInfo[k].Position.X > pWorkStations.par.xLocation - MARGIN AND gAcp6DCtrl.Status.ShuttleInfo[k].Position.X < pWorkStations.par.xLocation + MARGIN) AND
					(gAcp6DCtrl.Status.ShuttleInfo[k].Position.Y > pWorkStations.par.yLocation - MARGIN AND gAcp6DCtrl.Status.ShuttleInfo[k].Position.Y < pWorkStations.par.yLocation + MARGIN) THEN
					IF gAcp6DCtrl.Status.ShuttleInfo[k].State = mcACP6D_SH_STATE_IDLING THEN
						pWorkStations.par.tempShuttleID := k;
						IF pWorkStations.par.landBeforeProcess THEN
							cm.state := 10;
						ELSE
							cm.state := 20;
						END_IF
					END_IF
				END_IF
			END_FOR
		
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
			cm.description := 'Wait for process to finish';
			pWorkStations.TON_0.PT := REAL_TO_TIME(pWorkStations.par.processTime*1000);
			pWorkStations.TON_0.IN := TRUE;
			IF pWorkStations.TON_0.Q THEN
				pWorkStations.TON_0.IN := FALSE;
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
			
			IF pWorkStations.par.nextStationSelector = 'END' THEN
				pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := positionContainerSmartLabProgram[parkingSpotIndex].initXPos;
				pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := positionContainerSmartLabProgram[parkingSpotIndex].initYPos;
				
				pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
				IF pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
					pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
					
					amountProductsFinished := amountProductsFinished + 1;
					shuttleIndexAtPosition[parkingSpotIndex] := pWorkStations.par.tempShuttleID; // Make the shuttle index correspond to the given position (see Smart Lab page for reference)
					parkingSpotIndex := parkingSpotIndex - 1;
					IF parkingSpotIndex = -1 THEN
						cm.state := 50;
					ELSE
						cm.state := 0;
					END_IF
					
				END_IF
			ELSE
				pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := gWorkStations[STRING_TO_UDINT(pWorkStations.par.nextStationSelector)].par.xLocation;
				pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := gWorkStations[STRING_TO_UDINT(pWorkStations.par.nextStationSelector)].par.yLocation;
				
				pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
				IF pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
					pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
					cm.state := 0;
				END_IF
			END_IF
			
		50:
			cm.description := 'Waiting for current product order to finish';
			IF (gAcp6DCtrl.Status.ShuttleInfo[shuttleIndexAtPosition[0]].Position.X > positionContainerSmartLabProgram[0].initXPos - MARGIN AND gAcp6DCtrl.Status.ShuttleInfo[shuttleIndexAtPosition[0]].Position.X < positionContainerSmartLabProgram[0].initXPos + MARGIN) AND
				(gAcp6DCtrl.Status.ShuttleInfo[shuttleIndexAtPosition[0]].Position.Y > positionContainerSmartLabProgram[0].initYPos - MARGIN AND gAcp6DCtrl.Status.ShuttleInfo[shuttleIndexAtPosition[0]].Position.Y < positionContainerSmartLabProgram[0].initYPos + MARGIN) THEN
				orderFinished := TRUE;
				executeOrder := FALSE;
				cm.state := 0;
				em.substate := 17010;
			END_IF
			
	END_CASE
	
	//Calls
	pWorkStations.MC_BR_MoveInPlane_Acp6D_0();
	pWorkStations.MC_BR_MoveArc_Acp6D_0();
	pWorkStations.MC_BR_ShLevitation_Acp6D_0();
	pWorkStations.TON_0();
	cm();
	
END_ACTION