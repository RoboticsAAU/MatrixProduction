ACTION mxA_BottomCover :
	
	// Assigning velocity
	velocity 										:= 10;
	
	
//	// Joint position
//	position1.A1 := 0;
//	position1.A2 := -90;
//	position1.A3 := 90;
//	position1.A4 := 0;
//	position1.A5 := 90;
//	position1.A6 := 0;
//
//	// Move to absolute joint values
//	KRC_MoveAxisAbsolute_0.AxisGroupIdx 			:= 1; // HMI_AxisGroup;
//	KRC_MoveAxisAbsolute_0.KRC_AxisGroupRefArr		:= ADR(AxisRef);
//	KRC_MoveAxisAbsolute_0.ExecuteCmd 				:= TRUE;
//	KRC_MoveAxisAbsolute_0.AxisPosition 			:= position1;
//	KRC_MoveAxisAbsolute_0.Velocity 				:= velocity;
//	KRC_MoveAxisAbsolute_0.Acceleration 			:= 20;
//	KRC_MoveAxisAbsolute_0.BufferMode 				:= 2; // Buffered according to the FIFO principle. Interpreted by the main robot interpreter.
//
//	KRC_MoveAxisAbsolute_0();

//	KRC_ReadToolData_0.AxisGroupIdx 				:= 1;
//	KRC_ReadToolData_0.ExecuteCmd					:= TRUE;
//	KRC_ReadToolData_0.ToolNo						:= 1;
//	
//	KRC_ReadToolData_0();
	
//	IF KRC_ReadToolData_0.Done AND KRC_ReadToolData_0.Error = TRUE THEN

	// Asign TCP relative to flange.
	tcp.X := 0;
	tcp.Y := 0;
	tcp.Z := 100;
	tcp.A := 0;
	tcp.B := 0;
	tcp.C := 0;
	
	
	// Make tool data
	writeToolData_0.AxisGroupIdx 					:= 1; //index of the axis group
	writeToolData_0.ExecuteCmd						:= TRUE; //Bool : Execute at rising edge
	writeToolData_0.ToolNo							:= 1; //Tool number between 0 and 16
	writeToolData_0.ToolData						:= tcp;
	writeToolData_0.BufferMode 						:= 2; //Directly executed by the submit interpreter. 
	writeToolData_0.KRC_AxisGroupRefArr				:= ADR(AxisRef);
	
	writeToolData_0();
	
	IF writeToolData_0.Busy = TRUE THEN
		writeToolData_0.ExecuteCmd 					:= FALSE;
	END_IF;
		////	END_IF;
	
	
	KRC_ReadBaseData_0.AxisGroupIdx					:= 1;
	KRC_ReadBaseData_0.BaseNo						:= 1;
	KRC_ReadBaseData_0.ExecuteCmd					:= TRUE;
	
	KRC_ReadBaseDAta_0();
//	
//	IF KRC_ReadBaseDAta_0.Done = TRUE AND KRC_ReadBaseDAta_0.Error = TRUE THEN
	
		// Assign base position
	base.X 											:= 0;
	base.Y 											:= 0;
	base.Z 											:= 0;
	base.A 											:= 0;
	base.B 											:= 0;
	base.C 											:= 0;
	
	// Write base data
	writeBaseData_0.AxisGroupIdx 					:= 1;
	writeBaseData_0.ExecuteCmd						:= TRUE;
	writeBaseData_0.KRC_AxisGroupRefArr				:= ADR(AxisRef);
	writeToolData_0.BufferMode						:= 0;
	writeBaseData_0.BaseNo 							:= 1;
	writeBaseData_0.BaseData						:= base;
	
	writeBaseData_0();
		
	IF writeBaseData_0.Busy	= TRUE THEN
		writeBaseData_0.ExecuteCmd					:= FALSE;
	END_IF;		
		
////		
//////	END_IF;
	// Make the coordsys
	reference_frame.BASE 							:= 1; // Base number 1
	reference_frame.TOOL							:= 1; // Tool number 1
	reference_frame.IPO_Mode						:= 1; // Tool mounted on flange
	
	KRC_SetCoordSys_0.AxisGroupIdx					:= 1;
	KRC_SetCoordSys_0.KRC_AxisGroupRefArr			:= ADR(AxisRef);
	KRC_SetCoordSys_0.BufferMode					:= 0;
	KRC_SetCoordSys_0.CoordinateSystem				:= reference_frame;
	KRC_SetCoordSys_0.ExecuteCmd					:= TRUE;
	
	KRC_SetCoordSys_0();
	
	Approximate.CP_MODE								:= 0;
	Approximate.PTP_MODE							:= 0;
	
	// Cartesian end position
	cartesianPosition1.X 							:= 200;
	cartesianPosition1.Y 							:= 0;
	cartesianPosition1.Z 							:= 700;
	cartesianPosition1.A 							:= 0;
	cartesianPosition1.B 							:= 0;
	cartesianPosition1.C 							:= 0;
	cartesianPosition1.Status						:= 1;
	cartesianPosition1.Turn							:= 1;

	
	// Move liear to cartesian position
	KRC_MoveLinearAbsolute_0.AxisGroupIdx 			:= 1;
	KRC_MoveLinearAbsolute_0.KRC_AxisGroupRefArr	:= ADR(AxisRef);
	KRC_MoveLinearAbsolute_0.ExecuteCmd				:= TRUE;
	KRC_MoveLinearAbsolute_0.Position				:= cartesianPosition1;
	KRC_MoveLinearAbsolute_0.Velocity				:= velocity;
	KRC_MoveLinearAbsolute_0.Acceleration			:= 20;
	KRC_MoveLinearAbsolute_0.OriType				:= 1; //
	KRC_MoveLinearAbsolute_0.BufferMode				:= 2;
	KRC_MoveLinearAbsolute_0.CoordinateSystem		:= reference_frame;
	KRC_MoveLinearAbsolute_0.Approximate			:= Approximate; //No approximation on positioning (Default)

	KRC_MoveLinearAbsolute_0();
	
	IF KRC_MoveLinearAbsolute_0.Busy = TRUE THEN
		KRC_MoveLinearAbsolute_0.ExecuteCmd  		:= FALSE;
	END_IF;
	
	
	KRC_diag_0.AxisGroupIdx							:= 1;
	KRC_diag_0.KRC_AxisGroupRefArr					:= ADR(AxisRef);
	KRC_diag_0.ShowTrace							:= FALSE;
	KRC_diag_0.MaxSubmitCycle						:= 1000;
	
	KRC_diag_0();
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

END_ACTION
