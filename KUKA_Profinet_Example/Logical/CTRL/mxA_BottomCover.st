
ACTION mxA_BottomCover: 
//	position1.A1 := 0;
//	position1.A2 := -90;
//	position1.A3 := 90;
//	position1.A4 := 0;
//	position1.A5 := 90;
//	position1.A6 := 0;
//	
//	KRC_MoveAxisAbsolute_0.AxisGroupIdx 		:= 1; // HMI_AxisGroup;
//	KRC_MoveAxisAbsolute_0.KRC_AxisGroupRefArr	:= ADR(AxisRef);
//	KRC_MoveAxisAbsolute_0.ExecuteCmd 			:= TRUE;
//	KRC_MoveAxisAbsolute_0.AxisPosition 		:= position1;
//	KRC_MoveAxisAbsolute_0.Velocity 			:= 10;
//	KRC_MoveAxisAbsolute_0.Acceleration 		:= 20;
//	KRC_MoveAxisAbsolute_0.BufferMode 			:= 2; //Buffered according to the FIFO principle. Interpreted by the main robot interpreter.
//	
//	KRC_MoveAxisAbsolute_0();
	
//	KRC_SetCoordSys_0.AxisGroupIdx 				:= 1;
//	KRC_SetCoordSys_0.ExecuteCmd				:= TRUE;
//	KRC_SetCoordSys_0.CoordinateSystem			:= JoggingCoordSys;
//	KRC_SetCoordSys_0.BufferMode				:= 2;
//	
//	KRC_SetCoordSys_0();
	
	KRC_ReadBaseData_0.AxisGroupIdx				:= 1;
	KRC_ReadBaseData_0.BaseNo					:= 1;
	KRC_ReadBaseData_0.ExecuteCmd 				:= TRUE;
	KRC_ReadBaseData_0.KRC_AxisGroupRefArr 		:= ADR(AxisRef);
	
	KRC_ReadBaseData_0();
	
	
	mxa_ValuesToCOORDSYS_0 := KRC_ReadBaseData_0.BaseData;
	
	baseFrame := mxa_ValuesToCOORDSYS_0.COORDSYS;
	
	cartesianPosition1.X := 250;
	cartesianPosition1.Y := 150;
	cartesianPosition1.Z := 250;
	cartesianPosition1.A := 180;
	cartesianPosition1.B := 0;
	cartesianPosition1.C := 180;	
	
	
	KRC_MoveLinearAbsolute_0.AxisGroupIdx 			:= 1;
	KRC_MoveLinearAbsolute_0.KRC_AxisGroupRefArr	:= ADR(AxisRef);
	KRC_MoveLinearAbsolute_0.ExecuteCmd				:= TRUE;
	KRC_MoveLinearAbsolute_0.Position				:= cartesianPosition1;
	KRC_MoveLinearAbsolute_0.Velocity				:= 10;
	KRC_MoveLinearAbsolute_0.Acceleration			:= 20; 
	KRC_MoveLinearAbsolute_0.OriType				:= 0; 
	KRC_MoveLinearAbsolute_0.BufferMode				:= 2;
	KRC_MoveLinearAbsolute_0.CoordinateSystem		:= baseFrame;
	
	KRC_MoveLinearAbsolute_0();
//	
	
END_ACTION
