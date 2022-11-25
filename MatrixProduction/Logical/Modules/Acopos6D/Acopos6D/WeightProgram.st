
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
			cm.description := 'Calibrate weight';
			pShuttle.function.MC_BR_ShGetPayload_Acp6D_0.Execute := TRUE;
			IF pShuttle.function.MC_BR_ShGetPayload_Acp6D_0.Done THEN
				weightCalibration := pShuttle.function.MC_BR_ShGetPayload_Acp6D_0.Payload * 1000;
				pShuttle.function.MC_BR_ShGetPayload_Acp6D_0.Execute := FALSE;
				cm.state := 50;
			END_IF
			
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
			pShuttle.function.TON_0.PT := t#0.2s;
			pShuttle.function.TON_0.IN := TRUE;
			IF pShuttle.function.TON_0.Q THEN
				pShuttle.function.TON_0.IN := FALSE;
				cm.state := 50;
			END_IF
		
	END_CASE
	pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0();
	pShuttle.function.MC_BR_ShGetPayload_Acp6D_0();
	pShuttle.function.MC_BR_MoveInPlane_Acp6D_0();
	pShuttle.function.TON_0();
END_ACTION
