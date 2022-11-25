
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
	
	MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
	MC_BR_MoveInPlane_Acp6D_0.Parameters.Mode := 0;
	MC_BR_MoveInPlane_Acp6D_0.Parameters.Path := 0;
	
	FOR i := 0 TO NR_OF_WORKSTATIONS DO
		gWorkstations[i].cm.state := 0;
		gWorkstations[i].MC_BR_ShLevitation_Acp6D_0.Execute := FALSE;
		gWorkstations[i].MC_BR_MoveArc_Acp6D_0.Execute := FALSE;
		gWorkstations[i].MC_BR_MoveInPlane_Acp6D_0.Execute := FALSE;
		gWorkstations[i].MC_BR_RotaryMotion_Acp6D_0.Execute := FALSE;
		gWorkstations[i].MC_BR_RotaryMotionSpin_Acp6D_0.Execute := FALSE;
		gWorkstations[i].MC_BR_Move6D_Acp6D_0.Execute := FALSE;
		gWorkstations[i].par.ArcMovement := FALSE;
		gWorkstations[i].par.landBeforeProcess := FALSE;
		gWorkstations[i].par.pathRouting := FALSE;
		gWorkstations[i].par.processTime := FALSE;
		gWorkstations[i].par.tempShuttleID := FALSE;
		gWorkstations[i].par.xLocation := FALSE;
		gWorkstations[i].par.yLocation := FALSE;
		gWorkstations[i].TON_0.IN := FALSE;
		gWorkstations[i].par.xLocation										:= 0.0;
		gWorkstations[i].par.yLocation										:= 0.0;
		gWorkstations[i].par.nextStationSelector							:= '0';
		gWorkstations[i].par.processTime									:= 0;
		gWorkstations[i].par.pathRouting									:= 0;
		gWorkstations[i].par.ArcMovement									:= FALSE;
		gWorkstations[i].par.landBeforeProcess								:= FALSE;
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
