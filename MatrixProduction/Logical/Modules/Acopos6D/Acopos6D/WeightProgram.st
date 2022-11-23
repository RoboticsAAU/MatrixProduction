
ACTION weightProgram: 
	pShuttle.function.MC_BR_ShGetPayload_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[pShuttle.par.shuttleID].shuttleRef);
	
	pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[pShuttle.par.shuttleID].shuttleRef);
	pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Parameters.Position.Rx := 0.000;
	pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Parameters.Position.Ry := 0.000;
	pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Parameters.Position.Rz := 0.000;
	pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Parameters.Position.Z := (weightProgramFlyingHight/1000); //mm to meter;
	pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Parameters.Velocity.Z := 1;
	
	pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[pShuttle.par.shuttleID].shuttleRef);
	pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := 1;
	pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
	pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 0; //Diagonal
	pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Parameters.Mode := 0; //absolute
	
	CASE cm.state OF
		0:
			cm.description := 'Move shuttle to loadLocation';
			pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := 0.060;
			pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := 0.060;
			pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
				pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				cm.state := 5;
			END_IF
			
		5:
			cm.description := 'Change levitation hight';
			pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Execute := TRUE;
			IF pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Acknowledge THEN
				pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Execute := FALSE;
				cm.state := 10;
			END_IF
				
			
		10:
			cm.description := 'Check pos reached';
			FOR i := 0 TO NUM_SHUTTLES DO
				IF((gAcp6DCtrl.Status.ShuttleInfo[pShuttle.par.shuttleID].Position.X > 0.060 - MARGIN AND gAcp6DCtrl.Status.ShuttleInfo[pShuttle.par.shuttleID].Position.X < 0.060 + MARGIN) AND
					gAcp6DCtrl.Status.ShuttleInfo[pShuttle.par.shuttleID].Position.Y > 0.060 - MARGIN AND gAcp6DCtrl.Status.ShuttleInfo[pShuttle.par.shuttleID].Position.Y < 0.060 + MARGIN) THEN
					IF gAcp6DCtrl.Status.ShuttleInfo[pShuttle.par.shuttleID].State = mcACP6D_SH_STATE_IDLING THEN
						cm.state := 20;
					END_IF
				END_IF
			END_FOR
			
		20:
			cm.description := 'Trigger robot';
			ABBRobot.startBigWeightMovement := TRUE;
			pShuttle.function.TON_0.PT := t#3s;
			pShuttle.function.TON_0.IN := TRUE;
			IF pShuttle.function.TON_0.Q THEN
				ABBRobot.startBigWeightMovement := FALSE;
				pShuttle.function.TON_0.IN := FALSE;
				cm.state := 21;
			END_IF
			
		21:
			cm.description := 'Calibrate weight';
			pShuttle.function.MC_BR_ShGetPayload_Acp6D_0.Execute := TRUE;
			IF pShuttle.function.MC_BR_ShGetPayload_Acp6D_0.Done THEN
				weightCalibration := pShuttle.function.MC_BR_ShGetPayload_Acp6D_0.Payload * 1000;
				pShuttle.function.MC_BR_ShGetPayload_Acp6D_0.Execute := FALSE;
				cm.state := 50;
			END_IF
			
//		25:
//			cm.description := 'Wait robot done';
//			IF ABBRobot.HomePositionReached THEN
//				cm.state := 50;
//			END_IF	

			
		50:
			cm.description := 'Measure weight';
			pShuttle.function.MC_BR_ShGetPayload_Acp6D_0.Execute := TRUE;
			IF pShuttle.function.MC_BR_ShGetPayload_Acp6D_0.Done THEN
				fbPayload := pShuttle.function.MC_BR_ShGetPayload_Acp6D_0.Payload * 1000;
				shuttlePayload := fbPayload - weightCalibration;
				pShuttle.function.MC_BR_ShGetPayload_Acp6D_0.Execute := FALSE;
				cm.state := 60;
			END_IF
			
		60:
			cm.description := 'Wait time';
			pShuttle.function.TON_0.PT := t#5s;
			pShuttle.function.TON_0.IN := TRUE;
			IF pShuttle.function.TON_0.Q THEN
				pShuttle.function.TON_0.IN := FALSE;
				cm.state := 50;
			END_IF
		
//		80:
//			cm.description := 'Check robot ready';
//			IF ABBRobot.HomePositionReached THEN
//				ABBRobot.returnBigWeightMovement := TRUE;
//				cm.state := 81;
//			END_IF
//			
//		81:
//			IF NOT ABBRobot.HomePositionReached THEN
//				ABBRobot.returnBigWeightMovement := FALSE;
//				cm.state := 90;
//			END_IF
//		
//		90:
//			cm.description := 'Check when robot is done and fire small weightMovement';
//			IF ABBRobot.HomePositionReached THEN
//				ABBRobot.startSmallWeightMovement := TRUE;
//				cm.state := 100;
//			END_IF
//			
//		100:
//			cm.description := 'Check robot start';
//			IF NOT ABBRobot.HomePositionReached THEN
//				ABBRobot.startSmallWeightMovement := FALSE;
//				cm.state := 110;
//			END_IF
//		
//		110:
//			cm.description := 'Check robot done';
//			IF ABBRobot.HomePositionReached THEN
//				cm.state := 120;
//			END_IF
//		
//		120:
//			cm.description := 'meassure small weight';
//			pShuttle.function.MC_BR_GetPayload_Acp6D_0.Execute := TRUE;
//			IF pShuttle.function.MC_BR_GetPayload_Acp6D_0.Valid THEN
//				shuttlePayload := pShuttle.function.MC_BR_GetPayload_Acp6D_0.Payload * 1000;
//				shuttlePayload := shuttlePayload - weightCalibration;
//				pShuttle.function.MC_BR_GetPayload_Acp6D_0.Execute := FALSE;
//				cm.state := 130;
//			END_IF
//		
//		130:
//			cm.description := 'Wait time';
//			pShuttle.function.TON_0.PT := t#3s;
//			pShuttle.function.TON_0.IN := TRUE;
//			IF pShuttle.function.TON_0.Q THEN
//				pShuttle.function.TON_0.IN := FALSE;
//				cm.state := 140;
//			END_IF
//		
//		140:
//			cm.description := 'Return small weight';
//			IF ABBRobot.HomePositionReached THEN
//				ABBRobot.returnSmallWeightMovement := TRUE;
//				cm.state := 150;
//			END_IF
//				
//		150:
//			IF NOT ABBRobot.HomePositionReached THEN
//				ABBRobot.returnSmallWeightMovement := FALSE;
//				cm.state := 160;
//			END_IF
//		
//		160:
//			IF ABBRobot.HomePositionReached THEN
//				modeSelector := 5; //demoProgram
//				em.cmd.sc := TRUE;
//			END_IF
		
	END_CASE
	pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0();
	pShuttle.function.MC_BR_ShGetPayload_Acp6D_0();
	pShuttle.function.MC_BR_MoveInPlane_Acp6D_0();
	pShuttle.function.TON_0();
END_ACTION
