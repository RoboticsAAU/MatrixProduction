
TYPE
	KUKA : 	STRUCT 
		cm : brdkCM;
		start : start_function;
		motion : motion_function;
		read : read_pos_function;
		operationType : operation_type;
		eeType : end_effector_type;
		status : status;
		AxisGroupIdx : USINT;
		gripperAction : GripperAction;
		TON : TON;
		startState : USINT;
		toolFrame : FRAME;
	END_STRUCT;
	start_function : 	STRUCT 
		KRC_Initialize : KRC_Initialize;
		KRC_Error : KRC_Error;
		KRC_AutomaticExternal : KRC_AutomaticExternal;
		KRC_AutoStart : KRC_AutoStart;
		KRC_SetOverride : KRC_SetOverride;
		KRC_Diag : KRC_Diag;
		KRC_WriteAxisGroup : KRC_WriteAxisGroup;
		KRC_Abort : KRC_Abort;
		KRC_ReadAxisGroup : KRC_ReadAxisGroup;
	END_STRUCT;
	motion_function : 	STRUCT 
		KRC_MoveDirectAbsolute : KRC_MoveDirectAbsolute;
		KRC_MoveDirectRelative : KRC_MoveDirectRelative;
		KRC_MoveLinearAbsolute : KRC_MoveLinearAbsolute;
		KRC_MoveLinearRelative : KRC_MoveLinearRelative;
		KRC_MoveAxisAbsolute : KRC_MoveAxisAbsolute;
	END_STRUCT;
	read_pos_function : 	STRUCT 
		KRC_ReadActualPosition : KRC_ReadActualPosition;
		KRC_ReadActualAxisPosition : KRC_ReadActualAxisPosition;
	END_STRUCT;
	operation_type : 
		(
		ASSEMBLY := 0,
		PROCESS := 1
		);
	end_effector_type : 
		(
		COVER_EE := 1,
		PCB_EE := 2,
		FUSE_EE := 3,
		DRILL_EE := 4
		);
	status : 	STRUCT 
		S_ : BOOL;
		I_ : BOOL;
		R_ : BOOL;
		EXT_ : BOOL;
		P_ : BOOL;
	END_STRUCT;
	gripper_action_type : 
		(
		OPEN := 0,
		CLOSE := 1
		);
END_TYPE
