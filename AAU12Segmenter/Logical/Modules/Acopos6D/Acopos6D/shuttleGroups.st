
ACTION shuttleGroups: 
	CASE createShGroup OF
		0:
			//Create First shuttle Group
			MC_BR_ShGroupCreate_Acp6D_0.Execute := TRUE;
			IF MC_BR_ShGroupCreate_Acp6D_0.Done THEN
				shGroupShuttle1_2 := ADR(MC_BR_ShGroupCreate_Acp6D_0.ShuttleGroup);
				MC_BR_ShGroupCreate_Acp6D_0.Execute := FALSE;
				createShGroup := 10;
			END_IF
			
		10:
			//Add shuttles to new group
			MC_BR_ShGroupAddShuttle_Acp6D_0.ShuttleGroup := shGroupShuttle1_2;
			MC_BR_ShGroupAddShuttle_Acp6D_0.Parameters.ShuttleList[0].Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[0].shuttleRef);
			MC_BR_ShGroupAddShuttle_Acp6D_0.Parameters.ShuttleList[1].Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[1].shuttleRef);
			MC_BR_ShGroupAddShuttle_Acp6D_0.Parameters.ShuttleList[2].Shuttle := 0;
			MC_BR_ShGroupAddShuttle_Acp6D_0.Parameters.ShuttleList[3].Shuttle := 0;
			MC_BR_ShGroupAddShuttle_Acp6D_0.Execute := TRUE;
			IF MC_BR_ShGroupAddShuttle_Acp6D_0.Done THEN
				MC_BR_ShGroupAddShuttle_Acp6D_0.Execute := FALSE;
				createShGroup := 15;
			END_IF
			
		15:
			//dummy scan
			IF NOT MC_BR_ShGroupAddShuttle_Acp6D_0.Done THEN
				createShGroup := 20;
			END_IF
			
		20:
			//Create Second shuttle Group
			MC_BR_ShGroupCreate_Acp6D_1.Execute := TRUE;
			IF MC_BR_ShGroupCreate_Acp6D_1.Done THEN
				shGroupShuttle3_4 := ADR(MC_BR_ShGroupCreate_Acp6D_1.ShuttleGroup);
				MC_BR_ShGroupCreate_Acp6D_1.Execute := FALSE;
				createShGroup := 30;
			END_IF
			
		30:
			//Add shuttles to new group
			MC_BR_ShGroupAddShuttle_Acp6D_0.ShuttleGroup := shGroupShuttle3_4;
			MC_BR_ShGroupAddShuttle_Acp6D_0.Parameters.ShuttleList[0].Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[2].shuttleRef);
			MC_BR_ShGroupAddShuttle_Acp6D_0.Parameters.ShuttleList[1].Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[3].shuttleRef);
			MC_BR_ShGroupAddShuttle_Acp6D_0.Parameters.ShuttleList[2].Shuttle := 0;
			MC_BR_ShGroupAddShuttle_Acp6D_0.Parameters.ShuttleList[3].Shuttle := 0;
			MC_BR_ShGroupAddShuttle_Acp6D_0.Execute := TRUE;
			IF MC_BR_ShGroupAddShuttle_Acp6D_0.Done THEN
				MC_BR_ShGroupAddShuttle_Acp6D_0.Execute := FALSE;
				createShGroup := 40;
			END_IF
		
		40:
			//Create third shuttle Group
			MC_BR_ShGroupCreate_Acp6D_2.Execute := TRUE;
			IF MC_BR_ShGroupCreate_Acp6D_2.Done THEN
				shGroupShuttle1_4 := ADR(MC_BR_ShGroupCreate_Acp6D_2.ShuttleGroup);
				MC_BR_ShGroupCreate_Acp6D_2.Execute := FALSE;
				createShGroup := 50;
			END_IF
		
		50:
			//Add shuttles to new group
			MC_BR_ShGroupAddShuttle_Acp6D_0.ShuttleGroup := shGroupShuttle1_4;
			MC_BR_ShGroupAddShuttle_Acp6D_0.Parameters.ShuttleList[0].Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[0].shuttleRef);
			MC_BR_ShGroupAddShuttle_Acp6D_0.Parameters.ShuttleList[1].Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[3].shuttleRef);
			MC_BR_ShGroupAddShuttle_Acp6D_0.Parameters.ShuttleList[2].Shuttle := 0;
			MC_BR_ShGroupAddShuttle_Acp6D_0.Parameters.ShuttleList[3].Shuttle := 0;
			MC_BR_ShGroupAddShuttle_Acp6D_0.Execute := TRUE;
			IF MC_BR_ShGroupAddShuttle_Acp6D_0.Done THEN
				MC_BR_ShGroupAddShuttle_Acp6D_0.Execute := FALSE;
				createShGroup := 60;
			END_IF
		
		60:
			//Create fourth shuttle Group
			MC_BR_ShGroupCreate_Acp6D_3.Execute := TRUE;
			IF MC_BR_ShGroupCreate_Acp6D_3.Done THEN
				shGroupShuttle2_3 := ADR(MC_BR_ShGroupCreate_Acp6D_3.ShuttleGroup);
				MC_BR_ShGroupCreate_Acp6D_3.Execute := FALSE;
				createShGroup := 70;
			END_IF
		
		70:
			//Add shuttles to new group
			MC_BR_ShGroupAddShuttle_Acp6D_0.ShuttleGroup := shGroupShuttle2_3;
			MC_BR_ShGroupAddShuttle_Acp6D_0.Parameters.ShuttleList[0].Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[1].shuttleRef);
			MC_BR_ShGroupAddShuttle_Acp6D_0.Parameters.ShuttleList[1].Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[2].shuttleRef);
			MC_BR_ShGroupAddShuttle_Acp6D_0.Parameters.ShuttleList[2].Shuttle := 0;
			MC_BR_ShGroupAddShuttle_Acp6D_0.Parameters.ShuttleList[3].Shuttle := 0;
			MC_BR_ShGroupAddShuttle_Acp6D_0.Execute := TRUE;
			IF MC_BR_ShGroupAddShuttle_Acp6D_0.Done THEN
				MC_BR_ShGroupAddShuttle_Acp6D_0.Execute := FALSE;
				createShGroup := 80;
			END_IF
		
		80:
			//Create fifth shuttle Group
			MC_BR_ShGroupCreate_Acp6D_4.Execute := TRUE;
			IF MC_BR_ShGroupCreate_Acp6D_4.Done THEN
				shGroupShuttle5_6_7_8 := ADR(MC_BR_ShGroupCreate_Acp6D_4.ShuttleGroup);
				MC_BR_ShGroupCreate_Acp6D_4.Execute := FALSE;
				createShGroup := 90;
			END_IF
			
		90:
			//Add shuttles to new group
			MC_BR_ShGroupAddShuttle_Acp6D_0.ShuttleGroup := shGroupShuttle5_6_7_8;
			MC_BR_ShGroupAddShuttle_Acp6D_0.Parameters.ShuttleList[0].Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[4].shuttleRef);
			MC_BR_ShGroupAddShuttle_Acp6D_0.Parameters.ShuttleList[1].Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[5].shuttleRef);
			MC_BR_ShGroupAddShuttle_Acp6D_0.Parameters.ShuttleList[2].Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[6].shuttleRef);
			MC_BR_ShGroupAddShuttle_Acp6D_0.Parameters.ShuttleList[3].Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[7].shuttleRef);
			MC_BR_ShGroupAddShuttle_Acp6D_0.Execute := TRUE;
			IF MC_BR_ShGroupAddShuttle_Acp6D_0.Done THEN
				MC_BR_ShGroupAddShuttle_Acp6D_0.Execute := FALSE;
				createShGroup := 100;
			END_IF
	END_CASE
END_ACTION
ACTION macroCreatorAction:
	CASE macroCreater OF
		0:
			MC_BR_MacroCreate_Acp6D_0.Parameters.Name := 'shuttleWave';
			MC_BR_MacroCreate_Acp6D_0.Execute := TRUE;
			IF MC_BR_MacroCreate_Acp6D_0.Done THEN
				MC_BR_MacroCreate_Acp6D_0.Execute := FALSE;
				macroCreater := 10;
			END_IF
		
		10:
			MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(MC_BR_MacroCreate_Acp6D_0.MacroShuttle);
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := 0.0;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := 0.060;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Mode := 1; //Relative
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 0; //Y then X
			MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
				MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				macroCreater := 20;
			END_IF
		
		20:
			MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(MC_BR_MacroCreate_Acp6D_0.MacroShuttle);
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := 0.0;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := -0.120;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Mode := 1; //Relative
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 0; //Y then X
			MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
				MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				macroCreater := 30;
			END_IF
		
		30:
			MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(MC_BR_MacroCreate_Acp6D_0.MacroShuttle);
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := 0.0;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := 0.120;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Mode := 1; //Relative
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 0; //Y then X
			MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
				MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				macroCreater := 40;
			END_IF
		
		40:
			MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(MC_BR_MacroCreate_Acp6D_0.MacroShuttle);
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := 0.0;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := -0.120;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Mode := 1; //Relative
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 0; //Y then X
			MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
				MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				macroCreater := 50;
			END_IF
		
		50:
			MC_BR_MoveInPlane_Acp6D_0.Shuttle := ADR(MC_BR_MacroCreate_Acp6D_0.MacroShuttle);
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.X := 0.0;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Position.Y := 0.120;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Mode := 1; //Relative
			MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 0; //Y then X
			MC_BR_MoveInPlane_Acp6D_0.Execute := TRUE;
			IF MC_BR_MoveInPlane_Acp6D_0.Acknowledge THEN
				MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
				macroCreater := 60;
			END_IF
		
		60:
			MC_BR_MacroSave_Acp6D_0.Shuttle := ADR(MC_BR_MacroCreate_Acp6D_0.MacroShuttle);
			MC_BR_MacroSave_Acp6D_0.Execute := TRUE;
			IF MC_BR_MacroSave_Acp6D_0.Done THEN
				MC_BR_MacroSave_Acp6D_0.Execute := FALSE;
				macroCreater := 70;
			END_IF
		
		70:
			//nothing
	END_CASE
	
			
END_ACTION