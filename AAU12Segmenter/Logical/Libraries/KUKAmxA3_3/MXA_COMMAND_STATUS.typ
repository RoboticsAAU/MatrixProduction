TYPE MXA_COMMAND_STATUS :
STRUCT
		CmdIDRet		  :	DINT;
		OrderIDRet		  :	DINT;
		TransmissionNoRet : INT;
		StateReturn		  :	MXA_CMD_SR_ARR;
		CmdDataReturn	  :	MXA_CMD_DATA_RET;
		CmdDataRetCSKRC	  :	DINT;
		CmdDataRetCSPLC	  :	DINT;
	
END_STRUCT;
END_TYPE
