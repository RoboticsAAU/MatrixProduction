
ACTION testProgram: 
//setup
	positionContainerTestProgram[0].initXPos := 0.050;
	positionContainerTestProgram[0].initYPos := 0.060;
	
	positionContainerTestProgram[1].initXPos := 0.050;
	positionContainerTestProgram[1].initYPos := 0.180;
	
	positionContainerTestProgram[2].initXPos := 0.050;
	positionContainerTestProgram[2].initYPos := 0.300;
	
	positionContainerTestProgram[3].initXPos := 0.050;
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
			pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[pShuttle.par.shuttleID].shuttleRef);
			
			pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Parameters.Mode         := 0; //Absolute movement
			pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X   := positionContainerTestProgram[pShuttle.par.shuttleID].initXPos + (USINT_TO_REAL(pShuttle.par.shuttleID)+1)*0.120;
			pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y   := positionContainerTestProgram[pShuttle.par.shuttleID].initYPos - (USINT_TO_REAL(pShuttle.par.shuttleID))*0.120;
			pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := 1.0;
			pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity     := 0.8;
			pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Parameters.EndVelocity  := 0.0;
			pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Parameters.Path         := 1; //mcACP6D_PATH_X_THEN_Y
			
			pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN  // Try to change to DONE
				pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				cm.state := 10;
			END_IF
			
		10:
			cm.description := 'Check if position is reached';
			IF gAcp6DCtrl.Status.ShuttleInfo[pShuttle.par.shuttleID].Position.X > positionContainerTestProgram[pShuttle.par.shuttleID].initXPos + (USINT_TO_REAL(pShuttle.par.shuttleID)+1)*0.120 - 0.001 AND
				gAcp6DCtrl.Status.ShuttleInfo[pShuttle.par.shuttleID].Position.Y < positionContainerTestProgram[pShuttle.par.shuttleID].initYPos - (USINT_TO_REAL(pShuttle.par.shuttleID))*0.120 + 0.001 THEN
				testObj.targetReached[pShuttle.par.shuttleID] := TRUE;
				cm.state := 15;
			END_IF
		
		15: 
			cm.description := 'Waiting to move back to start position';
			IF testObj.targetReached[0] AND testObj.targetReached[1] AND testObj.targetReached[2] AND testObj.targetReached[3] THEN
				//IF testObj.targetReached[i] THEN
				cm.state := 16;
			END_IF
			
		16:
			cm.description := 'Setting all targetReached to false';
			testObj.targetReached[i] := FALSE; 
			OpenGripper := TRUE;
			GripperMovement;
			cm.state := 20;
			
		20: 
			cm.description := 'Moving back to the starting position';
			pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[pShuttle.par.shuttleID].shuttleRef);
			
			pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Parameters.Mode         := 1; //Relative movement
			pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X   := -(USINT_TO_REAL(pShuttle.par.shuttleID)+1)*0.120;
			pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y   := (USINT_TO_REAL(pShuttle.par.shuttleID))*0.120;
			pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := 1.0;
			pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity     := 0.8;
			pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Parameters.EndVelocity  := 0.0;
			pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Parameters.Path         := 2; //mcACP6D_PATH_Y_THEN_X
			
			pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN  // Try to change to DONE
				pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				cm.state := 30;
			END_IF
		
		30:
			cm.description := 'Check if position is reached';
			IF gAcp6DCtrl.Status.ShuttleInfo[pShuttle.par.shuttleID].Position.X < positionContainerTestProgram[pShuttle.par.shuttleID].initXPos + 0.001 AND
				gAcp6DCtrl.Status.ShuttleInfo[pShuttle.par.shuttleID].Position.Y > positionContainerTestProgram[pShuttle.par.shuttleID].initYPos - 0.001 THEN
				testObj.targetReached[pShuttle.par.shuttleID] := TRUE;
				cm.state := 35;
			END_IF
		
		35: 
			cm.description := 'Waiting to go back to start of loop';
			IF testObj.targetReached[0] AND testObj.targetReached[1] AND testObj.targetReached[2] AND testObj.targetReached[3] THEN
				//IF testObj.targetReached[i] THEN
				cm.state := 36;
			END_IF
		
		36:
			cm.description := 'Setting all targetReached to false';
			testObj.targetReached[i] := FALSE;
			OpenGripper := FALSE;
			GripperMovement;
			cm.state := 0;
			
	END_CASE
	
	cm();
	pShuttle.function.MC_BR_MoveInPlane_Acp6D_0();
	
END_ACTION


ACTION GripperMovement:  
	IF OpenGripper THEN
		GripperWhitePin := TRUE;
		GripperBlackPin := FALSE;
	ELSE
		GripperWhitePin := FALSE;
		GripperBlackPin := TRUE;
	END_IF
		
END_ACTION