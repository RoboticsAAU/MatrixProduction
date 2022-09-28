
ACTION steelSheetTask: 
	positionContainerSteelSheet[0].initXPos := 0.300;
	positionContainerSteelSheet[0].initYPos := 0.060;
	positionContainerSteelSheet[1].initXPos := 0.420;
	positionContainerSteelSheet[1].initYPos := 0.060;
	positionContainerSteelSheet[2].initXPos := 0.540;
	positionContainerSteelSheet[2].initYPos := 0.060;
	positionContainerSteelSheet[3].initXPos := 0.660;
	positionContainerSteelSheet[3].initYPos := 0.060;
	
	positionContainerSteelSheet[4].initXPos := 0.780;
	positionContainerSteelSheet[4].initYPos := 0.900;
	positionContainerSteelSheet[5].initXPos := 0.900;
	positionContainerSteelSheet[5].initYPos := 0.900;
	positionContainerSteelSheet[6].initXPos := 0.780;
	positionContainerSteelSheet[6].initYPos := 0.780;
	positionContainerSteelSheet[7].initXPos := 0.900;
	positionContainerSteelSheet[7].initYPos := 0.780;
	positionContainerSteelSheet[8].initXPos := 0.780;
	positionContainerSteelSheet[8].initYPos := 0.660;
	positionContainerSteelSheet[9].initXPos := 0.900;
	positionContainerSteelSheet[9].initYPos := 0.660;
	
	gWorkStations[0].par.xLocation										:= 0.300;
	gWorkStations[0].par.yLocation										:= 0.060;
	gWorkStations[0].par.nextStationSelector							:= '0';
	gWorkStations[0].par.processTime									:= 0;
	gWorkStations[0].par.pathRouting									:= 0;
	gWorkStations[0].par.landBeforeProcess								:= FALSE;
	gWorkStations[0].par.ArcMovement									:= FALSE;
	
	gWorkStations[1].par.xLocation										:= 0.420;
	gWorkStations[1].par.yLocation										:= 0.060;
	gWorkStations[1].par.nextStationSelector							:= '1';
	gWorkStations[1].par.processTime									:= 0;
	gWorkStations[1].par.pathRouting									:= 0;
	gWorkStations[1].par.landBeforeProcess								:= FALSE;
	gWorkStations[1].par.ArcMovement									:= FALSE;
	
	gWorkStations[2].par.xLocation										:= 0.540;
	gWorkStations[2].par.yLocation										:= 0.060;
	gWorkStations[2].par.nextStationSelector							:= '2';
	gWorkStations[2].par.processTime									:= 0;
	gWorkStations[2].par.pathRouting									:= 0;
	gWorkStations[2].par.landBeforeProcess								:= FALSE;
	gWorkStations[2].par.ArcMovement									:= FALSE;
	
	gWorkStations[3].par.xLocation										:= 0.660;
	gWorkStations[3].par.yLocation										:= 0.060;
	gWorkStations[3].par.nextStationSelector							:= '3';
	gWorkStations[3].par.processTime									:= 0;
	gWorkStations[3].par.pathRouting									:= 0;
	gWorkStations[3].par.landBeforeProcess								:= FALSE;
	gWorkStations[3].par.ArcMovement									:= FALSE;
	
	CASE em.substate OF 
		15000:
			em.description := 'Move shuttle to pre pos';
			tempShuttleCounter := 0;
			MC_BR_MoveInPlaneAsync_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
			MC_BR_MoveInPlaneAsync_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
			FOR i := 0 TO UINT_TO_USINT(localCurrentNumShuttles-1) DO
				MC_BR_MoveInPlaneAsync_Acp6D_0.Parameters.AsyncPar[i].Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[i].shuttleRef);
				MC_BR_MoveInPlaneAsync_Acp6D_0.Parameters.AsyncPar[i].X := positionContainerSteelSheet[i].initXPos;
				MC_BR_MoveInPlaneAsync_Acp6D_0.Parameters.AsyncPar[i].Y := positionContainerSteelSheet[i].initYPos;
			END_FOR
			MC_BR_MoveInPlaneAsync_Acp6D_0.Execute := TRUE;
			IF MC_BR_MoveInPlaneAsync_Acp6D_0.Acknowledge THEN
				MC_BR_MoveInPlaneAsync_Acp6D_0.Execute := FALSE;
				em.substate := 15010;
			END_IF
		
		15010:
			em.description := 'Shuttle moves at a higher levitation hight';
			
	END_CASE

END_ACTION

ACTION steelSheetStation:
	CASE cm.state OF
		0:
			//Check what shuttle is on top of workstation
			FOR k := 0 TO NUM_SHUTTLES DO
				IF((gAcp6DCtrl.Status.ShuttleInfo[k].Position.X > pWorkStations.par.xLocation - MARGIN AND gAcp6DCtrl.Status.ShuttleInfo[k].Position.X < pWorkStations.par.xLocation + MARGIN) AND
					gAcp6DCtrl.Status.ShuttleInfo[k].Position.Y > pWorkStations.par.yLocation - MARGIN AND gAcp6DCtrl.Status.ShuttleInfo[k].Position.Y < pWorkStations.par.yLocation + MARGIN) THEN
					IF gAcp6DCtrl.Status.ShuttleInfo[k].State = mcACP6D_SH_STATE_IDLING THEN
						pWorkStations.par.tempShuttleID := k;
						cm.state := 10;
					END_IF
				END_IF
			END_FOR
			
		10:
			pWorkStations.MC_BR_Move6D_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[pWorkStations.par.tempShuttleID].shuttleRef);
			pWorkStations.MC_BR_Move6D_Acp6D_0.Parameters.InPlane.Velocity := 0.1;
			pWorkStations.MC_BR_Move6D_Acp6D_0.Parameters.InPlane.Acceleration := 0.1;
			pWorkStations.MC_BR_Move6D_Acp6D_0.Parameters.InPlane.Position.X := pWorkStations.par.xLocation;
			pWorkStations.MC_BR_Move6D_Acp6D_0.Parameters.InPlane.Position.Y := 0.180;
			pWorkStations.MC_BR_Move6D_Acp6D_0.Parameters.ShortAxis.Position.Z := steelSheetFlyingHeight;
			pWorkStations.MC_BR_Move6D_Acp6D_0.Parameters.ShortAxis.Position.Rx := 0;
			pWorkStations.MC_BR_Move6D_Acp6D_0.Parameters.ShortAxis.Position.Ry := 0;
			pWorkStations.MC_BR_Move6D_Acp6D_0.Parameters.ShortAxis.Position.Rz := 0;
			pWorkStations.MC_BR_Move6D_Acp6D_0.Execute := TRUE;
			IF pWorkStations.MC_BR_Move6D_Acp6D_0.Done THEN
				pWorkStations.MC_BR_Move6D_Acp6D_0.Execute := FALSE;
				cm.state := 30;
			END_IF
			
		30:
			pWorkStations.MC_BR_Move6D_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[pWorkStations.par.tempShuttleID].shuttleRef);
			pWorkStations.MC_BR_Move6D_Acp6D_0.Parameters.InPlane.Velocity := 0.1;
			pWorkStations.MC_BR_Move6D_Acp6D_0.Parameters.InPlane.Acceleration := 0.1;
			pWorkStations.MC_BR_Move6D_Acp6D_0.Parameters.InPlane.Position.X := pWorkStations.par.xLocation;
			pWorkStations.MC_BR_Move6D_Acp6D_0.Parameters.InPlane.Position.Y := 0.060;
			pWorkStations.MC_BR_Move6D_Acp6D_0.Parameters.ShortAxis.Position.Rx := 0;
			pWorkStations.MC_BR_Move6D_Acp6D_0.Parameters.ShortAxis.Position.Ry := 0;
			pWorkStations.MC_BR_Move6D_Acp6D_0.Parameters.ShortAxis.Position.Rz := 0;
			pWorkStations.MC_BR_Move6D_Acp6D_0.Parameters.ShortAxis.Position.Z := steelSheetFlyingHeight;
			pWorkStations.MC_BR_Move6D_Acp6D_0.Execute := TRUE;
			IF pWorkStations.MC_BR_Move6D_Acp6D_0.Done THEN
				pWorkStations.MC_BR_Move6D_Acp6D_0.Execute := FALSE;
				cm.state := 0;
			END_IF
			
	END_CASE

	//Calls
	pWorkStations.MC_BR_MoveInPlane_Acp6D_0();
	pWorkStations.MC_BR_MoveArc_Acp6D_0();
	pWorkStations.MC_BR_Move6D_Acp6D_0();
	pWorkStations.MC_BR_ShLevitation_Acp6D_0();
	pWorkStations.MC_BR_RotaryMotion_Acp6D_0();
	pWorkStations.MC_BR_RotaryMotionSpin_Acp6D_0();
	pWorkStations.TON_0();
	cm();
	
END_ACTION
