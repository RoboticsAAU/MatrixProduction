
ACTION MovementRx: 
	pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[pShuttle.par.shuttleID].shuttleRef);
	pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Parameters.Mode := 0; //Absolute
	pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Parameters.Rotation.Type := 0; //Around Center
	pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Parameters.Velocity.Rx := 0.1;
	pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Parameters.Velocity.Rx := 0.1;
	pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Parameters.Velocity.Ry := 0.1;
	pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Parameters.Velocity.Z := 0.002;

	pShuttle.function.MC_BR_Move6D_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[pShuttle.par.shuttleID].shuttleRef);
	CASE cm.state OF
		0:
			cm.description := 'tilt shuttle Rx';
			pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Parameters.Position.Z := 0.002;
			pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Parameters.Position.Rx := 0.02;
			pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Parameters.Position.Ry := 0.00;
			pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Parameters.Position.Rz := 0.00;
			pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Execute := TRUE;
			IF pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Acknowledge THEN
				pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Execute := FALSE;
				cm.state := 10;
			ELSIF pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Error THEN
				em.cmd.abort := TRUE;
			END_IF;
			
		10:
			cm.description := 'Check Rx position reached';
			IF gAcp6DCtrl.Status.ShuttleInfo[pShuttle.par.shuttleID].Position.Rx >= 0.019 THEN
				cm.state := 20;
			END_IF
			
		20:
			cm.description := 'tilt shuttle Rx';
			pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Parameters.Position.Z := 0.002;
			pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Parameters.Position.Rx := -0.02;
			pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Parameters.Position.Ry := 0.00;
			pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Parameters.Position.Rz := 0.00;
			pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Execute := TRUE;
			IF pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Acknowledge THEN
				pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Execute := FALSE;
				cm.state := 30;
			ELSIF pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Error THEN
				em.cmd.abort := TRUE;
			END_IF;
			
		30:
			cm.description := 'Check Rx position reached';
			IF gAcp6DCtrl.Status.ShuttleInfo[pShuttle.par.shuttleID].Position.Rx <= -0.019 THEN
				cm.state := 0;
			END_IF
			
	END_CASE
		
	cm();
	pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0();
	pShuttle.function.MC_BR_Move6D_Acp6D_0();
				

END_ACTION

ACTION MovementRy: 
	pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[pShuttle.par.shuttleID].shuttleRef);
	pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Parameters.Mode := 0; //Absolute
	pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Parameters.Rotation.Type := 0; //Around Center
	pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Parameters.Velocity.Rx := 0.1;
	pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Parameters.Velocity.Rx := 0.1;
	pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Parameters.Velocity.Ry := 0.1;
	pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Parameters.Velocity.Z := 0.002;
	
	pShuttle.function.MC_BR_Move6D_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[pShuttle.par.shuttleID].shuttleRef);
	
	CASE cm.state OF
		0:
			
			cm.description := 'tilt shuttle Ry';
			pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Parameters.Position.Z := 0.002;
			pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Parameters.Position.Ry := 0.02;
			pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Parameters.Position.Rx := 0.00;
			pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Parameters.Position.Rz := 0.00;
			pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Execute := TRUE;
			IF pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Acknowledge THEN
				pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Execute := FALSE;
				cm.state := 10;
			ELSIF pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Error THEN
				em.cmd.abort := TRUE;
			END_IF;
			
		10:
			cm.description := 'Check Rx position reached';
			IF gAcp6DCtrl.Status.ShuttleInfo[pShuttle.par.shuttleID].Position.Ry >= 0.019 THEN
				cm.state := 20;
			END_IF
			
		20:
			cm.description := 'tilt shuttle Ry';
			pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Parameters.Position.Z := 0.002;
			pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Parameters.Position.Ry := -0.02;
			pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Parameters.Position.Rx := 0.00;
			pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Parameters.Position.Rz := 0.00;
			pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Execute := TRUE;
			IF pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Acknowledge THEN
				pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Execute := FALSE;
				cm.state := 30;
			ELSIF pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Error THEN
				em.cmd.abort := TRUE;
			END_IF;
			
		30:
			cm.description := 'Check Rx position reached';
			IF gAcp6DCtrl.Status.ShuttleInfo[pShuttle.par.shuttleID].Position.Ry <= -0.019 THEN
				cm.state := 0;
			END_IF
			
	END_CASE
		
	cm();
	pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0();
	pShuttle.function.MC_BR_Move6D_Acp6D_0();
				

END_ACTION

ACTION MovementRz: 
	pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[pShuttle.par.shuttleID].shuttleRef);
	pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Parameters.Mode := 0; //Absolute
	pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Parameters.Rotation.Type := 0; //Around Center
	pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Parameters.Velocity.Rx := 0.1;
	pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Parameters.Velocity.Rx := 0.1;
	pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Parameters.Velocity.Ry := 0.1;
	pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Parameters.Velocity.Z := 0.002;
	
	pShuttle.function.MC_BR_Move6D_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[pShuttle.par.shuttleID].shuttleRef);
	CASE cm.state OF
		0:
			
			cm.description := 'tilt shuttle Rz';
			pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Parameters.Position.Z := 0.002;
			pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Parameters.Position.Rz := 0.150;
			pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Parameters.Position.Rx := 0.00;
			pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Parameters.Position.Ry := 0.00;
			pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Execute := TRUE;
			IF pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Acknowledge THEN
				pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Execute := FALSE;
				cm.state := 10;
			ELSIF pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Error THEN
				em.cmd.abort := TRUE;
			END_IF;
			
		10:
			cm.description := 'Check Rx position reached';
			IF gAcp6DCtrl.Status.ShuttleInfo[pShuttle.par.shuttleID].Position.RZ >= 0.0140 THEN
				cm.state := 20;
			END_IF
			
		20:
			cm.description := 'tilt shuttle Rz';
			pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Parameters.Position.Z := 0.002;
			pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Parameters.Position.Rz := -0.150;
			pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Parameters.Position.Rx := 0.00;
			pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Parameters.Position.Ry := 0.00;
			pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Execute := TRUE;
			IF pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Acknowledge THEN
				pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Execute := FALSE;
				cm.state := 30;
			ELSIF pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Aborted THEN
				em.cmd.abort := TRUE;
			END_IF;
			
		30:
			cm.description := 'Check Rx position reached';
			IF gAcp6DCtrl.Status.ShuttleInfo[pShuttle.par.shuttleID].Position.RZ <= -0.0140 THEN
				cm.state := 0;
			END_IF
			
	END_CASE
		
	cm();
	pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0();
	pShuttle.function.MC_BR_Move6D_Acp6D_0();
				

END_ACTION

ACTION MovementZ:
	pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[pShuttle.par.shuttleID].shuttleRef);
	pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Parameters.Mode := 0; //Absolute
	pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Parameters.Rotation.Type := 0; //Around Center
	pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Parameters.Velocity.Rx := 0.1;
	pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Parameters.Velocity.Rx := 0.1;
	pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Parameters.Velocity.Ry := 0.1;
	pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Parameters.Velocity.Z := 0.002;
	CASE em.substate OF
		12000..12999:
			pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Parameters.Velocity.Z := 2;
		ELSE
			pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Parameters.Velocity.Z := 0.002;
	END_CASE
	pShuttle.function.MC_BR_Move6D_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[pShuttle.par.shuttleID].shuttleRef);
	
	CASE cm.state OF
		0:
			
			cm.description := 'raise shuttle';
			pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Parameters.Position.Z := 0.004;
			pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Parameters.Position.Rz := 0.00;
			pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Parameters.Position.Rx := 0.00;
			pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Parameters.Position.Ry := 0.00;
			pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Execute := TRUE;
			IF pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Acknowledge THEN
				pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Execute := FALSE;
				cm.state := 10;
			ELSIF pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Error THEN
				em.cmd.abort := TRUE;
			END_IF;
			
		10:
			cm.description := 'Check Rx position reached';
			IF gAcp6DCtrl.Status.ShuttleInfo[pShuttle.par.shuttleID].Position.Z >= 0.0038 THEN
				cm.state := 20;
			END_IF
			
		20:
			cm.description := 'tilt shuttle Rz';
			pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Parameters.Position.Z := 0.001;
			pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Parameters.Position.Rz := 0.00;
			pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Parameters.Position.Rx := 0.00;
			pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Parameters.Position.Ry := 0.00;
			pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Execute := TRUE;
			IF pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Acknowledge THEN
				pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Execute := FALSE;
				cm.state := 30;
			ELSIF pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0.Error THEN
				em.cmd.abort := TRUE;
			END_IF;
			
		30:
			cm.description := 'Check Rx position reached';
			IF gAcp6DCtrl.Status.ShuttleInfo[pShuttle.par.shuttleID].Position.Z <= 0.0011 THEN
				cm.state := 0;
			END_IF
			
	END_CASE
		
	cm();
	pShuttle.function.MC_BR_MoveShortAxis_Acp6D_0();
	pShuttle.function.MC_BR_Move6D_Acp6D_0();
END_ACTION

