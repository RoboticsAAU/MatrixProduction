
ACTION demoProgramTask:
	positionContainerDemo_0[0].initXPos := 0.060;
	positionContainerDemo_0[0].initYPos := 0.120;
	positionContainerDemo_0[1].initXPos := 0.180;
	positionContainerDemo_0[1].initYPos := 0.120;
	positionContainerDemo_0[2].initXPos := 0.300;
	positionContainerDemo_0[2].initYPos := 0.120;
	positionContainerDemo_0[3].initXPos := 0.420;
	positionContainerDemo_0[3].initYPos := 0.120;
	
	//Setup 
	positionContainerLinkMovement[0].Shuttle3.xPos := 0.120;
	positionContainerLinkMovement[0].Shuttle3.yPos := 0.120;
	positionContainerLinkMovement[0].Shuttle2.xPos := 0.360;
	positionContainerLinkMovement[0].Shuttle2.yPos := 0.360;
	positionContainerLinkMovement[0].Shuttle4.xPos := 0.360;
	positionContainerLinkMovement[0].Shuttle4.yPos := 0.120;
	positionContainerLinkMovement[0].Shuttle1.xPos := 0.120;
	positionContainerLinkMovement[0].Shuttle1.yPos := 0.360;
			
	positionContainerLinkMovement[1].Shuttle3.xPos := 0.060;
	positionContainerLinkMovement[1].Shuttle3.yPos := 0.060;
	positionContainerLinkMovement[1].Shuttle2.xPos := 0.180;
	positionContainerLinkMovement[1].Shuttle2.yPos := 0.180;
	positionContainerLinkMovement[1].Shuttle4.xPos := 0.180;
	positionContainerLinkMovement[1].Shuttle4.yPos := 0.060;
	positionContainerLinkMovement[1].Shuttle1.xPos := 0.060;
	positionContainerLinkMovement[1].Shuttle1.yPos := 0.180;
			
	positionContainerLinkMovement[2].Shuttle3.xPos := 0.120;
	positionContainerLinkMovement[2].Shuttle3.yPos := 0.120;
	positionContainerLinkMovement[2].Shuttle2.xPos := 0.360;
	positionContainerLinkMovement[2].Shuttle2.yPos := 0.360;
	positionContainerLinkMovement[2].Shuttle4.xPos := 0.360;
	positionContainerLinkMovement[2].Shuttle4.yPos := 0.120;
	positionContainerLinkMovement[2].Shuttle1.xPos := 0.120;
	positionContainerLinkMovement[2].Shuttle1.yPos := 0.360;
			
	positionContainerLinkMovement[3].Shuttle3.xPos := 0.300;
	positionContainerLinkMovement[3].Shuttle3.yPos := 0.060;
	positionContainerLinkMovement[3].Shuttle2.xPos := 0.420;
	positionContainerLinkMovement[3].Shuttle2.yPos := 0.180;
	positionContainerLinkMovement[3].Shuttle4.xPos := 0.420;
	positionContainerLinkMovement[3].Shuttle4.yPos := 0.060;
	positionContainerLinkMovement[3].Shuttle1.xPos := 0.300;
	positionContainerLinkMovement[3].Shuttle1.yPos := 0.180;
			
	positionContainerLinkMovement[4].Shuttle3.xPos := 0.120;
	positionContainerLinkMovement[4].Shuttle3.yPos := 0.120;
	positionContainerLinkMovement[4].Shuttle2.xPos := 0.360;
	positionContainerLinkMovement[4].Shuttle2.yPos := 0.360;
	positionContainerLinkMovement[4].Shuttle4.xPos := 0.360;
	positionContainerLinkMovement[4].Shuttle4.yPos := 0.120;
	positionContainerLinkMovement[4].Shuttle1.xPos := 0.120;
	positionContainerLinkMovement[4].Shuttle1.yPos := 0.360;
			
	positionContainerLinkMovement[5].Shuttle3.xPos := 0.300;
	positionContainerLinkMovement[5].Shuttle3.yPos := 0.300;
	positionContainerLinkMovement[5].Shuttle2.xPos := 0.420;
	positionContainerLinkMovement[5].Shuttle2.yPos := 0.420;
	positionContainerLinkMovement[5].Shuttle4.xPos := 0.420;
	positionContainerLinkMovement[5].Shuttle4.yPos := 0.300;
	positionContainerLinkMovement[5].Shuttle1.xPos := 0.300;
	positionContainerLinkMovement[5].Shuttle1.yPos := 0.420;
			
	positionContainerLinkMovement[6].Shuttle3.xPos := 0.120;
	positionContainerLinkMovement[6].Shuttle3.yPos := 0.120;
	positionContainerLinkMovement[6].Shuttle2.xPos := 0.360;
	positionContainerLinkMovement[6].Shuttle2.yPos := 0.360;
	positionContainerLinkMovement[6].Shuttle4.xPos := 0.360;
	positionContainerLinkMovement[6].Shuttle4.yPos := 0.120;
	positionContainerLinkMovement[6].Shuttle1.xPos := 0.120;
	positionContainerLinkMovement[6].Shuttle1.yPos := 0.360;
	
	CASE em.substate OF		
		5000:
			
			em.description := 'Move shuttle to pre pos';
			tempShuttleCounter := 0;
			MC_BR_MoveInPlaneAsync_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
			MC_BR_MoveInPlaneAsync_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
			FOR i := 0 TO UINT_TO_USINT(localCurrentNumShuttles-1) DO
				MC_BR_MoveInPlaneAsync_Acp6D_0.Parameters.AsyncPar[i].Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[i].shuttleRef);
				MC_BR_MoveInPlaneAsync_Acp6D_0.Parameters.AsyncPar[i].X := positionContainerDemo_0[i].initXPos;
				MC_BR_MoveInPlaneAsync_Acp6D_0.Parameters.AsyncPar[i].Y := positionContainerDemo_0[i].initYPos;
			END_FOR
			MC_BR_MoveInPlaneAsync_Acp6D_0.Execute := TRUE;
			IF MC_BR_MoveInPlaneAsync_Acp6D_0.Acknowledge THEN
				MC_BR_MoveInPlaneAsync_Acp6D_0.Execute := FALSE;
				em.substate := 5010;
			END_IF
		
		5010:
			MC_BR_MacroRun_Acp6D_0.Name := 'shuttleWave';
			MC_BR_MacroRun_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[0].shuttleRef);
			MC_BR_MacroRun_Acp6D_0.Execute := TRUE;
			IF MC_BR_MacroRun_Acp6D_0.Acknowledge THEN
				MC_BR_MacroRun_Acp6D_0.Execute := FALSE;
				em.substate := 5015;
			END_IF
			
		5015:
			TON_0.PT := t#500ms;
			TON_0.IN := TRUE;
			IF TON_0.Q THEN
				TON_0.IN := FALSE;
				em.substate := 5020;
			END_IF
		
		5020:
			MC_BR_MacroRun_Acp6D_0.Name := 'shuttleWave';
			MC_BR_MacroRun_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[1].shuttleRef);
			MC_BR_MacroRun_Acp6D_0.Execute := TRUE;
			IF MC_BR_MacroRun_Acp6D_0.Acknowledge THEN
				MC_BR_MacroRun_Acp6D_0.Execute := FALSE;
				em.substate := 5025;
			END_IF
			
		5025:
			TON_0.PT := t#500ms;
			TON_0.IN := TRUE;
			IF TON_0.Q THEN
				TON_0.IN := FALSE;
				em.substate := 5030;
			END_IF
		
		5030:
			MC_BR_MacroRun_Acp6D_0.Name := 'shuttleWave';
			MC_BR_MacroRun_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[2].shuttleRef);
			MC_BR_MacroRun_Acp6D_0.Execute := TRUE;
			IF MC_BR_MacroRun_Acp6D_0.Acknowledge THEN
				MC_BR_MacroRun_Acp6D_0.Execute := FALSE;
				em.substate := 5035;
			END_IF
			
		5035:
			TON_0.PT := t#500ms;
			TON_0.IN := TRUE;
			IF TON_0.Q THEN
				TON_0.IN := FALSE;
				em.substate := 5040;
			END_IF
		
		5040:
			MC_BR_MacroRun_Acp6D_0.Name := 'shuttleWave';
			MC_BR_MacroRun_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[3].shuttleRef);
			MC_BR_MacroRun_Acp6D_0.Execute := TRUE;
			IF MC_BR_MacroRun_Acp6D_0.Acknowledge THEN
				MC_BR_MacroRun_Acp6D_0.Execute := FALSE;
				em.substate := 5045;
			END_IF
			
		5045:
			em.description := 'Check all shuttle state';
			IF gAcp6DCtrl.Status.ShuttleInfo[0].State = mcACP6D_SH_STATE_IDLING AND gAcp6DCtrl.Status.ShuttleInfo[1].State = mcACP6D_SH_STATE_IDLING 
				AND gAcp6DCtrl.Status.ShuttleInfo[2].State = mcACP6D_SH_STATE_IDLING AND gAcp6DCtrl.Status.ShuttleInfo[3].State = mcACP6D_SH_STATE_IDLING AND MC_BR_AsmReadStatus_Acp6D_0.AssemblyReady THEN
				em.substate := 5050;
			END_IF
		
		5050:
			em.description := 'Couple ShuttleGroup1_2';
			em.cmd.sc := FALSE;
			MC_BR_ShGroupCoupleCtrl_Acp6D_0.ShuttleGroup := shGroupShuttle1_2;
			MC_BR_ShGroupCoupleCtrl_Acp6D_0.Parameters.Option := 1; //Couple
			MC_BR_ShGroupCoupleCtrl_Acp6D_0.Execute := TRUE;
			IF MC_BR_ShGroupCoupleCtrl_Acp6D_0.Done THEN
				MC_BR_ShGroupCoupleCtrl_Acp6D_0.Execute := FALSE;
				em.substate := 5060;
			END_IF
		
		5060:
			em.description := 'Couple ShuttleGroup3_4';
			em.cmd.sc := FALSE;
			MC_BR_ShGroupCoupleCtrl_Acp6D_0.ShuttleGroup := shGroupShuttle3_4;
			MC_BR_ShGroupCoupleCtrl_Acp6D_0.Parameters.Option := 1; //Couple
			MC_BR_ShGroupCoupleCtrl_Acp6D_0.Execute := TRUE;
			IF MC_BR_ShGroupCoupleCtrl_Acp6D_0.Done THEN
				MC_BR_ShGroupCoupleCtrl_Acp6D_0.Execute := FALSE;
				em.substate := 5070;
			END_IF
			
		5070:
			em.cmd.sc := FALSE;
			MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[0].shuttleRef);
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := 0.060;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := 0.060;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Mode := 0; //Abs
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 0; //direct
			MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
				MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				em.substate := 5080;
			END_IF
		
		5080:
			em.cmd.sc := FALSE;
			MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[0].shuttleRef);
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := 0.300;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := 0.060;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Mode := 0; //Abs
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 0; //direct
			MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
				MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				em.substate := 5090;
			END_IF
			
		5090:
			em.cmd.sc := FALSE;
			MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[0].shuttleRef);
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := 0.060;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := 0.060;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Mode := 0; //Abs
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 0; //direct
			MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
				MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				em.substate := 5100;
			END_IF
			
		5100:
			em.cmd.sc := FALSE;
			MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[0].shuttleRef);
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := 0.300;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := 0.060;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Mode := 0; //Abs
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 0; //direct
			MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
				MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				em.substate := 5110;
			END_IF
			
		5110:
			em.cmd.sc := FALSE;
			MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[0].shuttleRef);
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := 0.060;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := 0.060;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Mode := 0; //Abs
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 0; //direct
			MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
				MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				em.substate := 5120;
			END_IF
			
		5120:
			em.cmd.sc := FALSE;
			MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[0].shuttleRef);
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := 0.300;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := 0.060;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Mode := 0; //Abs
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 0; //direct
			MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
				MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				em.substate := 5130;
			END_IF
			
		5130:
			em.cmd.sc := FALSE;
			MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[0].shuttleRef);
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := 0.060;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := 0.060;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Mode := 0; //Abs
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 0; //direct
			MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
				MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				em.substate := 5135;
			END_IF
			
		5135:
			em.cmd.sc := FALSE;
			MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[0].shuttleRef);
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := 0.060;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := 0.180;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Mode := 0; //Abs
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 0; //direct
			MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
				MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				em.substate := 5140;
			END_IF
			
		5140:
			em.cmd.sc := FALSE;
			MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[2].shuttleRef);
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := 0.060;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := 0.180;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Mode := 0; //Abs
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 0; //direct
			MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
				MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				em.substate := 5150;
			END_IF
			
		5150:
			em.cmd.sc := FALSE;
			MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[2].shuttleRef);
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := 0.300;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := 0.180;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Mode := 0; //Abs
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 0; //direct
			MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
				MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				em.substate := 5160;
			END_IF
			
		5160:
			em.cmd.sc := FALSE;
			MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[2].shuttleRef);
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := 0.060;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := 0.180;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Mode := 0; //Abs
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 0; //direct
			MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
				MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				em.substate := 5170;
			END_IF
			
		5170:
			em.cmd.sc := FALSE;
			MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[2].shuttleRef);
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := 0.300;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := 0.180;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Mode := 0; //Abs
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 0; //direct
			MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
				MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				em.substate := 5190;
			END_IF
			
		5190:
			em.cmd.sc := FALSE;
			MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[2].shuttleRef);
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := 0.060;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := 0.180;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Mode := 0; //Abs
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 0; //direct
			MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
				MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				em.substate := 5195;
			END_IF
			
		5195:
			em.cmd.sc := FALSE;
			MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[2].shuttleRef);
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := 0.300;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := 0.180;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Mode := 0; //Abs
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 0; //direct
			MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
				MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				em.substate := 5200;
			END_IF
			
		5200:
			em.description := 'DeCouple ShuttleGroup1_2';
			em.cmd.sc := FALSE;
			MC_BR_ShGroupCoupleCtrl_Acp6D_0.ShuttleGroup := shGroupShuttle1_2;
			MC_BR_ShGroupCoupleCtrl_Acp6D_0.Parameters.Option := 0; //DeCouple
			MC_BR_ShGroupCoupleCtrl_Acp6D_0.Execute := TRUE;
			IF MC_BR_ShGroupCoupleCtrl_Acp6D_0.Done THEN
				MC_BR_ShGroupCoupleCtrl_Acp6D_0.Execute := FALSE;
				em.substate := 5210;
			END_IF
		
		5210:
			em.description := 'DeCouple ShuttleGroup3_4';
			em.cmd.sc := FALSE;
			MC_BR_ShGroupCoupleCtrl_Acp6D_0.ShuttleGroup := shGroupShuttle3_4;
			MC_BR_ShGroupCoupleCtrl_Acp6D_0.Parameters.Option := 0; //DeCouple
			MC_BR_ShGroupCoupleCtrl_Acp6D_0.Execute := TRUE;
			IF MC_BR_ShGroupCoupleCtrl_Acp6D_0.Done THEN
				MC_BR_ShGroupCoupleCtrl_Acp6D_0.Execute := FALSE;
				em.substate := 5220;
			END_IF
		
		5220:
			em.description := 'check shuttle state idle';
			IF gAcp6DCtrl.Status.ShuttleInfo[0].State = mcACP6D_SH_STATE_IDLING AND gAcp6DCtrl.Status.ShuttleInfo[1].State = mcACP6D_SH_STATE_IDLING 
				AND gAcp6DCtrl.Status.ShuttleInfo[2].State = mcACP6D_SH_STATE_IDLING AND gAcp6DCtrl.Status.ShuttleInfo[3].State = mcACP6D_SH_STATE_IDLING AND MC_BR_AsmReadStatus_Acp6D_0.AssemblyReady THEN
				em.substate := 5230;
			END_IF
			
		5230:
			em.description := 'Couple ShuttleGroup1_2';
			em.cmd.sc := FALSE;
			MC_BR_ShGroupCoupleCtrl_Acp6D_0.ShuttleGroup := shGroupShuttle1_2;
			MC_BR_ShGroupCoupleCtrl_Acp6D_0.Parameters.Option := 1; //Couple
			MC_BR_ShGroupCoupleCtrl_Acp6D_0.Execute := TRUE;
			IF MC_BR_ShGroupCoupleCtrl_Acp6D_0.Done THEN
				MC_BR_ShGroupCoupleCtrl_Acp6D_0.Execute := FALSE;
				em.substate := 5240;
			ELSIF MC_BR_ShGroupCoupleCtrl_Acp6D_0.Error THEN
				em.cmd.abort := TRUE;
			END_IF
		
		5240:
			em.description := 'Couple ShuttleGroup1_2';
			em.cmd.sc := FALSE;
			MC_BR_ShGroupCoupleCtrl_Acp6D_0.ShuttleGroup := shGroupShuttle3_4;
			MC_BR_ShGroupCoupleCtrl_Acp6D_0.Parameters.Option := 1; //Couple
			MC_BR_ShGroupCoupleCtrl_Acp6D_0.Execute := TRUE;
			IF MC_BR_ShGroupCoupleCtrl_Acp6D_0.Done THEN
				MC_BR_ShGroupCoupleCtrl_Acp6D_0.Execute := FALSE;
				em.substate := 5250;
			ELSIF MC_BR_ShGroupCoupleCtrl_Acp6D_0.Error THEN
				em.cmd.abort := TRUE;
			END_IF

		5250:
			em.description := 'Move group 10 of shuttle around';
			em.cmd.sc := FALSE;
			IF tempCounter >= 3 THEN
				tempCounter := 0;
				em.substate := 5270;
			ELSE
				MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[0].shuttleRef);
				MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := 0.300;
				MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := 0.060;
				MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 2; //Y then X
				MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
				IF MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
					MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
					em.substate := 5260;
				END_IF
			END_IF
		
		5260:
			em.description := 'Move group of shuttle around';
			em.cmd.sc := FALSE;
			MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[0].shuttleRef);
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := 0.060;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := 0.180;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 2; //Y then X
			MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
				MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				tempCounter := tempCounter + 1;
				em.substate := 5250;
			END_IF
			
		5270:
			em.description := 'Move group 11 of shuttle around';
			em.cmd.sc := FALSE;
			IF tempCounter >= 3 THEN
				tempCounter := 0;
				em.substate := 5290;
			ELSE
				MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[2].shuttleRef);
				MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := 0.060;
				MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := 0.180;
				MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 2; //Y then X
				MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
				IF MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
					MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
					em.substate := 5280;
				END_IF
			END_IF
		
		5280:
			em.description := 'Move group of shuttle around';
			em.cmd.sc := FALSE;
			MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[2].shuttleRef);
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := 0.300;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := 0.060;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 2; //Y then X
			MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
				MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				tempCounter := tempCounter + 1;
				em.substate := 5270;
			END_IF
		
		5290:
			em.description := 'DeCouple ShuttleGroup1_2';
			em.cmd.sc := FALSE;
			MC_BR_ShGroupCoupleCtrl_Acp6D_0.ShuttleGroup := shGroupShuttle1_2;
			MC_BR_ShGroupCoupleCtrl_Acp6D_0.Parameters.Option := 0; //DeCouple
			MC_BR_ShGroupCoupleCtrl_Acp6D_0.Execute := TRUE;
			IF MC_BR_ShGroupCoupleCtrl_Acp6D_0.Done THEN
				MC_BR_ShGroupCoupleCtrl_Acp6D_0.Execute := FALSE;
				em.substate := 5300;
			ELSIF MC_BR_ShGroupCoupleCtrl_Acp6D_0.Error THEN
				em.cmd.abort := TRUE;
			END_IF
			
		5300:
			em.description := 'Wait for shuttle to reach pos';
			em.cmd.sc := FALSE;
			IF((gAcp6DCtrl.Status.ShuttleInfo[2].Position.X > 0.300 - MARGIN AND gAcp6DCtrl.Status.ShuttleInfo[2].Position.X < 0.300 + MARGIN) AND
				gAcp6DCtrl.Status.ShuttleInfo[2].Position.Y > 0.060 - MARGIN AND gAcp6DCtrl.Status.ShuttleInfo[2].Position.Y < 0.060 + MARGIN) THEN
				IF gAcp6DCtrl.Status.ShuttleInfo[2].State = mcACP6D_SH_STATE_IDLING THEN
					em.substate := 5310;
				END_IF
			END_IF
		
		5310:
			em.description := 'Move right group up';
			em.cmd.sc := FALSE;
			MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[2].shuttleRef);
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := 0.300;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := 0.180;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 0; //Direct
			MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
				MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				em.substate := 5320;
			END_IF
		
		5320:			
			em.description := 'Couple ShuttleGroup1_2';
			em.cmd.sc := FALSE;
			MC_BR_ShGroupCoupleCtrl_Acp6D_0.ShuttleGroup := shGroupShuttle3_4;
			MC_BR_ShGroupCoupleCtrl_Acp6D_0.Parameters.Option := 0; //DeCouple
			MC_BR_ShGroupCoupleCtrl_Acp6D_0.Execute := TRUE;
			IF MC_BR_ShGroupCoupleCtrl_Acp6D_0.Done THEN
				MC_BR_ShGroupCoupleCtrl_Acp6D_0.Execute := FALSE;
				em.substate := 5330;
			ELSIF MC_BR_ShGroupCoupleCtrl_Acp6D_0.Error THEN
				em.cmd.abort := TRUE;
			END_IF
		
		5330:
			em.description := 'rotationMove part 1';
			MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[1].shuttleRef);
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := 0.060;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := 0.060;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 2; //Y then X
			MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
				MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				em.substate := 5340;
			END_IF
		
		5340:
			em.description := 'rotationMove part 2';
			MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[3].shuttleRef);
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := 0.180;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := 0.060;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 2; //Y then X
			MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
				MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				em.substate := 5350;
			END_IF
		
		5350:
			em.description := 'rotationMove part 3';
			MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[3].shuttleRef);
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := 0.180;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := 0.180;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 0; //direct
			MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
				MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				em.substate := 5360;
			END_IF
			
		5360:
			em.description := 'Check switch is done part 1';
			IF((gAcp6DCtrl.Status.ShuttleInfo[3].Position.X > 0.180 - MARGIN AND gAcp6DCtrl.Status.ShuttleInfo[3].Position.X < 0.180 + MARGIN) AND
				gAcp6DCtrl.Status.ShuttleInfo[3].Position.Y > 0.180 - MARGIN AND gAcp6DCtrl.Status.ShuttleInfo[3].Position.Y < 0.180 + MARGIN) THEN
				IF gAcp6DCtrl.Status.ShuttleInfo[3].State = mcACP6D_SH_STATE_IDLING THEN
					em.substate := 5370;
				END_IF
			END_IF
			
		5370:
			em.description := 'rotationMove part 4';
			MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[1].shuttleRef);
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := 0.420;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := 0.180;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 1; //X then Y
			MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
				MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				em.substate := 5380;
			END_IF
		
		5380:
			em.description := 'Check switch is done part 2';
			IF((gAcp6DCtrl.Status.ShuttleInfo[1].Position.X > 0.420 - MARGIN AND gAcp6DCtrl.Status.ShuttleInfo[1].Position.X < 0.420 + MARGIN) AND
				gAcp6DCtrl.Status.ShuttleInfo[1].Position.Y > 0.180 - MARGIN AND gAcp6DCtrl.Status.ShuttleInfo[1].Position.Y < 0.180 + MARGIN) THEN
				IF gAcp6DCtrl.Status.ShuttleInfo[1].State = mcACP6D_SH_STATE_IDLING THEN
					em.substate := 5390;
				END_IF
			END_IF

		
		5390:
			em.description := 'Couple ShuttleGroup1_4';
			em.cmd.sc := FALSE;
			MC_BR_ShGroupCoupleCtrl_Acp6D_0.ShuttleGroup := shGroupShuttle1_4;
			MC_BR_ShGroupCoupleCtrl_Acp6D_0.Parameters.Option := 1; //Couple
			MC_BR_ShGroupCoupleCtrl_Acp6D_0.Execute := TRUE;
			IF MC_BR_ShGroupCoupleCtrl_Acp6D_0.Done THEN
				MC_BR_ShGroupCoupleCtrl_Acp6D_0.Execute := FALSE;
				em.substate := 5400;
			ELSIF MC_BR_ShGroupCoupleCtrl_Acp6D_0.Error THEN
				em.cmd.abort := TRUE;
			END_IF
		
		5400:
			em.description := 'Couple ShuttleGroup2_3';
			em.cmd.sc := FALSE;
			MC_BR_ShGroupCoupleCtrl_Acp6D_0.ShuttleGroup := shGroupShuttle2_3;
			MC_BR_ShGroupCoupleCtrl_Acp6D_0.Parameters.Option := 1; //Couple
			MC_BR_ShGroupCoupleCtrl_Acp6D_0.Execute := TRUE;
			IF MC_BR_ShGroupCoupleCtrl_Acp6D_0.Done THEN
				MC_BR_ShGroupCoupleCtrl_Acp6D_0.Execute := FALSE;
				em.substate := 5410;
			ELSIF MC_BR_ShGroupCoupleCtrl_Acp6D_0.Error THEN
				em.cmd.abort := TRUE;
			END_IF
			
		5410:
			em.description := 'Move right side down';
			em.cmd.sc := FALSE;
			MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[2].shuttleRef);
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := 0.300;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := 0.060;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 0; //direct
			MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
				MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				em.substate := 5430;
			END_IF
		
		5430:
			em.description := 'Move group 12 of shuttle around';
			em.cmd.sc := FALSE;
			IF tempCounter >= 3 THEN
				tempCounter := 0;
				em.substate := 5450;
			ELSE
				MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[0].shuttleRef);
				MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := 0.300;
				MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := 0.060;
				MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 1; //X then Y
				MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
				IF MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
					MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
					em.substate := 5440;
				END_IF
			END_IF
		
		5440:
			em.description := 'Move group of shuttle around';
			em.cmd.sc := FALSE;
			MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[0].shuttleRef);
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := 0.060;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := 0.180;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 1; //X then Y
			MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
				MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				tempCounter := tempCounter + 1;
				em.substate := 5430;
			END_IF
		
		5450:
			em.description := 'Move group 13 of shuttle around';
			em.cmd.sc := FALSE;
			IF tempCounter >= 3 THEN
				tempCounter := 0;
				em.substate := 5470;
			ELSE
				MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[2].shuttleRef);
				MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := 0.060;
				MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := 0.180;
				MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 1; //X then Y
				MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
				IF MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
					MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
					em.substate := 5460;
				END_IF
			END_IF
		
		5460:
			em.description := 'Move group of shuttle around';
			em.cmd.sc := FALSE;
			MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[2].shuttleRef);
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := 0.300;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := 0.060;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 1; //X then Y
			MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
				MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				tempCounter := tempCounter + 1;
				em.substate := 5450;
			END_IF
		
		5470:
			em.cmd.sc := FALSE;
			IF((gAcp6DCtrl.Status.ShuttleInfo[2].Position.X > 0.300 - MARGIN AND gAcp6DCtrl.Status.ShuttleInfo[2].Position.X < 0.300 + MARGIN) AND
				gAcp6DCtrl.Status.ShuttleInfo[2].Position.Y > 0.060 - MARGIN AND gAcp6DCtrl.Status.ShuttleInfo[2].Position.Y < 0.060 + MARGIN) THEN
				IF gAcp6DCtrl.Status.ShuttleInfo[2].State = mcACP6D_SH_STATE_IDLING THEN
					em.substate := 5480;
				END_IF
			END_IF
		
		5480:
			em.description := 'Move right group up';
			em.cmd.sc := FALSE;
			MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[2].shuttleRef);
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := 0.300;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := 0.180;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 0; //Direct
			MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
				MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				em.substate := 5490;
			END_IF
		
		5490:
			em.description := 'DeCouple ShuttleGroup1_4';
			em.cmd.sc := FALSE;
			MC_BR_ShGroupCoupleCtrl_Acp6D_0.ShuttleGroup := shGroupShuttle1_4;
			MC_BR_ShGroupCoupleCtrl_Acp6D_0.Parameters.Option := 0; //DeCouple
			MC_BR_ShGroupCoupleCtrl_Acp6D_0.Execute := TRUE;
			IF MC_BR_ShGroupCoupleCtrl_Acp6D_0.Done THEN
				MC_BR_ShGroupCoupleCtrl_Acp6D_0.Execute := FALSE;
				em.substate := 5500;
			ELSIF MC_BR_ShGroupCoupleCtrl_Acp6D_0.Error THEN
				em.cmd.abort := TRUE;
			END_IF
		
		5500:
			em.description := 'DeCouple ShuttleGroup2_3';
			em.cmd.sc := FALSE;
			MC_BR_ShGroupCoupleCtrl_Acp6D_0.ShuttleGroup := shGroupShuttle2_3;
			MC_BR_ShGroupCoupleCtrl_Acp6D_0.Parameters.Option := 0; //DeCouple
			MC_BR_ShGroupCoupleCtrl_Acp6D_0.Execute := TRUE;
			IF MC_BR_ShGroupCoupleCtrl_Acp6D_0.Done THEN
				MC_BR_ShGroupCoupleCtrl_Acp6D_0.Execute := FALSE;
				em.substate := 5510;
			ELSIF MC_BR_ShGroupCoupleCtrl_Acp6D_0.Error THEN
				em.cmd.abort := TRUE;
			END_IF
		
		5510:
			em.description := 'rotationMove part 1';
			MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[3].shuttleRef);
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := 0.060;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := 0.060;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 2; //Y then X
			MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
				MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				em.substate := 5520;
			END_IF
		
		5520:
			em.description := 'rotationMove part 2';
			MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[1].shuttleRef);
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := 0.180;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := 0.060;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 2; //Y then X
			MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
				MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				em.substate := 5530;
			END_IF
		
		5530:
			em.description := 'rotationMove part 3';
			MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[1].shuttleRef);
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := 0.180;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := 0.180;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 0; //direct
			MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
				MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				em.substate := 5540;
			END_IF
		
		5540:
			IF((gAcp6DCtrl.Status.ShuttleInfo[1].Position.X > 0.180 - MARGIN AND gAcp6DCtrl.Status.ShuttleInfo[1].Position.X < 0.180 + MARGIN) AND
				gAcp6DCtrl.Status.ShuttleInfo[1].Position.Y > 0.180 - MARGIN AND gAcp6DCtrl.Status.ShuttleInfo[1].Position.Y < 0.180 + MARGIN) THEN
				IF gAcp6DCtrl.Status.ShuttleInfo[1].State = mcACP6D_SH_STATE_IDLING THEN
					em.substate := 5550;
				END_IF
			END_IF
		
		5550:
			em.description := 'rotationMove part 4';
			MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[3].shuttleRef);
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := 0.420;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := 0.180;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 1; //X then Y
			MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
				MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				em.substate := 5560;
			END_IF
		
		5560:
			IF((gAcp6DCtrl.Status.ShuttleInfo[3].Position.X > 0.420 - MARGIN AND gAcp6DCtrl.Status.ShuttleInfo[3].Position.X < 0.420 + MARGIN) AND
				gAcp6DCtrl.Status.ShuttleInfo[3].Position.Y > 0.180 - MARGIN AND gAcp6DCtrl.Status.ShuttleInfo[3].Position.Y < 0.180 + MARGIN) THEN
				IF gAcp6DCtrl.Status.ShuttleInfo[3].State = mcACP6D_SH_STATE_IDLING THEN
					em.substate := 5000;
				END_IF
			END_IF
		
		
//		5020:
//			em.description := 'Move shuttle up/down wave File 128-131';
//			MC_BR_MacroLoad_Acp6D_0.FileName := MC_BR_MacroList_Acp6D_0.MacroList[tempCounter];
//			MC_BR_MacroLoad_Acp6D_0.Execute := TRUE;
//			IF MC_BR_MacroLoad_Acp6D_0.Done THEN
//				tempCounter := tempCounter + 1;
//				MC_BR_MacroLoad_Acp6D_0.Execute := FALSE;
//				em.substate := 5021;
//			END_IF
//			
//		5021:
//			em.description := 'check if all 4 shuttles have done wave move';
//			IF tempCounter > NUM_SHUTTLES THEN
//				em.substate := 5022;
//			ELSE
//				em.substate := 5020;
//			END_IF
//			
//		5022:
//			em.description := 'Check shuttle 4 aka last shuttle reach pos';
//			IF((gAcp6DCtrl.Status.ShuttleInfo[3].Position.X > 0.420 - MARGIN AND gAcp6DCtrl.Status.ShuttleInfo[3].Position.X < 0.420 + MARGIN) AND
//				gAcp6DCtrl.Status.ShuttleInfo[3].Position.Y > 0.180 - MARGIN AND gAcp6DCtrl.Status.ShuttleInfo[3].Position.Y < 0.180 + MARGIN) THEN
//				IF gAcp6DCtrl.Status.ShuttleInfo[3].State = mcACP6D_SH_STATE_IDLING THEN
//					MC_BR_ZoneGetStatus_Acp6D_0.Execute := FALSE;
//					em.substate := 5030;
//				END_IF
//			END_IF
//			
//		5030:
//			em.description := 'Link Shuttles';
//			em.description := 'Check if shuttle group 10 is created';
//			MC_BR_ShGroupGetStatus_Acp6D_0.GroupID := 10;
//			MC_BR_ShGroupGetStatus_Acp6D_0.Execute := TRUE;
//			IF MC_BR_ShGroupGetStatus_Acp6D_0.Done THEN
//				em.substate := 5031;
//			END_IF
//			
//		5031:	
//			IF MC_BR_ShGroupGetStatus_Acp6D_0.NumberOfShuttles > 0 THEN
//				//group created
//				MC_BR_ShGroupGetStatus_Acp6D_0.Execute := FALSE;
//				em.substate := 5032;
//			ELSE
//				//Create group
//				MC_BR_ShGroupGetStatus_Acp6D_0.Execute := FALSE;;
//				MC_BR_ShGroupCreate_Acp6D_0.GroupID := 10;
//				MC_BR_ShGroupCreate_Acp6D_0.NumberOfShuttles := 2;
//				MC_BR_ShGroupCreate_Acp6D_0.ShuttleID[0] := 1;
//				MC_BR_ShGroupCreate_Acp6D_0.ShuttleID[1] := 2;
//				//				MC_BR_ShGroupCreate_Acp6D_0.ShuttleID[2] := 3;
//				//				MC_BR_ShGroupCreate_Acp6D_0.ShuttleID[3] := 4;
//				MC_BR_ShGroupCreate_Acp6D_0.Execute := TRUE;
//				IF MC_BR_ShGroupCreate_Acp6D_0.Done THEN
//					MC_BR_ShGroupGetStatus_Acp6D_0.Execute := FALSE;
//					MC_BR_ShGroupCreate_Acp6D_0.Execute := FALSE;
//					em.substate := 5032;
//				END_IF
//			END_IF
//			
//		5032:
//			em.description := 'Check if shuttle group 11 is created';
//			MC_BR_ShGroupGetStatus_Acp6D_0.GroupID := 11;
//			MC_BR_ShGroupGetStatus_Acp6D_0.Execute := TRUE;
//			IF MC_BR_ShGroupGetStatus_Acp6D_0.Done THEN
//				em.substate := 5033;
//			END_IF
//			
//		5033:
//			IF MC_BR_ShGroupGetStatus_Acp6D_0.NumberOfShuttles > 0 THEN
//				//group created
//				MC_BR_ShGroupGetStatus_Acp6D_0.Execute := FALSE;
//				em.substate := 5040;
//			ELSE
//				//Create group
//				MC_BR_ShGroupGetStatus_Acp6D_0.Execute := FALSE;;
//				MC_BR_ShGroupCreate_Acp6D_0.GroupID := 11;
//				MC_BR_ShGroupCreate_Acp6D_0.NumberOfShuttles := 2;
//				MC_BR_ShGroupCreate_Acp6D_0.ShuttleID[0] := 3;
//				MC_BR_ShGroupCreate_Acp6D_0.ShuttleID[1] := 4;
//				//				MC_BR_ShGroupCreate_Acp6D_0.ShuttleID[2] := 3;
//				//				MC_BR_ShGroupCreate_Acp6D_0.ShuttleID[3] := 4;
//				MC_BR_ShGroupCreate_Acp6D_0.Execute := TRUE;
//				IF MC_BR_ShGroupCreate_Acp6D_0.Done THEN
//					MC_BR_ShGroupGetStatus_Acp6D_0.Execute := FALSE;
//					MC_BR_ShGroupCreate_Acp6D_0.Execute := FALSE;
//					em.substate := 5040;
//				END_IF
//			END_IF
//			
//		5040:
//			em.description := 'couple shuttles group 10';
//			MC_BR_ShGroupCoupleCtrl_Acp6D_0.GroupID := 10;
//			MC_BR_ShGroupCoupleCtrl_Acp6D_0.CoupleMode := 0;
//			MC_BR_ShGroupCoupleCtrl_Acp6D_0.Option := 1; //Couple
//			MC_BR_ShGroupCoupleCtrl_Acp6D_0.Execute := TRUE;
//			IF MC_BR_ShGroupCoupleCtrl_Acp6D_0.Done THEN
//				MC_BR_ShGroupCoupleCtrl_Acp6D_0.Execute := FALSE;
//				em.substate := 5045;
//			END_IF
//			
//		5045:
//			em.description := 'couple shuttles group 11';
//			MC_BR_ShGroupCoupleCtrl_Acp6D_0.GroupID := 11;
//			MC_BR_ShGroupCoupleCtrl_Acp6D_0.CoupleMode := 0;
//			MC_BR_ShGroupCoupleCtrl_Acp6D_0.Option := 1; //Couple
//			MC_BR_ShGroupCoupleCtrl_Acp6D_0.Execute := TRUE;
//			IF MC_BR_ShGroupCoupleCtrl_Acp6D_0.Done THEN
//				MC_BR_ShGroupCoupleCtrl_Acp6D_0.Execute := FALSE;
//				em.substate := 5050;
//			END_IF
//			
//		5050:
//			em.description := 'prepaire tiktak move';
//			MC_BR_MoveInPlane_Acp6D_0.ShuttleID := 1;
//			MC_BR_MoveInPlane_Acp6D_0.PositionX := 0.060;
//			MC_BR_MoveInPlane_Acp6D_0.PositionY := 0.060;
//			MC_BR_MoveInPlane_Acp6D_0.Velocity := gAcp6DCtrl.Par.Velocity;
//			MC_BR_MoveInPlane_Acp6D_0.Acceleration := gAcp6DCtrl.Par.Acceleration;
//			MC_BR_MoveInPlane_Acp6D_0.Path := 2; //Y then X
//			MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
//			IF MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
//				MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
//				em.substate := 5055;
//			END_IF
//		
//		5055:
//			em.description := 'Move tiktak move File 132-135';
//			MC_BR_MacroLoad_Acp6D_0.FileName := MC_BR_MacroList_Acp6D_0.MacroList[tempCounter];
//			MC_BR_MacroLoad_Acp6D_0.Execute := TRUE;
//			IF MC_BR_MacroLoad_Acp6D_0.Done THEN
//				tempCounter := tempCounter + 1;
//				MC_BR_MacroLoad_Acp6D_0.Execute := FALSE;
//				em.substate := 5060;
//			END_IF
//		
//		5060:
//			em.description := 'check if all 4 shuttles have done wave move';
//			IF tempCounter > 5 THEN
//				em.substate := 5065;
//			ELSE
//				em.substate := 5055;
//			END_IF
//		
//		5065:
//			em.description := 'decouple shuttles group 10';
//			MC_BR_ShGroupCoupleCtrl_Acp6D_0.GroupID := 10;
//			MC_BR_ShGroupCoupleCtrl_Acp6D_0.CoupleMode := 0;
//			MC_BR_ShGroupCoupleCtrl_Acp6D_0.Option := 0; //Couple
//			MC_BR_ShGroupCoupleCtrl_Acp6D_0.Execute := TRUE;
//			IF MC_BR_ShGroupCoupleCtrl_Acp6D_0.Done THEN
//				MC_BR_ShGroupCoupleCtrl_Acp6D_0.Execute := FALSE;
//				em.substate := 5070;
//			END_IF
//		
//		5070:
//			em.description := 'decouple shuttles group 11';
//			MC_BR_ShGroupCoupleCtrl_Acp6D_0.GroupID := 11;
//			MC_BR_ShGroupCoupleCtrl_Acp6D_0.CoupleMode := 0;
//			MC_BR_ShGroupCoupleCtrl_Acp6D_0.Option := 0; //Couple
//			MC_BR_ShGroupCoupleCtrl_Acp6D_0.Execute := TRUE;
//			IF MC_BR_ShGroupCoupleCtrl_Acp6D_0.Done THEN
//				MC_BR_ShGroupCoupleCtrl_Acp6D_0.Execute := FALSE;
//				em.substate := 5075;
//			END_IF
//		
//		5075:
//			em.description := 'Move shuttle 3 to corner to make space for 2 shuttle show';
//			MC_BR_MoveInPlane_Acp6D_0.ShuttleID := 3;
//			MC_BR_MoveInPlane_Acp6D_0.PositionX := 0.420;
//			MC_BR_MoveInPlane_Acp6D_0.PositionY := 0.060;
//			MC_BR_MoveInPlane_Acp6D_0.Velocity := gAcp6DCtrl.Par.Velocity;
//			MC_BR_MoveInPlane_Acp6D_0.Acceleration := gAcp6DCtrl.Par.Acceleration;
//			MC_BR_MoveInPlane_Acp6D_0.Path := 2; //Y then X
//			MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
//			IF MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
//				MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
//				em.substate := 5077;
//			END_IF
//			
//		5077:
//			em.description := 'Check shuttle 3 reach pos';
//			IF((gAcp6DCtrl.Status.ShuttleInfo[2].Position.X > 0.420 - MARGIN AND gAcp6DCtrl.Status.ShuttleInfo[2].Position.X < 0.420 + MARGIN) AND
//				gAcp6DCtrl.Status.ShuttleInfo[2].Position.Y > 0.060 - MARGIN AND gAcp6DCtrl.Status.ShuttleInfo[2].Position.Y < 0.060 + MARGIN) THEN
//				IF gAcp6DCtrl.Status.ShuttleInfo[2].State = mcACP6D_SH_STATE_IDLING THEN
//					MC_BR_ZoneGetStatus_Acp6D_0.Execute := FALSE;
//					em.substate := 5080;
//				END_IF
//			END_IF
//		
//		5080:
//			em.description := 'Move shuttle 2 a small amount away from shuttle 1';
//			MC_BR_MoveInPlane_Acp6D_0.ShuttleID := 2;
//			MC_BR_MoveInPlane_Acp6D_0.PositionX := 0.200;
//			MC_BR_MoveInPlane_Acp6D_0.PositionY := 0.060;
//			MC_BR_MoveInPlane_Acp6D_0.Velocity := gAcp6DCtrl.Par.Velocity;
//			MC_BR_MoveInPlane_Acp6D_0.Acceleration := gAcp6DCtrl.Par.Acceleration;
//			MC_BR_MoveInPlane_Acp6D_0.Path := 2; //Y then X
//			MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
//			IF MC_BR_MoveInPlane_Acp6D_0.Done THEN
//				MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
//				em.substate := 5085;
//			END_IF
//		
//		5085:
//			em.description := 'couple shuttles group 10';
//			MC_BR_ShGroupCoupleCtrl_Acp6D_0.GroupID := 10;
//			MC_BR_ShGroupCoupleCtrl_Acp6D_0.CoupleMode := 0;
//			MC_BR_ShGroupCoupleCtrl_Acp6D_0.Option := 1; //Couple
//			MC_BR_ShGroupCoupleCtrl_Acp6D_0.Execute := TRUE;
//			IF MC_BR_ShGroupCoupleCtrl_Acp6D_0.Done THEN
//				MC_BR_ShGroupCoupleCtrl_Acp6D_0.Execute := FALSE;
//				em.substate := 5090;
//			END_IF
//		
//		5090:
//			em.description := 'Move shuttles in X Y and RZ at the same time';
//			MC_BR_Move6D_Acp6D_0.Acceleration := 0.5;
//			MC_BR_Move6D_Acp6D_0.InPlaneVelocity := 0.14;
//			MC_BR_Move6D_Acp6D_0.ShuttleID := 1;
//			MC_BR_Move6D_Acp6D_0.ShortAxisVelocity[3] := 0.300;
//			MC_BR_Move6D_Acp6D_0.Position[0] := 0.140;
//			MC_BR_Move6D_Acp6D_0.Position[1] := 0.180;
//			MC_BR_Move6D_Acp6D_0.Position[2] := 0.001;
//			MC_BR_Move6D_Acp6D_0.Position[3] := 0;
//			MC_BR_Move6D_Acp6D_0.Position[4] := 0;
//			MC_BR_Move6D_Acp6D_0.Position[5] := 0.100;
//			MC_BR_Move6D_Acp6D_0.Execute := TRUE;
//			IF MC_BR_Move6D_Acp6D_0.Acknowledge THEN
//				MC_BR_Move6D_Acp6D_0.Execute := FALSE;
//				em.substate := 5095;
//			END_IF
//		
//		5095:
//			em.description := 'Move shuttles in X Y and RZ at the same time';
//			MC_BR_Move6D_Acp6D_0.Acceleration := 0.5;
//			MC_BR_Move6D_Acp6D_0.InPlaneVelocity := 0.08;
//			MC_BR_Move6D_Acp6D_0.ShuttleID := 1;
//			MC_BR_Move6D_Acp6D_0.ShortAxisVelocity[3] := 0.300;
//			MC_BR_Move6D_Acp6D_0.Position[0] := 0.140;
//			MC_BR_Move6D_Acp6D_0.Position[1] := 0.060;
//			MC_BR_Move6D_Acp6D_0.Position[2] := 0.001;
//			MC_BR_Move6D_Acp6D_0.Position[3] := 0;
//			MC_BR_Move6D_Acp6D_0.Position[4] := 0;
//			MC_BR_Move6D_Acp6D_0.Position[5] := -0.100;
//			MC_BR_Move6D_Acp6D_0.Execute := TRUE;
//			IF MC_BR_Move6D_Acp6D_0.Acknowledge THEN
//				MC_BR_Move6D_Acp6D_0.Execute := FALSE;
//				em.substate := 5100;
//			END_IF
//		
//		5100:
//			em.description := 'Move shuttles in X Y and RZ at the same time';
//			MC_BR_Move6D_Acp6D_0.Acceleration := 0.5;
//			MC_BR_Move6D_Acp6D_0.InPlaneVelocity := 0.1;
//			MC_BR_Move6D_Acp6D_0.ShuttleID := 1;
//			MC_BR_Move6D_Acp6D_0.ShortAxisVelocity[3] := 0.300;
//			MC_BR_Move6D_Acp6D_0.Position[0] := 0.060;
//			MC_BR_Move6D_Acp6D_0.Position[1] := 0.180;
//			MC_BR_Move6D_Acp6D_0.Position[2] := 0.001;
//			MC_BR_Move6D_Acp6D_0.Position[3] := 0;
//			MC_BR_Move6D_Acp6D_0.Position[4] := 0;
//			MC_BR_Move6D_Acp6D_0.Position[5] := 0.100;
//			MC_BR_Move6D_Acp6D_0.Execute := TRUE;
//			IF MC_BR_Move6D_Acp6D_0.Acknowledge THEN
//				MC_BR_Move6D_Acp6D_0.Execute := FALSE;
//				em.substate := 5105;
//			END_IF
//			
//		5105:
//			em.description := 'Move shuttles in X Y and RZ at the same time';
//			MC_BR_Move6D_Acp6D_0.Acceleration := 0.5;
//			MC_BR_Move6D_Acp6D_0.InPlaneVelocity := 0.12;
//			MC_BR_Move6D_Acp6D_0.ShuttleID := 1;
//			MC_BR_Move6D_Acp6D_0.ShortAxisVelocity[3] := 0.300;
//			MC_BR_Move6D_Acp6D_0.Position[0] := 0.060;
//			MC_BR_Move6D_Acp6D_0.Position[1] := 0.060;
//			MC_BR_Move6D_Acp6D_0.Position[2] := 0.001;
//			MC_BR_Move6D_Acp6D_0.Position[3] := 0;
//			MC_BR_Move6D_Acp6D_0.Position[4] := 0;
//			MC_BR_Move6D_Acp6D_0.Position[5] := 0.0;
//			MC_BR_Move6D_Acp6D_0.Execute := TRUE;
//			IF MC_BR_Move6D_Acp6D_0.Acknowledge THEN
//				MC_BR_Move6D_Acp6D_0.Execute := FALSE;
//				IF tempCounter >= 8 THEN
//					tempCounter := 0;
//					em.substate := 5110;
//				ELSE
//					em.substate := 5090;
//					tempCounter := tempCounter + 1;
//				END_IF
//			END_IF
//			
//		5110:
//			em.description := 'Decouple';
//			MC_BR_ShGroupCoupleCtrl_Acp6D_0.GroupID := 10;
//			MC_BR_ShGroupCoupleCtrl_Acp6D_0.CoupleMode := 0;
//			MC_BR_ShGroupCoupleCtrl_Acp6D_0.Option := 0; //Couple
//			MC_BR_ShGroupCoupleCtrl_Acp6D_0.Execute := TRUE;
//			IF MC_BR_ShGroupCoupleCtrl_Acp6D_0.Done THEN
//				MC_BR_ShGroupCoupleCtrl_Acp6D_0.Execute := FALSE;
//				em.substate := 5115;
//			END_IF
//		
//		5115:
//			em.description := 'Check shuttle 1 reach pos';
//			IF((gAcp6DCtrl.Status.ShuttleInfo[0].Position.X > 0.060 - MARGIN AND gAcp6DCtrl.Status.ShuttleInfo[0].Position.X < 0.060 + MARGIN) AND
//				gAcp6DCtrl.Status.ShuttleInfo[0].Position.Y > 0.060 - MARGIN AND gAcp6DCtrl.Status.ShuttleInfo[0].Position.Y < 0.060 + MARGIN) THEN
//				IF gAcp6DCtrl.Status.ShuttleInfo[0].State = mcACP6D_SH_STATE_IDLING THEN
//					MC_BR_ZoneGetStatus_Acp6D_0.Execute := FALSE;
//					em.substate := 5010;
//				END_IF
//			END_IF
//		
//		
//			
//		
	END_CASE
	
	TON_0();
			

END_ACTION
