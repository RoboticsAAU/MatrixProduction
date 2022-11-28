
ACTION smartLabWorkstationSetup:
	// Reset all workstations
	FOR i := 0 TO NR_OF_WORKSTATIONS DO
		gWorkstations[i].par.xLocation				:= 0.0;
		gWorkstations[i].par.yLocation				:= 0.0;
		gWorkstations[i].par.approachPosX			:= 0.0;
		gWorkstations[i].par.approachPosY			:= 0.0;
		gWorkstations[i].par.departPosX				:= 0.0;
		gWorkstations[i].par.departPosY				:= 0.0;
		gWorkstations[i].par.nextStationSelector	:= '0';
		gWorkstations[i].par.processTime			:= 0;
		gWorkstations[i].par.pathRouting			:= 0;
		gWorkstations[i].par.ArcMovement			:= FALSE;
		gWorkstations[i].par.landBeforeProcess		:= FALSE;
		gWorkstations[i].par.cameraID			 	:= -1; // -1 represents no camera attached
	END_FOR
	
	gWorkstations[0].par.xLocation					:= QuadrantIdxToPos(5);
	gWorkstations[0].par.yLocation					:= QuadrantIdxToPos(0);
	gWorkstations[0].par.approachPosX				:= QuadrantIdxToPos(4);
	gWorkstations[0].par.approachPosY				:= QuadrantIdxToPos(0);
	gWorkstations[0].par.departPosX					:= QuadrantIdxToPos(4);
	gWorkstations[0].par.departPosY					:= QuadrantIdxToPos(1);
	gWorkstations[0].par.landBeforeProcess			:= FALSE;
	gWorkstations[0].par.cameraID					:= 0;
	
	gWorkstations[1].par.xLocation					:= QuadrantIdxToPos(5);
	gWorkstations[1].par.yLocation					:= QuadrantIdxToPos(3);
	gWorkstations[1].par.approachPosX				:= QuadrantIdxToPos(4);
	gWorkstations[1].par.approachPosY				:= QuadrantIdxToPos(2);
	gWorkstations[1].par.departPosX					:= QuadrantIdxToPos(4);
	gWorkstations[1].par.departPosY					:= QuadrantIdxToPos(4);
	gWorkstations[1].par.landBeforeProcess			:= FALSE;
	
	gWorkstations[2].par.xLocation					:= QuadrantIdxToPos(5);
	gWorkstations[2].par.yLocation					:= QuadrantIdxToPos(6);
	gWorkstations[2].par.approachPosX				:= QuadrantIdxToPos(4);
	gWorkstations[2].par.approachPosY				:= QuadrantIdxToPos(5);
	gWorkstations[2].par.departPosX					:= QuadrantIdxToPos(4);
	gWorkstations[2].par.departPosY					:= QuadrantIdxToPos(7);
	gWorkstations[2].par.landBeforeProcess			:= FALSE;
	
	gWorkstations[3].par.xLocation					:= QuadrantIdxToPos(0);
	gWorkstations[3].par.yLocation					:= QuadrantIdxToPos(6);
	gWorkstations[3].par.approachPosX				:= QuadrantIdxToPos(1);
	gWorkstations[3].par.approachPosY				:= QuadrantIdxToPos(7);
	gWorkstations[3].par.departPosX					:= QuadrantIdxToPos(1);
	gWorkstations[3].par.departPosY					:= QuadrantIdxToPos(5);
	gWorkstations[3].par.landBeforeProcess			:= FALSE;
	
	gWorkstations[4].par.xLocation					:= QuadrantIdxToPos(0);
	gWorkstations[4].par.yLocation					:= QuadrantIdxToPos(3);
	gWorkstations[4].par.approachPosX				:= QuadrantIdxToPos(1);
	gWorkstations[4].par.approachPosY				:= QuadrantIdxToPos(4);
	gWorkstations[4].par.departPosX					:= QuadrantIdxToPos(1);
	gWorkstations[4].par.departPosY					:= QuadrantIdxToPos(2);
	gWorkstations[4].par.landBeforeProcess			:= FALSE;
	
	gWorkstations[5].par.xLocation					:= QuadrantIdxToPos(0);
	gWorkstations[5].par.yLocation					:= QuadrantIdxToPos(0);
	gWorkstations[5].par.approachPosX				:= QuadrantIdxToPos(1);
	gWorkstations[5].par.approachPosY				:= QuadrantIdxToPos(1);
	gWorkstations[5].par.departPosX					:= QuadrantIdxToPos(1);
	gWorkstations[5].par.departPosY					:= QuadrantIdxToPos(0);
	gWorkstations[5].par.landBeforeProcess			:= FALSE;
	
END_ACTION
	
ACTION smartLabCameraStationSetup:
	
	FOR i := 0 TO NUM_CAMS DO
		gCameraStations[i].camPosX := 0;
		gCameraStations[i].camPosY := 0;
		gCameraStations[i].tempShuttleID := -1;
		gCameraStations[i].cm.state := 0;
		gCameraStations[i].TON.IN := FALSE;
	END_FOR
	
	gCameraStations[0].camPosX := QuadrantIdxToPos(5);
	gCameraStations[0].camPosY := QuadrantIdxToPos(1);
	
END_ACTION

ACTION smartLabSetup: 
	
	smartLabWorkstationSetup; // Setup workstations	
	smartLabCameraStationSetup; // Setup cameras
	
	cameraOperationPosition[0].xPos := QuadrantIdxToPos(2) + 0.060;
	cameraOperationPosition[0].yPos := QuadrantIdxToPos(2) + 0.060;
	
	positionContainerSmartLabProgram[0].initXPos := gWorkstations[0].par.xLocation;
	positionContainerSmartLabProgram[0].initYPos := gWorkstations[0].par.yLocation;
	
	positionContainerSmartLabProgram[1].initXPos := gWorkstations[0].par.xLocation - 1*0.120;
	positionContainerSmartLabProgram[1].initYPos := gWorkstations[0].par.yLocation;
	
	positionContainerSmartLabProgram[2].initXPos := gWorkstations[0].par.xLocation - 2*0.120;
	positionContainerSmartLabProgram[2].initYPos := gWorkstations[0].par.yLocation;
	
	positionContainerSmartLabProgram[3].initXPos := gWorkstations[1].par.xLocation;
	positionContainerSmartLabProgram[3].initYPos := gWorkstations[1].par.yLocation;
	
	positionContainerSmartLabProgram[4].initXPos := gWorkstations[2].par.xLocation;
	positionContainerSmartLabProgram[4].initYPos := gWorkstations[2].par.yLocation;
	
	positionContainerSmartLabProgram[5].initXPos := gWorkstations[3].par.xLocation;
	positionContainerSmartLabProgram[5].initYPos := gWorkstations[3].par.yLocation;
	
	positionContainerSmartLabProgram[6].initXPos := gWorkstations[4].par.xLocation;
	positionContainerSmartLabProgram[6].initYPos := gWorkstations[4].par.yLocation;
	
	positionContainerSmartLabProgram[7].initXPos := gWorkstations[5].par.xLocation;
	positionContainerSmartLabProgram[7].initYPos := gWorkstations[5].par.yLocation;
	
	
	
	CASE em.substate OF
		17000:
			em.description := 'Resetting parameters';
			FOR i := 0 TO NUM_SHUTTLES DO
				gShuttles[i].cm.state := 0;
				gWorkstations[i].cm.state := 0;
				
				gWorkstations[i].par.tempShuttleID := -1;
				gShuttles[i].par.tempHighwayColumn := -1;
				gShuttles[i].par.tempWorkstationID := 0;
				gShuttles[i].par.tempCameraStationID := -1;
				gShuttles[i].par.acquireImage := FALSE;
				shuttlePlans[i].isActive := FALSE;
				moveShuttle[i] := FALSE;
			END_FOR
			
			FOR i := 0 TO 3 DO // Highway columns
				FOR k := 0 TO 7 DO // Highway rows
					occupiedPosition[i, k] := FALSE;
				END_FOR
			END_FOR
			
			TON_0.IN := FALSE;
			bufferSize := SIZEOF(orderBuffer)/SIZEOF(orderBuffer[0]);
			activeShuttles := 0;
			amountProductsFinished := 0;
			amountOrdersFinished := 0;
			tempProductOrder.ID := 0;
			em.substate := 17005;
			
		
		17005:
			em.description := 'Move shuttles to pre pos';
			MC_BR_MoveInPlaneAsync_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
			MC_BR_MoveInPlaneAsync_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
			FOR i := 0 TO NUM_SHUTTLES DO
				MC_BR_MoveInPlaneAsync_Acp6D_0.Parameters.AsyncPar[i].Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[i].shuttleRef);
				MC_BR_MoveInPlaneAsync_Acp6D_0.Parameters.AsyncPar[i].X := positionContainerSmartLabProgram[i].initXPos;
				MC_BR_MoveInPlaneAsync_Acp6D_0.Parameters.AsyncPar[i].Y := positionContainerSmartLabProgram[i].initYPos;
			END_FOR
			MC_BR_MoveInPlaneAsync_Acp6D_0.Execute := TRUE;
			IF MC_BR_MoveInPlaneAsync_Acp6D_0.Done THEN
				MC_BR_MoveInPlaneAsync_Acp6D_0.Execute := FALSE;
				em.substate := 17006;
			END_IF
			
			
		17006:
			em.description := 'Wait for shuttles to settle before getting their initial weight';
			TON_0.PT := T#3S;
			TON_0.IN := TRUE;
			IF TON_0.Q THEN
				TON_0.IN := FALSE;
				
				tempShuttleIndex := 0; // Set for next state
				em.substate := 17007;
			END_IF
			
			
		17007:
			em.description := 'Calibrate weight of all shuttles';
			MC_BR_ShGetPayload_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[tempShuttleIndex].shuttleRef);
			MC_BR_ShGetPayload_Acp6D_0.Execute := TRUE;
			IF MC_BR_ShGetPayload_Acp6D_0.Done THEN
				MC_BR_ShGetPayload_Acp6D_0.Execute := FALSE;
				gShuttles[tempShuttleIndex].par.initialWeight := MC_BR_ShGetPayload_Acp6D_0.Payload * 1000; // in g
				
				tempShuttleIndex := tempShuttleIndex + 1;
				
				IF tempShuttleIndex = 8 THEN
					tempShuttleIndex := 1; // Set for next state
					em.substate := 17009;
				END_IF
			END_IF
			
			
		17009:
			em.description := 'Move shuttle 2 and 3 towards workstation 0';
			gShuttles[tempShuttleIndex].function.MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[tempShuttleIndex].shuttleRef);
			gShuttles[tempShuttleIndex].function.MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
			gShuttles[tempShuttleIndex].function.MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
			gShuttles[tempShuttleIndex].function.MC_BR_MoveInPlane_Acp6D_0.Parameters.Mode := 0; // Absolute
			gShuttles[tempShuttleIndex].function.MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 1; // X THEN Y
			
			gShuttles[tempShuttleIndex].function.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := gWorkstations[0].par.xLocation;
			gShuttles[tempShuttleIndex].function.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := gWorkstations[0].par.yLocation;
			gShuttles[tempShuttleIndex].function.MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF gShuttles[tempShuttleIndex].function.MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
				gShuttles[tempShuttleIndex].function.MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				
				tempShuttleIndex := tempShuttleIndex + 1;
				
				IF tempShuttleIndex = 3 THEN
					em.substate := 17010;
				END_IF
				
			END_IF
			
			gShuttles[tempShuttleIndex].function.MC_BR_MoveInPlane_Acp6D_0();
		
	END_CASE
	
END_ACTION
