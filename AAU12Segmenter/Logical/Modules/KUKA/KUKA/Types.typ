
TYPE
	KUKA : 	STRUCT 
		axisGroupIdx : USINT;
		startState : USINT;
		cm : brdkCM;
		start : start_function;
		motion : motion_function;
		convert : convert_function;
		read : read_pos_function;
		operationType : operation_type; (*Maybe remove*)
		eeType : end_effector_type;
		status : status;
		gripperAction : GripperAction;
		tempPosition : E6POS;
		TON : TON;
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
	convert_function : 	STRUCT 
		ValuesToCOORDSYS : mxa_ValuesToCOORDSYS;
		ValuesToPosition : ValuesToPosition;
	END_STRUCT;
	read_pos_function : 	STRUCT 
		KRC_ReadActualPosition : KRC_ReadActualPosition;
		KRC_ReadActualAxisPosition : KRC_ReadActualAxisPosition;
	END_STRUCT;
	status : 	STRUCT 
		S_ : BOOL;
		I_ : BOOL;
		R_ : BOOL;
		EXT_ : BOOL;
		P_ : BOOL;
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
	gripper_action_type : 
		(
		OPEN := 0,
		CLOSE := 1
		);
	robot_position_type : 
		(
		DEFAULT := 0,
		APPROACH_MAGAZINE := 1,
		APPROACH_WORKSTATION := 2
		);
END_TYPE
