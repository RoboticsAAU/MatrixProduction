TYPE	
	Mc6DAssemblyType : STRUCT
		controlif : REFERENCE TO Mc6DInternalAssemblyIfType;
	END_STRUCT;
	
	Mc6DInternalAssemblyIfType : STRUCT (*Partial interface type (C only)*)
		vtable : DWORD;
	END_STRUCT;
	
	Mc6DShuttleType : STRUCT
		controlif : REFERENCE TO Mc6DInternalShuttleIfType;
	END_STRUCT;
	
	Mc6DShuttleGroupType : STRUCT
		controlif : REFERENCE TO Mc6DInternalShuttleGroupIfType;
	END_STRUCT;
	
	Mc6DSegmentType : STRUCT
		controlif : REFERENCE TO Mc6DInternalSegmentIfType;
	END_STRUCT;
	
	Mc6DZoneType : STRUCT
		controlif : REFERENCE TO Mc6DInternalZoneIfType;
	END_STRUCT;
	
	Mc6DInternalZoneIfType : STRUCT (*Partial interface type (C only)*)
		vtable : DWORD;
	END_STRUCT;	
	
	Mc6DInternalSegmentIfType : STRUCT (*Partial interface type (C only)*)
		vtable : DWORD;
	END_STRUCT;	
	
	Mc6DInternalShuttleIfType : STRUCT (*Partial interface type (C only)*)
		vtable : DWORD;
	END_STRUCT;
	
	Mc6DInternalShuttleGroupIfType : STRUCT (*Partial interface type (C only)*)
		vtable : DWORD;
	END_STRUCT;	
	
	
	Mc6DControllerFBIOType : 	STRUCT 
		Array : ARRAY[0..199]OF UINT;
	END_STRUCT;
	
	
	McAcp6DControllerStateEnum :
	(
		mcACP6D_STATE_BOOTING := 0,
		mcACP6D_STATE_INACTIVE := 1,
		mcACP6D_STATE_ACTIVATING := 2,
		mcACP6D_STATE_OPERATION := 5,
		mcACP6D_STATE_DEACTIVATING := 7,
		mcACP6D_STATE_ERROR_HANDLING := 8,
		mcACP6D_STATE_ERROR := 9
		);
		
	McAcp6DShStereotypeDeleteCmdEnum :
	(
		mcACP6D_SH_ST_DELETE_SPECIFIC := 0,
		mcACP6D_SH_ST_DELETE_ALL := 1
		);
	McAcp6DShGetInfoOptionEnum :
	(
		mcACP6D_POSITION_FEEDBACK := 0,
		mcACP6D_FORCE_FEEDBACK := 1
		);
		
	
		
		
	McAcp6DMacroDeleteCmdEnum :
	(
		mcACP6D_MACRO_DELETE_SPECIFIC := 0,
		mcACP6D_MACRO_DELETE_ALL := 1
		);
		
	McAcp6dPLCopenStateEnum :
	(
		mcACP6D_DISABLED := 0,
		mcACP6D_HOMING := 1,
		mcACP6D_READY := 2,
		mcACP6D_STOPPING := 3,
		mcACP6D_ERRORSTOP := 4,
		mcACP6D_STARTUP := 5,
		mcACP6D_INVALID_CONFIGURATION := 6
	);
			
		
	McAcp6DShStateEnum :
	(
		mcACP6D_SH_STATE_UNDETECTED 	:= 0,
		mcACP6D_SH_STATE_DISCOVERING 	:= 1,
		mcACP6D_SH_STATE_LANDED 		:= 2,
		mcACP6D_SH_STATE_IDLING			:= 3,
		mcACP6D_SH_STATE_DISABLED 		:= 4,
		mcACP6D_SH_STATE_MOTION 		:= 5,
		mcACP6D_SH_STATE_WAIT 			:= 6,
		mcACP6D_SH_STATE_STOPPING		:= 7,
		mcACP6D_SH_STATE_OBSTACLE 		:= 8,
		mcACP6D_SH_STATE_HOLD			:= 9,
		mcACP6D_SH_STATE_STOPPED 		:= 10,
		mcACP6D_SH_STATE_ERROR 			:= 14,
		mcACP6D_SH_STATE_RESERVED 		:= 15
		);
		
	McAcp6DZoneStateEnum :
	(
		mcACP6D_ZONE_NOT_AVAILABLE 		:= 0,
		mcACP6D_ZONE_ACTIVE_OPEN 		:= 1,
		mcACP6D_ZONE_DEACTIVATING 		:= 2,
		mcACP6D_ZONE_LOADING			:= 3,
		mcACP6D_ZONE_ACTIVATING 		:= 4,
		mcACP6D_ZONE_ACTIVE_CLOSED 		:= 5
		);

		
		
	McAcp6DJogVelocityParType : STRUCT
		Jog 		: BOOL;
		Direction 	: REAL; (*Direction in rad. 0 rad = positive x*)
		Velocity 	: REAL;		
	END_STRUCT;	
		
	McAcp6DAsmInfoType : STRUCT 
		AssemblyState : McAcp6dPLCopenStateEnum;
		Controller6DState : McAcp6DControllerStateEnum; (*Current system state*)
	END_STRUCT;
	
	McAcp6DConfigDiagType : STRUCT
		ConfigWrite : BOOL;
		ConfigReboot : BOOL;		
	END_STRUCT;
	
	McAcp6DTicketDiagType : STRUCT
		ExecutingTicket 			 : UINT;
		LastFinishedTicket 			 : UINT;
		ExecutingTicketHistory		 : ARRAY[0..99]OF UINT;
		LastFinishedTicketHistoryy	 : ARRAY[0..99]OF UINT;
		FreeTickets		 			 : UINT;
		LastExecutedCommand 		 : UINT;
		LastFinishedCommand			 : UINT;
		CommandHistory				 : ARRAY[0..99]OF UINT;
	END_STRUCT;
	
	McAcp6DAsmDiagType : STRUCT 
		Config : McAcp6DConfigDiagType;
		Ticket : McAcp6DTicketDiagType;
	END_STRUCT;
		
	McAcp6DAsmGetInfoType : 	STRUCT 
		State : McAcp6DControllerStateEnum; (*Current system state*)
		NumberOfShuttles : UINT; (*Number of shuttles recognized by the controller*)
		Power : REAL; (*Total power consumption. Sum of all segment power.*)
		MaxCPUTemp : REAL; (*Maximum CPU temperature of all segments. CPU temperature refers to the internal CPU inside the segment.*)
		MaxAmplifierTemp : REAL; (*Maximum Amplifier temperature of all segments. Amplifier temperature is equivalent to temperature at the center of a segment.*)
		MaxMotorTemp : REAL; (*Maximum Motor temperature of all segments. Motor temperature is equivalemt to the top middle surface temperature of a segment*)
	END_STRUCT;
	
	McAcp6DSegInfoType : 	STRUCT 
		Power : REAL; (*Total power consumption. Sum of all segment power.*)
		CPUTemp : REAL; (*CPU temperature of all segments. CPU temperature refers to the internal CPU inside the segment.*)
		AmplifierTemp : REAL; (*Amplifier temperature of all segments. Amplifier temperature is equivalent to temperature at the center of a segment.*)
		MotorTemp : REAL; (*Motor temperature of all segments. Motor temperature is equivalemt to the top middle surface temperature of a segment*)
	END_STRUCT;
	
	McAcp6DAsyncPosType : STRUCT
		X : REAL;
		Y : REAL;
		Shuttle : REFERENCE TO Mc6DShuttleType;
	END_STRUCT;
	
	McAcp6DMoveInPlaneAsyncParType : STRUCT
		Velocity		 : REAL;
		Acceleration	 : REAL;
		AsyncPar		 : ARRAY[0..77]OF McAcp6DAsyncPosType;
		MoveOnlySelectedShuttles : BOOL;
	END_STRUCT;
	
	McAcp6DShGroupShListParType : STRUCT
		Shuttle : REFERENCE TO Mc6DShuttleType; 
	END_STRUCT;
	
	McAcp6DShGroupAddShParType : STRUCT
		ShuttleList		 : ARRAY[0..31]OF McAcp6DShGroupShListParType;
	END_STRUCT;
	
	McAcp6DPlanetCtrlOptionEnum :
	(
		mcACP6D_PLANET_REMOVE_SH := 0,
		mcACP6D_PLANET_ADD_SH := 1
		);
	
	
	McAcp6DPlanetParType : STRUCT
		Option			 : McAcp6DPlanetCtrlOptionEnum;
		ShuttleList		 : ARRAY[0..31]OF McAcp6DShGroupShListParType;
	END_STRUCT;
	
	McAcp6DShGroupCoupleStateEnum :
	(
		mcACP6D_SH_GROUP_DECOUPLED := 0,
		mcACP6D_SH_GROUP_COUPLED := 1
	);
	
	McAcp6DShGroupCoupleOptionEnum :
	(
		mcACP6D_SH_GROUP_DECOUPLE := 0,
		mcACP6D_SH_GROUP_COUPLE := 1
	);
	
	McAcp6DShGroupCoupleModeEnum :
	(
		mcACP6D_SH_GROUP_INDV_ROT_REF 	:= 0,
		mcACP6D_SH_GROUP_CMN_ROT_REF 	:= 1
	);
	
	McAcp6DShGroupCoupleCtrlParType : STRUCT
		Mode	: McAcp6DShGroupCoupleModeEnum;
		Option 	: McAcp6DShGroupCoupleOptionEnum;
	END_STRUCT;
		
	McAcp6DShGroupInfoType : 	STRUCT 
		CoupleState : McAcp6DShGroupCoupleStateEnum;
		NumberOfShuttles : UINT;
	END_STRUCT;
		
	McAcp6DSegBarrierInfoType : 	STRUCT 
		State : McAcp6DZoneStateEnum;
		NumberOfShuttles : UINT;
	END_STRUCT;
	
	McAcp6DZoneBarrierInfoType : 	STRUCT 
		State : McAcp6DZoneStateEnum;
		NumberOfShuttles : UINT;
	END_STRUCT;
	
	McAcp6DZoneTypeEnum :
	(
		mcACP6D_ZONE_TYPE_NORMAL 		:= 0
		);
		
	McAcp6DForceModeOptionEnum :
	(
		mcACP6D_FORCE_MODE_EXIT := 0,
		mcACP6D_FORCE_MODE_Z 	:= 1,
		mcACP6D_FORCE_MODE_X 	:= 2,
		mcACP6D_FORCE_MODE_Y	:= 3,
		mcACP6D_FORCE_MODE_XY 	:= 4
	);

	
	McAcp6DCreateZoneParType : STRUCT
		Name : STRING[33]; (*Not working*)
		ZoneType : McAcp6DZoneTypeEnum; (*Not working*)
		BottomLeft : McAcp6DInPlaneAxesType;
		TopRight   : McAcp6DInPlaneAxesType;
	END_STRUCT;	
	
	McAcp6DGetShAddInfoType : STRUCT
		ShuttleID : UINT;
	END_STRUCT;
	
	McAcp6DGetSegAddInfoType : STRUCT
		SegmentID : UINT;
	END_STRUCT;
	
	McAcp6DGetZoneAddInfoType : STRUCT
		ZoneID : UINT;
	END_STRUCT;
	
	McAcp6DGetShGroupAddInfoType : STRUCT
		GroupID : UINT;
	END_STRUCT;
	
	
	McAcp6DMoveModeEnum : 
		(
		mcACP6D_MOVE_ABSOLUTE := 0,
		mcACP6D_MOVE_RELATIVE := 1
		);
		
	McAcp6DInPlanePathEnum : 
		(
		mcACP6D_PATH_DIRECT := 0,
		mcACP6D_PATH_X_THEN_Y := 1,
		mcACP6D_PATH_Y_THEN_X := 2
		);
	McAcp6DArcDirectionEnum : 
		(
		mcACP6D_ARC_CLOCKWISE := 0,
		mcACP6D_ARC_COUNTER_CLOCKWISE := 1
		);
		
	McAcp6DArcOptionEnum : 
		(
		mcACP6D_ARC_RADIUS := 0,
		mcACP6D_ARC_ANGULAR := 1
		);
		
	McAcp6DArcTypeEnum : 
		(
		mcACP6D_ARC_MINOR, (*Minor Arc (shortest arc path) to the target position*)
		mcACP6D_ARC_MAJOR (*Major Arc (longest arc path) to the target position*)
		);
		
	McAcp6DShortAxRotEnum : 
		(
		mcACP6D_SHORT_AX_ROT_ONLY,
		mcACP6D_SHORT_AX_ROT_CENTER
		);
		
	McAcp6DLevitationLevelEnum : 
		(
		mcACP6D_LEVEL_LAND := 0,
		mcACP6D_LEVEL_LEVITATE := 1
		);
		
	McAcp6DBufferStateEnum	:
	(
		mcACP6D_BUFFER_STATE_BLOCKED 	:= 0,
		mcACP6D_BUFFER_STATE_OPEN		:= 1
	);
	McAcp6DHaltOptionEnum	:
	(
		mcACP6D_CONTINUE 	:= 0,
		mcACP6D_HALT		:= 1
	);
	
	McAcp6DAsmBufferOptionEnum : 
	(
		mcACP6D_BUFFER_ASM_BLOCK 		:= 0,
		mcACP6D_BUFFER_ASM_RELEASE 		:= 1,
		mcACP6D_BUFFER_ASM_CLEAR 		:= 2
	);
		McAcp6DShGroupBufferOptionEnum : 
	(
		mcACP6D_BUFFER_SHGROUP_BLOCK 		:= 0,
		mcACP6D_BUFFER_SHGROUP_RELEASE 		:= 1
	);
	
	McAcp6DBufferOptionEnum : 
	(
		mcACP6D_BUFFER_BLOCK 		:= 0,
		mcACP6D_BUFFER_RELEASE 		:= 1,
		mcACP6D_BUFFER_CLEAR 		:= 2,
		mcACP6D_BUFFER_GET_STATUS 	:= 3
	);
	
	McAcp6DBarrierCmdEnum : 
		(
		mcACP6D_BARRIER_OPEN 	:= 0,
		mcACP6D_BARRIER_CLOSE 	:= 1
		);
		
	McAcp6DBarrierCmdParType : STRUCT
		Command : McAcp6DBarrierCmdEnum;
	END_STRUCT;		
		
	McAcp6DInPlaneAxesType : STRUCT
		X : REAL;
		Y : REAL;
	END_STRUCT;
	
	McAcp6DShortAxAxesType : STRUCT
		Z : REAL;
		Rx : REAL;
		Ry : REAL;
		Rz : REAL;
	END_STRUCT;
	
	McAcp6DInPlaneParType : STRUCT 
		Position : McAcp6DInPlaneAxesType;
		Velocity : REAL;
		EndVelocity : REAL;
		Acceleration : REAL;
		Mode : McAcp6DMoveModeEnum; (*Position Mode. Mode = 0: Absolute, Mode = 1: Relative*) (* *) (*#PAR*)
		Path : McAcp6DInPlanePathEnum;
	END_STRUCT;
	
	McAcp6DAxisBoolType : STRUCT
		X : BOOL;
		Y : BOOL;
		Z : BOOL;
		RX : BOOL;
		RY : BOOL;
		RZ : BOOL;
	END_STRUCT;
	
	McAcp6DMoveCyclicParType: STRUCT
		DisableAxis : McAcp6DAxisBoolType;
	END_STRUCT;
	
	McAcp6DValueSrcEnum : 
		(
		mcACP6D_VALUE_ACTUAL := 0
		);
	
	McAcp6DReadCyclicParType: STRUCT
		ValueSource : McAcp6DValueSrcEnum;
	END_STRUCT;
	
	McAcp6DShortAxRotType : STRUCT 
		Type : McAcp6DShortAxRotEnum;
		Center : McAcp6DInPlaneAxesType;
	END_STRUCT;
	
	McAcp6DShortAxParType : STRUCT 
		Position : McAcp6DShortAxAxesType;
		Velocity : McAcp6DShortAxAxesType;
		Mode : McAcp6DMoveModeEnum;
		Rotation : McAcp6DShortAxRotType;
	END_STRUCT;
	
	
	McAcp6DArcAngularType : STRUCT 
		Center: McAcp6DInPlaneAxesType;
		Angle : REAL;
	END_STRUCT;
	
	McAcp6DArcRadiusType : STRUCT
		Position : McAcp6DInPlaneAxesType;
		Radius	 : REAL;
		ArcType	 : McAcp6DArcTypeEnum;
	END_STRUCT;
	
	McAcp6DArcParType : STRUCT 
		Direction : McAcp6DArcDirectionEnum;
		Velocity : REAL;
		EndVelocity : REAL;
		Acceleration : REAL;
		Mode : McAcp6DMoveModeEnum; (*Position Mode. Mode = 0: Absolute, Mode = 1: Relative*) (* *) (*#PAR*)
		Option : McAcp6DArcOptionEnum;
		Angular : McAcp6DArcAngularType;
		Radius : McAcp6DArcRadiusType;
	END_STRUCT;
	
	McAcp6DLevitationParType : STRUCT
		Level : McAcp6DLevitationLevelEnum;
		Speed : USINT;
	END_STRUCT;
	
	McAcp6DShortAx6DParType : STRUCT 
		Position : McAcp6DShortAxAxesType;
		Velocity : McAcp6DShortAxAxesType;
	END_STRUCT;
	
	McAcp6DInPlane6DParType : STRUCT 
		Position : McAcp6DInPlaneAxesType;
		Velocity : REAL;
		Acceleration : REAL;
	END_STRUCT;
	
	McAcp6DMove6DParType : STRUCT
		InPlane : McAcp6DInPlane6DParType;
		ShortAxis : McAcp6DShortAx6DParType;
	END_STRUCT;
	
	McAcp6DShPositionType : STRUCT
		X : REAL;
		Y : REAL;
		Z : REAL;
		Rx : REAL;
		Ry : REAL;
		Rz : REAL;
	END_STRUCT;
	
	
	
	McAcp6DShForceType : STRUCT
		Fx : REAL;
		Fy : REAL;
		Fz : REAL;
		Tx : REAL;
		Ty : REAL;
		Tz : REAL;
	END_STRUCT;
	
	McAcp6DForceModeParType : STRUCT
		Option : McAcp6DForceModeOptionEnum;
		Force  : McAcp6DShForceType;
	END_STRUCT;
	
	
	McAcp6DShInfoMotionBufferType : STRUCT
		NumberOfCommands : UINT;
		IsBlocked		 : BOOL;
		CommandLabel	 : UINT;
	END_STRUCT;
	
	McAcp6DShInfoType : STRUCT
		ShuttleID 	: UINT;
		State 		: McAcp6DShStateEnum;
		Position	: McAcp6DShPositionType;
	END_STRUCT;
	
	McAcp6DShGetInfoType : STRUCT
		ShuttleID 	: UINT;
		State	 : McAcp6DShStateEnum;
		Position : McAcp6DShPositionType;
		Force	 : McAcp6DShForceType;
		IsHalt		: BOOL;
		MotionBuffer	: McAcp6DShInfoMotionBufferType;
		ForceMode		: McAcp6DAxisBoolType;
		StarShuttle		: Mc6DShuttleType;
	END_STRUCT;
	
	McAcp6DShGetPropertyType : STRUCT
		ShuttleType 	: McAcp6DShTypesEnum;
	END_STRUCT;
	
	McAcp6DBufferInfoType : STRUCT
		NumberOfCommands : UINT;
		State			 : McAcp6DBufferStateEnum;
		NextCmdLabel	 : UINT;
		LatestCmdLabel	 : UINT;		
	END_STRUCT;
	
	McAcp6DErrInfoType : STRUCT
		NumberOfErrors : USINT;
		ErrorCode	    : ARRAY[0..8]OF DINT;
	END_STRUCT;
	
	McAcp6DShTypesEnum :
	(
		mcACP6D_SH_TYPE_120_120 	:= 0,
		mcACP6D_SH_TYPE_180_120 	:= 2,
		mcACP6D_SH_TYPE_120_180 	:= 3,
		mcACP6D_SH_TYPE_180_180 	:= 6,
		mcACP6D_SH_TYPE_210_180 	:= 8,
		mcACP6D_SH_TYPE_180_210 	:= 9,
		mcACP6D_SH_TYPE_210_210 	:= 12,
		mcACP6D_SH_TYPE_240_240 	:= 14,
		mcACP6D_SH_TYPE_300_300 	:= 16,
		mcACP6D_SH_TYPE_330_330 	:= 18,
		mcACP6D_SH_TYPE_450_450 	:= 20
		);
		
	McAcp6DShPerformanceLevelEnum :
	(
		mcACP6D_SH_PERF_STABILITY 		:= 0,
		mcACP6D_SH_PERF_SEMI_STABILITY	:= 1,
		mcACP6D_SH_PERF_SEMI_AGGRESSIVE	:= 2,
		mcACP6D_SH_PERF_AGGRESSIVE		:= 3
		);
		
	McAcp6DPayloadSizeType: STRUCT
		XOffsetPos : REAL;
		XOffsetNeg : REAL;
		YOffsetPos : REAL;
		YOffsetNeg : REAL;
	END_STRUCT;
	
	McAcp6DCoGType: STRUCT
		X : REAL;
		Y : REAL;
		Z : REAL;	
	END_STRUCT;
	
	
	McAcp6DShStereotypeParType: STRUCT
		Name : STRING[33];
		ShuttleType : McAcp6DShTypesEnum;
		PerformanceLevel : McAcp6DShPerformanceLevelEnum;
		Payload : REAL;
		PayloadSize : McAcp6DPayloadSizeType;
		CenterOfGravity : McAcp6DCoGType;
	END_STRUCT;
	
	McAcp6DMacroCreateParType: STRUCT
		Name : STRING[33];
	END_STRUCT;
	
	McAcp6DFuncInfoType : 	STRUCT  (*Stores the status of a single function block instance*) (* *) (*#OMIT*)
		CmdSta : USINT;
		TicketNumber : USINT;
		EventID : UINT;
		SendToPMC : BOOL;
		ReadFromPMC : BOOL;
		MsgPartNStatus : DINT;
	END_STRUCT;
	
	
	McAcp6DRotaryMotionModeEnum :
	(
		mcACP6D_ROTATE_ABSOLUTE_POS			:= 0,
		mcACP6D_ROTATE_COUNTER_CLOCKWISE	:= 1,
		mcACP6D_ROTATE_CLOCKWISE			:= 2
		);
		
	McAcp6DRotaryMotionParType: STRUCT
		Mode : McAcp6DRotaryMotionModeEnum;
		Angle : REAL;
		Velocity : REAL;
		Acceleration : REAL;
	END_STRUCT;
	
		McAcp6DRotaryMotionSpinParType: STRUCT
		Duration: REAL;
		Angle : REAL;
		Velocity : REAL;
		Acceleration : REAL;
	END_STRUCT;
	

	
	
END_TYPE