
TYPE
	KUKA : 	STRUCT 
		axisGroupIdx : USINT;
		startState : USINT;
		cm : brdkCM;
		start : start_function;
		motion : motion_function;
		convert : convert_function;
		read : read_function;
		write : write_function;
		status : status;
		operationType : operation_type;
		eeType : end_effector_type;
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
		KRC_Abort : KRC_Abort;
	END_STRUCT;
	motion_function : 	STRUCT 
		KRC_MoveDirectAbsolute : KRC_MoveDirectAbsolute; (*PTP absolute motion*)
		KRC_MoveDirectRelative : KRC_MoveDirectRelative; (*PTP relative motion*)
		KRC_MoveLinearAbsolute : KRC_MoveLinearAbsolute; (*LIN absolute motion*)
		KRC_MoveLinearRelative : KRC_MoveLinearRelative; (*LIN relative motion*)
		KRC_MoveAxisAbsolute : KRC_MoveAxisAbsolute; (*JOINT absolute motion*)
	END_STRUCT;
	convert_function : 	STRUCT 
		ValuesToCOORDSYS : mxa_ValuesToCOORDSYS;
		ValuesToPosition : ValuesToPosition;
		ValuesToMagazineFrame : ValuesToMagazineFrame;
	END_STRUCT;
	read_function : 	STRUCT 
		KRC_ReadAxisGroup : KRC_ReadAxisGroup;
		KRC_ReadActualPosition : KRC_ReadActualPosition;
		KRC_ReadActualAxisPosition : KRC_ReadActualAxisPosition;
	END_STRUCT;
	write_function : 	STRUCT 
		KRC_WriteAxisGroup : KRC_WriteAxisGroup;
		KRC_WriteToolData : KRC_WriteToolData;
		KRC_WriteBaseData : KRC_WriteBaseData;
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
		PROCESS := 1,
		HANDLING := 2
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
		APPROACH_WORKSTATION := 1,
		APPROACH_MAGAZINE := 2,
		APPROACH_MAGAZINE_FLIPPED := 3
		);
END_TYPE
