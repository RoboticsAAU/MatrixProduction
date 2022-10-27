
TYPE
	shuttle_plan : 	STRUCT 
		shuttleIdx : USINT;
		productOrder : product_order;
		routingSheet : ARRAY[0..5]OF STRING[10];
		progressIndex : USINT := 0;
	END_STRUCT;
	shuttle_status_typ : 	STRUCT 
		dummy : USINT;
	END_STRUCT;
	shuttle_par_typ : 	STRUCT 
		shuttleID : USINT;
	END_STRUCT;
	shuttle_function_typ : 	STRUCT 
		MC_BR_Move6D_Acp6D_0 : MC_BR_Move6D_Acp6D;
		MC_BR_MoveShortAxis_Acp6D_0 : MC_BR_MoveShortAxis_Acp6D;
		MC_BR_ShGetPayload_Acp6D_0 : MC_BR_ShGetPayload_Acp6D;
		MC_BR_MoveInPlane_Acp6D_0 : MC_BR_MoveInPlane_Acp6D;
		TON_0 : TON;
	END_STRUCT;
	shuttlePos : 	STRUCT 
		xPos : REAL;
		yPos : REAL;
	END_STRUCT;
	test_typ : 	STRUCT 
		targetReached : ARRAY[0..3]OF BOOL := [4(FALSE)];
	END_STRUCT;
	thisShuttleSetup : 	STRUCT 
		Shuttle2 : shuttlePos;
		Shuttle3 : shuttlePos;
		Shuttle4 : shuttlePos;
		Shuttle1 : shuttlePos;
	END_STRUCT;
	ABB_typ : 	STRUCT 
		HomePositionReached : BOOL;
		startSmallWeightMovement : BOOL;
		returnBigWeightMovement : BOOL;
		returnSmallWeightMovement : BOOL;
		startBigWeightMovement : BOOL;
	END_STRUCT;
	product_order : 	STRUCT 
		amount : USINT;
		bottomCover : cover_types;
		topCover : cover_types;
		PCB : BOOL;
		Fuses : USINT;
		Holes : UINT;
		ID : UINT;
	END_STRUCT;
	cover_types : 
		(
		noCover := 0,
		blackCover := 1,
		whiteCover := 2,
		blueCover := 3
		);
	shuttle_typ : 	STRUCT 
		cm : brdkCM;
		status : shuttle_status_typ;
		par : shuttle_par_typ;
		function : shuttle_function_typ;
	END_STRUCT;
	workStation_cmd_typ : 	STRUCT 
		dummy : USINT;
	END_STRUCT;
	workStation_par_typ : 	STRUCT 
		landBeforeProcess : BOOL; (*TRUE = yes*)
		yLocation : REAL;
		xLocation : REAL;
		tempShuttleID : USINT;
		processTime : REAL;
		pathRouting : USINT := 0; (*0 Diagonal, 1 First X then Y, 2 First Y then X*)
		nextStationSelector : STRING[80];
		ArcMovement : BOOL;
		internalCounter : USINT;
		tempCounter : USINT;
		approachPosX : REAL;
		approachPosY : REAL;
		departPosX : REAL;
		departPosY : REAL;
	END_STRUCT;
	workStation_status_typ : 	STRUCT 
		componentName : STRING[80];
		active : BOOL;
		oneshot : BOOL;
	END_STRUCT;
	workStation_typ : 	STRUCT 
		par : workStation_par_typ;
		status : workStation_status_typ;
		cmd : workStation_cmd_typ;
		cm : brdkCM;
		MC_BR_RotaryMotionSpin_Acp6D_0 : MC_BR_RotaryMotionSpin_Acp6D;
		MC_BR_RotaryMotion_Acp6D_0 : MC_BR_RotaryMotion_Acp6D;
		MC_BR_MoveInPlane_Acp6D_0 : MC_BR_MoveInPlane_Acp6D;
		MC_BR_ShLevitation_Acp6D_0 : MC_BR_ShLevitation_Acp6D;
		TON_0 : TON;
		workstationSwitcher : BOOL;
		MC_BR_MoveArc_Acp6D_0 : MC_BR_MoveArc_Acp6D;
		MC_BR_Move6D_Acp6D_0 : MC_BR_Move6D_Acp6D;
	END_STRUCT;
END_TYPE
