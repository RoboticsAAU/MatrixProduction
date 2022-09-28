
ACTION ResetInput: 
	MC_BR_AsmPowerOff_Acp6D_0.Execute		:= FALSE;
	MC_BR_AsmPowerOn_Acp6D_0.Execute		:= FALSE;
	MC_BR_ReadCyclicPosition_Acp6D_0.Enable	:= FALSE;
	MC_BR_ReadCyclicPosition_Acp6D_1.Enable	:= FALSE;
	MC_BR_ReadCyclicPosition_Acp6D_2.Enable	:= FALSE;
	MC_BR_ReadCyclicPosition_Acp6D_3.Enable	:= FALSE;
	gAcp6DCtrl.Cmd.PowerOn					:= FALSE;
	gAcp6DCtrl.Cmd.PowerOff					:= FALSE;
	gAcp6DCtrl.Cmd.StartProcess				:= FALSE;
	gAcp6DCtrl.Cmd.StopProcess				:= FALSE;
	
	ABBRobot.returnBigWeightMovement 		:= FALSE;
	ABBRobot.returnSmallWeightMovement		:= FALSE;
	ABBRobot.startBigWeightMovement			:= FALSE;
	ABBRobot.startSmallWeightMovement		:= FALSE;
	
	MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
	MC_BR_MoveInPlane_Acp6D_0.Parameters.Mode := 0;
	MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 0;
	
	FOR i := 0 TO NR_OF_WORKSTATIONS DO
		gWorkStations[i].cm.state := 0;
		gWorkStations[i].MC_BR_ShLevitation_Acp6D_0.Execute := FALSE;
		gWorkStations[i].MC_BR_MoveArc_Acp6D_0.Execute := FALSE;
		gWorkStations[i].MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
		gWorkStations[i].MC_BR_RotaryMotion_Acp6D_0.Execute := FALSE;
		gWorkStations[i].MC_BR_RotaryMotionSpin_Acp6D_0.Execute := FALSE;
		gWorkStations[i].MC_BR_Move6D_Acp6D_0.Execute := FALSE;
		gWorkStations[i].par.ArcMovement := FALSE;
		gWorkStations[i].par.landBeforeProcess := FALSE;
		gWorkStations[i].par.pathRouting := FALSE;
		gWorkStations[i].par.processTime := FALSE;
		gWorkStations[i].par.tempShuttleID := FALSE;
		gWorkStations[i].par.xLocation := FALSE;
		gWorkStations[i].par.yLocation := FALSE;
		gWorkStations[i].par.internalCounter := 0;
		gWorkStations[i].par.tempCounter := 0;
		gWorkStations[i].TON_0.IN := FALSE;
		gWorkStations[i].par.xLocation										:= 0.0;
		gWorkStations[i].par.yLocation										:= 0.0;
		gWorkStations[i].par.nextStationSelector							:= '0';
		gWorkStations[i].par.processTime									:= 0;
		gWorkStations[i].par.pathRouting									:= 0;
		gWorkStations[i].par.ArcMovement									:= FALSE;
		gWorkStations[i].par.landBeforeProcess								:= FALSE;
	END_FOR
	

	FOR i := 0 TO NUM_SHUTTLES DO
		gShuttles[i].function.MC_BR_Move6D_Acp6D_0.Execute := FALSE;
		gShuttles[i].function.MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
		gShuttles[i].function.MC_BR_MoveShortAxis_Acp6D_0.Execute := FALSE;
		gShuttles[i].function.TON_0.IN := FALSE;
		gShuttles[i].cm.state := 0;
		
		//MC_BR_ShReadInfo_Acp6D_0[i].Enable := FALSE;
		
		//MC_BR_MoveArc_Acp6D_0[i].Execute := FALSE;
		
		MC_BR_MoveShortAxis_Acp6D_0[i].Execute := FALSE;
	END_FOR
	
	FOR k := 0 TO 1 DO
		FOR j := 0 TO NUM_SHUTTLES DO 
			//MC_BR_ReadCyclicChAxis_Acp6D_0[k,j].Enable := FALSE;
		END_FOR
	END_FOR
	
	TON_0.IN								:= FALSE;
	MC_BR_MoveArc_Acp6D_0.Execute 			:= FALSE;
	MC_BR_MoveInPlaneAsync_Acp6D_0.Execute	:= FALSE;
	MC_BR_MoveInPlane_Acp6D_0.Execute		:= FALSE;
	//MC_BR_ShReadInfo_Acp6D_0.Execute		:= FALSE;
	MC_BR_ShGroupCreate_Acp6D_0.Execute		:= FALSE;
	MC_BR_ShGroupAddShuttle_Acp6D_0.Execute := FALSE;
	MC_BR_ShGroupCoupleCtrl_Acp6D_0.Execute	:= FALSE;
	MC_BR_ShGroupGetInfo_Acp6D_0.Execute	:= FALSE;
	MC_BR_RotaryMotionSpin_Acp6D_0.Execute 	:= FALSE;
	MC_BR_AsmLevitation_Acp6D_0.Execute		:= FALSE;
	//MC_BR_MacroList_Acp6D_0.Execute			:= FALSE;
	//MC_BR_MacroLoad_Acp6D_0.Execute			:= FALSE;
	//MC_BR_MoveShortAxis_Acp6D_0.Execute		:= FALSE;
	//MC_BR_PlanetCtrl_Acp6D_0.Execute		:= FALSE;
	MC_BR_Move6D_Acp6D_0.Execute 			:= FALSE;
	MC_BR_ShLevitation_Acp6D_0.Execute	:= FALSE;
	
	//MC_BR_MacroList_Acp6D_0();
	//MC_BR_MacroLoad_Acp6D_0();

END_ACTION
