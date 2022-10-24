ACTION workStationSetup:
	// Setup
	// Reset all workstations
	FOR i := 0 TO NR_OF_WORKSTATIONS DO
		gWorkStations[0].par.xLocation										:= 0.0;
		gWorkStations[0].par.yLocation										:= 0.0;
		gWorkStations[0].par.nextStationSelector							:= '0';
		gWorkStations[0].par.processTime									:= 0;
		gWorkStations[0].par.pathRouting									:= 0;
		gWorkStations[0].par.ArcMovement									:= FALSE;
		gWorkStations[0].par.landBeforeProcess								:= FALSE;
	END_FOR
	
	gWorkStations[0].par.xLocation										:= 0.180;
	gWorkStations[0].par.yLocation										:= 0.060;
	gWorkStations[0].par.nextStationSelector							:= '1';
	gWorkStations[0].par.processTime									:= ConveyorMovementWorkstation1Time;
	gWorkStations[0].par.pathRouting									:= 1;
	gWorkStations[0].par.ArcMovement									:= FALSE;
	gWorkStations[0].par.landBeforeProcess								:= FALSE;
	
	gWorkStations[1].par.xLocation										:= 0.540;
	gWorkStations[1].par.yLocation										:= 0.060;
	gWorkStations[1].par.nextStationSelector							:= '3';
	gWorkStations[1].par.processTime									:= ConveyorMovementWorkstation2Time;
	gWorkStations[1].par.pathRouting									:= 2;
	gWorkStations[1].par.ArcMovement									:= FALSE;
	gWorkStations[1].par.landBeforeProcess								:= FALSE;
	
	gWorkStations[2].par.xLocation										:= 0.660;
	gWorkStations[2].par.yLocation										:= 0.060;
	gWorkStations[2].par.nextStationSelector							:= '3';
	gWorkStations[2].par.processTime									:= ConveyorMovementWorkstation2Time;
	gWorkStations[2].par.pathRouting									:= 2;
	gWorkStations[2].par.ArcMovement									:= FALSE;
	gWorkStations[2].par.landBeforeProcess								:= FALSE;
	
	gWorkStations[3].par.xLocation										:= 0.660;
	gWorkStations[3].par.yLocation										:= 0.300;
	gWorkStations[3].par.nextStationSelector							:= '4';
	gWorkStations[3].par.processTime									:= ConveyorMovementWorkstation1Time;
	gWorkStations[3].par.pathRouting									:= 2;
	gWorkStations[3].par.ArcMovement									:= FALSE;
	gWorkStations[3].par.landBeforeProcess								:= FALSE;
	
	gWorkStations[4].par.xLocation										:= 0.540;
	gWorkStations[4].par.yLocation										:= 0.900;
	gWorkStations[4].par.nextStationSelector							:= '5';
	gWorkStations[4].par.processTime									:= ConveyorMovementWorkstation1Time;
	gWorkStations[4].par.pathRouting									:= 2;
	gWorkStations[4].par.ArcMovement									:= FALSE;
	gWorkStations[4].par.landBeforeProcess								:= FALSE;
	
	gWorkStations[5].par.xLocation										:= 0.540;
	gWorkStations[5].par.yLocation										:= 0.420;
	gWorkStations[5].par.nextStationSelector							:= '6';
	gWorkStations[5].par.processTime									:= ConveyorMovementWorkstation1Time;
	gWorkStations[5].par.pathRouting									:= 0;
	gWorkStations[5].par.ArcMovement									:= FALSE;
	gWorkStations[5].par.landBeforeProcess								:= FALSE;
	
	gWorkStations[6].par.xLocation										:= 0.060;
	gWorkStations[6].par.yLocation										:= 0.420;
	gWorkStations[6].par.nextStationSelector							:= '0';
	gWorkStations[6].par.processTime									:= ConveyorMovementWorkstation1Time;
	gWorkStations[6].par.pathRouting									:= 2;
	gWorkStations[6].par.ArcMovement									:= FALSE;
	gWorkStations[6].par.landBeforeProcess								:= FALSE;
	
	gWorkStations[7].par.xLocation										:= 0.300;
	gWorkStations[7].par.yLocation										:= 0.900;
	gWorkStations[7].par.nextStationSelector							:= '6';
	gWorkStations[7].par.processTime									:= ConveyorMovementWorkstation1Time;
	gWorkStations[7].par.pathRouting									:= 2;
	gWorkStations[7].par.ArcMovement									:= FALSE;
	gWorkStations[7].par.landBeforeProcess								:= FALSE;
	
	
	positionContainerWorkstationMov[0].initXPos							:= 0.060;
	positionContainerWorkstationMov[0].initYPos							:= 0.060;
	positionContainerWorkstationMov[1].initXPos							:= 0.180;
	positionContainerWorkstationMov[1].initYPos							:= 0.060;
	positionContainerWorkstationMov[2].initXPos							:= 0.420;
	positionContainerWorkstationMov[2].initYPos							:= 0.060;
	positionContainerWorkstationMov[3].initXPos							:= 0.540;
	positionContainerWorkstationMov[3].initYPos							:= 0.300;
	
	positionContainerWorkstationMov[4].initXPos							:= 0.060;
	positionContainerWorkstationMov[4].initYPos							:= 0.180;
	positionContainerWorkstationMov[5].initXPos							:= 0.060;
	positionContainerWorkstationMov[5].initYPos							:= 0.300;
	positionContainerWorkstationMov[6].initXPos							:= 0.660;
	positionContainerWorkstationMov[6].initYPos							:= 0.300;
	positionContainerWorkstationMov[7].initXPos							:= 0.540;
	positionContainerWorkstationMov[7].initYPos							:= 0.900;

	CASE em.substate OF
		8000:
			em.description := 'Move shuttle to pre pos';
			tempShuttleCounter := 0;
			MC_BR_MoveInPlaneAsync_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
			MC_BR_MoveInPlaneAsync_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
			FOR i := 0 TO UINT_TO_USINT(localCurrentNumShuttles-1) DO
				MC_BR_MoveInPlaneAsync_Acp6D_0.Parameters.AsyncPar[i].Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[i].shuttleRef);
				MC_BR_MoveInPlaneAsync_Acp6D_0.Parameters.AsyncPar[i].X := positionContainerWorkstationMov[i].initXPos;
				MC_BR_MoveInPlaneAsync_Acp6D_0.Parameters.AsyncPar[i].Y := positionContainerWorkstationMov[i].initYPos;
			END_FOR
			MC_BR_MoveInPlaneAsync_Acp6D_0.Execute := TRUE;
			IF MC_BR_MoveInPlaneAsync_Acp6D_0.Acknowledge THEN
				MC_BR_MoveInPlaneAsync_Acp6D_0.Execute := FALSE;
				em.substate := 8001;
			END_IF
			
		8001:
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
			MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[0].shuttleRef);;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := gWorkStations[0].par.xLocation;;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := gWorkStations[0].par.yLocation;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 0; //Y then X
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Mode := 0;
			MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
				MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				em.substate := 8002;
			END_IF
		
		8002:
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
			MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[2].shuttleRef);;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := gWorkStations[1].par.xLocation;;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := gWorkStations[1].par.yLocation;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 0; //Y then X
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Mode := 0;
			MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
				MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				em.substate := 8003;
			END_IF
			
		8003:
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
			MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[3].shuttleRef);;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := gWorkStations[3].par.xLocation;;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := gWorkStations[3].par.yLocation;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 0; //Y then X
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Mode := 0;
			MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
				MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				em.substate := 8004;
			END_IF
			
		8004:
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
			MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[4].shuttleRef);;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := gWorkStations[0].par.xLocation;;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := gWorkStations[0].par.yLocation;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 2; //Y then X
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Mode := 0;
			MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
				MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				em.substate := 8005;
			END_IF
			
		8005:
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
			MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[5].shuttleRef);;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := gWorkStations[0].par.xLocation;;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := gWorkStations[0].par.yLocation;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 2; //Y then X
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Mode := 0;
			MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
				MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				em.substate := 8006;
			END_IF
		
		8006:
			// Change timer on the fly
			gWorkStations[0].par.processTime									:= ConveyorMovementWorkstation1Time;
			gWorkStations[1].par.processTime									:= ConveyorMovementWorkstation2Time;
			
	END_CASE
END_ACTION


ACTION workStationMovement: 

	CASE cm.state OF
		// Display station at image
		//'<foreignObject x="20" y="20" width="300" height="300"><img src="Media/statusGreen.png" height="300" width="300"/>'
		//brsstrcat(ADR(showWorkStations),ADR('<foreingObject x="')); 
		//brdkStrCat(ADR(showWorkStations), ADR(testDraw));
		//brdkStrCat(ADR(showWorkStations),'<foreingObject x="');
		
		0:
			//Check what shuttle is on top of workstation
			FOR k := 0 TO NUM_SHUTTLES DO
				IF((gAcp6DCtrl.Status.ShuttleInfo[k].Position.X > pWorkStations.par.xLocation - MARGIN AND gAcp6DCtrl.Status.ShuttleInfo[k].Position.X < pWorkStations.par.xLocation + MARGIN) AND
					gAcp6DCtrl.Status.ShuttleInfo[k].Position.Y > pWorkStations.par.yLocation - MARGIN AND gAcp6DCtrl.Status.ShuttleInfo[k].Position.Y < pWorkStations.par.yLocation + MARGIN) THEN
					IF gAcp6DCtrl.Status.ShuttleInfo[k].State = mcACP6D_SH_STATE_IDLING THEN
						pWorkStations.par.tempShuttleID := k;
						IF pWorkStations.par.landBeforeProcess THEN
							cm.state := 10;
						ELSE
							cm.state := 20;
						END_IF
					END_IF
				END_IF
			END_FOR
			
		10:
			//Land shuttle if reguired
			IF gAcp6DCtrl.Status.ShuttleInfo[pWorkStations.par.tempShuttleID].State = mcACP6D_SH_STATE_IDLING THEN
				pWorkStations.MC_BR_ShLevitation_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[pWorkStations.par.tempShuttleID].shuttleRef);
				pWorkStations.MC_BR_ShLevitation_Acp6D_0.Parameters.Level := 0; //Land
				pWorkStations.MC_BR_ShLevitation_Acp6D_0.Parameters.Speed := 10;
				pWorkStations.MC_BR_ShLevitation_Acp6D_0.Execute := TRUE;
			END_IF
			IF pWorkStations.MC_BR_ShLevitation_Acp6D_0.Done THEN
				pWorkStations.MC_BR_ShLevitation_Acp6D_0.Execute := FALSE;
				cm.state := 20;
			END_IF
				
		20:
			//Simulate process TON timer
			pWorkStations.TON_0.PT := REAL_TO_TIME(pWorkStations.par.processTime*1000);
			pWorkStations.TON_0.IN := TRUE;
			
			//Chooice which position shuttle stream to watch(Vision calc)
			CASE i OF
				3: shuttleToTakePictureOf := pWorkStations.par.tempShuttleID;
			END_CASE
						
			IF pWorkStations.TON_0.Q THEN
				pWorkStations.TON_0.IN := FALSE;
				IF pWorkStations.par.landBeforeProcess THEN
					cm.state := 30;
				ELSE
					cm.state := 40;
				END_IF
			END_IF
			
		30:
			//Leviate shuttle if landed before process
			pWorkStations.MC_BR_ShLevitation_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[pWorkStations.par.tempShuttleID].shuttleRef);
			pWorkStations.MC_BR_ShLevitation_Acp6D_0.Parameters.Level := 1; //Leviate
			pWorkStations.MC_BR_ShLevitation_Acp6D_0.Parameters.Speed := 10;
			pWorkStations.MC_BR_ShLevitation_Acp6D_0.Execute := TRUE;
			IF pWorkStations.MC_BR_ShLevitation_Acp6D_0.Done THEN
				pWorkStations.MC_BR_ShLevitation_Acp6D_0.Execute := FALSE;
				cm.state := 40;
			END_IF
			
		40:
			//Move to next workstation
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[pWorkStations.par.tempShuttleID].shuttleRef);
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := gWorkStations[STRING_TO_UDINT(pWorkStations.par.nextStationSelector)].par.xLocation;
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := gWorkStations[STRING_TO_UDINT(pWorkStations.par.nextStationSelector)].par.yLocation;
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Mode := 0; //Absolute
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := pWorkStations.par.pathRouting; //0 Diagonal, 1 First X then Y, 2 First Y then X
			CASE i OF
				0:
					IF pWorkStations.workstationSwitcher AND NOT pWorkStations.status.oneshot THEN
						pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := gWorkStations[STRING_TO_UDINT(pWorkStations.par.nextStationSelector)].par.xLocation;
						pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := gWorkStations[STRING_TO_UDINT(pWorkStations.par.nextStationSelector)].par.yLocation;
						pWorkStations.status.oneshot := TRUE;
						pWorkStations.workstationSwitcher := FALSE;
					ELSIF NOT pWorkStations.workstationSwitcher AND NOT pWorkStations.status.oneshot THEN
						pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := gWorkStations[STRING_TO_UDINT(pWorkStations.par.nextStationSelector)+1].par.xLocation;
						pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := gWorkStations[STRING_TO_UDINT(pWorkStations.par.nextStationSelector)+1].par.yLocation;
						pWorkStations.status.oneshot := TRUE;
						pWorkStations.workstationSwitcher := TRUE;
					END_IF
				
				4:
					IF pWorkStations.workstationSwitcher THEN
						pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := gWorkStations[5].par.xLocation;
						pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := gWorkStations[5].par.yLocation;
						pWorkStations.workstationSwitcher := FALSE;
					ELSE
						pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := gWorkStations[7].par.xLocation;
						pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := gWorkStations[7].par.yLocation;
						pWorkStations.workstationSwitcher := TRUE;
					END_IF
				
			END_CASE
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
				pWorkStations.status.oneshot := FALSE;
				pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				cm.state := 0;
			END_IF
	END_CASE

	//Calls
	pWorkStations.MC_BR_MoveInPlane_Acp6D_0();
	pWorkStations.MC_BR_ShLevitation_Acp6D_0();
	pWorkStations.TON_0();
	cm();

END_ACTION
