
ACTION flaskProgramTask: 
	//setup
	positionContainerFlaskProgram[0].initXPos := 0.060;
	positionContainerFlaskProgram[0].initYPos := 0.060;
	positionContainerFlaskProgram[1].initXPos := 0.060;
	positionContainerFlaskProgram[1].initYPos := 0.180;
	positionContainerFlaskProgram[2].initXPos := 0.180;
	positionContainerFlaskProgram[2].initYPos := 0.120;
	positionContainerFlaskProgram[3].initXPos := 0.360;
	positionContainerFlaskProgram[3].initYPos := 0.120;
	positionContainerFlaskProgram[4].initXPos := 0.780;
	positionContainerFlaskProgram[4].initYPos := 0.900;
	positionContainerFlaskProgram[5].initXPos := 0.900;
	positionContainerFlaskProgram[5].initYPos := 0.900;
	positionContainerFlaskProgram[6].initXPos := 0.780;
	positionContainerFlaskProgram[6].initYPos := 0.780;
	positionContainerFlaskProgram[7].initXPos := 0.900;
	positionContainerFlaskProgram[7].initYPos := 0.780;
	positionContainerFlaskProgram[8].initXPos := 0.780;
	positionContainerFlaskProgram[8].initYPos := 0.660;
	positionContainerFlaskProgram[9].initXPos := 0.900;
	positionContainerFlaskProgram[9].initYPos := 0.660;
	CASE em.substate OF
		12000:
			em.description := 'Move shuttle to pre pos';
			tempShuttleCounter := 0;
			MC_BR_MoveInPlaneAsync_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
			MC_BR_MoveInPlaneAsync_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
			FOR i := 0 TO UINT_TO_USINT(localCurrentNumShuttles-1) DO
				MC_BR_MoveInPlaneAsync_Acp6D_0.Parameters.AsyncPar[i].Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[i].shuttleRef);
				MC_BR_MoveInPlaneAsync_Acp6D_0.Parameters.AsyncPar[i].X := positionContainerFlaskProgram[i].initXPos;
				MC_BR_MoveInPlaneAsync_Acp6D_0.Parameters.AsyncPar[i].Y := positionContainerFlaskProgram[i].initYPos;
			END_FOR
			MC_BR_MoveInPlaneAsync_Acp6D_0.Execute := TRUE;
			IF MC_BR_MoveInPlaneAsync_Acp6D_0.Done THEN
				MC_BR_MoveInPlaneAsync_Acp6D_0.Execute := FALSE;
				em.substate := 12010;
			END_IF
		
		12010:
			em.description := 'Start circle movement on shuttle 4';
			MC_BR_MoveArc_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[3].shuttleRef);
			MC_BR_MoveArc_Acp6D_0.Parameters.Option := mcACP6D_ARC_ANGULAR;
			MC_BR_MoveArc_Acp6D_0.Parameters.Acceleration := flaskProgramAcceleration;
			MC_BR_MoveArc_Acp6D_0.Parameters.Velocity := flaskProgramVelocity;
			MC_BR_MoveArc_Acp6D_0.Parameters.Angular.Center.X := 0.361;
			MC_BR_MoveArc_Acp6D_0.Parameters.Angular.Center.Y := 0.120;
			MC_BR_MoveArc_Acp6D_0.Parameters.Angular.Angle := 6283.1;
			MC_BR_MoveArc_Acp6D_0.Parameters.Mode := 0; //Abs
			MC_BR_MoveArc_Acp6D_0.Parameters.Direction := 0; //Clockwise
			MC_BR_MoveArc_Acp6D_0.Execute := TRUE;
			IF MC_BR_MoveArc_Acp6D_0.Acknowledge THEN
				MC_BR_MoveArc_Acp6D_0.Execute := FALSE;
				em.substate := 12020;
			END_IF
			
		12020:
			em.description := 'shuttle 1,2,3 is doing basic movement, shuttle 4 is rotation from command above';
			
	END_CASE
	

END_ACTION
