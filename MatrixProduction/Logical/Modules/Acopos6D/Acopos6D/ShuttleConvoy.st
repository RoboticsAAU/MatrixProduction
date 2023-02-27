
ACTION shuttleConvoy: 
	
	// Set initial positions: 
	positionContainerShuttleConvoy[0].initxPos := 0.060;
	positionContainerShuttleConvoy[0].inityPos := 0.060;
	
	positionContainerShuttleConvoy[1].initxPos := 0.180;
	positionContainerShuttleConvoy[1].inityPos := 0.060;
	
	positionContainerShuttleConvoy[2].initxPos := 0.060;
	positionContainerShuttleConvoy[2].inityPos := 0.180;
	
	positionContainerShuttleConvoy[3].initxPos := 0.180;
	positionContainerShuttleConvoy[3].inityPos := 0.180;
	
	positionContainerShuttleConvoy[4].initxPos := 0.540;
	positionContainerShuttleConvoy[4].inityPos := 0.060;
	
	positionContainerShuttleConvoy[5].initxPos := 0.660;
	positionContainerShuttleConvoy[5].inityPos := 0.060;
	
	positionContainerShuttleConvoy[6].initxPos := 0.540;
	positionContainerShuttleConvoy[6].inityPos := 0.180;
	
	positionContainerShuttleConvoy[7].initxPos := 0.660;
	positionContainerShuttleConvoy[7].inityPos := 0.180;
	
	CASE em.substate OF 
		0: 
			em.description := 'Move shuttle to initial pos';
			tempShuttleCounter := 0;
			em.cmd.sc := FALSE;
			MC_BR_MoveInPlaneAsync_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
			MC_BR_MoveInPlaneAsync_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
			FOR i := 0 TO UINT_TO_USINT(localCurrentNumShuttles-1) DO
				MC_BR_MoveInPlaneAsync_Acp6D_0.Parameters.AsyncPar[i].Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[i].shuttleRef);
				MC_BR_MoveInPlaneAsync_Acp6D_0.Parameters.AsyncPar[i].X := positionContainerShuttleConvoy[i].initXPos;
				MC_BR_MoveInPlaneAsync_Acp6D_0.Parameters.AsyncPar[i].Y := positionContainerShuttleConvoy[i].initYPos;
			END_FOR
			MC_BR_MoveInPlaneAsync_Acp6D_0.Execute := TRUE;
			IF MC_BR_MoveInPlaneAsync_Acp6D_0.Done THEN
				MC_BR_MoveInPlaneAsync_Acp6D_0.Execute := FALSE;
				em.substate := 3010;
			END_IF
		
		
		
		
	END_CASE
	
	
	
	

END_ACTION
