
TYPE
	KUKA : 	STRUCT 
		cm : brdkCM;
		init : init_function;
		motion : motion_function;
		read : read_function;
		operationType : operation_type;
		eeType : end_effector_type;
		TON_Timer : TON;
		operationDone : BOOL := FALSE; (*Maybe don't need. Depends how we send finish flag to ACOPOS*)
		status : status;
		AxisGroupIdx : USINT;
	END_STRUCT;
	init_function : 	STRUCT 
		KRC_Initialize : KRC_Initialize;
		KRC_Error : KRC_Error;
		KRC_AutomaticExternal : KRC_AutomaticExternal;
		KRC_AutoStart : KRC_AutoStart;
		KRC_SetOverride : KRC_SetOverride;
		KRC_Diag : KRC_Diag;
		KRC_WriteAxisGroup : KRC_WriteAxisGroup;
		KRC_Abort : KRC_Abort;
	END_STRUCT;
	motion_function : 	STRUCT 
		KRC_MoveDirectAbsolute : KRC_MoveDirectAbsolute;
		KRC_MoveDirectRelative : KRC_MoveDirectRelative;
		KRC_MoveLinearAbsolute : KRC_MoveLinearAbsolute;
		KRC_MoveLinearRelative : KRC_MoveLinearRelative;
	END_STRUCT;
	read_function : 	STRUCT 
		KRC_ReadActualPosition : KRC_ReadActualPosition;
		KRC_ReadActualAxisPosition : KRC_ReadActualAxisPosition;
		KRC_ReadAxisGroup : KRC_ReadAxisGroup;
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
END_TYPE
