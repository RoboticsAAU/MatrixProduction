
ACTION boxProgramTask: 
	
//	positionContainerBoxProgram[0].initXPos := 0.060;
//	positionContainerBoxProgram[0].initYPos := 0.180;
//	positionContainerBoxProgram[1].initXPos := 0.180;
//	positionContainerBoxProgram[1].initYPos := 0.060;
//	positionContainerBoxProgram[2].initXPos := 0.420;
//	positionContainerBoxProgram[2].initYPos := 0.180;
//	positionContainerBoxProgram[3].initXPos := 0.420;
//	positionContainerBoxProgram[3].initYPos := 0.060;
	
	
	CASE em.substate OF 
		13000:
			em.description := 'Move shuttle to pre pos';
			positionContainerBoxProgram[0].initXPos := 0.060;
			positionContainerBoxProgram[0].initYPos := 0.180;
			positionContainerBoxProgram[1].initXPos := 0.180;
			positionContainerBoxProgram[1].initYPos := 0.060;
			positionContainerBoxProgram[2].initXPos := 0.540;
			positionContainerBoxProgram[2].initYPos := 0.540;
			positionContainerBoxProgram[3].initXPos := 0.660;
			positionContainerBoxProgram[3].initYPos := 0.540;
			
			positionContainerBoxProgram[4].initXPos := 0.540;
			positionContainerBoxProgram[4].initYPos := 0.900;
			positionContainerBoxProgram[5].initXPos := 0.660;
			positionContainerBoxProgram[5].initYPos := 0.900;
			positionContainerBoxProgram[6].initXPos := 0.540;
			positionContainerBoxProgram[6].initYPos := 0.780;
			positionContainerBoxProgram[7].initXPos := 0.660;
			positionContainerBoxProgram[7].initYPos := 0.780;
			
			tempShuttleCounter := 0;
			MC_BR_MoveInPlaneAsync_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
			MC_BR_MoveInPlaneAsync_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
			FOR i := 0 TO UINT_TO_USINT(localCurrentNumShuttles-1) DO
				MC_BR_MoveInPlaneAsync_Acp6D_0.Parameters.AsyncPar[i].Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[i].shuttleRef);
				MC_BR_MoveInPlaneAsync_Acp6D_0.Parameters.AsyncPar[i].X := positionContainerBoxProgram[i].initXPos;
				MC_BR_MoveInPlaneAsync_Acp6D_0.Parameters.AsyncPar[i].Y := positionContainerBoxProgram[i].initYPos;
			END_FOR
			MC_BR_MoveInPlaneAsync_Acp6D_0.Execute := TRUE;
			IF MC_BR_MoveInPlaneAsync_Acp6D_0.Acknowledge THEN
				cmdBoxProgram.LastTypeWasBox := TRUE;
				MC_BR_MoveInPlaneAsync_Acp6D_0.Execute := FALSE;
				em.substate := 13010;
			END_IF
		
		13010:
			em.description := 'Select size or start from HMI';
			IF cmdBoxProgram.smallBox OR cmdBoxProgram.bigBox THEN
				IF cmdBoxProgram.LastTypeWasBox THEN
					em.substate := 13020;
				ELSE
					em.substate := 13015;
				END_IF
			ELSIF cmdBoxProgram.bottle THEN
				IF cmdBoxProgram.LastTypeWasBox THEN
					em.substate := 13011;
				ELSE
					em.substate := 13030;
				END_IF
			END_IF
			
		13011:
			em.description := 'move shuttle away';
			MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[0].shuttleRef);
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := 0.300; // at 0.180 = 80mm on x box
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := 0.300; // at 0.060 = 80mm on y box
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Mode := 0;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 2; //Y then X
			MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF MC_BR_MoveInPlane_Acp6D_0.Done THEN
				MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				em.substate := 13012;
			END_IF
			
		13012:
			em.description := 'move shuttle 1 to correct pos';
			MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[1].shuttleRef);
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := 0.060; // at 0.180 = 80mm on x box
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := 0.060; // at 0.060 = 80mm on y box
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Mode := 0;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 0; //X then Y
			MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF MC_BR_MoveInPlane_Acp6D_0.Done THEN
				MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				cmdBoxProgram.LastTypeWasBox := FALSE;
				em.substate := 13010;
			END_IF
			
		13015:
			em.description := 'adjust shuttle to box';
			MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[1].shuttleRef);
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := 0.300; // at 0.180 = 80mm on x box
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := 0.060; // at 0.060 = 80mm on y box
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Mode := 0;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 0; //Y then X
			MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF MC_BR_MoveInPlane_Acp6D_0.Done THEN
				MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				em.substate := 13016;
			END_IF
			
		13016:
			em.description := 'adjust shuttle to box';
			MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[0].shuttleRef);
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := 0.060; // at 0.180 = 80mm on x box
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := 0.180; // at 0.060 = 80mm on y box
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Mode := 0;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 0; //Y then X
			MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF MC_BR_MoveInPlane_Acp6D_0.Done THEN
				MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				cmdBoxProgram.LastTypeWasBox := TRUE;
				em.substate := 13010;
			END_IF
			
		13020:
			IF cmdBoxProgram.smallBox THEN
				cmdBoxProgram.smallBox := FALSE;
				em.substate := 13100;
			ELSIF cmdBoxProgram.bigBox THEN
				cmdBoxProgram.bigBox := FALSE;
				em.substate := 13200;
			END_IF
			
		13030:
			em.description := 'which bottle?';
			IF cmdBoxProgram.bottle THEN
				cmdBoxProgram.bottle := FALSE;
				em.substate := 13250;
			END_IF	
			
		
		13100:
			em.description := 'adjust shuttle to small size box';
			MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[1].shuttleRef);
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := 0.2175; // at 0.180 = 80mm on x box
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := 0.084; // at 0.060 = 80mm on y box
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Mode := 0;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 0; //Y then X
			MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
				MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				em.substate := 13300;
			END_IF
		
		13200:
			em.description := 'adjust shuttle to big size box';
			MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[1].shuttleRef);
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := 0.229; // at 0.180 = 80mm on x box
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := 0.066; // at 0.060 = 80mm on y box
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Mode := 0;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 0; //Y then X
			MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
				MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				em.substate := 13300;
			END_IF
			
		13250:
			em.description := 'adjust shuttle to bottle';
			MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[0].shuttleRef);
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := 0.132; // at 0.180 = 80mm on x box
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := 0.181; // at 0.060 = 80mm on y box
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Mode := 0;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 0; //Y then X
			MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
				MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				em.substate := 13310;
			END_IF
		
		13300:
			em.description := 'start timer';
			TON_0.PT := t#3s;
			TON_0.IN := TRUE;
			IF TON_0.Q THEN
				TON_0.IN := FALSE;
				em.substate := 13330;
			END_IF
		
		13310:
			em.description := 'start timer';
			TON_0.PT := t#3s;
			TON_0.IN := TRUE;
			IF TON_0.Q THEN
				TON_0.IN := FALSE;
				em.substate := 13500;
			END_IF
		
		13330:
			em.description := 'Couple ShuttleGroup1_2';
			MC_BR_ShGroupCoupleCtrl_Acp6D_0.ShuttleGroup := shGroupShuttle1_2;
			MC_BR_ShGroupCoupleCtrl_Acp6D_0.Parameters.Mode := 1;
			MC_BR_ShGroupCoupleCtrl_Acp6D_0.Parameters.Option := 1; //Couple
			MC_BR_ShGroupCoupleCtrl_Acp6D_0.Execute := TRUE;
			IF MC_BR_ShGroupCoupleCtrl_Acp6D_0.Done THEN
				MC_BR_ShGroupCoupleCtrl_Acp6D_0.Execute := FALSE;
				em.substate := 13340;
			END_IF
		
		13340:
			em.description := 'Move box around';
			MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[0].shuttleRef);;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := 0.500;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := 0.420;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity := 1;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := 1;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 2; //Y then X
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Mode := 0;
			MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
				MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				em.substate := 13360;
			END_IF
			
		13360:
			MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[0].shuttleRef);;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := 0.060;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := 0.180;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity := 1;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := 1;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 2;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Mode := 0;
			MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
				MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				em.substate := 13400;
			END_IF
		
//		13350:
//			em.description := 'Move shuttles in X Y and RZ at the same time';
//			MC_BR_Move6D_Acp6D_0.Parameters.InPlane.Acceleration := 0.5;
//			MC_BR_Move6D_Acp6D_0.Parameters.InPlane.Velocity := 0.14;
//			MC_BR_Move6D_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[0].shuttleRef);
//			MC_BR_Move6D_Acp6D_0.Parameters.ShortAxis.Velocity.Rz := MC_BR_Move6D_Acp6D_0.Parameters.ShortAxis.Velocity.Ry := MC_BR_Move6D_Acp6D_0.Parameters.ShortAxis.Velocity.Rx := MC_BR_Move6D_Acp6D_0.Parameters.ShortAxis.Velocity.Z := 0.300;
//			MC_BR_Move6D_Acp6D_0.Parameters.InPlane.Position.X := 0.125;
//			MC_BR_Move6D_Acp6D_0.Parameters.InPlane.Position.Y := 0.180;
//			MC_BR_Move6D_Acp6D_0.Parameters.ShortAxis.Position.Z := 0.001;
//			MC_BR_Move6D_Acp6D_0.Parameters.ShortAxis.Position.Rx := 0;
//			MC_BR_Move6D_Acp6D_0.Parameters.ShortAxis.Position.Ry := 0;
//			MC_BR_Move6D_Acp6D_0.Parameters.ShortAxis.Position.Rz := 0.125;
//			MC_BR_Move6D_Acp6D_0.Execute := TRUE;
//			IF MC_BR_Move6D_Acp6D_0.Acknowledge THEN
//				MC_BR_Move6D_Acp6D_0.Execute := FALSE;
//				em.substate := 13360;
//			END_IF
//		
//		13360:
//			em.description := 'Move shuttles in X Y and RZ at the same time';
//			MC_BR_Move6D_Acp6D_0.Parameters.InPlane.Acceleration := 0.5;
//			MC_BR_Move6D_Acp6D_0.Parameters.InPlane.Velocity := 0.14;
//			MC_BR_Move6D_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[0].shuttleRef);
//			MC_BR_Move6D_Acp6D_0.Parameters.ShortAxis.Velocity.Rz := MC_BR_Move6D_Acp6D_0.Parameters.ShortAxis.Velocity.Ry := MC_BR_Move6D_Acp6D_0.Parameters.ShortAxis.Velocity.Rx := MC_BR_Move6D_Acp6D_0.Parameters.ShortAxis.Velocity.Z := 0.300;
//			MC_BR_Move6D_Acp6D_0.Parameters.InPlane.Position.X := 0.125;
//			MC_BR_Move6D_Acp6D_0.Parameters.InPlane.Position.Y := 0.180;
//			MC_BR_Move6D_Acp6D_0.Parameters.ShortAxis.Position.Z := 0.001;
//			MC_BR_Move6D_Acp6D_0.Parameters.ShortAxis.Position.Rx := 0;
//			MC_BR_Move6D_Acp6D_0.Parameters.ShortAxis.Position.Ry := 0;
//			MC_BR_Move6D_Acp6D_0.Parameters.ShortAxis.Position.Rz := -0.125;
//			MC_BR_Move6D_Acp6D_0.Execute := TRUE;
//			IF MC_BR_Move6D_Acp6D_0.Acknowledge THEN
//				MC_BR_Move6D_Acp6D_0.Execute := FALSE;
//				em.substate := 13370;
//			END_IF
//		
//		13370:
//			em.description := 'Move shuttles in X Y and RZ at the same time';
//			MC_BR_Move6D_Acp6D_0.Parameters.InPlane.Acceleration := 0.5;
//			MC_BR_Move6D_Acp6D_0.Parameters.InPlane.Velocity := 0.14;
//			MC_BR_Move6D_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[0].shuttleRef);
//			MC_BR_Move6D_Acp6D_0.Parameters.ShortAxis.Velocity.Rz := MC_BR_Move6D_Acp6D_0.Parameters.ShortAxis.Velocity.Ry := MC_BR_Move6D_Acp6D_0.Parameters.ShortAxis.Velocity.Rx := MC_BR_Move6D_Acp6D_0.Parameters.ShortAxis.Velocity.Z := 0.300;
//			MC_BR_Move6D_Acp6D_0.Parameters.InPlane.Position.X := 0.060;
//			MC_BR_Move6D_Acp6D_0.Parameters.InPlane.Position.Y := 0.180;
//			MC_BR_Move6D_Acp6D_0.Parameters.ShortAxis.Position.Z := 0.001;
//			MC_BR_Move6D_Acp6D_0.Parameters.ShortAxis.Position.Rx := 0;
//			MC_BR_Move6D_Acp6D_0.Parameters.ShortAxis.Position.Ry := 0;
//			MC_BR_Move6D_Acp6D_0.Parameters.ShortAxis.Position.Rz := 0.125;
//			MC_BR_Move6D_Acp6D_0.Execute := TRUE;
//			IF MC_BR_Move6D_Acp6D_0.Acknowledge THEN
//				MC_BR_Move6D_Acp6D_0.Execute := FALSE;
//				em.substate := 13380;
//			END_IF
//		
//		13380:
//			em.description := 'Move shuttles in X Y and RZ at the same time';
//			MC_BR_Move6D_Acp6D_0.Parameters.InPlane.Acceleration := 0.5;
//			MC_BR_Move6D_Acp6D_0.Parameters.InPlane.Velocity := 0.14;
//			MC_BR_Move6D_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[0].shuttleRef);
//			MC_BR_Move6D_Acp6D_0.Parameters.ShortAxis.Velocity.Rz := MC_BR_Move6D_Acp6D_0.Parameters.ShortAxis.Velocity.Ry := MC_BR_Move6D_Acp6D_0.Parameters.ShortAxis.Velocity.Rx := MC_BR_Move6D_Acp6D_0.Parameters.ShortAxis.Velocity.Z := 0.300;
//			MC_BR_Move6D_Acp6D_0.Parameters.InPlane.Position.X := 0.125;
//			MC_BR_Move6D_Acp6D_0.Parameters.InPlane.Position.Y := 0.180;
//			MC_BR_Move6D_Acp6D_0.Parameters.ShortAxis.Position.Z := 0.001;
//			MC_BR_Move6D_Acp6D_0.Parameters.ShortAxis.Position.Rx := 0;
//			MC_BR_Move6D_Acp6D_0.Parameters.ShortAxis.Position.Ry := 0;
//			MC_BR_Move6D_Acp6D_0.Parameters.ShortAxis.Position.Rz := -0.125;
//			MC_BR_Move6D_Acp6D_0.Execute := TRUE;
//			IF MC_BR_Move6D_Acp6D_0.Acknowledge THEN
//				MC_BR_Move6D_Acp6D_0.Execute := FALSE;
//				em.substate := 13390;
//			END_IF
//		
//		13390:
//			em.description := 'Move shuttles in X Y and RZ at the same time';
//			MC_BR_Move6D_Acp6D_0.Parameters.InPlane.Acceleration := 0.5;
//			MC_BR_Move6D_Acp6D_0.Parameters.InPlane.Velocity := 0.14;
//			MC_BR_Move6D_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[0].shuttleRef);
//			MC_BR_Move6D_Acp6D_0.Parameters.ShortAxis.Velocity.Rz := MC_BR_Move6D_Acp6D_0.Parameters.ShortAxis.Velocity.Ry := MC_BR_Move6D_Acp6D_0.Parameters.ShortAxis.Velocity.Rx := MC_BR_Move6D_Acp6D_0.Parameters.ShortAxis.Velocity.Z := 0.300;
//			MC_BR_Move6D_Acp6D_0.Parameters.InPlane.Position.X := 0.060;
//			MC_BR_Move6D_Acp6D_0.Parameters.InPlane.Position.Y := 0.180;
//			MC_BR_Move6D_Acp6D_0.Parameters.ShortAxis.Position.Z := 0.001;
//			MC_BR_Move6D_Acp6D_0.Parameters.ShortAxis.Position.Rx := 0;
//			MC_BR_Move6D_Acp6D_0.Parameters.ShortAxis.Position.Ry := 0;
//			MC_BR_Move6D_Acp6D_0.Parameters.ShortAxis.Position.Rz := 0;
//			MC_BR_Move6D_Acp6D_0.Execute := TRUE;
//			IF MC_BR_Move6D_Acp6D_0.Acknowledge THEN
//				MC_BR_Move6D_Acp6D_0.Execute := FALSE;
//				em.substate := 13400;
//			END_IF
		
		13400:
			em.description := 'DeCouple ShuttleGroup1_2';
			MC_BR_ShGroupCoupleCtrl_Acp6D_0.ShuttleGroup := shGroupShuttle1_2;
			MC_BR_ShGroupCoupleCtrl_Acp6D_0.Parameters.Option := 0; //DeCouple
			MC_BR_ShGroupCoupleCtrl_Acp6D_0.Execute := TRUE;
			IF MC_BR_ShGroupCoupleCtrl_Acp6D_0.Done THEN
				MC_BR_ShGroupCoupleCtrl_Acp6D_0.Execute := FALSE;
				em.substate := 13010;
			END_IF		
		
		13500:
			em.description := 'Couple ShuttleGroup1_2';
			MC_BR_ShGroupCoupleCtrl_Acp6D_0.ShuttleGroup := shGroupShuttle1_2;
			MC_BR_ShGroupCoupleCtrl_Acp6D_0.Parameters.Mode := 1;
			MC_BR_ShGroupCoupleCtrl_Acp6D_0.Parameters.Option := 1; //Couple
			MC_BR_ShGroupCoupleCtrl_Acp6D_0.Execute := TRUE;
			IF MC_BR_ShGroupCoupleCtrl_Acp6D_0.Done THEN
				MC_BR_ShGroupCoupleCtrl_Acp6D_0.Execute := FALSE;
				em.substate := 13510;
			END_IF
		
		13510:
			em.description := 'Move bottle around';
			MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[1].shuttleRef);;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := 0.540;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := 0.290;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity := 1;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := 1;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 2; //Y then X
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Mode := 0;
			MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
				MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				em.substate := 13530;
			END_IF
		
		13530:
			em.description := 'Move bottle around';
			MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[1].shuttleRef);;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := 0.060;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := 0.060;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity := 1;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := 1;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 2;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Mode := 0;
			MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
				MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				em.substate := 13400; //decouple state
			END_IF
	END_CASE

	TON_0();
	

END_ACTION
