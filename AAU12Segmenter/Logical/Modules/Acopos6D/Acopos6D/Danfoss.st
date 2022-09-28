
ACTION danfossAction:
	//Setup
	positionDanfoss[0].initXPos											:= 0.430;
	positionDanfoss[0].initYPos											:= 0.420;
	positionDanfoss[1].initXPos											:= 0.420;
	positionDanfoss[1].initYPos											:= 0.300;
	positionDanfoss[2].initXPos											:= 0.430;
	positionDanfoss[2].initYPos											:= 0.180;
	positionDanfoss[3].initXPos											:= 0.420;
	positionDanfoss[3].initYPos											:= 0.060;
	
	gWorkStations[0].par.xLocation										:= 0.430;
	gWorkStations[0].par.yLocation										:= 0.180;
	gWorkStations[0].par.nextStationSelector							:= '1';
	gWorkStations[0].par.processTime									:= danfossWorkStation1Timer;
	gWorkStations[0].par.pathRouting									:= 1;
	gWorkStations[0].par.ArcMovement									:= FALSE;
	gWorkStations[0].par.landBeforeProcess								:= TRUE;
	gWorkStations[0].par.internalCounter								:= danfossWorkStation1NUMRotations;
	
	gWorkStations[1].par.xLocation										:= 0.430;
	gWorkStations[1].par.yLocation										:= 0.420;
	gWorkStations[1].par.nextStationSelector							:= '0';
	gWorkStations[1].par.processTime									:= danfossWorkStation2Timer;
	gWorkStations[1].par.pathRouting									:= 2;
	gWorkStations[1].par.ArcMovement									:= FALSE;
	gWorkStations[1].par.landBeforeProcess								:= TRUE;
	gWorkStations[1].par.internalCounter								:= danfossWorkStation2NUMRotations;
	
	gWorkStations[2].par.xLocation										:= 0.000;
	gWorkStations[2].par.yLocation										:= 0.000;
	gWorkStations[2].par.nextStationSelector							:= '0';
	gWorkStations[2].par.processTime									:= 0;
	gWorkStations[2].par.pathRouting									:= 0;
	gWorkStations[2].par.ArcMovement									:= FALSE;
	
	gWorkStations[3].par.xLocation										:= 0.000;
	gWorkStations[3].par.yLocation										:= 0.000;
	gWorkStations[3].par.nextStationSelector							:= '0';
	gWorkStations[3].par.processTime									:= 0;
	gWorkStations[3].par.pathRouting									:= 0;
	gWorkStations[3].par.ArcMovement									:= FALSE;
	
	//Setup WorkStations
	CASE em.substate OF 
		10000:
			em.description := 'Move shuttle to pre pos';
			gWorkStations[1].status.oneshot := TRUE;
			tempShuttleCounter := 0;
			MC_BR_MoveInPlaneAsync_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
			MC_BR_MoveInPlaneAsync_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
			FOR i := 0 TO NUM_SHUTTLES DO
				MC_BR_MoveInPlaneAsync_Acp6D_0.Parameters.AsyncPar[i].Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[i].shuttleRef);
				MC_BR_MoveInPlaneAsync_Acp6D_0.Parameters.AsyncPar[i].X := positionDanfoss[i].initXPos;
				MC_BR_MoveInPlaneAsync_Acp6D_0.Parameters.AsyncPar[i].Y := positionDanfoss[i].initYPos;
			END_FOR;
			MC_BR_MoveInPlaneAsync_Acp6D_0.Execute := TRUE;
			IF MC_BR_MoveInPlaneAsync_Acp6D_0.Acknowledge THEN
				MC_BR_MoveInPlaneAsync_Acp6D_0.Execute := FALSE;
				em.substate := 10010;
			END_IF
			
		10010:
			em.description := 'Move shuttle 2 towards workstation 2';
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
			MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[1].shuttleRef);
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := 0.420;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := 0.420;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 0; 
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Mode := 0;
			MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
				MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				em.substate := 10015;
			END_IF
			
		10015:
			em.description := 'Move shuttle 2 towards workstation 2';
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
			MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[1].shuttleRef);
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := 0.430;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := 0.420;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 0; 
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Mode := 0;
			MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
				MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				em.substate := 10020;
			END_IF
			
		10020:
			em.description := 'Move Shuttle 4 towards workstation 2';
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
			MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[3].shuttleRef);
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := 0.420;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := 0.180;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 0; 
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Mode := 0;
			MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
				MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				em.substate := 10025;
			END_IF
			
		10025:
			em.description := 'Move Shuttle 4 towards workstation 2';
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
			MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[3].shuttleRef);
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := 0.430;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := 0.180;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 0; 
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Mode := 0;
			MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
				MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				em.substate := 10030;
			END_IF
		
		10030:
			em.description := 'Shuttle now move with the help of DanFossWork Task';
	END_CASE
	

END_ACTION

ACTION DanFossWork:
	// Setup

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
			pWorkStations.MC_BR_ShLevitation_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[pWorkStations.par.tempShuttleID].shuttleRef);
			pWorkStations.MC_BR_ShLevitation_Acp6D_0.Parameters.Level := 0; //Land
			pWorkStations.MC_BR_ShLevitation_Acp6D_0.Parameters.Speed := REAL_TO_USINT(gAcp6DCtrl.Par.Velocity);
			pWorkStations.MC_BR_ShLevitation_Acp6D_0.Execute := TRUE;
			IF pWorkStations.MC_BR_ShLevitation_Acp6D_0.Done THEN
				pWorkStations.MC_BR_ShLevitation_Acp6D_0.Execute := FALSE;
				cm.state := 20;
			END_IF
			
		20:
			//Simulate process TON timer
			IF pWorkStations.status.oneshot THEN
				pWorkStations.TON_0.PT := REAL_TO_TIME(pWorkStations.par.processTime*1000/2);
			ELSE
				pWorkStations.TON_0.PT := REAL_TO_TIME(pWorkStations.par.processTime*1000);
			END_IF
			
			pWorkStations.TON_0.IN := TRUE;
						
			IF pWorkStations.TON_0.Q THEN
				pWorkStations.TON_0.IN := FALSE;
				pWorkStations.status.oneshot := FALSE;
				IF pWorkStations.par.landBeforeProcess THEN
					cm.state := 30;
				ELSE
					cm.state := 40;
				END_IF
			END_IF
			
		30:
			//Leviate shuttle if landed before process
			pWorkStations.MC_BR_ShLevitation_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[pWorkStations.par.tempShuttleID].shuttleRef);
			pWorkStations.MC_BR_ShLevitation_Acp6D_0.Parameters.Level := 1; //Land
			pWorkStations.MC_BR_ShLevitation_Acp6D_0.Parameters.Speed := REAL_TO_USINT(gAcp6DCtrl.Par.Velocity);
			pWorkStations.MC_BR_ShLevitation_Acp6D_0.Execute := TRUE;
			IF pWorkStations.MC_BR_ShLevitation_Acp6D_0.Done THEN
				pWorkStations.MC_BR_ShLevitation_Acp6D_0.Execute := FALSE;
				cm.state := 20;
			END_IF
			
		40:
		//Move to fastLane X numbers of times and return
			IF pWorkStations.par.tempCounter >= pWorkStations.par.internalCounter THEN
				cm.state := 200;
			ELSE
				cm.state := 50;
			END_IF
		
		50:
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[pWorkStations.par.tempShuttleID].shuttleRef);
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;

			CASE i OF
				0:
					pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := 0.300;
					pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := 0.180;
					IF pWorkStations.par.tempCounter > 0 THEN
						pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.EndVelocity := gAcp6DCtrl.Par.Velocity;
					ELSE
						pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.EndVelocity := 0;
					END_IF
					
				1:
					pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := 0.300;
					pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := 0.420;
					IF pWorkStations.par.tempCounter > 0 THEN
						pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.EndVelocity := 0;
					ELSE
						pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.EndVelocity := gAcp6DCtrl.Par.Velocity;
					END_IF
			END_CASE
			
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Mode := 0; //Absolute
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 0; //0 Diagonal, 1 First X then Y, 2 First Y then X
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
				pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				IF i = 0 THEN
					cm.state := 55;
				ELSE
					cm.state := 60;
				END_IF
			END_IF
			
		55:
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[pWorkStations.par.tempShuttleID].shuttleRef);
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.EndVelocity := 0;
			
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := 0.300;
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := 0.415;
			
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Mode := 0; //Absolute
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 0; //0 Diagonal, 1 First X then Y, 2 First Y then X
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
				pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				cm.state := 60;
			END_IF
			
		
		60:
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[pWorkStations.par.tempShuttleID].shuttleRef);pWorkStations.par.tempShuttleID;
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.EndVelocity := 0;
			
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := 0.060;
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := 0.420;
			
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Mode := 0; //Absolute
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 0; //0 Diagonal, 1 First X then Y, 2 First Y then X
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
				pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				cm.state := 70;
			END_IF
		
		70:
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[pWorkStations.par.tempShuttleID].shuttleRef);
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.EndVelocity := 0;
		
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := 0.300;
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := 0.060;
			
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Mode := 0; //Absolute
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 2; //0 Diagonal, 1 First X then Y, 2 First Y then X
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
				pWorkStations.status.oneshot := FALSE;
				pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				cm.state := 80;
			END_IF
		
		80:
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[pWorkStations.par.tempShuttleID].shuttleRef);
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
			CASE i OF
				0:
					pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := 0.300;
					pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := 0.060;
					IF pWorkStations.par.tempCounter+1 >= pWorkStations.par.internalCounter THEN
						pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.EndVelocity := 0.5;
					ELSE
						pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.EndVelocity := 0;
					END_IF
					
				1:
					pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := 0.300;
					pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := 0.300;
					IF pWorkStations.par.tempCounter+1 >= pWorkStations.par.internalCounter THEN
						pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.EndVelocity := 0;
					ELSE
						pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.EndVelocity := 0.5;
					END_IF
			END_CASE
			
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Mode := 0; //Absolute
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 0; //0 Diagonal, 1 First X then Y, 2 First Y then X
			
//			IF pWorkStations.par.tempCounter+1 >= pWorkStations.par.internalCounter THEN
//				pWorkStations.MC_BR_MoveInPlane_Acp6D_0.EndVelocity := 0;
//			ELSE
//				pWorkStations.MC_BR_MoveInPlane_Acp6D_0.EndVelocity := 0.5;
//			END_IF
			
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
				pWorkStations.status.oneshot := FALSE;
				pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				pWorkStations.par.tempCounter := pWorkStations.par.tempCounter + 1;
				cm.state := 40;
			END_IF
		
		200:
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[pWorkStations.par.tempShuttleID].shuttleRef);
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.EndVelocity := 0;
			CASE i OF
				0:
					pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := 0.420;
					pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := 0.060;
					
				1:
					pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := 0.420;
					pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := 0.300;
			END_CASE
			
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Mode := 0; //Absolute
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 1; //0 Diagonal, 1 First X then Y, 2 First Y then X
			//pWorkStations.MC_BR_MoveInPlane_Acp6D_0.EndVelocity := gAcp6DCtrl.Par.Velocity;
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
				pWorkStations.status.oneshot := FALSE;
				pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				cm.state := 210;
			END_IF
		
		210:
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[pWorkStations.par.tempShuttleID].shuttleRef);
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.EndVelocity := 0;
			CASE i OF
				0:
					pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := 0.420;
					pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := 0.180;
					
				1:
					pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := 0.420;
					pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := 0.420;
			END_CASE
			
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Mode := 0; //Absolute
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 1; //0 Diagonal, 1 First X then Y, 2 First Y then X
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.EndVelocity := 0;
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
				pWorkStations.status.oneshot := FALSE;
				pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				cm.state := 220;
			END_IF
		
		220:
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[pWorkStations.par.tempShuttleID].shuttleRef);
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.EndVelocity := 0;
			CASE i OF
				0:
					pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := 0.430;
					pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := 0.180;
					
				1:
					pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := 0.430;
					pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := 0.420;
			END_CASE
			
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Mode := 0; //Absolute
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 1; //0 Diagonal, 1 First X then Y, 2 First Y then X
			//pWorkStations.MC_BR_MoveInPlane_Acp6D_0.EndVelocity := gAcp6DCtrl.Par.Velocity;
			pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
				pWorkStations.status.oneshot := FALSE;
				pWorkStations.MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				pWorkStations.par.tempCounter := 0;
				cm.state := 0;
			END_IF
			
	END_CASE

	//Calls
	pWorkStations.MC_BR_MoveInPlane_Acp6D_0();
	pWorkStations.MC_BR_ShLevitation_Acp6D_0();
	pWorkStations.TON_0();
	cm();

END_ACTION

