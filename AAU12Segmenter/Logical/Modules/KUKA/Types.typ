
TYPE
	KUKA : 	STRUCT 
		cm : brdkCM; (*Change type after integration into Smart Lab project*)
		init : init_function;
		motion : motion_function;
		read : read_function;
		operationType : operation_type;
		gripperType : gripper_type;
		TON_Timer : TON;
		operationDone : BOOL := FALSE; (*Maybe don't need. Depends how we send finish flag to ACOPOS*)
		status : status;
	END_STRUCT;
	init_function : 	STRUCT 
		KRC_ReadAxisGroup : KRC_ReadAxisGroup;
		KRC_Initialize : KRC_Initialize;
		KRC_Error : KRC_Error;
		KRC_AutomaticExternal : KRC_AutomaticExternal;
		KRC_AutoStart : KRC_AutoStart;
		KRC_SetOverride : KRC_SetOverride;
		KRC_Diag : KRC_Diag;
		KRC_WriteAxisGroup : KRC_WriteAxisGroup;
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
	END_STRUCT;
	operation_type : 
		(
		ASSEMBLY := 0,
		PROCESS := 1
		);
	gripper_type : 
		(
		COVER_GRIPPER := 0,
		PCB_GRIPPER := 1,
		FUSE_GRIPPER := 2
		);
	status : 	STRUCT 
		S_ : BOOL;
		I_ : BOOL;
		R_ : BOOL;
		EXT_ : BOOL;
		P_ : BOOL;
	END_STRUCT;
END_TYPE
