TYPE MXA_COMMAND :
STRUCT
		CommandID	: DINT;
		OrderID		: DINT;
		BufferMode	: DINT;
		CommandSize : INT;
		CmdParReal	: MXA_CMD_PAR_REAL;
		CmdParInt	: MXA_CMD_PAR_INT;
		CmdParBool	: MXA_CMD_PAR_BOOL;
END_STRUCT;
END_TYPE
