
ACTION VisionMovement: 
	//Setup
//	MC_BR_ConfigReadCyclicCh_Acp6D_0.Controller := ADR(McAcp6DController);
//	FOR k := 0 TO NUM_SHUTTLES DO
//		MC_BR_ReadCyclicChAxis_Acp6D_0[0,k].Controller := ADR(McAcp6DController);
//		MC_BR_ReadCyclicChAxis_Acp6D_0[1,k].Controller := ADR(McAcp6DController);
//	END_FOR
//	
	MC_BR_ReadCyclicPosition_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[0].shuttleRef);
	//MC_BR_ReadCyclicPosition_Acp6D_0.Enable := TRUE;
	MC_BR_ReadCyclicPosition_Acp6D_1.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[1].shuttleRef);
	//MC_BR_ReadCyclicPosition_Acp6D_1.Enable := TRUE;
	MC_BR_ReadCyclicPosition_Acp6D_2.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[2].shuttleRef);
	//MC_BR_ReadCyclicPosition_Acp6D_2.Enable := TRUE;
	MC_BR_ReadCyclicPosition_Acp6D_3.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[3].shuttleRef);
	//MC_BR_ReadCyclicPosition_Acp6D_3.Enable := TRUE;

	positionContainerVisionMovement[0].initXPos := 0.420;
	positionContainerVisionMovement[0].initYPos := 0.060;
	positionContainerVisionMovement[1].initXPos := 0.420;
	positionContainerVisionMovement[1].initYPos := 0.180;
	positionContainerVisionMovement[2].initXPos := 0.420;
	positionContainerVisionMovement[2].initYPos := 0.300;
	positionContainerVisionMovement[3].initXPos := 0.420;
	positionContainerVisionMovement[3].initYPos := 0.420;
	
	positionContainerVisionMovement[4].initXPos := 0.780;
	positionContainerVisionMovement[4].initYPos := 0.900;
	positionContainerVisionMovement[5].initXPos := 0.900;
	positionContainerVisionMovement[5].initYPos := 0.900;
	positionContainerVisionMovement[6].initXPos := 0.780;
	positionContainerVisionMovement[6].initYPos := 0.780;
	positionContainerVisionMovement[7].initXPos := 0.900;
	positionContainerVisionMovement[7].initYPos := 0.780;
	positionContainerVisionMovement[8].initXPos := 0.780;
	positionContainerVisionMovement[8].initYPos := 0.660;
	positionContainerVisionMovement[9].initXPos := 0.900;
	positionContainerVisionMovement[9].initYPos := 0.660;
	
	gWorkStations[0].par.xLocation										:= 0.000;
	gWorkStations[0].par.yLocation										:= 0.000;
	gWorkStations[0].par.nextStationSelector							:= '0';
	gWorkStations[0].par.processTime									:= 0;
	gWorkStations[0].par.pathRouting									:= 0;
	gWorkStations[0].par.ArcMovement									:= FALSE;
	
	gWorkStations[1].par.xLocation										:= 0.000;
	gWorkStations[1].par.yLocation										:= 0.000;
	gWorkStations[1].par.nextStationSelector							:= '0';
	gWorkStations[1].par.processTime									:= 0;
	gWorkStations[1].par.pathRouting									:= 0;
	gWorkStations[1].par.ArcMovement									:= FALSE;
	
	gWorkStations[2].par.xLocation										:= 0.060;
	gWorkStations[2].par.yLocation										:= 0.060;
	gWorkStations[2].par.nextStationSelector							:= '3';
	gWorkStations[2].par.processTime									:= 0;
	gWorkStations[2].par.pathRouting									:= 1;
	gWorkStations[2].par.ArcMovement									:= FALSE;
			
	gWorkStations[3].par.xLocation										:= 0.420;
	gWorkStations[3].par.yLocation										:= 0.420;
	gWorkStations[3].par.nextStationSelector							:= '2';
	gWorkStations[3].par.processTime									:= 3;
	gWorkStations[3].par.pathRouting									:= 1;
	gWorkStations[3].par.ArcMovement									:= FALSE;
	
	//visionLightControl
	IF controlLight.visionProgram THEN
		visionLightTON.PT := t#10s;
		visionLightTON.IN := TRUE;
		IF visionLightTON.Q THEN
			IF visionFlipFlop THEN
				visionFlipFlop := FALSE;
			ELSE
				visionFlipFlop := TRUE;
			END_IF
			visionLightTON.IN := FALSE;
		END_IF
		IF visionFlipFlop THEN
			lightValue := 1;
		ELSE
			lightValue := 8;
		END_IF
	END_IF
	
	CASE em.substate OF
		1000:
			em.description := 'Move shuttle to pre pos';
			MC_BR_MoveInPlaneAsync_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
			MC_BR_MoveInPlaneAsync_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
			FOR i := 0 TO UINT_TO_USINT(localCurrentNumShuttles-1) DO
				MC_BR_MoveInPlaneAsync_Acp6D_0.Parameters.AsyncPar[i].Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[i].shuttleRef);
				MC_BR_MoveInPlaneAsync_Acp6D_0.Parameters.AsyncPar[i].X := positionContainerVisionMovement[i].initXPos;
				MC_BR_MoveInPlaneAsync_Acp6D_0.Parameters.AsyncPar[i].Y := positionContainerVisionMovement[i].initYPos;
			END_FOR
			MC_BR_MoveInPlaneAsync_Acp6D_0.Execute := TRUE;
			IF MC_BR_MoveInPlaneAsync_Acp6D_0.Done THEN
				MC_BR_MoveInPlaneAsync_Acp6D_0.Execute := FALSE;
				em.substate := 1010;
			END_IF
			
		1010:
			em.description := 'Move shuttles towards workstation 1';
			IF tempShuttleCounter > 3 THEN
				tempShuttleCounter := 0;
				em.substate := 1023;
			ELSE
				MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
				MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
				MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[tempShuttleCounter].shuttleRef);
				MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := 0.420;
				MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := 0.420;
				MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 1; //first x then y
				MC_BR_MoveInPlane_Acp6D_0.Parameters.Mode := 0;
				MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
				IF MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
					MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
					tempShuttleCounter := tempShuttleCounter + 1;
					em.substate := 1020;
				END_IF
			END_IF
			
		1020:
			em.description := 'DummyScan';
			em.substate := 1010;
			
		1021:
//			em.description := 'Setup Cyclic channel';
//			MC_BR_ConfigReadCyclicCh_Acp6D_0.NumberOfChannels := 8;
//			MC_BR_ConfigReadCyclicCh_Acp6D_0.ChannelID[0] := 1;
//			MC_BR_ConfigReadCyclicCh_Acp6D_0.ChannelID[1] := 2;
//			MC_BR_ConfigReadCyclicCh_Acp6D_0.ChannelID[2] := 3;
//			MC_BR_ConfigReadCyclicCh_Acp6D_0.ChannelID[3] := 4;
//			MC_BR_ConfigReadCyclicCh_Acp6D_0.ChannelID[4] := 5;
//			MC_BR_ConfigReadCyclicCh_Acp6D_0.ChannelID[5] := 6;
//			MC_BR_ConfigReadCyclicCh_Acp6D_0.ChannelID[6] := 7;
//			MC_BR_ConfigReadCyclicCh_Acp6D_0.ChannelID[7] := 8;
//			
//			MC_BR_ConfigReadCyclicCh_Acp6D_0.ShuttleID[0] := 1;
//			MC_BR_ConfigReadCyclicCh_Acp6D_0.ShuttleID[1] := 2;
//			MC_BR_ConfigReadCyclicCh_Acp6D_0.ShuttleID[2] := 3;
//			MC_BR_ConfigReadCyclicCh_Acp6D_0.ShuttleID[3] := 4;
//			MC_BR_ConfigReadCyclicCh_Acp6D_0.ShuttleID[4] := 1;
//			MC_BR_ConfigReadCyclicCh_Acp6D_0.ShuttleID[5] := 2;
//			MC_BR_ConfigReadCyclicCh_Acp6D_0.ShuttleID[6] := 3;
//			MC_BR_ConfigReadCyclicCh_Acp6D_0.ShuttleID[7] := 4;
//			
//			MC_BR_ConfigReadCyclicCh_Acp6D_0.FeedbackMode[0] := 0;
//			MC_BR_ConfigReadCyclicCh_Acp6D_0.FeedbackMode[1] := 0;
//			MC_BR_ConfigReadCyclicCh_Acp6D_0.FeedbackMode[2] := 0;
//			MC_BR_ConfigReadCyclicCh_Acp6D_0.FeedbackMode[3] := 0;
//			MC_BR_ConfigReadCyclicCh_Acp6D_0.FeedbackMode[4] := 0;
//			MC_BR_ConfigReadCyclicCh_Acp6D_0.FeedbackMode[5] := 0;
//			MC_BR_ConfigReadCyclicCh_Acp6D_0.FeedbackMode[6] := 0;
//			MC_BR_ConfigReadCyclicCh_Acp6D_0.FeedbackMode[7] := 0;
//			
//			MC_BR_ConfigReadCyclicCh_Acp6D_0.Execute := TRUE;
//			
//			IF MC_BR_ConfigReadCyclicCh_Acp6D_0.Done THEN
//				MC_BR_ConfigReadCyclicCh_Acp6D_0.Execute := FALSE;
//				tempCounter := 1;
//				em.substate := 1022;
//			END_IF
			
		1022:
			em.description := 'Turn on channelStreaming';
//			FOR k := 0 TO 1 DO
//				FOR j := 0 TO NUM_SHUTTLES DO 
//					MC_BR_ReadCyclicChAxis_Acp6D_0[k,j].AxisID := k+1;
//					MC_BR_ReadCyclicChAxis_Acp6D_0[k,j].ChannelID := tempCounter;
//					MC_BR_ReadCyclicChAxis_Acp6D_0[k,j].Enable := TRUE;
//					tempCounter := tempCounter + 1;
//				END_FOR
//			END_FOR
//			tempCounter := 1;
//			em.substate := 1023;
			
		1023:
			em.description := 'Check if camera has self adjusted';
			IF gVisionSensor[3].DAT.Focus > 0 AND gVisionSensor[3].DAT.Exposure > 0 THEN
				em.substate := 1030;
			ELSE
				em.substate := 1024;
			END_IF
			
		1024:
			em.description := 'Move shuttle to under camera before self adjust';
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
			MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[3].shuttleRef);
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := 0.180;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := 0.420;
			MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
				MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				em.substate := 1025;
			END_IF
			
		1025:
			em.description := 'Check pos reached';
			IF((gAcp6DCtrl.Status.ShuttleInfo[3].Position.X > 0.180 - MARGIN AND gAcp6DCtrl.Status.ShuttleInfo[3].Position.X < 0.180 + MARGIN) AND
				(gAcp6DCtrl.Status.ShuttleInfo[3].Position.Y > 0.420 - MARGIN AND gAcp6DCtrl.Status.ShuttleInfo[3].Position.Y < 0.420 + MARGIN)) THEN
				IF gAcp6DCtrl.Status.ShuttleInfo[3].State = mcACP6D_SH_STATE_IDLING THEN
					em.substate := 1026;
				END_IF
			END_IF
			
		1026:
			em.description := 'Fire autoSetup';
			gVisionSensor[3].CMD.AutoSetupStartStop := TRUE;
			em.substate := 1027;
			
		1027:
			em.description := 'Check when self calibration is done';
			IF NOT gVisionSensor[3].CMD.AutoSetupStartStop AND gVisionSensor[3].DAT.Focus > 0 AND gVisionSensor[3].DAT.Exposure > 0 THEN
				gVisionSensor[3].DAT.Exposure := 100; // known best camera value
				em.substate := 1028;
			END_IF
			
		1028:
			em.description := 'Move caliShuttle back';
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
			MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[3].shuttleRef);
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := 0.060;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := 0.060;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 1; //x then y
			MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
				MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				em.substate := 1030;
			END_IF
			
		1030:
			em.description := 'Move shuttle with workStationMovement task and count laps';
			
			
	END_CASE
	MC_BR_ReadCyclicPosition_Acp6D_0.Enable := FALSE;
	MC_BR_ReadCyclicPosition_Acp6D_1.Enable := FALSE;
	MC_BR_ReadCyclicPosition_Acp6D_2.Enable := FALSE;
	MC_BR_ReadCyclicPosition_Acp6D_3.Enable := FALSE;
	
	CASE shuttleToTakePictureOf OF
		0:
			ShuttleYPos_m := MC_BR_ReadCyclicPosition_Acp6D_0.CyclicPosition.X;
			MC_BR_ReadCyclicPosition_Acp6D_0.Enable := TRUE;
		1:
			ShuttleYPos_m := MC_BR_ReadCyclicPosition_Acp6D_1.CyclicPosition.X;
			MC_BR_ReadCyclicPosition_Acp6D_1.Enable := TRUE;
		2:
			ShuttleYPos_m := MC_BR_ReadCyclicPosition_Acp6D_2.CyclicPosition.X;
			MC_BR_ReadCyclicPosition_Acp6D_2.Enable := TRUE;
		3:
			ShuttleYPos_m := MC_BR_ReadCyclicPosition_Acp6D_3.CyclicPosition.X;
			MC_BR_ReadCyclicPosition_Acp6D_3.Enable := TRUE;
	END_CASE
		
	//ShuttleYPos_m := SEL(MC_BR_ReadCyclicChAxis_Acp6D_0[0,shuttleToTakePictureOf-1].Valid,0,MC_BR_ReadCyclicChAxis_Acp6D_0[0,shuttleToTakePictureOf-1].Value);
	
//	MC_BR_ConfigReadCyclicCh_Acp6D_0(Controller := ADR(McAcp6DController));
	
//	FOR k := 0 TO NUM_SHUTTLES DO
//		MC_BR_ReadCyclicChAxis_Acp6D_0[0,k](Controller := ADR(McAcp6DController));
//		MC_BR_ReadCyclicChAxis_Acp6D_0[1,k](Controller := ADR(McAcp6DController));
//	END_FOR
	
	visionLightTON();
			
END_ACTION
