
ACTION testProgram: 
//setup
	positionContainerTestProgram[0].initXPos := 0.060;
	positionContainerTestProgram[0].initYPos := 0.060;
	
	positionContainerTestProgram[1].initXPos := 0.060;
	positionContainerTestProgram[1].initYPos := 0.180;
	
	positionContainerTestProgram[2].initXPos := 0.060;
	positionContainerTestProgram[2].initYPos := 0.300;
	
	positionContainerTestProgram[3].initXPos := 0.060;
	positionContainerTestProgram[3].initYPos := 0.420;
	
	positionContainerTestProgram[4].initXPos := 0.900;
	positionContainerTestProgram[4].initYPos := 0.900;
	
	positionContainerTestProgram[5].initXPos := 0.900;
	positionContainerTestProgram[5].initYPos := 0.780;
	
	positionContainerTestProgram[6].initXPos := 0.780;
	positionContainerTestProgram[6].initYPos := 0.900;
	
	positionContainerTestProgram[7].initXPos := 0.780;
	positionContainerTestProgram[7].initYPos := 0.780;

	CASE em.substate OF
		16000:
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
		
		16010:
			em.description := 'Move shuttles in a staircase movement';
	
	END_CASE
	
END_ACTION

ACTION testMovements:
	CASE cm.state OF
		0:
			cm.description := 'Start linear movement of the four shuttles';
			MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[i].shuttleRef);
			
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Mode         := 0; //Absolute movement
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X   := positionContainerTestProgram[i].initXPos + (i+1)*0.120;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y   := positionContainerTestProgram[i].initYPos;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := 1.0;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity     := 1.0;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.EndVelocity  := 0.0;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Path         := 0; //mcACP6D_PATH_DIRECT
			
			MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN  // Try to change to DONE
				MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				cm.state := 10;
			END_IF
			
		10:
			cm.description := 'Check if position is reached';
			IF gAcp6DCtrl.Status.ShuttleInfo[i].Position.X >= positionContainerTestProgram[i].initXPos + (i+1)*0.120 - 0.001 THEN
				testObj.targetReached[i] := TRUE;
				cm.state := 15;
			END_IF
		
		15: 
			cm.description := 'Waiting to move back to start position';
			IF testObj.targetReached[0] AND testObj.targetReached[1] AND testObj.targetReached[2] AND testObj.targetReached[3] THEN
			//IF testObj.targetReached[i] THEN
				testObj.targetReached[0] := testObj.targetReached[1] := testObj.targetReached[2] := testObj.targetReached[3] := FALSE; 
				cm.state := 20;
			END_IF
			
		20: 
			cm.description := 'Moving back to the starting position';
			MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[i].shuttleRef);
			
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Mode         := 1; //Relative movement
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X   := -(i+1)*0.120;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y   := 0;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := 1.0;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity     := 1.0;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.EndVelocity  := 0.0;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Path         := 0; //mcACP6D_PATH_DIRECT
			
			MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN  // Try to change to DONE
				MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				cm.state := 30;
			END_IF
		
		30:
			cm.description := 'Check if position is reached';
			IF gAcp6DCtrl.Status.ShuttleInfo[i].Position.X <= positionContainerTestProgram[i].initXPos + 0.001 THEN
				testObj.targetReached[i] := TRUE;
				cm.state := 35;
			END_IF
		
		35: 
			cm.description := 'Waiting to go back to start of loop';
			IF testObj.targetReached[0] AND testObj.targetReached[1] AND testObj.targetReached[2] AND testObj.targetReached[3] THEN
			//IF testObj.targetReached[i] THEN
				testObj.targetReached[0] := testObj.targetReached[1] := testObj.targetReached[2] := testObj.targetReached[3] := FALSE; 
				cm.state := 0;
			END_IF
			
	END_CASE
	
	cm();
	MC_BR_MoveInPlane_Acp6D_0();
			
END_ACTION