
TYPE
	Acp6DCmdType : 	STRUCT 
		PowerOn : BOOL;
		PowerOff : BOOL;
		ErrorReset : BOOL;
		Init : BOOL;
		StartProcess : BOOL;
		StopProcess : BOOL;
		Stop : BOOL;
		gameProgramDeleteShuttle : BOOL;
	END_STRUCT;
	Acp6DCtrlType : 	STRUCT 
		Cmd : Acp6DCmdType;
		Status : Acp6DStatusType;
		Par : Acp6DParType;
	END_STRUCT;
	Acp6DParType : 	STRUCT 
		Acceleration : REAL := 10;
		Velocity : REAL := 2;
		modeSelector : driveModes;
		rotationVelocity : REAL := 200;
		rotationAcceleration : REAL := 10;
	END_STRUCT;
	Acp6DStatusType : 	STRUCT 
		Error : BOOL;
		ErrorID : DINT;
		Ready : BOOL;
		PowerOn : BOOL;
		ReadyToPowerOn : BOOL;
		ShuttleInfo : ARRAY[0..NUM_SHUTTLES]OF ShuttleInfoType;
		ShuttleInfoVis : ARRAY[0..NUM_SHUTTLES]OF ShuttleInfoType;
		currentNumShuttles : UINT;
	END_STRUCT;
	box_typ : 	STRUCT 
		smallBox : BOOL;
		bottle : BOOL;
		bigBox : BOOL;
		LastTypeWasBox : BOOL;
	END_STRUCT;
	driveModes : 
		(
		none := 0, (*bootup*)
		vision := 1,
		weight := 2,
		linkMovement := 3,
		gameProgram := 4,
		demoProgram := 5,
		shuttleToConveyor := 6,
		workstationMovement := 8,
		conveyorStationMovement := 9,
		dialGauge := 7,
		danfossMode := 10,
		sunMovement := 11,
		flaskProgram := 12,
		boxProgram := 13,
		rotationProgram := 14,
		steelSheet := 15,
		test := 16,
		smartLab := 17
		);
	ShuttleInfoType : 	STRUCT 
		ID : UINT;
		State : McAcp6DShStateEnum;
		Force : McAcp6DShForceType;
		Position : McAcp6DShPositionType;
		inUse : BOOL; (*DryStation Bool*)
		lastgPath : DINT := 100;
		shuttleRef : Mc6DShuttleType;
	END_STRUCT;
	shuttleStartup_typ : 	STRUCT 
		initYPos : REAL;
		initXPos : REAL;
		nextStationSelector : STRING[80] := '0';
		initZPos : REAL;
		initRxPos : REAL;
		initRyPos : REAL;
		initRzPos : REAL;
	END_STRUCT;
END_TYPE
