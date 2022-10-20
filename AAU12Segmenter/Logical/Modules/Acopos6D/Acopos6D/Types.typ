
TYPE
	shuttle_typ : 	STRUCT 
		cm : brdkCM;
		status : shuttle_status_typ;
		par : shuttle_par_typ;
		function : shuttle_function_typ;
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
	gameMemory_typ : 	STRUCT 
		shuttlesIDs : ARRAY[0..NUM_SHUTTLES]OF USINT;
		shuttlesLeft : USINT;
		shuttlesDead : ARRAY[0..NUM_SHUTTLES]OF BOOL;
		shuttlePicked : ARRAY[0..NUM_SHUTTLES]OF BOOL;
		startGame : BOOL;
		choosenRandomShuttle : UDINT;
		showHMIButton : BOOL;
		showStartBtnHMI : BOOL;
		playerNumeric : REAL;
		players : ARRAY[0..NUM_SHUTTLES]OF BOOL;
		loosingShuttlesIDs : ARRAY[0..NUM_SHUTTLES]OF USINT;
		winningShuttleID : USINT;
		showWinningNumber : BOOL;
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
		ID : UINT;
	END_STRUCT;
	cover_types : 
		(
		noCover := 0,
		blackCover := 1,
		whiteCover := 2,
		blueCover := 3
		);
	shuttle_plan : 	STRUCT 
		shuttleIdx : USINT;
		productOrder : REFERENCE TO product_order;
		routingSheet : REFERENCE TO ARRAY[0..3]OF SINT;
		progressSheet : ARRAY[0..3]OF SINT;
	END_STRUCT;
END_TYPE
