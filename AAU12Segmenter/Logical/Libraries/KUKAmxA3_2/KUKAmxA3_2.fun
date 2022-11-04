
FUNCTION_BLOCK KRC_Abort
	VAR_INPUT
		AxisGroupIdx : INT;
		KRC_AxisGroupRefArr : REFERENCE TO AXIS_GROUP_REF_ARR;
		ExecuteCmd : BOOL;
	END_VAR
	VAR_OUTPUT
		Busy : BOOL;
		Done : BOOL;
		Error : BOOL;
		ErrorID : DINT;
	END_VAR
	VAR
		mxA_ExecuteCommand_1 : mxA_ExecuteCommand;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK KRC_ActivateConvInterrupt
	VAR_INPUT
		AxisGroupIdx : INT;
		KRC_AxisGroupRefArr : REFERENCE TO AXIS_GROUP_REF_ARR;
		ExecuteCmd : BOOL;
		ConveyorNumber : INT;
		BufferMode : INT;
	END_VAR
	VAR_OUTPUT
		Busy : BOOL;
		Active : BOOL;
		Done : BOOL;
		Aborted : BOOL;
		Error : BOOL;
		ErrorID : DINT;
	END_VAR
	VAR
		mxA_ExecuteCommand_1 : mxA_ExecuteCommand;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK KRC_ActivateInterrupt
	VAR_INPUT
		AxisGroupIdx : INT;
		KRC_AxisGroupRefArr : REFERENCE TO AXIS_GROUP_REF_ARR;
		ExecuteCmd : BOOL;
		Interrupt : INT;
		BufferMode : INT;
	END_VAR
	VAR_OUTPUT
		Busy : BOOL;
		Done : BOOL;
		Aborted : BOOL;
		Error : BOOL;
		ErrorID : DINT;
	END_VAR
	VAR
		mxA_ExecuteCommand_1 : mxA_ExecuteCommand;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK KRC_AutomaticExternal
	VAR_INPUT
		AxisGroupIdx : INT;
		KRC_AxisGroupRefArr : REFERENCE TO AXIS_GROUP_REF_ARR;
		MOVE_ENABLE : BOOL;
		CONF_MESS : BOOL;
		DRIVES_ON : BOOL;
		DRIVES_OFF : BOOL;
		EXT_START : BOOL;
		RESET : BOOL;
		ENABLE_T1 : BOOL;
		ENABLE_T2 : BOOL;
		ENABLE_AUT : BOOL;
		ENABLE_EXT : BOOL;
	END_VAR
	VAR_OUTPUT
		Valid : BOOL;
		RC_RDY1 : BOOL;
		ALARM_STOP : BOOL;
		USER_SAFE : BOOL;
		PERI_RDY : BOOL;
		ROB_CAL : BOOL;
		IO_ACTCONF : BOOL;
		STOPMESS : BOOL;
		INT_E_STOP : BOOL;
		PRO_ACT : BOOL;
		APPL_RUN : BOOL;
		PRO_MOVE : BOOL;
		ON_PATH : BOOL;
		NEAR_POSRET : BOOL;
		ROB_STOPPED : BOOL;
		T1 : BOOL;
		T2 : BOOL;
		AUT : BOOL;
		EXT : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK KRC_AutoStart
	VAR_INPUT
		AxisGroupIdx : INT;
		KRC_AxisGroupRefArr : REFERENCE TO AXIS_GROUP_REF_ARR;
		ExecuteReset : BOOL;
	END_VAR
	VAR_OUTPUT
		Busy : BOOL;
		Done : BOOL;
		DispActive : BOOL;
		ResetValid : BOOL;
		Error : BOOL;
		ErrorID : DINT;
	END_VAR
	VAR
		m_State : DINT;
		m_ConfMess : BOOL;
		m_Reset : BOOL;
		m_RE_ExecuteReset : BOOL;
		m_ExecuteResetLast : BOOL;
		KRC_ReadMXAError : KRC_ReadMXAError;
		KRC_MessageReset : KRC_MessageReset;
		TON_ON : TON;
		TON_OFF : TON;
		TON_1 : TON;
		TON_2 : TON;
		TON_3 : TON;
		TON_4 : TON;
		F_TRIG_1 : F_TRIG;
		TP_1 : TP;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK KRC_BrakeTest
	VAR_INPUT
		AxisGroupIdx : INT;
		KRC_AxisGroupRefArr : REFERENCE TO AXIS_GROUP_REF_ARR;
		ExecuteCmd : BOOL;
		ParkPosition : E6POS;
		ParkVelocity : INT;
		ParkAcceleration : INT;
		ParkCoordinateSystem : COORDSYS;
		BufferMode : INT;
	END_VAR
	VAR_OUTPUT
		Busy : BOOL;
		Active : BOOL;
		Done : BOOL;
		Aborted : BOOL;
		Result : DINT;
		Error : BOOL;
		ErrorID : DINT;
	END_VAR
	VAR
		KRC_Move_1 : KRC_Move;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK KRC_Continue
	VAR_INPUT
		AxisGroupIdx : INT;
		KRC_AxisGroupRefArr : REFERENCE TO AXIS_GROUP_REF_ARR;
		Enable : BOOL;
	END_VAR
	VAR_OUTPUT
		Error : BOOL;
		ErrorID : DINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK KRC_ConvFollow
	VAR_INPUT
		AxisGroupIdx : INT;
		KRC_AxisGroupRefArr : REFERENCE TO AXIS_GROUP_REF_ARR;
		ExecuteCmd : BOOL;
		ConveyorNumber : INT;
		StartDistance : REAL;
		MaxDistance : REAL;
		BufferMode : INT;
	END_VAR
	VAR_OUTPUT
		Busy : BOOL;
		Active : BOOL;
		Done : BOOL;
		Aborted : BOOL;
		MaxDistanceReached : BOOL;
		Error : BOOL;
		ErrorID : DINT;
	END_VAR
	VAR
		mxA_ExecuteCommand_1 : mxA_ExecuteCommand;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK KRC_ConvIniOff
	VAR_INPUT
		AxisGroupIdx : INT;
		KRC_AxisGroupRefArr : REFERENCE TO AXIS_GROUP_REF_ARR;
		ExecuteCmd : BOOL;
		ConveyorNumber : INT;
		BufferMode : INT;
	END_VAR
	VAR_OUTPUT
		Busy : BOOL;
		Done : BOOL;
		Aborted : BOOL;
		Error : BOOL;
		ErrorID : DINT;
	END_VAR
	VAR
		mxA_ExecuteCommand_1 : mxA_ExecuteCommand;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK KRC_ConvOn
	VAR_INPUT
		AxisGroupIdx : INT;
		KRC_AxisGroupRefArr : REFERENCE TO AXIS_GROUP_REF_ARR;
		ExecuteCmd : BOOL;
		ConveyorNumber : INT;
		BufferMode : INT;
	END_VAR
	VAR_OUTPUT
		Busy : BOOL;
		Done : BOOL;
		Aborted : BOOL;
		Error : BOOL;
		ErrorID : DINT;
	END_VAR
	VAR
		mxA_ExecuteCommand_1 : mxA_ExecuteCommand;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK KRC_ConvSkip
	VAR_INPUT
		AxisGroupIdx : INT;
		KRC_AxisGroupRefArr : REFERENCE TO AXIS_GROUP_REF_ARR;
		ExecuteCmd : BOOL;
		ConveyorNumber : INT;
		PieceNumber : INT;
		StartDistance : REAL;
		MaxDistance : REAL;
		BufferMode : INT;
	END_VAR
	VAR_OUTPUT
		Busy : BOOL;
		Active : BOOL;
		Done : BOOL;
		Aborted : BOOL;
		MaxDistanceReached : BOOL;
		Error : BOOL;
		ErrorID : DINT;
	END_VAR
	VAR
		mxA_ExecuteCommand_1 : mxA_ExecuteCommand;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK KRC_DeactivateConvInterrupt
	VAR_INPUT
		AxisGroupIdx : INT;
		KRC_AxisGroupRefArr : REFERENCE TO AXIS_GROUP_REF_ARR;
		ExecuteCmd : BOOL;
		ConveyorNumber : INT;
		BufferMode : INT;
	END_VAR
	VAR_OUTPUT
		Busy : BOOL;
		Active : BOOL;
		Done : BOOL;
		Aborted : BOOL;
		Error : BOOL;
		ErrorID : DINT;
	END_VAR
	VAR
		mxA_ExecuteCommand_1 : mxA_ExecuteCommand;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK KRC_DeactivateInterrupt
	VAR_INPUT
		AxisGroupIdx : INT;
		KRC_AxisGroupRefArr : REFERENCE TO AXIS_GROUP_REF_ARR;
		ExecuteCmd : BOOL;
		Interrupt : INT;
		BufferMode : INT;
	END_VAR
	VAR_OUTPUT
		Busy : BOOL;
		Done : BOOL;
		Aborted : BOOL;
		Error : BOOL;
		ErrorID : DINT;
	END_VAR
	VAR
		mxA_ExecuteCommand_1 : mxA_ExecuteCommand;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK KRC_DeclareInterrupt
	VAR_INPUT
		AxisGroupIdx : INT;
		KRC_AxisGroupRefArr : REFERENCE TO AXIS_GROUP_REF_ARR;
		ExecuteCmd : BOOL;
		Interrupt : INT;
		Input : INT;
		InputValue : BOOL;
		Reaction : INT;
		BufferMode : INT;
	END_VAR
	VAR_OUTPUT
		Busy : BOOL;
		Done : BOOL;
		Aborted : BOOL;
		Error : BOOL;
		ErrorID : DINT;
	END_VAR
	VAR
		mxA_ExecuteCommand_1 : mxA_ExecuteCommand;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK KRC_Diag
	VAR_INPUT
		AxisGroupIdx : INT;
		KRC_AxisGroupRefArr : REFERENCE TO AXIS_GROUP_REF_ARR;
		ShowTrace : BOOL;
		MaxSubmitCycle : INT;
	END_VAR
	VAR_OUTPUT
		Valid : BOOL;
		QueueCount : INT;
		PosActValid : BOOL;
		BrakeActive : BOOL;
		SubmitHeartbeat : INT;
		SubmitCyc_Act : INT;
		SubmitCyc_Min : INT;
		SubmitCyc_Max : INT;
		SubmitCyc_Avg : INT;
		ActivePosOrderID : DINT;
		ActiveOrderIDB : DINT;
		Avg_Duration : DINT;
		ProconosHeartbeat : INT;
		ProconosCyc_Act : INT;
		ProconosCyc_Min : INT;
		ProconosCyc_Max : INT;
		ProconosCyc_Avg : INT;
		ErrorID_RI : DINT;
		ErrorID_SI : DINT;
		ErrorID_PLC : DINT;
		ErrorID_PCOS : DINT;
		Error : BOOL;
		ErrorID : DINT;
	END_VAR
	VAR
		TON_1Sec : TON;
		HBLast : INT;
		HBCycDiff : INT;
		HBSum : DINT;
		CyclCnt : DINT;
		PCOSHBLast : DINT;
		PCOSHBCycDiff : DINT;
		PCOSHBSum : DINT;
		SecSum : DINT;
		HBCycDiff1000 : DINT;
		CyclCnt1000 : DINT;
		PCOSHBCycDiff1000 : DINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK KRC_Error
	VAR_INPUT
		AxisGroupIdx : INT;
		KRC_AxisGroupRefArr : REFERENCE TO AXIS_GROUP_REF_ARR;
		MessageReset : BOOL;
	END_VAR
	VAR_OUTPUT
		Error : BOOL;
		ErrorID : DINT;
		NoHeartbeatKRC : BOOL;
		NoHeartbeatPCOS : BOOL;
		NotOnline : BOOL;
		NotInitialized : BOOL;
		NoOpModeExt : BOOL;
		NoMoveEnable : BOOL;
		UserSafeNotOK : BOOL;
		KrcErrorActive : BOOL;
		DrivesNotReady : BOOL;
		NoProgActive : BOOL;
	END_VAR
	VAR
		KRC_ReadMXAError_1 : KRC_ReadMXAError;
		KRC_MessageReset_1 : KRC_MessageReset;
		TON_ON : TON;
		TON_OFF : TON;
		TON_HBSub : TON;
		TON_HBPCOS : TON;
		EnableTONSubmit : BOOL;
		EnableTONPCOS : BOOL;
		m_HeartbeatLast : INT;
		m_HeartbeatLastPCOS : INT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK KRC_Forward
	VAR_INPUT
		AxisGroupIdx : INT;
		KRC_AxisGroupRefArr : REFERENCE TO AXIS_GROUP_REF_ARR;
		ExecuteCmd : BOOL;
		Axis_Values : E6AXIS;
		CheckSoftEnd : BOOL;
		BufferMode : INT;
	END_VAR
	VAR_OUTPUT
		Busy : BOOL;
		Done : BOOL;
		Position : E6POS;
		Aborted : BOOL;
		Error : BOOL;
		ErrorID : DINT;
	END_VAR
	VAR
		nState : INT;
		mxA_ExecuteCommand_0 : mxA_ExecuteCommand;
		mxA_ExecuteCommand_1 : mxA_ExecuteCommand;
		mxA_ExecuteCommand_2 : mxA_ExecuteCommand;
		nOrderID : DINT;
		ERR_STATUS : REAL;
		m_Position : E6POS;
		nErr : INT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK KRC_GetAdvance
	VAR_INPUT
		AxisGroupIdx : INT;
		KRC_AxisGroupRefArr : REFERENCE TO AXIS_GROUP_REF_ARR;
		ExecuteCmd : BOOL;
	END_VAR
	VAR_OUTPUT
		Done : BOOL;
		Count : INT;
		MaxWaitTime : INT;
		Mode : INT;
		Error : BOOL;
		ErrorID : DINT;
	END_VAR
	VAR
		mxA_ExecuteCommand : mxA_ExecuteCommand;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK KRC_Initialize (*TODO: Add your comment here*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		AxisGroupIdx : INT;
		KRC_AxisGroupRefArr : REFERENCE TO AXIS_GROUP_REF_ARR;
	END_VAR
	VAR_OUTPUT
		Done : BOOL;
		Error : BOOL;
		ErrorID : DINT;
		KRC_Serial : DINT;
		KRC_Major : DINT;
		KRC_Minor : DINT;
		KRC_Revision : DINT;
		PLC_Major : DINT;
		PLC_Minor : DINT;
		PLC_Revision : DINT;
	END_VAR
	VAR
		mxA_ExecuteCommand : mxA_ExecuteCommand;
		mxA_ResetCommand : mxA_ResetCommand;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK KRC_Interrupt
	VAR_INPUT
		AxisGroupIdx : INT;
		KRC_AxisGroupRefArr : REFERENCE TO AXIS_GROUP_REF_ARR;
		Execute : BOOL;
		Fast : BOOL;
	END_VAR
	VAR_OUTPUT
		BrakeActive : BOOL;
		Error : BOOL;
		ErrorID : DINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK KRC_Inverse
	VAR_INPUT
		AxisGroupIdx : INT;
		KRC_AxisGroupRefArr : REFERENCE TO AXIS_GROUP_REF_ARR;
		ExecuteCmd : BOOL;
		Position : E6POS;
		PosValidS : BOOL;
		PosValidT : BOOL;
		Start_Axis : E6AXIS;
		CheckSoftEnd : BOOL;
		BufferMode : INT;
	END_VAR
	VAR_OUTPUT
		Busy : BOOL;
		Done : BOOL;
		AxisPosition : E6AXIS;
		Aborted : BOOL;
		Error : BOOL;
		ErrorID : DINT;
	END_VAR
	VAR
		nState : INT;
		mxA_ExecuteCommand_0 : mxA_ExecuteCommand;
		mxA_ExecuteCommand_1 : mxA_ExecuteCommand;
		mxA_ExecuteCommand_2 : mxA_ExecuteCommand;
		nOrderID : DINT;
		ERR_STATUS : REAL;
		m_Position : E6AXIS;
		nErr : INT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK KRC_Jog
	VAR_INPUT
		AxisGroupIdx : INT;
		KRC_AxisGroupRefArr : REFERENCE TO AXIS_GROUP_REF_ARR;
		MoveType : INT;
		Velocity : INT;
		Acceleration : INT;
		Increment : REAL;
		A1_X_P : BOOL;
		A1_X_M : BOOL;
		A2_Y_P : BOOL;
		A2_Y_M : BOOL;
		A3_Z_P : BOOL;
		A3_Z_M : BOOL;
		A4_A_P : BOOL;
		A4_A_M : BOOL;
		A5_B_P : BOOL;
		A5_B_M : BOOL;
		A6_C_P : BOOL;
		A6_C_M : BOOL;
		E1_P : BOOL;
		E1_M : BOOL;
		E2_P : BOOL;
		E2_M : BOOL;
		E3_P : BOOL;
		E3_M : BOOL;
		E4_P : BOOL;
		E4_M : BOOL;
		E5_P : BOOL;
		E5_M : BOOL;
		E6_P : BOOL;
		E6_M : BOOL;
		CoordinateSystem : COORDSYS;
	END_VAR
	VAR_OUTPUT
		Busy : BOOL;
		Active : BOOL;
		Done : BOOL;
		Aborted : BOOL;
		Error : BOOL;
		ErrorID : DINT;
	END_VAR
	VAR
		KRC_Move_1 : KRC_Move;
		KRC_Abort_1 : KRC_Abort;
		m_Position : E6POS;
		m_AxisPosition : E6AXIS;
		m_MoveType : INT;
		m_ExecuteCmd : BOOL;
		m_CmdInputActive : BOOL;
		m_CmdInputActiveLast : BOOL;
		m_CmdInputActiveChanged : BOOL;
		m_CmdInputChanged : BOOL;
		m_IncrementActive : BOOL;
		m_MaxDelta : REAL;
		m_ExecuteAbort : BOOL;
		A1_X_P_Last : BOOL;
		A1_X_M_Last : BOOL;
		A2_Y_P_Last : BOOL;
		A2_Y_M_Last : BOOL;
		A3_Z_P_Last : BOOL;
		A3_Z_M_Last : BOOL;
		A4_A_P_Last : BOOL;
		A4_A_M_Last : BOOL;
		A5_B_P_Last : BOOL;
		A5_B_M_Last : BOOL;
		A6_C_P_Last : BOOL;
		A6_C_M_Last : BOOL;
		E1_P_Last : BOOL;
		E1_M_Last : BOOL;
		E2_P_Last : BOOL;
		E2_M_Last : BOOL;
		E3_P_Last : BOOL;
		E3_M_Last : BOOL;
		E4_P_Last : BOOL;
		E4_M_Last : BOOL;
		E5_P_Last : BOOL;
		E5_M_Last : BOOL;
		E6_P_Last : BOOL;
		E6_M_Last : BOOL;
		m_ExecuteCmd_Finished : BOOL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK KRC_JogLinearRelative
	VAR_INPUT
		AxisGroupIdx : INT;
		KRC_AxisGroupRefArr : REFERENCE TO AXIS_GROUP_REF_ARR;
		ExecuteCmd : BOOL;
		Position : E6POS;
		Velocity : INT;
		Acceleration : INT;
		CoordinateSystem : COORDSYS;
		OriType : INT;
	END_VAR
	VAR_OUTPUT
		Busy : BOOL;
		Active : BOOL;
		Done : BOOL;
		Aborted : BOOL;
		Error : BOOL;
		ErrorID : DINT;
	END_VAR
	VAR
		KRC_Move_1 : KRC_Move;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK KRC_JogToolRelative
	VAR_INPUT
		AxisGroupIdx : INT;
		KRC_AxisGroupRefArr : REFERENCE TO AXIS_GROUP_REF_ARR;
		ExecuteCmd : BOOL;
		Position : E6POS;
		Velocity : INT;
		Acceleration : INT;
		CoordinateSystem : COORDSYS;
		OriType : INT;
	END_VAR
	VAR_OUTPUT
		Busy : BOOL;
		Active : BOOL;
		Done : BOOL;
		Aborted : BOOL;
		Error : BOOL;
		ErrorID : DINT;
	END_VAR
	VAR
		KRC_Move_1 : KRC_Move;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK KRC_MasRef
	VAR_INPUT
		AxisGroupIdx : INT;
		KRC_AxisGroupRefArr : REFERENCE TO AXIS_GROUP_REF_ARR;
		ExecuteCmd : BOOL;
		Position : E6POS;
		Velocity : INT;
		Acceleration : INT;
		CoordinateSystem : COORDSYS;
		BufferMode : INT;
	END_VAR
	VAR_OUTPUT
		Busy : BOOL;
		Active : BOOL;
		Done : BOOL;
		Aborted : BOOL;
		Error : BOOL;
		ErrorID : DINT;
		MasRefRequest : BOOL;
	END_VAR
	VAR
		KRC_Move_1 : KRC_Move;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK KRC_MessageReset
	VAR_INPUT
		AxisGroupIdx : INT;
		KRC_AxisGroupRefArr : REFERENCE TO AXIS_GROUP_REF_ARR;
		MessageReset : BOOL;
	END_VAR
	VAR_OUTPUT
		Error : BOOL;
		ErrorID : DINT;
	END_VAR
	VAR
		i : INT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK KRC_Move
	VAR_INPUT
		AxisGroupIdx : INT;
		KRC_AxisGroupRefArr : REFERENCE TO AXIS_GROUP_REF_ARR;
		CmdID : DINT := 1;
		ExecuteCmd : BOOL;
		MoveType : INT;
		Position : E6POS;
		CircHP : E6POS;
		AxisPosition : E6AXIS;
		Velocity : INT;
		Acceleration : INT;
		AbsoluteAcceleration : REAL;
		CoordinateSystem : COORDSYS;
		OriType : INT;
		Approximate : APO;
		CircType : INT;
		CircAngle : REAL;
		PosValidX : BOOL;
		PosValidY : BOOL;
		PosValidZ : BOOL;
		PosValidA : BOOL;
		PosValidB : BOOL;
		PosValidC : BOOL;
		PosValidE1 : BOOL;
		PosValidE2 : BOOL;
		PosValidE3 : BOOL;
		PosValidE4 : BOOL;
		PosValidE5 : BOOL;
		PosValidE6 : BOOL;
		PosValidS : BOOL;
		PosValidT : BOOL;
		BufferMode : INT;
	END_VAR
	VAR_OUTPUT
		Busy : BOOL;
		Active : BOOL;
		Done : BOOL;
		Aborted : BOOL;
		Error : BOOL;
		ErrorID : DINT;
	END_VAR
	VAR
		mxA_ExecuteCommand_1 : mxA_ExecuteCommand;
		CommandSize : INT;
		AbsoluteVelocity : INT;
		m_Velocity : DINT;
		m_Acceleration : DINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK KRC_MoveAxisAbsolute
	VAR_INPUT
		AxisGroupIdx : INT;
		KRC_AxisGroupRefArr : REFERENCE TO AXIS_GROUP_REF_ARR;
		ExecuteCmd : BOOL;
		AxisPosition : E6AXIS;
		Velocity : INT;
		Acceleration : INT;
		Approximate : APO;
		BufferMode : INT;
	END_VAR
	VAR_OUTPUT
		Busy : BOOL;
		Active : BOOL;
		Done : BOOL;
		Aborted : BOOL;
		Error : BOOL;
		ErrorID : DINT;
	END_VAR
	VAR
		KRC_Move : KRC_Move;
		m_CircHP : E6POS;
		m_Position : E6POS;
		m_OriType : INT;
		m_CoordinateSystem : COORDSYS;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK KRC_MoveCircAbsolute
	VAR_INPUT
		AxisGroupIdx : INT;
		KRC_AxisGroupRefArr : REFERENCE TO AXIS_GROUP_REF_ARR;
		ExecuteCmd : BOOL;
		Position : E6POS;
		CircHP : E6POS;
		Angle : REAL;
		Velocity : INT;
		Acceleration : INT;
		CoordinateSystem : COORDSYS;
		OriType : INT;
		CircType : INT;
		Approximate : APO;
		BufferMode : INT;
	END_VAR
	VAR_OUTPUT
		Busy : BOOL;
		Active : BOOL;
		Done : BOOL;
		Aborted : BOOL;
		Error : BOOL;
		ErrorID : DINT;
	END_VAR
	VAR
		KRC_Move : KRC_Move;
		m_CoordinateSystem : COORDSYS;
		m_AxisPosition : E6AXIS;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK KRC_MoveCircRelative
	VAR_INPUT
		AxisGroupIdx : INT;
		KRC_AxisGroupRefArr : REFERENCE TO AXIS_GROUP_REF_ARR;
		ExecuteCmd : BOOL;
		Position : E6POS;
		CircHP : E6POS;
		Angle : REAL;
		Velocity : INT;
		Acceleration : INT;
		CoordinateSystem : COORDSYS;
		OriType : INT;
		CircType : INT;
		Approximate : APO;
		BufferMode : INT;
	END_VAR
	VAR_OUTPUT
		Busy : BOOL;
		Active : BOOL;
		Done : BOOL;
		Aborted : BOOL;
		Error : BOOL;
		ErrorID : DINT;
	END_VAR
	VAR
		KRC_Move : KRC_Move;
		m_CoordinateSystem : COORDSYS;
		m_AxisPosition : E6AXIS;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK KRC_MoveDirectAbsolute
	VAR_INPUT
		AxisGroupIdx : INT;
		KRC_AxisGroupRefArr : REFERENCE TO AXIS_GROUP_REF_ARR;
		ExecuteCmd : BOOL;
		Position : E6POS;
		Velocity : INT;
		Acceleration : INT;
		CoordinateSystem : COORDSYS;
		Approximate : APO;
		BufferMode : INT;
	END_VAR
	VAR_OUTPUT
		Busy : BOOL;
		Active : BOOL;
		Done : BOOL;
		Aborted : BOOL;
		Error : BOOL;
		ErrorID : DINT;
	END_VAR
	VAR
		KRC_Move : KRC_Move;
		m_CircHP : E6POS;
		m_AxisPosition : E6AXIS;
		m_OriType : INT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK KRC_MoveDirectRelative
	VAR_INPUT
		AxisGroupIdx : INT;
		KRC_AxisGroupRefArr : REFERENCE TO AXIS_GROUP_REF_ARR;
		ExecuteCmd : BOOL;
		Position : E6POS;
		Velocity : INT;
		Acceleration : INT;
		CoordinateSystem : COORDSYS;
		Approximate : APO;
		BufferMode : INT;
	END_VAR
	VAR_OUTPUT
		Busy : BOOL;
		Active : BOOL;
		Done : BOOL;
		Aborted : BOOL;
		Error : BOOL;
		ErrorID : DINT;
	END_VAR
	VAR
		KRC_Move : KRC_Move;
		m_CircHP : E6POS;
		m_AxisPosition : E6AXIS;
		m_OriType : INT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK KRC_MoveLinearAbsolute
	VAR_INPUT
		AxisGroupIdx : INT;
		KRC_AxisGroupRefArr : REFERENCE TO AXIS_GROUP_REF_ARR;
		ExecuteCmd : BOOL;
		Position : E6POS;
		Velocity : INT;
		Acceleration : INT;
		CoordinateSystem : COORDSYS;
		OriType : INT;
		Approximate : APO;
		BufferMode : INT;
	END_VAR
	VAR_OUTPUT
		Busy : BOOL;
		Active : BOOL;
		Done : BOOL;
		Aborted : BOOL;
		Error : BOOL;
		ErrorID : DINT;
	END_VAR
	VAR
		KRC_Move : KRC_Move;
		m_CircHP : E6POS;
		m_AxisPosition : E6AXIS;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK KRC_MoveLinearRelative
	VAR_INPUT
		AxisGroupIdx : INT;
		KRC_AxisGroupRefArr : REFERENCE TO AXIS_GROUP_REF_ARR;
		ExecuteCmd : BOOL;
		Position : E6POS;
		Velocity : INT;
		Acceleration : INT;
		CoordinateSystem : COORDSYS;
		OriType : INT;
		Approximate : APO;
		BufferMode : INT;
	END_VAR
	VAR_OUTPUT
		Busy : BOOL;
		Active : BOOL;
		Done : BOOL;
		Aborted : BOOL;
		Error : BOOL;
		ErrorID : DINT;
	END_VAR
	VAR
		KRC_Move : KRC_Move;
		m_CircHP : E6POS;
		m_AxisPosition : E6AXIS;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK KRC_ReadActualAcceleration
	VAR_INPUT
		AxisGroupIdx : INT;
		KRC_AxisGroupRefArr : REFERENCE TO AXIS_GROUP_REF_ARR;
		ExecuteCmd : BOOL;
	END_VAR
	VAR_OUTPUT
		Done : BOOL;
		Error : BOOL;
		ErrorID : DINT;
		Acc_ABS : REAL;
		X : REAL;
		Y : REAL;
		Z : REAL;
		A : REAL;
		B : REAL;
		C : REAL;
	END_VAR
	VAR
		mxA_ExecuteCommand : mxA_ExecuteCommand;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK KRC_ReadActualAxisPosition
	VAR_INPUT
		AxisGroupIdx : INT;
		KRC_AxisGroupRefArr : REFERENCE TO AXIS_GROUP_REF_ARR;
	END_VAR
	VAR_OUTPUT
		Valid : BOOL;
		AxisPosition : E6AXIS;
		A1 : REAL;
		A2 : REAL;
		A3 : REAL;
		A4 : REAL;
		A5 : REAL;
		A6 : REAL;
		E1 : REAL;
		E2 : REAL;
		E3 : REAL;
		E4 : REAL;
		E5 : REAL;
		E6 : REAL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK KRC_ReadActualAxisVelocity
	VAR_INPUT
		AxisGroupIdx : INT;
		KRC_AxisGroupRefArr : REFERENCE TO AXIS_GROUP_REF_ARR;
		ExecuteCmd : BOOL;
	END_VAR
	VAR_OUTPUT
		Done : BOOL;
		Error : BOOL;
		ErrorID : DINT;
		A1 : INT;
		A2 : INT;
		A3 : INT;
		A4 : INT;
		A5 : INT;
		A6 : INT;
		E1 : INT;
		E2 : INT;
		E3 : INT;
		E4 : INT;
		E5 : INT;
		E6 : INT;
	END_VAR
	VAR
		mxA_ExecuteCommand : mxA_ExecuteCommand;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK KRC_ReadActualPosition
	VAR_INPUT
		AxisGroupIdx : INT;
		KRC_AxisGroupRefArr : REFERENCE TO AXIS_GROUP_REF_ARR;
	END_VAR
	VAR_OUTPUT
		Valid : BOOL;
		Position : E6POS;
		X : REAL;
		Y : REAL;
		Z : REAL;
		A : REAL;
		B : REAL;
		C : REAL;
		Status : INT;
		Turn : INT;
		Tool : INT;
		Base : INT;
		IPOMode : INT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK KRC_ReadActualVelocity
	VAR_INPUT
		AxisGroupIdx : INT;
		KRC_AxisGroupRefArr : REFERENCE TO AXIS_GROUP_REF_ARR;
	END_VAR
	VAR_OUTPUT
		Valid : BOOL;
		Value : REAL;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK KRC_ReadAnalogInput
	VAR_INPUT
		AxisGroupIdx : INT;
		KRC_AxisGroupRefArr : REFERENCE TO AXIS_GROUP_REF_ARR;
		ExecuteCmd : BOOL;
		Number : INT;
	END_VAR
	VAR_OUTPUT
		Done : BOOL;
		Value : REAL;
		Error : BOOL;
		ErrorID : DINT;
	END_VAR
	VAR
		mxA_ExecuteCommand : mxA_ExecuteCommand;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK KRC_ReadAnalogOutput
	VAR_INPUT
		AxisGroupIdx : INT;
		KRC_AxisGroupRefArr : REFERENCE TO AXIS_GROUP_REF_ARR;
		ExecuteCmd : BOOL;
		Number : INT;
	END_VAR
	VAR_OUTPUT
		Done : BOOL;
		Value : REAL;
		Error : BOOL;
		ErrorID : DINT;
	END_VAR
	VAR
		mxA_ExecuteCommand : mxA_ExecuteCommand;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK KRC_ReadAxisGroup
	VAR_INPUT
		KRC4_Input : REFERENCE TO ARRAY[0..254] OF BYTE;
		KRC_AxisGroupRefArr : REFERENCE TO AXIS_GROUP_REF_ARR;
		AxisGroupIdx : INT;
	END_VAR
	VAR_OUTPUT
		Error : BOOL;
		ErrorID : DINT;
	END_VAR
	VAR
		m_AE_RC_RDY1 : BOOL;
		m_AE_ALARM_STOP : BOOL;
		m_AE_USER_SAF : BOOL;
		m_AE_PERI_RDY : BOOL;
		m_AE_ROB_CAL : BOOL;
		m_AE_IO_ACTCONF : BOOL;
		m_AE_STOPMESS : BOOL;
		m_AE_PGNO_FBIT_REFL : BOOL;
		m_AE_INT_ESTOP : BOOL;
		m_AE_PRO_ACT : BOOL;
		m_AE_PGNO_REQ : BOOL;
		m_AE_APPL_RUN : BOOL;
		m_AE_PRO_MOVE : BOOL;
		m_AE_IN_HOME : BOOL;
		m_AE_ON_PATH : BOOL;
		m_AE_NEAR_POSRET : BOOL;
		m_AE_ROB_STOPPED : BOOL;
		m_AE_T1 : BOOL;
		m_AE_T2 : BOOL;
		m_AE_AUT : BOOL;
		m_AE_EXT : BOOL;
		m_BRAKETEST_MONTIME : BOOL;
		m_BRAKETEST_REQ_INT : BOOL;
		m_BRAKETEST_WORK : BOOL;
		m_BRAKES_OK : BOOL;
		m_BRAKETEST_WARN : BOOL;
		m_Reserve2075 : BOOL;
		m_BRAKEACTIVE : BOOL;
		m_KCP_CONNECT : BOOL;
		m_TouchUp : BOOL;
		m_MASTEST_REQ_INT : BOOL;
		m_MASTESTSWITCH_OK : BOOL;
		m_POS_ACT_VALID : BOOL;
		m_HeartbeatSubmit : INT;
		m_IN_VAL_1To8 : INT;
		m_TouchUp_PosNo : INT;
		m_SR_Order1_ID : DINT;
		m_SR_Order2_ID : DINT;
		m_SR_Order3_ID : DINT;
		m_SR_Order4_ID : DINT;
		m_SR_Order5_ID : DINT;
		m_SR_Order6_ID : DINT;
		m_SR_Order7_ID : DINT;
		m_SR_Order8_ID : DINT;
		m_SR_Order9_ID : DINT;
		m_SR_Order10_ID : DINT;
		m_SR_Order1_State : INT;
		m_SR_Order2_State : INT;
		m_SR_Order3_State : INT;
		m_SR_Order4_State : INT;
		m_SR_Order5_State : INT;
		m_SR_Order6_State : INT;
		m_SR_Order7_State : INT;
		m_SR_Order8_State : INT;
		m_SR_Order9_State : INT;
		m_SR_Order10_State : INT;
		m_HeartbeatPCOS : INT;
		m_Override : INT;
		m_PosAct_X : REAL;
		m_PosAct_Y : REAL;
		m_PosAct_Z : REAL;
		m_PosAct_A : REAL;
		m_PosAct_B : REAL;
		m_PosAct_C : REAL;
		m_PosAct_Status : DINT;
		m_PosAct_Turn : INT;
		m_ToolAct : SINT;
		m_BaseAct : SINT;
		m_IPOMode : INT;
		m_AxisAct_A1 : REAL;
		m_AxisAct_A2 : REAL;
		m_AxisAct_A3 : REAL;
		m_AxisAct_A4 : REAL;
		m_AxisAct_A5 : REAL;
		m_AxisAct_A6 : REAL;
		m_AxisAct_A7 : REAL;
		m_AxisAct_A8 : REAL;
		m_AxisAct_A9 : REAL;
		m_AxisAct_A10 : REAL;
		m_AxisAct_A11 : REAL;
		m_AxisAct_A12 : REAL;
		m_VelAct : REAL;
		m_VelAxis_A1 : SINT;
		m_VelAxis_A2 : SINT;
		m_VelAxis_A3 : SINT;
		m_VelAxis_A4 : SINT;
		m_VelAxis_A5 : SINT;
		m_VelAxis_A6 : SINT;
		m_VelAxis_A7 : SINT;
		m_VelAxis_A8 : SINT;
		m_VelAxis_A9 : SINT;
		m_VelAxis_A10 : SINT;
		m_VelAxis_A11 : SINT;
		m_VelAxis_A12 : SINT;
		m_GroupState : INT;
		m_ErrorID : INT;
		m_ErrorIDSub : INT;
		m_ActivePosOrderID : DINT;
		m_ActiveOrderIDB : DINT;
		m_QueueCount : INT;
		m_IR_Status1 : INT;
		m_IR_Status2 : INT;
		m_IR_Status3 : INT;
		m_IR_Status4 : INT;
		m_IR_Status5 : INT;
		m_IR_Status6 : INT;
		m_IR_Status7 : INT;
		m_IR_Status8 : INT;
		m_ErrorIDPcos : INT;
		m_FREE_FOR_WOV : INT;
		m_TransmissionNoRet : INT;
		m_OrderIdRet : DINT;
		m_CmdIdRet : DINT;
		m_CmdDataRetCS : DINT;
		m_Reserve190 : DINT;
		m_CmdDataRet1 : REAL;
		m_CmdDataRet2 : REAL;
		m_CmdDataRet3 : REAL;
		m_CmdDataRet4 : REAL;
		m_CmdDataRet5 : REAL;
		m_CmdDataRet6 : REAL;
		m_CmdDataRet7 : REAL;
		m_CmdDataRet8 : REAL;
		m_CmdDataRet9 : REAL;
		m_CmdDataRet10 : REAL;
		m_CmdDataRet11 : REAL;
		m_CmdDataRet12 : REAL;
		m_Reserve242 : DINT;
		nCheckSum : DWORD;
		fTmp : REAL;
		nTMP1 : DINT;
		fTMP1 : REAL;
		bTMP1 : BOOL;
		i : INT;
		onF_TRIG : BOOL;
		EnableTONSubmit : BOOL;
		EnableTONPCOS : BOOL;
		m_InitOK : BOOL;
		m_HeartbeatLast : INT;
		m_HeartbeatLastPCOS : INT;
		HeartBeatTO : TIME;
		TON_1 : TON;
		TON_2 : TON;
		m_LastOrderID : DINT;
		R_TRIG_1 : R_TRIG;
		m_ConnectionOK : BOOL;
		m_F_TRIG : BOOL;
		m_FirstCycles : INT;
		mxA_ResetCommand : mxA_ResetCommand;
		m_Workstates : INT;
		m_AxWorkstates : INT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK KRC_ReadAxWorkspace
	VAR_INPUT
		AxisGroupIdx : INT;
		KRC_AxisGroupRefArr : REFERENCE TO AXIS_GROUP_REF_ARR;
		ExecuteCmd : BOOL;
		WorkspaceNo : INT;
	END_VAR
	VAR_OUTPUT
		Done : BOOL;
		WorkspaceMode : INT;
		WorkspaceData : AXBOX;
		Error : BOOL;
		ErrorID : DINT;
	END_VAR
	VAR
		nState : INT;
		mxA_ExecuteCommand_0 : mxA_ExecuteCommand;
		mxA_ExecuteCommand_1 : mxA_ExecuteCommand;
		mxA_ExecuteCommand_2 : mxA_ExecuteCommand;
		m_WorkspaceMode : INT;
		m_WorkspaceData : AXBOX;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK KRC_ReadBaseData
	VAR_INPUT
		AxisGroupIdx : INT;
		KRC_AxisGroupRefArr : REFERENCE TO AXIS_GROUP_REF_ARR;
		ExecuteCmd : BOOL;
		BaseNo : INT;
	END_VAR
	VAR_OUTPUT
		Done : BOOL;
		BaseData : FRAME;
		Error : BOOL;
		ErrorID : DINT;
	END_VAR
	VAR
		mxA_ExecuteCommand : mxA_ExecuteCommand;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK KRC_ReadDigitalInput
	VAR_INPUT
		AxisGroupIdx : INT;
		KRC_AxisGroupRefArr : REFERENCE TO AXIS_GROUP_REF_ARR;
		ExecuteCmd : BOOL;
		Number : INT;
	END_VAR
	VAR_OUTPUT
		Done : BOOL;
		Value : BOOL;
		Error : BOOL;
		ErrorID : DINT;
	END_VAR
	VAR
		mxA_ExecuteCommand : mxA_ExecuteCommand;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK KRC_ReadDigitalInput1To8
	VAR_INPUT
		AxisGroupIdx : INT;
		KRC_AxisGroupRefArr : REFERENCE TO AXIS_GROUP_REF_ARR;
	END_VAR
	VAR_OUTPUT
		Valid : BOOL;
		IN1 : BOOL;
		IN2 : BOOL;
		IN3 : BOOL;
		IN4 : BOOL;
		IN5 : BOOL;
		IN6 : BOOL;
		IN7 : BOOL;
		IN8 : BOOL;
		Error : BOOL;
		ErrorID : DINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK KRC_ReadDigitalInputArray
	VAR_INPUT
		AxisGroupIdx : INT;
		KRC_AxisGroupRefArr : REFERENCE TO AXIS_GROUP_REF_ARR;
		ExecuteCmd : BOOL;
		Startnumber : INT;
		Length : INT;
	END_VAR
	VAR_OUTPUT
		Done : BOOL;
		Values : ARRAY[1..200] OF BOOL;
		Error : BOOL;
		ErrorID : DINT;
	END_VAR
	VAR
		DW1 : DWORD;
		DW2 : DWORD;
		DW3 : DWORD;
		DW4 : DWORD;
		DW5 : DWORD;
		DW6 : DWORD;
		DW7 : DWORD;
		DW8 : DWORD;
		DW9 : DWORD;
		DW10 : DWORD;
		mxA_ExecuteCommand : mxA_ExecuteCommand;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK KRC_ReadDigitalOutput
	VAR_INPUT
		AxisGroupIdx : INT;
		KRC_AxisGroupRefArr : REFERENCE TO AXIS_GROUP_REF_ARR;
		ExecuteCmd : BOOL;
		Number : INT;
	END_VAR
	VAR_OUTPUT
		Done : BOOL;
		Value : BOOL;
		Error : BOOL;
		ErrorID : DINT;
	END_VAR
	VAR
		mxA_ExecuteCommand : mxA_ExecuteCommand;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK KRC_ReadInterruptState
	VAR_INPUT
		AxisGroupIdx : INT;
		KRC_AxisGroupRefArr : REFERENCE TO AXIS_GROUP_REF_ARR;
		Interrupt : INT;
	END_VAR
	VAR_OUTPUT
		Valid : BOOL;
		Value : INT;
		Error : BOOL;
		ErrorID : DINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK KRC_ReadKRCError
	VAR_INPUT
		AxisGroupIdx : INT;
		KRC_AxisGroupRefArr : REFERENCE TO AXIS_GROUP_REF_ARR;
		ExecuteCmd : BOOL;
		Offset : INT;
	END_VAR
	VAR_OUTPUT
		Done : BOOL;
		Error : BOOL;
		ErrorID : DINT;
		STOPMESS : BOOL;
		MessageCount : INT;
		Message1 : DINT;
		Message2 : DINT;
		Message3 : DINT;
		Message4 : DINT;
		Message5 : DINT;
		Message6 : DINT;
		Message7 : DINT;
		Message8 : DINT;
		Message9 : DINT;
		Message10 : DINT;
	END_VAR
	VAR
		mxA_ExecuteCommand : mxA_ExecuteCommand;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK KRC_ReadLoadData
	VAR_INPUT
		AxisGroupIdx : INT;
		KRC_AxisGroupRefArr : REFERENCE TO AXIS_GROUP_REF_ARR;
		ExecuteCmd : BOOL;
		Tool : INT;
	END_VAR
	VAR_OUTPUT
		Done : BOOL;
		M : REAL;
		X : REAL;
		Y : REAL;
		Z : REAL;
		A : REAL;
		B : REAL;
		C : REAL;
		JX : REAL;
		JY : REAL;
		JZ : REAL;
		Error : BOOL;
		ErrorID : DINT;
	END_VAR
	VAR
		mxA_ExecuteCommand : mxA_ExecuteCommand;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK KRC_ReadMXAError
	VAR_INPUT
		AxisGroupIdx : INT;
		KRC_AxisGroupRefArr : REFERENCE TO AXIS_GROUP_REF_ARR;
	END_VAR
	VAR_OUTPUT
		Error : BOOL;
		ErrorID : DINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK KRC_ReadMXAStatus
	VAR_INPUT
		AxisGroupIdx : INT;
		KRC_AxisGroupRefArr : REFERENCE TO AXIS_GROUP_REF_ARR;
	END_VAR
	VAR_OUTPUT
		Status : INT;
		Error : BOOL;
		ErrorID : DINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK KRC_ReadSafeOPStatus
	VAR_INPUT
		AxisGroupIdx : INT;
		KRC_AxisGroupRefArr : REFERENCE TO AXIS_GROUP_REF_ARR;
		MASTERINGTEST_REQ_EXT : BOOL;
		BRAKETEST_REQ_EXT : BOOL;
	END_VAR
	VAR_OUTPUT
		Valid : BOOL;
		BRAKETEST_REQ_INT : BOOL;
		MASTERINGTEST_REQ_INT : BOOL;
		BRAKETEST_MONTIME : BOOL;
		BRAKETEST_WORK : BOOL;
		BRAKES_OK : BOOL;
		BRAKETEST_WARN : BOOL;
		MASTERINGTESTSWITCH_OK : BOOL;
		Error : BOOL;
		ErrorID : DINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK KRC_ReadSoftEnd
	VAR_INPUT
		AxisGroupIdx : INT;
		KRC_AxisGroupRefArr : REFERENCE TO AXIS_GROUP_REF_ARR;
		ExecuteCmd : BOOL;
	END_VAR
	VAR_OUTPUT
		Done : BOOL;
		A1_Min : REAL;
		A1_Max : REAL;
		A2_Min : REAL;
		A2_Max : REAL;
		A3_Min : REAL;
		A3_Max : REAL;
		A4_Min : REAL;
		A4_Max : REAL;
		A5_Min : REAL;
		A5_Max : REAL;
		A6_Min : REAL;
		A6_Max : REAL;
		Error : BOOL;
		ErrorID : DINT;
	END_VAR
	VAR
		mxA_ExecuteCommand : mxA_ExecuteCommand;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK KRC_ReadSoftEndExt
	VAR_INPUT
		AxisGroupIdx : INT;
		KRC_AxisGroupRefArr : REFERENCE TO AXIS_GROUP_REF_ARR;
		ExecuteCmd : BOOL;
	END_VAR
	VAR_OUTPUT
		Done : BOOL;
		E1_Min : REAL;
		E1_Max : REAL;
		E2_Min : REAL;
		E2_Max : REAL;
		E3_Min : REAL;
		E3_Max : REAL;
		E4_Min : REAL;
		E4_Max : REAL;
		E5_Min : REAL;
		E5_Max : REAL;
		E6_Min : REAL;
		E6_Max : REAL;
		Error : BOOL;
		ErrorID : DINT;
	END_VAR
	VAR
		mxA_ExecuteCommand : mxA_ExecuteCommand;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK KRC_ReadSysVar
	VAR_INPUT
		AxisGroupIdx : INT;
		KRC_AxisGroupRefArr : REFERENCE TO AXIS_GROUP_REF_ARR;
		ExecuteCmd : BOOL;
		Index : INT;
	END_VAR
	VAR_OUTPUT
		Done : BOOL;
		Error : BOOL;
		ErrorID : DINT;
		Value1 : REAL;
		Value2 : REAL;
		Value3 : REAL;
		Value4 : REAL;
		Value5 : REAL;
		Value6 : REAL;
		Value7 : REAL;
		Value8 : REAL;
		Value9 : REAL;
		Value10 : REAL;
	END_VAR
	VAR
		mxA_ExecuteCommand : mxA_ExecuteCommand;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK KRC_ReadToolData
	VAR_INPUT
		AxisGroupIdx : INT;
		KRC_AxisGroupRefArr : REFERENCE TO AXIS_GROUP_REF_ARR;
		ExecuteCmd : BOOL;
		ToolNo : INT;
	END_VAR
	VAR_OUTPUT
		Done : BOOL;
		ToolData : FRAME;
		Error : BOOL;
		ErrorID : DINT;
	END_VAR
	VAR
		mxA_ExecuteCommand : mxA_ExecuteCommand;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK KRC_ReadTouchUPState
	VAR_INPUT
		AxisGroupIdx : INT;
		KRC_AxisGroupRefArr : REFERENCE TO AXIS_GROUP_REF_ARR;
	END_VAR
	VAR_OUTPUT
		Valid : BOOL;
		TouchUP : BOOL;
		Index : INT;
		Error : BOOL;
		ErrorID : DINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK KRC_ReadWorkspace
	VAR_INPUT
		AxisGroupIdx : INT;
		KRC_AxisGroupRefArr : REFERENCE TO AXIS_GROUP_REF_ARR;
		ExecuteCmd : BOOL;
		WorkspaceNo : INT;
	END_VAR
	VAR_OUTPUT
		Done : BOOL;
		WorkspaceMode : INT;
		WorkspaceData : BOX;
		Error : BOOL;
		ErrorID : DINT;
	END_VAR
	VAR
		nState : INT;
		mxA_ExecuteCommand_0 : mxA_ExecuteCommand;
		mxA_ExecuteCommand_1 : mxA_ExecuteCommand;
		m_WorkspaceMode : INT;
		m_WorkspaceData : BOX;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK KRC_ReadWorkstates
	VAR_INPUT
		AxisGroupIdx : INT;
		KRC_AxisGroupRefArr : REFERENCE TO AXIS_GROUP_REF_ARR;
	END_VAR
	VAR_OUTPUT
		Valid : BOOL;
		WORKSTATE1 : BOOL;
		WORKSTATE2 : BOOL;
		WORKSTATE3 : BOOL;
		WORKSTATE4 : BOOL;
		WORKSTATE5 : BOOL;
		WORKSTATE6 : BOOL;
		WORKSTATE7 : BOOL;
		WORKSTATE8 : BOOL;
		AXWORKSTATE1 : BOOL;
		AXWORKSTATE2 : BOOL;
		AXWORKSTATE3 : BOOL;
		AXWORKSTATE4 : BOOL;
		AXWORKSTATE5 : BOOL;
		AXWORKSTATE6 : BOOL;
		AXWORKSTATE7 : BOOL;
		AXWORKSTATE8 : BOOL;
		Error : BOOL;
		ErrorID : DINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK KRC_SetAdvance
	VAR_INPUT
		AxisGroupIdx : INT;
		KRC_AxisGroupRefArr : REFERENCE TO AXIS_GROUP_REF_ARR;
		ExecuteCmd : BOOL;
		Count : INT;
		MaxWaitTime : INT;
		Mode : INT;
		BufferMode : INT;
	END_VAR
	VAR_OUTPUT
		Busy : BOOL;
		Done : BOOL;
		Aborted : BOOL;
		Error : BOOL;
		ErrorID : DINT;
	END_VAR
	VAR
		mxA_ExecuteCommand_1 : mxA_ExecuteCommand;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK KRC_SetCoordSys
	VAR_INPUT
		AxisGroupIdx : INT;
		KRC_AxisGroupRefArr : REFERENCE TO AXIS_GROUP_REF_ARR;
		ExecuteCmd : BOOL;
		CoordinateSystem : COORDSYS;
		BufferMode : INT;
	END_VAR
	VAR_OUTPUT
		Busy : BOOL;
		Done : BOOL;
		Aborted : BOOL;
		Error : BOOL;
		ErrorID : DINT;
	END_VAR
	VAR
		mxA_ExecuteCommand : mxA_ExecuteCommand;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK KRC_SetDistanceTrigger
	VAR_INPUT
		AxisGroupIdx : INT;
		KRC_AxisGroupRefArr : REFERENCE TO AXIS_GROUP_REF_ARR;
		ExecuteCmd : BOOL;
		Distance : INT;
		Delay : INT;
		Output : INT;
		Value : BOOL;
		Pulse : REAL;
		BufferMode : INT;
	END_VAR
	VAR_OUTPUT
		Busy : BOOL;
		Done : BOOL;
		Aborted : BOOL;
		Error : BOOL;
		ErrorID : DINT;
	END_VAR
	VAR
		mxA_ExecuteCommand : mxA_ExecuteCommand;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK KRC_SetOverride
	VAR_INPUT
		AxisGroupIdx : INT;
		KRC_AxisGroupRefArr : REFERENCE TO AXIS_GROUP_REF_ARR;
		Override : INT;
	END_VAR
	VAR_OUTPUT
		Valid : BOOL;
		ActualOverride : INT;
		Error : BOOL;
		ErrorID : DINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK KRC_SetPathTrigger
	VAR_INPUT
		AxisGroupIdx : INT;
		KRC_AxisGroupRefArr : REFERENCE TO AXIS_GROUP_REF_ARR;
		ExecuteCmd : BOOL;
		Path : REAL;
		Delay : INT;
		Output : INT;
		Value : BOOL;
		Pulse : REAL;
		BufferMode : INT;
	END_VAR
	VAR_OUTPUT
		Busy : BOOL;
		Done : BOOL;
		Aborted : BOOL;
		Error : BOOL;
		ErrorID : DINT;
	END_VAR
	VAR
		mxA_ExecuteCommand : mxA_ExecuteCommand;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK KRC_TechFunction
	VAR_INPUT
		AxisGroupIdx : INT;
		KRC_AxisGroupRefArr : REFERENCE TO AXIS_GROUP_REF_ARR;
		ExecuteCmd : BOOL;
		TechFunctionID : INT;
		BufferMode : INT;
		BOOL_DATA : BOOL_ARRAY_40;
		INT_DATA : INT32_ARRAY_40;
		REAL_DATA : REAL_ARRAY_40;
		ParameterCount : INT;
	END_VAR
	VAR_OUTPUT
		ErrorID : DINT;
		Error : BOOL;
		Busy : BOOL;
		Active : BOOL;
		Done : BOOL;
		Aborted : BOOL;
	END_VAR
	VAR
		i : INT;
		mxA_ExecuteCommand_1 : mxA_ExecuteCommand;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK KRC_Test_TechFunction
	VAR_INPUT
		AxisGroupIdx : INT;
		KRC_AxisGroupRefArr : REFERENCE TO AXIS_GROUP_REF_ARR;
		ExecuteCmd : BOOL;
	END_VAR
	VAR_OUTPUT
		Busy : BOOL;
		Active : BOOL;
		Done : BOOL;
		Aborted : BOOL;
		Error : BOOL;
		ErrorID : DINT;
	END_VAR
	VAR
		BOOL_DATA : BOOL_ARRAY_40;
		i : INT;
		INT_DATA : INT32_ARRAY_40;
		REAL_DATA : REAL_ARRAY_40;
		KRC_Techfunction_1 : KRC_TechFunction;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK KRC_TouchUP
	VAR_INPUT
		AxisGroupIdx : INT;
		KRC_AxisGroupRefArr : REFERENCE TO AXIS_GROUP_REF_ARR;
		ExecuteCmd : BOOL;
		Index : INT;
	END_VAR
	VAR_OUTPUT
		Done : BOOL;
		Error : BOOL;
		ErrorID : DINT;
		PositionArray : POSITION_ARRAY;
	END_VAR
	VAR
		mxA_ExecuteCommand_1 : mxA_ExecuteCommand;
		R_TRIG_1 : R_TRIG;
		m_PosIndex : INT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK KRC_VectorMoveOff
	VAR_INPUT
		AxisGroupIdx : INT;
		KRC_AxisGroupRefArr : REFERENCE TO AXIS_GROUP_REF_ARR;
		ExecuteCmd : BOOL;
		BufferMode : INT;
	END_VAR
	VAR_OUTPUT
		Busy : BOOL;
		Done : BOOL;
		Aborted : BOOL;
		Error : BOOL;
		ErrorID : DINT;
	END_VAR
	VAR
		mxA_ExecuteCommand_1 : mxA_ExecuteCommand;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK KRC_VectorMoveOn
	VAR_INPUT
		AxisGroupIdx : INT;
		KRC_AxisGroupRefArr : REFERENCE TO AXIS_GROUP_REF_ARR;
		ExecuteCmd : BOOL;
		X : REAL;
		Y : REAL;
		Z : REAL;
		A : REAL;
		B : REAL;
		C : REAL;
		VectorLimit : REAL;
		MaxDuration : REAL;
		TorqueOffsetValue : REAL;
		BufferMode : INT;
	END_VAR
	VAR_OUTPUT
		Busy : BOOL;
		Done : BOOL;
		Aborted : BOOL;
		Error : BOOL;
		ErrorID : DINT;
	END_VAR
	VAR
		mxA_ExecuteCommand_1 : mxA_ExecuteCommand;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK KRC_WaitForInput
	VAR_INPUT
		AxisGroupIdx : INT;
		KRC_AxisGroupRefArr : REFERENCE TO AXIS_GROUP_REF_ARR;
		ExecuteCmd : BOOL;
		Number : INT;
		Value : BOOL;
		bContinue : BOOL;
		BufferMode : INT;
	END_VAR
	VAR_OUTPUT
		Busy : BOOL;
		Active : BOOL;
		Done : BOOL;
		Aborted : BOOL;
		Error : BOOL;
		ErrorID : DINT;
	END_VAR
	VAR
		mxA_ExecuteCommand : mxA_ExecuteCommand;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK KRC_WriteAnalogOutput
	VAR_INPUT
		AxisGroupIdx : INT;
		KRC_AxisGroupRefArr : REFERENCE TO AXIS_GROUP_REF_ARR;
		ExecuteCmd : BOOL;
		Number : INT;
		Value : REAL;
		bContinue : BOOL;
		BufferMode : INT;
	END_VAR
	VAR_OUTPUT
		Busy : BOOL;
		Done : BOOL;
		Aborted : BOOL;
		Error : BOOL;
		ErrorID : DINT;
	END_VAR
	VAR
		mxA_ExecuteCommand : mxA_ExecuteCommand;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK KRC_WriteAxisGroup
	VAR_INPUT
		AxisGroupIdx : INT;
		KRC_AxisGroupRefArr : REFERENCE TO AXIS_GROUP_REF_ARR;
		KRC4_Output : REFERENCE TO ARRAY[0..254] OF BYTE;
	END_VAR
	VAR_OUTPUT
		Error : BOOL;
		ErrorID : DINT;
	END_VAR
	VAR
		fTmp : REAL;
		nTMP1 : DINT;
		fTMP1 : REAL;
		bTMP1 : BOOL;
		bMaxRealErr : BOOL;
		mxA_ResetCommand : mxA_ResetCommand;
		nCheckSum : DWORD;
		i : INT;
		LastOrderID : DINT;
		LastTGNumber : INT;
		LastTGType : INT;
		m_CommandID : DINT;
		m_OrderID : DINT;
		m_ProfiNetErr : BOOL;
		m_ProfiNetStatus : DWORD;
		m_AnzTelegramme : INT;
		AE_PGNO_FBIT_Val : BOOL;
		AE_PGNO_Bit1_Val : BOOL;
		AE_PGNO_Bit2_Val : BOOL;
		AE_PGNO_Bit3_Val : BOOL;
		AE_PGNO_Bit4_Val : BOOL;
		AE_PGNO_Bit5_Val : BOOL;
		AE_PGNO_Bit6_Val : BOOL;
		AE_PGNO_Bit7_Val : BOOL;
		AE_PGNO_PARITY_Val : BOOL;
		AE_PGNO_VALID_Val : BOOL;
		AE_EXT_START_Val : BOOL;
		AE_MOVE_ENABLE_Val : BOOL;
		AE_CONF_MESS_Val : BOOL;
		AE_DRIVES_OFF_Val : BOOL;
		AE_DRIVES_ON_Val : BOOL;
		MASTEST_REQ_EXT_Val : BOOL;
		BRAKETEST_REQ_EXT_Val : BOOL;
		AE_RESET_Val : BOOL;
		BRAKE_Val : BOOL;
		BRAKE_F_Val : BOOL;
		RELEASE_BRAKE_Val : BOOL;
		SHOW_TRACE_Val : BOOL;
		MESSAGE_RESET_Val : BOOL;
		OUT_VAL_1_Val : BOOL;
		OUT_VAL_2_Val : BOOL;
		OUT_VAL_3_Val : BOOL;
		OUT_VAL_4_Val : BOOL;
		OUT_VAL_5_Val : BOOL;
		OUT_VAL_6_Val : BOOL;
		OUT_VAL_7_Val : BOOL;
		OUT_VAL_8_Val : BOOL;
		WRITE_OUT_1TO8_Val : BOOL;
		Heartbeat_Val : BYTE;
		Override_Val : BYTE;
		PLC_Major_Val : DINT;
		PLC_Minor_Val : DINT;
		SR_Order1_ID_Val : DINT;
		SR_Order2_ID_Val : DINT;
		SR_Order3_ID_Val : DINT;
		SR_Order4_ID_Val : DINT;
		SR_Order5_ID_Val : DINT;
		SR_Order6_ID_Val : DINT;
		SR_Order7_ID_Val : DINT;
		SR_Order8_ID_Val : DINT;
		SR_Order9_ID_Val : DINT;
		SR_Order10_ID_Val : DINT;
		SR_Order1_State_Val : BYTE;
		SR_Order2_State_Val : BYTE;
		SR_Order3_State_Val : BYTE;
		SR_Order4_State_Val : BYTE;
		SR_Order5_State_Val : BYTE;
		SR_Order6_State_Val : BYTE;
		SR_Order7_State_Val : BYTE;
		SR_Order8_State_Val : BYTE;
		SR_Order9_State_Val : BYTE;
		SR_Order10_State_Val : BYTE;
		CmdPar_INT1_Val : DINT;
		CmdPar_INT2_Val : DINT;
		CmdPar_INT3_Val : DINT;
		CmdPar_INT4_Val : DINT;
		CmdPar_INT5_Val : DINT;
		CmdPar_INT6_Val : DINT;
		CmdPar_INT7_Val : DINT;
		CmdPar_INT8_Val : DINT;
		CmdPar_INT9_Val : DINT;
		CmdPar_INT10_Val : DINT;
		CmdPar_INT11_Val : DINT;
		CmdPar_INT12_Val : DINT;
		CmdPar_INT13_Val : DINT;
		CmdPar_INT14_Val : DINT;
		CmdPar_INT15_Val : DINT;
		CmdPar_REAL1_Val : REAL;
		CmdPar_REAL2_Val : REAL;
		CmdPar_REAL3_Val : REAL;
		CmdPar_REAL4_Val : REAL;
		CmdPar_REAL5_Val : REAL;
		CmdPar_REAL6_Val : REAL;
		CmdPar_REAL7_Val : REAL;
		CmdPar_REAL8_Val : REAL;
		CmdPar_REAL9_Val : REAL;
		CmdPar_REAL10_Val : REAL;
		CmdPar_REAL11_Val : REAL;
		CmdPar_REAL12_Val : REAL;
		CmdPar_REAL13_Val : REAL;
		CmdPar_REAL14_Val : REAL;
		CmdPar_REAL15_Val : REAL;
		CheckSum_Val : DWORD;
		TransmissionNO1_Val : INT;
		TransmissionNO2_Val : INT;
		TransmissionType_Val : INT;
		OrderID_Val : DINT;
		CmdID_Val : INT;
		BufferMode_Val : INT;
		BoolValues1 : WORD;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK KRC_WriteAxWorkspace
	VAR_INPUT
		AxisGroupIdx : INT;
		KRC_AxisGroupRefArr : REFERENCE TO AXIS_GROUP_REF_ARR;
		ExecuteCmd : BOOL;
		WorkspaceNo : INT;
		WorkspaceMode : INT;
		WorkspaceData : AXBOX;
		BufferMode : INT;
	END_VAR
	VAR_OUTPUT
		Busy : BOOL;
		Done : BOOL;
		Aborted : BOOL;
		Error : BOOL;
		ErrorID : DINT;
	END_VAR
	VAR
		mxA_ExecuteCommand : mxA_ExecuteCommand;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK KRC_WriteBaseData
	VAR_INPUT
		AxisGroupIdx : INT;
		KRC_AxisGroupRefArr : REFERENCE TO AXIS_GROUP_REF_ARR;
		ExecuteCmd : BOOL;
		BaseNo : INT;
		BaseData : FRAME;
		BufferMode : INT;
	END_VAR
	VAR_OUTPUT
		Busy : BOOL;
		Done : BOOL;
		Aborted : BOOL;
		Error : BOOL;
		ErrorID : DINT;
	END_VAR
	VAR
		mxA_ExecuteCommand : mxA_ExecuteCommand;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK KRC_WriteDigitalOutput
	VAR_INPUT
		AxisGroupIdx : INT;
		KRC_AxisGroupRefArr : REFERENCE TO AXIS_GROUP_REF_ARR;
		ExecuteCmd : BOOL;
		Number : INT;
		Value : BOOL;
		Pulse : REAL;
		bContinue : BOOL;
		BufferMode : INT;
	END_VAR
	VAR_OUTPUT
		Busy : BOOL;
		Done : BOOL;
		Aborted : BOOL;
		Error : BOOL;
		ErrorID : DINT;
	END_VAR
	VAR
		mxA_ExecuteCommand : mxA_ExecuteCommand;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK KRC_WriteDigitalOutput1To8
	VAR_INPUT
		AxisGroupIdx : INT;
		KRC_AxisGroupRefArr : REFERENCE TO AXIS_GROUP_REF_ARR;
		OUT1 : BOOL;
		OUT2 : BOOL;
		OUT3 : BOOL;
		OUT4 : BOOL;
		OUT5 : BOOL;
		OUT6 : BOOL;
		OUT7 : BOOL;
		OUT8 : BOOL;
	END_VAR
	VAR_OUTPUT
		Error : BOOL;
		ErrorID : DINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK KRC_WriteLoadData
	VAR_INPUT
		AxisGroupIdx : INT;
		KRC_AxisGroupRefArr : REFERENCE TO AXIS_GROUP_REF_ARR;
		ExecuteCmd : BOOL;
		Tool : INT;
		M : REAL;
		X : REAL;
		Y : REAL;
		Z : REAL;
		A : REAL;
		B : REAL;
		C : REAL;
		JX : REAL;
		JY : REAL;
		JZ : REAL;
		BufferMode : INT;
	END_VAR
	VAR_OUTPUT
		Busy : BOOL;
		Done : BOOL;
		Aborted : BOOL;
		Error : BOOL;
		ErrorID : DINT;
	END_VAR
	VAR
		mxA_ExecuteCommand : mxA_ExecuteCommand;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK KRC_WriteSoftEnd
	VAR_INPUT
		AxisGroupIdx : INT;
		KRC_AxisGroupRefArr : REFERENCE TO AXIS_GROUP_REF_ARR;
		ExecuteCmd : BOOL;
		A1_Min : REAL;
		A1_Max : REAL;
		A2_Min : REAL;
		A2_Max : REAL;
		A3_Min : REAL;
		A3_Max : REAL;
		A4_Min : REAL;
		A4_Max : REAL;
		A5_Min : REAL;
		A5_Max : REAL;
		A6_Min : REAL;
		A6_Max : REAL;
		BufferMode : INT;
	END_VAR
	VAR_OUTPUT
		Busy : BOOL;
		Done : BOOL;
		Aborted : BOOL;
		Error : BOOL;
		ErrorID : DINT;
	END_VAR
	VAR
		mxA_ExecuteCommand : mxA_ExecuteCommand;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK KRC_WriteSoftEndExt
	VAR_INPUT
		AxisGroupIdx : INT;
		KRC_AxisGroupRefArr : REFERENCE TO AXIS_GROUP_REF_ARR;
		ExecuteCmd : BOOL;
		E1_Min : REAL;
		E1_Max : REAL;
		E2_Min : REAL;
		E2_Max : REAL;
		E3_Min : REAL;
		E3_Max : REAL;
		E4_Min : REAL;
		E4_Max : REAL;
		E5_Min : REAL;
		E5_Max : REAL;
		E6_Min : REAL;
		E6_Max : REAL;
		BufferMode : INT;
	END_VAR
	VAR_OUTPUT
		Busy : BOOL;
		Done : BOOL;
		Aborted : BOOL;
		Error : BOOL;
		ErrorID : DINT;
	END_VAR
	VAR
		mxA_ExecuteCommand : mxA_ExecuteCommand;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK KRC_WriteSysVar
	VAR_INPUT
		AxisGroupIdx : INT;
		KRC_AxisGroupRefArr : REFERENCE TO AXIS_GROUP_REF_ARR;
		ExecuteCmd : BOOL;
		Index : INT;
		Value1 : REAL;
		Value2 : REAL;
		Value3 : REAL;
		Value4 : REAL;
		Value5 : REAL;
		Value6 : REAL;
		Value7 : REAL;
		Value8 : REAL;
		Value9 : REAL;
		Value10 : REAL;
		bContinue : BOOL;
		BufferMode : INT;
	END_VAR
	VAR_OUTPUT
		Busy : BOOL;
		Done : BOOL;
		Aborted : BOOL;
		Error : BOOL;
		ErrorID : DINT;
	END_VAR
	VAR
		mxA_ExecuteCommand : mxA_ExecuteCommand;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK KRC_WriteToolData
	VAR_INPUT
		AxisGroupIdx : INT;
		KRC_AxisGroupRefArr : REFERENCE TO AXIS_GROUP_REF_ARR;
		ExecuteCmd : BOOL;
		ToolNo : INT;
		ToolData : FRAME;
		BufferMode : INT;
	END_VAR
	VAR_OUTPUT
		Busy : BOOL;
		Done : BOOL;
		Aborted : BOOL;
		Error : BOOL;
		ErrorID : DINT;
	END_VAR
	VAR
		mxA_ExecuteCommand : mxA_ExecuteCommand;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK KRC_WriteWorkspace
	VAR_INPUT
		AxisGroupIdx : INT;
		KRC_AxisGroupRefArr : REFERENCE TO AXIS_GROUP_REF_ARR;
		ExecuteCmd : BOOL;
		WorkspaceNo : INT;
		WorkspaceMode : INT;
		WorkspaceData : BOX;
		BufferMode : INT;
	END_VAR
	VAR_OUTPUT
		Busy : BOOL;
		Done : BOOL;
		Aborted : BOOL;
		Error : BOOL;
		ErrorID : DINT;
	END_VAR
	VAR
		mxA_ExecuteCommand : mxA_ExecuteCommand;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK mc_ExecuteCommand
	VAR_INPUT
		AxisGroupIdx : INT;
		KRC_AxisGroupRefArr : REFERENCE TO AXIS_GROUP_REF_ARR;
		Execute : BOOL;
		CmdID : DINT;
		QueueMode : INT;
		CommandSize : INT;
		EnableDirectExe : BOOL;
		EnableQueueExe : BOOL;
		IgnoreInit : BOOL;
	END_VAR
	VAR_OUTPUT
		WriteCmdPar : BOOL;
		ComDone : BOOL;
		ComBusy : BOOL;
		Busy : BOOL;
		Active : BOOL;
		Done : BOOL;
		CommandAborted : BOOL;
		Error : BOOL;
		ErrorID : DINT;
		ReadCmdDataRet : BOOL;
	END_VAR
	VAR
		ResetCommand_1 : mxA_ResetCommand;
		GetOrderState_1 : mxA_GetOrderState;
		KRC_Error_1 : KRC_Error;
		m_State : INT;
		m_OrderID : DINT;
		m_ExecuteLast : BOOL;
		m_RE_Execute : BOOL;
		m_FE_Execute : BOOL;
		m_CommandSize : INT;
		m_IntErrorID : DINT;
		m_GlobalErrorID : DINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_Move
	VAR_INPUT
		AxisGroupIdx : INT;
		CmdID : DINT := 1;
		KRC_AxisGroupRefArr : REFERENCE TO AXIS_GROUP_REF_ARR;
		Execute : BOOL;
		MoveType : INT;
		Position : E6POS;
		AxisPosition : E6AXIS;
		CircHP : E6POS;
		Velocity : REAL;
		AbsoluteVelocity : REAL;
		Acceleration : REAL;
		AbsoluteAcceleration : REAL;
		CoordinateSystem : COORDSYS;
		OriType : INT;
		CircType : INT;
		CircAngle : REAL;
		Approximate : APO;
		PosValidX : BOOL;
		PosValidY : BOOL;
		PosValidZ : BOOL;
		PosValidA : BOOL;
		PosValidB : BOOL;
		PosValidC : BOOL;
		PosValidE1 : BOOL;
		PosValidE2 : BOOL;
		PosValidE3 : BOOL;
		PosValidE4 : BOOL;
		PosValidE5 : BOOL;
		PosValidE6 : BOOL;
		PosValidS : BOOL;
		PosValidT : BOOL;
		QueueMode : INT;
	END_VAR
	VAR_OUTPUT
		ComAcpt : BOOL;
		ComBusy : BOOL;
		Busy : BOOL;
		Active : BOOL;
		Done : BOOL;
		CommandAborted : BOOL;
		Error : BOOL;
		ErrorID : DINT;
	END_VAR
	VAR
		CommandSize : INT;
		m_Velocity : DINT;
		m_Acceleration : DINT;
		mc_ExecuteCommand_1 : mc_ExecuteCommand;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_MoveAxisAbsolute
	VAR_INPUT
		AxisGroupIdx : INT;
		KRC_AxisGroupRefArr : REFERENCE TO AXIS_GROUP_REF_ARR;
		Execute : BOOL;
		AxisPosition : E6AXIS;
		Velocity : REAL;
		Acceleration : REAL;
		Approximate : APO;
		QueueMode : INT;
	END_VAR
	VAR_OUTPUT
		ComAcpt : BOOL;
		ComBusy : BOOL;
		Busy : BOOL;
		Active : BOOL;
		Done : BOOL;
		CommandAborted : BOOL;
		Error : BOOL;
		ErrorID : DINT;
	END_VAR
	VAR
		MC_Move : MC_Move;
		m_CircHP : E6POS;
		m_Position : E6POS;
		m_OriType : INT;
		m_CoordinateSystem : COORDSYS;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_MoveCircularAbsolute
	VAR_INPUT
		AxisGroupIdx : INT;
		KRC_AxisGroupRefArr : REFERENCE TO AXIS_GROUP_REF_ARR;
		Execute : BOOL;
		Position : E6POS;
		CircHP : E6POS;
		Angle : REAL;
		Velocity : REAL;
		Acceleration : REAL;
		CoordinateSystem : COORDSYS;
		OriType : INT;
		CircType : INT;
		Approximate : APO;
		QueueMode : INT;
	END_VAR
	VAR_OUTPUT
		ComAcpt : BOOL;
		ComBusy : BOOL;
		Busy : BOOL;
		Active : BOOL;
		Done : BOOL;
		CommandAborted : BOOL;
		Error : BOOL;
		ErrorID : DINT;
	END_VAR
	VAR
		MC_Move : MC_Move;
		m_CoordinateSystem : COORDSYS;
		m_AxisPosition : E6AXIS;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_MoveCircularRelative
	VAR_INPUT
		AxisGroupIdx : INT;
		KRC_AxisGroupRefArr : REFERENCE TO AXIS_GROUP_REF_ARR;
		Execute : BOOL;
		Distance : E6POS;
		CircHP : E6POS;
		Angle : REAL;
		Velocity : REAL;
		Acceleration : REAL;
		CoordinateSystem : COORDSYS;
		OriType : INT;
		CircType : INT;
		Approximate : APO;
		QueueMode : INT;
	END_VAR
	VAR_OUTPUT
		ComAcpt : BOOL;
		ComBusy : BOOL;
		Busy : BOOL;
		Active : BOOL;
		Done : BOOL;
		CommandAborted : BOOL;
		Error : BOOL;
		ErrorID : DINT;
	END_VAR
	VAR
		MC_Move : MC_Move;
		m_CoordinateSystem : COORDSYS;
		m_AxisPosition : E6AXIS;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_MoveDirectAbsolute
	VAR_INPUT
		AxisGroupIdx : INT;
		KRC_AxisGroupRefArr : REFERENCE TO AXIS_GROUP_REF_ARR;
		Execute : BOOL;
		Position : E6POS;
		Velocity : REAL;
		Acceleration : REAL;
		CoordinateSystem : COORDSYS;
		Approximate : APO;
		QueueMode : INT;
	END_VAR
	VAR_OUTPUT
		ComAcpt : BOOL;
		ComBusy : BOOL;
		Busy : BOOL;
		Active : BOOL;
		Done : BOOL;
		CommandAborted : BOOL;
		Error : BOOL;
		ErrorID : DINT;
	END_VAR
	VAR
		MC_Move : MC_Move;
		m_CircHP : E6POS;
		m_AxisPosition : E6AXIS;
		m_OriType : INT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_MoveDirectRelative
	VAR_INPUT
		AxisGroupIdx : INT;
		KRC_AxisGroupRefArr : REFERENCE TO AXIS_GROUP_REF_ARR;
		Execute : BOOL;
		Distance : E6POS;
		Velocity : REAL;
		Acceleration : REAL;
		CoordinateSystem : COORDSYS;
		Approximate : APO;
		QueueMode : INT;
	END_VAR
	VAR_OUTPUT
		ComAcpt : BOOL;
		ComBusy : BOOL;
		Busy : BOOL;
		Active : BOOL;
		Done : BOOL;
		CommandAborted : BOOL;
		Error : BOOL;
		ErrorID : DINT;
	END_VAR
	VAR
		MC_Move : MC_Move;
		m_CircHP : E6POS;
		m_AxisPosition : E6AXIS;
		m_OriType : INT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_MoveLinearAbsolute
	VAR_INPUT
		AxisGroupIdx : INT;
		KRC_AxisGroupRefArr : REFERENCE TO AXIS_GROUP_REF_ARR;
		Execute : BOOL;
		Position : E6POS;
		Velocity : REAL;
		Acceleration : REAL;
		CoordinateSystem : COORDSYS;
		OriType : INT;
		Approximate : APO;
		QueueMode : INT;
	END_VAR
	VAR_OUTPUT
		ComAcpt : BOOL;
		ComBusy : BOOL;
		Busy : BOOL;
		Active : BOOL;
		Done : BOOL;
		CommandAborted : BOOL;
		Error : BOOL;
		ErrorID : DINT;
	END_VAR
	VAR
		MC_Move : MC_Move;
		m_CircHP : E6POS;
		m_AxisPosition : E6AXIS;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_MoveLinearRelative
	VAR_INPUT
		AxisGroupIdx : INT;
		KRC_AxisGroupRefArr : REFERENCE TO AXIS_GROUP_REF_ARR;
		Execute : BOOL;
		Distance : E6POS;
		Velocity : REAL;
		Acceleration : REAL;
		CoordinateSystem : COORDSYS;
		OriType : INT;
		Approximate : APO;
		QueueMode : INT;
	END_VAR
	VAR_OUTPUT
		ComAcpt : BOOL;
		ComBusy : BOOL;
		Busy : BOOL;
		Active : BOOL;
		Done : BOOL;
		CommandAborted : BOOL;
		Error : BOOL;
		ErrorID : DINT;
	END_VAR
	VAR
		MC_Move : MC_Move;
		m_CircHP : E6POS;
		m_AxisPosition : E6AXIS;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK mxA_ExecuteCommand
	VAR_INPUT
		AxisGroupIdx : INT;
		KRC_AxisGroupRefArr : REFERENCE TO AXIS_GROUP_REF_ARR;
		Execute : BOOL;
		CmdID : DINT;
		BufferMode : INT;
		CommandSize : INT;
		EnableDirectExe : BOOL;
		EnableQueueExe : BOOL;
		IgnoreInit : BOOL;
	END_VAR
	VAR_OUTPUT
		WriteCmdPar : BOOL;
		Busy : BOOL;
		Active : BOOL;
		Done : BOOL;
		CmdSpecific1 : BOOL;
		Aborted : BOOL;
		Error : BOOL;
		ErrorID : DINT;
		ReadCmdDataRet : BOOL;
	END_VAR
	VAR
		ResetCommand_1 : mxA_ResetCommand;
		GetOrderState_1 : mxA_GetOrderState;
		m_State : INT;
		m_OrderID : DINT;
		m_ExecuteLast : BOOL;
		m_RE_Execute : BOOL;
		m_CommandSize : INT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION mxA_GetIO_BYTE : BOOL
	VAR_INPUT
		BytePos : INT;
		KRC4_Input : REFERENCE TO ARRAY[0..254] OF BYTE;
	END_VAR
	VAR_IN_OUT
		O : INT;
	END_VAR
END_FUNCTION

FUNCTION mxA_GetIO_DINT : BOOL
	VAR_INPUT
		BytePos : INT;
		KRC4_Input : REFERENCE TO ARRAY[0..254] OF BYTE;
	END_VAR
	VAR_IN_OUT
		O : DINT;
	END_VAR
	VAR
		DW : DWORD;
	END_VAR
END_FUNCTION

FUNCTION mxA_GetIO_INT : BOOL
	VAR_INPUT
		BytePos : INT;
		KRC4_Input : REFERENCE TO ARRAY[0..254] OF BYTE;
	END_VAR
	VAR_IN_OUT
		O : INT;
	END_VAR
	VAR
		W : WORD;
	END_VAR
END_FUNCTION

FUNCTION mxA_GetIO_NIBBLE : BOOL
	VAR_INPUT
		BytePos : INT;
		KRC4_Input : REFERENCE TO ARRAY[0..254] OF BYTE;
	END_VAR
	VAR_IN_OUT
		N1 : INT;
		N2 : INT;
	END_VAR
	VAR
		B : BYTE;
		B1 : BYTE;
		B2 : BYTE;
	END_VAR
END_FUNCTION

FUNCTION mxA_GetIO_REAL : BOOL
	VAR_INPUT
		BytePos : INT;
		KRC4_Input : REFERENCE TO ARRAY[0..254] OF BYTE;
	END_VAR
	VAR_IN_OUT
		O : REAL;
	END_VAR
END_FUNCTION

FUNCTION mxA_GetIO_SINT : BOOL
	VAR_INPUT
		BytePos : INT;
		KRC4_Input : REFERENCE TO ARRAY[0..254] OF BYTE;
	END_VAR
	VAR_IN_OUT
		O : SINT;
	END_VAR
	VAR
		B : BYTE;
	END_VAR
END_FUNCTION

FUNCTION_BLOCK mxA_GetOrderState
	VAR_INPUT
		AxisGroupIdx : INT;
		KRC_AxisGroupRefArr : REFERENCE TO AXIS_GROUP_REF_ARR;
		OrderID : DINT;
	END_VAR
	VAR_OUTPUT
		OrderState : INT;
	END_VAR
	VAR
		i : INT;
		m_OrderState : INT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK mxA_ResetCommand
	VAR_INPUT
		AxisGroupIdx : INT;
		KRC_AxisGroupRefArr : REFERENCE TO ARRAY[1..5] OF AXIS_GROUP_REF;
	END_VAR
	VAR
		i : INT;
		Robots : USINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK mxa_ValuesToAPO
	VAR_INPUT
		PTP_MODE : INT;
		CP_MODE : INT;
		CPTP : INT;
		CDIS : REAL;
		CORI : REAL;
		CVEL : INT;
	END_VAR
	VAR_OUTPUT
		APO : APO;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK mxa_ValuesToCOORDSYS
	VAR_INPUT
		Tool : INT;
		Base : INT;
		IPO_Mode : INT;
	END_VAR
	VAR_OUTPUT
		COORDSYS : COORDSYS;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK mxA_ValuesToE6AXIS
	VAR_INPUT
		A1 : REAL;
		A2 : REAL;
		A3 : REAL;
		A4 : REAL;
		A5 : REAL;
		A6 : REAL;
		E1 : REAL;
		E2 : REAL;
		E3 : REAL;
		E4 : REAL;
		E5 : REAL;
		E6 : REAL;
	END_VAR
	VAR_OUTPUT
		E6Axis : E6AXIS;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK mxA_ValuesToE6POS
	VAR_INPUT
		X : REAL;
		Y : REAL;
		Z : REAL;
		A : REAL;
		B : REAL;
		C : REAL;
		Status : INT;
		Turn : INT;
		E1 : REAL;
		E2 : REAL;
		E3 : REAL;
		E4 : REAL;
		E5 : REAL;
		E6 : REAL;
	END_VAR
	VAR_OUTPUT
		E6POS : E6POS;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK mxA_ValuesToFRAME
	VAR_INPUT
		X : REAL;
		Y : REAL;
		Z : REAL;
		A : REAL;
		B : REAL;
		C : REAL;
	END_VAR
	VAR_OUTPUT
		FRAME : FRAME;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION mxA_WriteIO_BYTE : BOOL
	VAR_INPUT
		BytePos : INT;
		Val : INT;
	END_VAR
	VAR_IN_OUT
		KRC4_Output : ARRAY[0..254] OF BYTE;
	END_VAR
END_FUNCTION

FUNCTION mxA_WriteIO_DINT : BOOL
	VAR_INPUT
		BytePos : INT;
		Val : DINT;
	END_VAR
	VAR_IN_OUT
		KRC4_Output : ARRAY[0..254] OF BYTE;
	END_VAR
END_FUNCTION

FUNCTION mxA_WriteIO_DWORD : BOOL
	VAR_INPUT
		BytePos : INT;
		Val : DWORD;
	END_VAR
	VAR_IN_OUT
		KRC4_Output : ARRAY[0..254] OF BYTE;
	END_VAR
END_FUNCTION

FUNCTION mxA_WriteIO_REAL : BOOL
	VAR_INPUT
		BytePos : INT;
		Val : REAL;
	END_VAR
	VAR_IN_OUT
		KRC4_Output : ARRAY[0..254] OF BYTE;
	END_VAR
END_FUNCTION

FUNCTION mxA_WriteIO_WORD : BOOL
	VAR_INPUT
		BytePos : INT;
		Val : WORD;
	END_VAR
	VAR_IN_OUT
		KRC4_Output : ARRAY[0..254] OF BYTE;
	END_VAR
END_FUNCTION
