
ACTION rotationTask:
	positionContainerRotation[0].initXPos := 0.180;
	positionContainerRotation[0].initYPos := 0.060;
	positionContainerRotation[1].initXPos := 0.060;
	positionContainerRotation[1].initYPos := 0.060;
	positionContainerRotation[2].initXPos := 0.060;
	positionContainerRotation[2].initYPos := 0.180;
	positionContainerRotation[3].initXPos := 0.180;
	positionContainerRotation[3].initYPos := 0.180;
	
	positionContainerRotation[4].initXPos := 0.120;
	positionContainerRotation[4].initYPos := 0.360;
	positionContainerRotation[5].initXPos := 0.360;
	positionContainerRotation[5].initYPos := 0.360;
	positionContainerRotation[6].initXPos := 0.600;
	positionContainerRotation[6].initYPos := 0.360;
	positionContainerRotation[7].initXPos := 0.600;
	positionContainerRotation[7].initYPos := 0.360;
	

	gWorkStations[0].par.xLocation										:= 0.180;
	gWorkStations[0].par.yLocation										:= 0.060;
	gWorkStations[0].par.nextStationSelector							:= '1';
	gWorkStations[0].par.processTime									:= 0;
	gWorkStations[0].par.pathRouting									:= 1;
	gWorkStations[0].par.landBeforeProcess								:= FALSE;
	gWorkStations[0].par.ArcMovement									:= FALSE;
	
	gWorkStations[1].par.xLocation										:= 0.060;
	gWorkStations[1].par.yLocation										:= 0.180;
	gWorkStations[1].par.nextStationSelector							:= '0';
	gWorkStations[1].par.processTime									:= WorkStation2And3MovementTimer;
	gWorkStations[1].par.pathRouting									:= 1;
	gWorkStations[1].par.landBeforeProcess								:= TRUE;
	gWorkStations[1].par.ArcMovement									:= FALSE;
	
	CASE em.substate OF 
		14000:
			em.description := 'Move shuttle to pre pos';
			tempShuttleCounter := 0;
			MC_BR_MoveInPlaneAsync_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
			MC_BR_MoveInPlaneAsync_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
			FOR i := 0 TO UINT_TO_USINT(localCurrentNumShuttles-1) DO
				MC_BR_MoveInPlaneAsync_Acp6D_0.Parameters.AsyncPar[i].Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[i].shuttleRef);
				MC_BR_MoveInPlaneAsync_Acp6D_0.Parameters.AsyncPar[i].X := positionContainerRotation[i].initXPos;
				MC_BR_MoveInPlaneAsync_Acp6D_0.Parameters.AsyncPar[i].Y := positionContainerRotation[i].initYPos;
			END_FOR
			MC_BR_MoveInPlaneAsync_Acp6D_0.Execute := TRUE;
			IF MC_BR_MoveInPlaneAsync_Acp6D_0.Done THEN
				MC_BR_MoveInPlaneAsync_Acp6D_0.Execute := FALSE;
				tempShuttleCounter := 4;
				em.substate := 14005;
			END_IF
			
		14005:
			em.description := 'Start rotation of shuttle 5-10';
			IF tempShuttleCounter > localCurrentNumShuttles-1 THEN
				tempShuttleCounter := 0;
				em.substate := 14010;
			ELSE
				MC_BR_RotaryMotionSpin_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[tempShuttleCounter].shuttleRef);
				MC_BR_RotaryMotionSpin_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.rotationAcceleration;
				MC_BR_RotaryMotionSpin_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.rotationVelocity;
				MC_BR_RotaryMotionSpin_Acp6D_0.Parameters.Duration := 1000;
				MC_BR_RotaryMotionSpin_Acp6D_0.Execute := TRUE;
				IF MC_BR_RotaryMotionSpin_Acp6D_0.Acknowledge THEN
					MC_BR_RotaryMotionSpin_Acp6D_0.Execute := FALSE;
					em.substate := 14006;
				END_IF
			END_IF
				
		14006:
			em.description := 'Dummy scan';
			TON_0.PT := t#2s;
			TON_0.IN := TRUE;
			IF TON_0.Q THEN
				TON_0.IN := FALSE;
				tempShuttleCounter := tempShuttleCounter + 1;
				em.substate := 14005;
			END_IF
						
		14010:
			em.description := 'Move shuttle 2 towards workstation 0';
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
			MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[1].shuttleRef);;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := gWorkStations[0].par.xLocation;;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := gWorkStations[0].par.yLocation;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 0; //direct
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Mode := 0;
			MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
				MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				em.substate := 14020;
			END_IF
		
		14020:
			em.description := 'Move shuttle 3 towards workstation 0';
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
			MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[2].shuttleRef);;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := gWorkStations[0].par.xLocation;;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := gWorkStations[0].par.yLocation;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 2; //Y then X
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Mode := 0;
			MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
				MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				em.substate := 14030;
			END_IF
		
		14030:
			em.description := 'Move shuttle 4 towards workstation 1';
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
			MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[3].shuttleRef);;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := 0.060;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := 0.180;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 0; //direct
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Mode := 0;
			MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
				MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				em.substate := 14040;
			END_IF
		
		14040:
			em.description := 'Move shuttle 4 towards workstation 1';
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
			MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[3].shuttleRef);;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := gWorkStations[0].par.xLocation;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := gWorkStations[0].par.yLocation;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 2; //direct
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Mode := 0;
			MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
				MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				em.substate := 14050;
			END_IF
		
		14050:
			IF em.status.parent.state <> STATE_EXECUTE THEN
				em.substate := 14060;
			END_IF
		
		14060:
			MC_BR_AsmStop_Acp6D_0.Execute := TRUE;
			IF MC_BR_AsmStop_Acp6D_0.Done THEN
				MC_BR_AsmStop_Acp6D_0.Execute := FALSE;
				em.substate := 14070;
			END_IF
		
		14070:
			// Wait for shuttles to settle after rotation
			TON_0.PT := t#2s;
			TON_0.IN := TRUE;
			IF TON_0.Q THEN
				TON_0.IN := FALSE;
				tempShuttleCounter := 4;
				em.substate := 14080;
			END_IF
		
		14080:
			em.description := 'Start rotation of shuttle 5-10';
			IF tempShuttleCounter > localCurrentNumShuttles-1 THEN
				tempShuttleCounter := 0;
				em.substate := 14100;
			ELSIF gAcp6DCtrl.Status.ShuttleInfo[tempShuttleCounter].State = mcACP6D_SH_STATE_IDLING THEN
				MC_BR_RotaryMotion_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[tempShuttleCounter].shuttleRef);
				MC_BR_RotaryMotion_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.rotationAcceleration;
				MC_BR_RotaryMotion_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.rotationVelocity;
				MC_BR_RotaryMotion_Acp6D_0.Parameters.Mode := mcACP6D_ROTATE_CLOCKWISE;
				MC_BR_RotaryMotion_Acp6D_0.Parameters.Angle := 0;
				MC_BR_RotaryMotion_Acp6D_0.Execute := TRUE;
				IF MC_BR_RotaryMotion_Acp6D_0.Done THEN
					MC_BR_RotaryMotion_Acp6D_0.Execute := FALSE;
					em.substate := 14090;
				END_IF
			END_IF
			
		14090:
			em.description := 'Dummyscan';
			tempShuttleCounter := tempShuttleCounter + 1;
			em.substate := 14080;
			
		14100:
			em.description := 'check all shuttles that is rotating to pos zero is done';
			FOR i := 4 TO NUM_SHUTTLES DO
				IF gAcp6DCtrl.Status.ShuttleInfo[i].State = mcACP6D_SH_STATE_IDLING THEN
				ELSE
					EXIT;
				END_IF
			END_FOR
			IF i > NUM_SHUTTLES THEN
				em.substate := 14110;
			END_IF
			
		14110:
			em.cmd.sc := TRUE;
				
	END_CASE
			
END_ACTION

ACTION rotationStation:
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
						cm.state := 10;
					END_IF
				END_IF
			END_FOR
			
		10:
			//Move first workstation
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[pWorkStations.par.tempShuttleID].shuttleRef);
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := 0.360;
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := 0.120;
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Mode := 0; //Absolute
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 1; //0 Diagonal, 1 First X then Y, 2 First Y then X
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Done THEN
				pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				cm.state := 20;
			END_IF
			
			
		20:
			//Rotate 90 degress
			em.cmd.sc := FALSE;
			pWorkStations.MC_BR_RotaryMotion_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[pWorkStations.par.tempShuttleID].shuttleRef);
			pWorkStations.MC_BR_RotaryMotion_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.rotationAcceleration;
			pWorkStations.MC_BR_RotaryMotion_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.rotationVelocity;
			pWorkStations.MC_BR_RotaryMotion_Acp6D_0.Parameters.Angle := 1.57079633; //90 degress
			pWorkStations.MC_BR_RotaryMotion_Acp6D_0.Parameters.Mode := 0;
			pWorkStations.MC_BR_RotaryMotion_Acp6D_0.Execute := TRUE;
			IF pWorkStations.MC_BR_RotaryMotion_Acp6D_0.Done THEN
				pWorkStations.MC_BR_RotaryMotion_Acp6D_0.Execute := FALSE;
				cm.state := 30;
			END_IF
			
		30:
			//Move
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[pWorkStations.par.tempShuttleID].shuttleRef);
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := 0.420;
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := 0.120;
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Mode := 0; //Absolute
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 1; //0 Diagonal, 1 First X then Y, 2 First Y then X
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
				pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				cm.state := 40;
			END_IF
			
		40:
			pWorkStations.TON_0.IN := TRUE;
			pWorkStations.TON_0.PT := t#1s;
			IF pWorkStations.TON_0.Q THEN
				pWorkStations.TON_0.IN := FALSE;
				cm.state := 50;
			END_IF
		
		50:
			//Move
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[pWorkStations.par.tempShuttleID].shuttleRef);
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := 0.360;
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := 0.120;
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Mode := 0; //Absolute
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 1; //0 Diagonal, 1 First X then Y, 2 First Y then X
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
				pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				cm.state := 60;
			END_IF
		
		60:
			//Rotate 90 degress
			em.cmd.sc := FALSE;
			pWorkStations.MC_BR_RotaryMotion_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[pWorkStations.par.tempShuttleID].shuttleRef);
			pWorkStations.MC_BR_RotaryMotion_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.rotationAcceleration;
			pWorkStations.MC_BR_RotaryMotion_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.rotationVelocity;
			pWorkStations.MC_BR_RotaryMotion_Acp6D_0.Parameters.Angle := 3.14159265; //180 degress
			pWorkStations.MC_BR_RotaryMotion_Acp6D_0.Parameters.Mode := 0;
			pWorkStations.MC_BR_RotaryMotion_Acp6D_0.Execute := TRUE;
			IF pWorkStations.MC_BR_RotaryMotion_Acp6D_0.Done THEN
				pWorkStations.MC_BR_RotaryMotion_Acp6D_0.Execute := FALSE;
				cm.state := 70;
			END_IF
		
		70:
			//Move
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[pWorkStations.par.tempShuttleID].shuttleRef);
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := 0.420;
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := 0.120;
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Mode := 0; //Absolute
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 1; //0 Diagonal, 1 First X then Y, 2 First Y then X
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
				pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				cm.state := 80;
			END_IF
			
		80:
			pWorkStations.TON_0.IN := TRUE;
			pWorkStations.TON_0.PT := t#1s;
			IF pWorkStations.TON_0.Q THEN
				pWorkStations.TON_0.IN := FALSE;
				cm.state := 90;
			END_IF
		
		90:
			//Move
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[pWorkStations.par.tempShuttleID].shuttleRef);
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := 0.360;
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := 0.120;
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Mode := 0; //Absolute
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 1; //0 Diagonal, 1 First X then Y, 2 First Y then X
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
				pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				cm.state := 100;
			END_IF
		
		100:
			//Rotate 90 degress
			em.cmd.sc := FALSE;
			pWorkStations.MC_BR_RotaryMotion_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[pWorkStations.par.tempShuttleID].shuttleRef);
			pWorkStations.MC_BR_RotaryMotion_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.rotationAcceleration;
			pWorkStations.MC_BR_RotaryMotion_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.rotationVelocity;
			pWorkStations.MC_BR_RotaryMotion_Acp6D_0.Parameters.Angle := 4.71238898; //270 degress
			pWorkStations.MC_BR_RotaryMotion_Acp6D_0.Parameters.Mode := 0;
			pWorkStations.MC_BR_RotaryMotion_Acp6D_0.Execute := TRUE;
			IF pWorkStations.MC_BR_RotaryMotion_Acp6D_0.Done THEN
				pWorkStations.MC_BR_RotaryMotion_Acp6D_0.Execute := FALSE;
				cm.state := 110;
			END_IF
		
		110:
			//Move
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[pWorkStations.par.tempShuttleID].shuttleRef);
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := 0.420;
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := 0.120;
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Mode := 0; //Absolute
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 1; //0 Diagonal, 1 First X then Y, 2 First Y then X
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
				pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				cm.state := 120;
			END_IF
			
		120:
			pWorkStations.TON_0.IN := TRUE;
			pWorkStations.TON_0.PT := t#1s;
			IF pWorkStations.TON_0.Q THEN
				pWorkStations.TON_0.IN := FALSE;
				cm.state := 130;
			END_IF
		
		130:
			//Move
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[pWorkStations.par.tempShuttleID].shuttleRef);
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := 0.360;
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := 0.120;
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Mode := 0; //Absolute
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 1; //0 Diagonal, 1 First X then Y, 2 First Y then X
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
				pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				cm.state := 140;
			END_IF
		
		140:
			//Rotate
			em.cmd.sc := FALSE;
			pWorkStations.MC_BR_RotaryMotion_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[pWorkStations.par.tempShuttleID].shuttleRef);
			pWorkStations.MC_BR_RotaryMotion_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.rotationAcceleration;
			pWorkStations.MC_BR_RotaryMotion_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.rotationVelocity; //RPM
			pWorkStations.MC_BR_RotaryMotion_Acp6D_0.Parameters.Angle := 0; //0 degress
			pWorkStations.MC_BR_RotaryMotion_Acp6D_0.Parameters.Mode := 1;
			pWorkStations.MC_BR_RotaryMotion_Acp6D_0.Execute := TRUE;
			IF pWorkStations.MC_BR_RotaryMotion_Acp6D_0.Done THEN
				pWorkStations.MC_BR_RotaryMotion_Acp6D_0.Execute := FALSE;
				cm.state := 150;
			END_IF
			
//		145:
//			em.cmd.sc := FALSE;
//			pWorkStations.MC_BR_RotaryMotionSpin_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[pWorkStations.par.tempShuttleID].shuttleRef);
//			pWorkStations.MC_BR_RotaryMotionSpin_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
//			pWorkStations.MC_BR_RotaryMotionSpin_Acp6D_0.Parameters.Velocity := 200; //RPM
//			pWorkStations.MC_BR_RotaryMotionSpin_Acp6D_0.Parameters.Duration := 5;
//			pWorkStations.MC_BR_RotaryMotionSpin_Acp6D_0.Execute := TRUE;
//			IF pWorkStations.MC_BR_RotaryMotionSpin_Acp6D_0.Done THEN
//				pWorkStations.MC_BR_RotaryMotionSpin_Acp6D_0.Execute := FALSE;
//				cm.state := 150;
//			END_IF			
		
		150:
			//Move
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[pWorkStations.par.tempShuttleID].shuttleRef);
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := 0.060;
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := 0.180;
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Mode := 0; //Absolute
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 2; //0 Diagonal, 1 First X then Y, 2 First Y then X
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
				pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				cm.state := 160;
			END_IF
		
		160:
			//Move
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[pWorkStations.par.tempShuttleID].shuttleRef);
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := gWorkStations[0].par.xLocation;
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := gWorkStations[0].par.yLocation;
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Mode := 0; //Absolute
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 2; //0 Diagonal, 1 First X then Y, 2 First Y then X
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
				pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				cm.state := 0;
			END_IF
		
		
	END_CASE

	//Calls
	pWorkStations.MC_BR_MoveInPlane_Acp6D_0();
	pWorkStations.MC_BR_MoveArc_Acp6D_0();
	pWorkStations.MC_BR_ShLevitation_Acp6D_0();
	pWorkStations.MC_BR_RotaryMotion_Acp6D_0();
	pWorkStations.MC_BR_RotaryMotionSpin_Acp6D_0();
	pWorkStations.TON_0();
	cm();
	
END_ACTION
	

	
