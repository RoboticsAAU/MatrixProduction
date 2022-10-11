
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
	gWorkStations[0].par.processTime									:= 2.0;
	gWorkStations[0].par.pathRouting									:= 1;
	gWorkStations[0].par.ArcMovement									:= FALSE;
	gWorkStations[0].par.landBeforeProcess								:= FALSE;
	
	gWorkStations[1].par.xLocation										:= 0.900;
	gWorkStations[1].par.yLocation										:= 0.300;
	gWorkStations[1].par.nextStationSelector							:= '2';
	gWorkStations[1].par.processTime									:= 4.0;
	gWorkStations[1].par.pathRouting									:= 2;
	gWorkStations[1].par.ArcMovement									:= FALSE;
	gWorkStations[1].par.landBeforeProcess								:= FALSE;	
	
	gWorkStations[2].par.xLocation										:= 0.780;
	gWorkStations[2].par.yLocation										:= 0.900;
	gWorkStations[2].par.nextStationSelector							:= '3';
	gWorkStations[2].par.processTime									:= 2.0;
	gWorkStations[2].par.pathRouting									:= 1;
	gWorkStations[2].par.ArcMovement									:= FALSE;
	gWorkStations[2].par.landBeforeProcess								:= FALSE;
	
	gWorkStations[3].par.xLocation										:= 0.300;
	gWorkStations[3].par.yLocation										:= 0.900;
	gWorkStations[3].par.nextStationSelector							:= 'END';
	gWorkStations[3].par.processTime									:= 6.0;
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
	
	CASE em.substate OF
		17000:
			em.description := 'Move shuttles to pre pos';
			tempShuttleCounter := 0;
			MC_BR_MoveInPlaneAsync_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
			MC_BR_MoveInPlaneAsync_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
			FOR i := 0 TO UINT_TO_USINT(localCurrentNumShuttles-1) DO
				MC_BR_MoveInPlaneAsync_Acp6D_0.Parameters.AsyncPar[i].Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[i].shuttleRef);
				MC_BR_MoveInPlaneAsync_Acp6D_0.Parameters.AsyncPar[i].X := positionContainerTestProgram[i].initXPos;
				MC_BR_MoveInPlaneAsync_Acp6D_0.Parameters.AsyncPar[i].Y := positionContainerTestProgram[i].initYPos;
			END_FOR
			MC_BR_MoveInPlaneAsync_Acp6D_0.Execute := TRUE;
			IF MC_BR_MoveInPlaneAsync_Acp6D_0.Done THEN
				MC_BR_MoveInPlaneAsync_Acp6D_0.Execute := FALSE;
				em.substate := 16010;
			END_IF
		
		17010:
			em.description := 'Execute Smart Lab program';
	
	END_CASE
	
END_ACTION

ACTION smartLabProg:
	CASE cm.state OF
		0: 
			cm.description := 'Check if new order has been placed';
			IF executeOrder AND orderAmount <> 0 THEN
				cm.state := 10;
			END_IF
		
		10:
			cm.description := 'Initiate movement to start position of first shuttle position';	
			
		
		
		200:
			cm.description := 'Current product order has been finished';
			executeOrder := FALSE;
			cm.state := 0;
		
	END_CASE
	
END_ACTION