
ACTION BasicMoveDialGauge: 
	pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := 5;
	pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity := 0.02;
	pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[pShuttle.par.shuttleID].shuttleRef);
	pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Parameters.Mode := 0; //Absolute
	pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 0; //direct
	
	CASE pShuttle.cm.state OF
		0:
			cm.description := 'Move shuttle to preDialPos';
			pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := 0.060;
			pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := 0.300;
			pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
				pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				cm.state := 5;
			END_IF
			
		5:
			cm.description := 'Move shuttle to dialGauge';
			pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := 0.050;
			pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := 0.300;
			pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
				pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				cm.state := 10;
			END_IF
			
		10:
			cm.description := 'Check pos reached';
			FOR i := 0 TO NUM_SHUTTLES DO
				IF((gAcp6DCtrl.Status.ShuttleInfo[pShuttle.par.shuttleID].Position.X > 0.050 - MARGIN AND gAcp6DCtrl.Status.ShuttleInfo[pShuttle.par.shuttleID].Position.X < 0.050 + MARGIN) AND
					gAcp6DCtrl.Status.ShuttleInfo[pShuttle.par.shuttleID].Position.Y > 0.300 - MARGIN AND gAcp6DCtrl.Status.ShuttleInfo[pShuttle.par.shuttleID].Position.Y < 0.300 + MARGIN) THEN
					IF gAcp6DCtrl.Status.ShuttleInfo[pShuttle.par.shuttleID].State = mcACP6D_SH_STATE_IDLING THEN
						cm.state := 20;
					END_IF
				END_IF
			END_FOR
			
		20:
			cm.description := 'Wait time';
			pShuttle.function.TON_0.PT := t#3s;
			pShuttle.function.TON_0.IN := TRUE;
			IF pShuttle.function.TON_0.Q THEN
				pShuttle.function.TON_0.IN := FALSE;
				cm.state := 30;
			END_IF
			
		30:
			cm.description := 'Move shuttle away from dialGauge';
			pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := 0.060;
			pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := 0.300;
			pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
				pShuttle.function.MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				cm.state := 40;
			END_IF
			
		40:
			cm.description := 'Check pos reached';
			FOR i := 0 TO NUM_SHUTTLES DO
				IF((gAcp6DCtrl.Status.ShuttleInfo[pShuttle.par.shuttleID].Position.X > 0.060 - MARGIN AND gAcp6DCtrl.Status.ShuttleInfo[pShuttle.par.shuttleID].Position.X < 0.060 + MARGIN) AND
					gAcp6DCtrl.Status.ShuttleInfo[pShuttle.par.shuttleID].Position.Y > 0.300 - MARGIN AND gAcp6DCtrl.Status.ShuttleInfo[pShuttle.par.shuttleID].Position.Y < 0.300 + MARGIN) THEN
					IF gAcp6DCtrl.Status.ShuttleInfo[pShuttle.par.shuttleID].State = mcACP6D_SH_STATE_IDLING THEN
						cm.state := 0;
					END_IF
				END_IF
			END_FOR
			
	END_CASE
	
	cm();
	pShuttle.function.TON_0();
	pShuttle.function.MC_BR_MoveInPlane_Acp6D_0();
			
			
END_ACTION
