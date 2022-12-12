ACTION conveyorStationSetup:
	// Setup
	// Reset all workstations
	FOR i := 0 TO NR_OF_WORKSTATIONS DO
		gWorkstations[i].par.xLocation										:= 0.0;
		gWorkstations[i].par.yLocation										:= 0.0;
		gWorkstations[i].par.nextStationSelector							:= '0';
		gWorkstations[i].par.processTime									:= 0;
		gWorkstations[i].par.pathRouting									:= 0;
		gWorkstations[i].par.ArcMovement									:= FALSE;
		gWorkstations[i].par.landBeforeProcess								:= FALSE;
	END_FOR
	
	gWorkstations[0].par.xLocation										:= 0.180;
	gWorkstations[0].par.yLocation										:= 0.060;
	gWorkstations[0].par.nextStationSelector							:= '1';
	gWorkstations[0].par.processTime									:= 1;
	gWorkstations[0].par.pathRouting									:= 1;
	gWorkstations[0].par.ArcMovement									:= FALSE;
	gWorkstations[0].par.landBeforeProcess								:= FALSE;
	
	gWorkstations[1].par.xLocation										:= 0.660;
	gWorkstations[1].par.yLocation										:= 0.060;
	gWorkstations[1].par.nextStationSelector							:= '3';
	gWorkstations[1].par.processTime									:= 2;
	gWorkstations[1].par.pathRouting									:= 2;
	gWorkstations[1].par.ArcMovement									:= FALSE;
	gWorkstations[1].par.landBeforeProcess								:= FALSE;
	
	//Not in use
	gWorkstations[2].par.xLocation										:= 0.000;
	gWorkstations[2].par.yLocation										:= 0.000;
	gWorkstations[2].par.nextStationSelector							:= '0';
	gWorkstations[2].par.processTime									:= 0;
	gWorkstations[2].par.pathRouting									:= 2;
	gWorkstations[2].par.ArcMovement									:= FALSE;
	gWorkstations[2].par.landBeforeProcess								:= FALSE;
	
	gWorkstations[3].par.xLocation										:= 0.660;
	gWorkstations[3].par.yLocation										:= 0.300;
	gWorkstations[3].par.nextStationSelector							:= '4';
	gWorkstations[3].par.processTime									:= 1;
	gWorkstations[3].par.pathRouting									:= 2;
	gWorkstations[3].par.ArcMovement									:= FALSE;
	gWorkstations[3].par.landBeforeProcess								:= FALSE;
	
	gWorkstations[4].par.xLocation										:= 0.540;
	gWorkstations[4].par.yLocation										:= 0.900;
	gWorkstations[4].par.nextStationSelector							:= '5';
	gWorkstations[4].par.processTime									:= 1;
	gWorkstations[4].par.pathRouting									:= 2;
	gWorkstations[4].par.ArcMovement									:= FALSE;
	gWorkstations[4].par.landBeforeProcess								:= FALSE;
	
	gWorkstations[5].par.xLocation										:= 0.420;
	gWorkstations[5].par.yLocation										:= 0.420;
	gWorkstations[5].par.nextStationSelector							:= '6';
	gWorkstations[5].par.processTime									:= 2;
	gWorkstations[5].par.pathRouting									:= 0;
	gWorkstations[5].par.ArcMovement									:= FALSE;
	gWorkstations[5].par.landBeforeProcess								:= FALSE;
	
	gWorkstations[6].par.xLocation										:= 0.060;
	gWorkstations[6].par.yLocation										:= 0.420;
	gWorkstations[6].par.nextStationSelector							:= '0';
	gWorkstations[6].par.processTime									:= 1;
	gWorkstations[6].par.pathRouting									:= 2;
	gWorkstations[6].par.ArcMovement									:= FALSE;
	gWorkstations[6].par.landBeforeProcess								:= FALSE;
	
	gWorkstations[7].par.xLocation										:= 0.300;
	gWorkstations[7].par.yLocation										:= 0.900;
	gWorkstations[7].par.nextStationSelector							:= '6';
	gWorkstations[7].par.processTime									:= 2;
	gWorkstations[7].par.pathRouting									:= 2;
	gWorkstations[7].par.ArcMovement									:= FALSE;
	gWorkstations[7].par.landBeforeProcess								:= FALSE;
	
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
		9000:
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
				em.substate := 9001;
			END_IF
			
		9001:
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
			MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[0].shuttleRef);;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := gWorkstations[0].par.xLocation;;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := gWorkstations[0].par.yLocation;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 0; //Y then X
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Mode := 0;
			MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
				MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				em.substate := 9002;
			END_IF
		
		9002:
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
			MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[2].shuttleRef);;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := gWorkstations[1].par.xLocation;;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := gWorkstations[1].par.yLocation;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 0; //Y then X
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Mode := 0;
			MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
				MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				em.substate := 9003;
			END_IF
			
		9003:
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
			MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[3].shuttleRef);;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := gWorkstations[3].par.xLocation;;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := gWorkstations[3].par.yLocation;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 0; //Y then X
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Mode := 0;
			MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
				MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				em.substate := 9004;
			END_IF
			
		9004:
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
			MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[4].shuttleRef);;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := gWorkstations[0].par.xLocation;;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := gWorkstations[0].par.yLocation;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 2; //Y then X
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Mode := 0;
			MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
				MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				em.substate := 9005;
			END_IF
			
		9005:
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
			MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[5].shuttleRef);;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := gWorkstations[0].par.xLocation;;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := gWorkstations[0].par.yLocation;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 2; //Y then X
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Mode := 0;
			MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
				MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				em.substate := 9006;
			END_IF
		
		9006:
		
			
	END_CASE

END_ACTION


ACTION conveyourStationMovement:
	// Setup
//	pWorkstation.MC_BR_MoveInPlane_Acp6D_0.Controller 					:= ADR(McAcp6DController);
//	pWorkstation.MC_BR_ShLevitation_Acp6D_0.Controller				:= ADR(McAcp6DController);
//	pWorkstation.MC_BR_MoveArcAngle_Acp6D_0.Controller					:= ADR(McAcp6DController);

	CASE cm.state OF
		// Display station at image
		//'<foreignObject x="20" y="20" width="300" height="300"><img src="Media/statusGreen.png" height="300" width="300"/>'
		//brsstrcat(ADR(showWorkStations),ADR('<foreingObject x="')); 
		//brdkStrCat(ADR(showWorkStations), ADR(testDraw));
		//brdkStrCat(ADR(showWorkStations),'<foreingObject x="');
		
		0:
			//Check what shuttle is on top of workstation
			FOR k := 0 TO NUM_SHUTTLES DO
				IF((gAcp6DCtrl.Status.ShuttleInfo[k].Position.X > pWorkstation.par.xLocation - MARGIN AND gAcp6DCtrl.Status.ShuttleInfo[k].Position.X < pWorkstation.par.xLocation + MARGIN) AND
					gAcp6DCtrl.Status.ShuttleInfo[k].Position.Y > pWorkstation.par.yLocation - MARGIN AND gAcp6DCtrl.Status.ShuttleInfo[k].Position.Y < pWorkstation.par.yLocation + MARGIN) THEN
					IF gAcp6DCtrl.Status.ShuttleInfo[k].State = mcACP6D_SH_STATE_IDLING THEN
						pWorkstation.par.tempShuttleID := k;
						IF pWorkstation.par.landBeforeProcess THEN
							cm.state := 10;
						ELSE
							cm.state := 20;
						END_IF
					END_IF
				END_IF
			END_FOR
			
		10:
			//Land shuttle if reguired
			IF gAcp6DCtrl.Status.ShuttleInfo[pWorkstation.par.tempShuttleID].State = mcACP6D_SH_STATE_IDLING THEN
				pWorkstation.MC_BR_ShLevitation_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[pWorkstation.par.tempShuttleID].shuttleRef);
				pWorkstation.MC_BR_ShLevitation_Acp6D_0.Parameters.Level := 0; //Land
				pWorkstation.MC_BR_ShLevitation_Acp6D_0.Parameters.Speed := 0;
				pWorkstation.MC_BR_ShLevitation_Acp6D_0.Execute := TRUE;
			END_IF
			IF pWorkstation.MC_BR_ShLevitation_Acp6D_0.Done THEN
				pWorkstation.MC_BR_ShLevitation_Acp6D_0.Execute := FALSE;
				cm.state := 20;
			END_IF
			
		20:
			//Simulate process TON timer
			pWorkstation.TON_0.PT := REAL_TO_TIME(pWorkstation.par.processTime*1000);
			pWorkstation.TON_0.IN := TRUE;
			IF pWorkstation.TON_0.Q THEN
				pWorkstation.TON_0.IN := FALSE;
				IF pWorkstation.par.landBeforeProcess THEN
					cm.state := 30;
				ELSE
					cm.state := 40;
				END_IF
			END_IF
			
		30:
			//Leviate shuttle if landed before process
			pWorkstation.MC_BR_ShLevitation_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[pWorkstation.par.tempShuttleID].shuttleRef);
			pWorkstation.MC_BR_ShLevitation_Acp6D_0.Parameters.Level := 1; //Leviate
			pWorkstation.MC_BR_ShLevitation_Acp6D_0.Parameters.Speed := 0;
			pWorkstation.MC_BR_ShLevitation_Acp6D_0.Execute := TRUE;
			IF pWorkstation.MC_BR_ShLevitation_Acp6D_0.Done THEN
				pWorkstation.MC_BR_ShLevitation_Acp6D_0.Execute := FALSE;
				cm.state := 40;
			END_IF
			
		40:
			//Move to next workstation
			IF pWorkstation.par.ArcMovement THEN
				pWorkstation.MC_BR_MoveArc_Acp6D_0.Parameters.Angular.Center.X := 0.240;
				pWorkstation.MC_BR_MoveArc_Acp6D_0.Parameters.Angular.Center.Y := 0.240;
				pWorkstation.MC_BR_MoveArc_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
				pWorkstation.MC_BR_MoveArc_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
				pWorkstation.MC_BR_MoveArc_Acp6D_0.Parameters.Angular.Angle := 6.28318531; //360 degrees
				pWorkstation.MC_BR_MoveArc_Acp6D_0.Parameters.Mode := 0;
				pWorkstation.MC_BR_MoveArc_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[pWorkstation.par.tempShuttleID].shuttleRef);
				pWorkstation.MC_BR_MoveArc_Acp6D_0.Execute := TRUE;
				IF pWorkstation.MC_BR_MoveArc_Acp6D_0.Acknowledge THEN
					pWorkstation.status.oneshot := FALSE;
					pWorkstation.MC_BR_MoveArc_Acp6D_0.Execute := FALSE;
					cm.state := 0;
				END_IF
			ELSE
				pWorkstation.MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[pWorkstation.par.tempShuttleID].shuttleRef);
				pWorkstation.MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
				pWorkstation.MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
				CASE i OF
					4:
						IF pWorkstation.workstationSwitcher THEN
							pWorkstation.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := gWorkstations[5].par.xLocation;
							pWorkstation.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := gWorkstations[5].par.yLocation;
							pWorkstation.workstationSwitcher := FALSE;
						ELSE
							pWorkstation.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := gWorkstations[7].par.xLocation;
							pWorkstation.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := gWorkstations[7].par.yLocation;
							pWorkstation.workstationSwitcher := TRUE;
						END_IF
					ELSE
						pWorkstation.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := gWorkstations[STRING_TO_UDINT(pWorkstation.par.nextStationSelector)].par.xLocation;
						pWorkstation.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := gWorkstations[STRING_TO_UDINT(pWorkstation.par.nextStationSelector)].par.yLocation;
				END_CASE
				pWorkstation.MC_BR_MoveInPlane_Acp6D_0.Parameters.Mode := 0; //Absolute
				pWorkstation.MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := pWorkstation.par.pathRouting; //0 Diagonal, 1 First X then Y, 2 First Y then X
				pWorkstation.MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
				IF pWorkstation.MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
					pWorkstation.status.oneshot := FALSE;
					pWorkstation.MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
					cm.state := 0;
				END_IF	
			END_IF
	END_CASE

	//Calls
	pWorkstation.MC_BR_MoveInPlane_Acp6D_0();
	pWorkstation.MC_BR_MoveArc_Acp6D_0();
	pWorkstation.MC_BR_ShLevitation_Acp6D_0();
	pWorkstation.TON_0();
	cm();

END_ACTION
