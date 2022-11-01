TYPE MXA_KRC_STATE :
STRUCT
		PosAct           : E6POS;
		ToolAct          : INT;
		BaseAct          : INT;
		IpoModeAct       : INT;
		PosActValid      : BOOL;
		AxisAct          : E6AXIS;
		AxisActValid     : BOOL;
		OvProAct         : INT;
		VelAct           : REAL;
		BrakeActive      : BOOL; 
		Workstates       : INT;
		AxWorkstates     : INT;
		GroupState       : INT;
		ErrorID          : DINT;
		ErrorIDSub       : DINT;
		ErrorIDPCOS      : DINT;
		ActivePosOrderID : DINT;
		ActiveOrderIDB   : DINT;
		Heartbeat        : INT;
		HeartbeatPCOS    : INT;
		InterruptState   : MXA_IR_STATE;
		QueueCount       : INT;
		TouchUP          : BOOL;
		TouchUP_Index    : INT;
		IN_VAL_1TO8      : INT;
END_STRUCT;
END_TYPE
