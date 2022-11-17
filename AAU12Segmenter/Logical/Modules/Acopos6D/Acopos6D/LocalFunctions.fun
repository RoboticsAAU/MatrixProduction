
{REDUND_OK} FUNCTION_BLOCK CreateRouteSheet (*TODO: Add your comment here*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		inputProductOrder : product_order;
	END_VAR
	VAR_OUTPUT
		outputRouteSheet : ARRAY[0..5] OF USINT;
	END_VAR
	VAR
		tempIndex : USINT;
		routeSize : USINT;
		i : USINT;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} FUNCTION QuadrantIdxToPos : REAL
	VAR_INPUT
		quadrantIdx : USINT;
	END_VAR
END_FUNCTION

{REDUND_ERROR} FUNCTION COVER_TYPE_TO_USINT : USINT (*TODO: Add your comment here*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		coverType : cover_types;
	END_VAR
END_FUNCTION

{REDUND_ERROR} FUNCTION_BLOCK ShuttlesAtPositions (*TODO: Add your comment here*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		shuttleInfo : REFERENCE TO ARRAY[0..NUM_SHUTTLES] OF ShuttleInfoType;
		checkPosX : ARRAY[0..7] OF REAL; (*Should technically be 48 (12 segments * 4 positions)*)
		checkPosY : ARRAY[0..7] OF REAL; (*Should technically be 48 (12 segments * 4 positions)*)
		checkShuttleState : ARRAY[0..7] OF McAcp6DShStateEnum := [8(0)]; (*Don't set if all states should be checked*)
		numCheckedPos : USINT;
	END_VAR
	VAR_OUTPUT
		isAtCheckPos : BOOL;
		shuttleID : USINT;
	END_VAR
	VAR
		MARGIN : REAL := 0.005;
		i : USINT;
		k : USINT;
		numShuttles : USINT := 8;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} FUNCTION_BLOCK ShuttlesInRange
	VAR_INPUT
		shuttleInfo : REFERENCE TO ARRAY[0..NUM_SHUTTLES] OF ShuttleInfoType;
		checkRangeX1 : REAL;
		checkRangeX2 : REAL;
		checkRangeY1 : REAL;
		checkRangeY2 : REAL;
	END_VAR
	VAR_OUTPUT
		isInRange : BOOL;
	END_VAR
	VAR
		checkRangeStartX : REAL;
		checkRangeEndX : REAL;
		checkRangeStartY : REAL;
		checkRangeEndY : REAL;
		MARGIN : REAL := 0.005;
		i : USINT;
		numShuttles : USINT := 8;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK ShuttlesInWorkstationBuffer
	VAR_INPUT
		shuttleInfo : REFERENCE TO ARRAY[0..NUM_SHUTTLES] OF ShuttleInfoType;
		workstation : workStation_typ;
	END_VAR
	VAR_OUTPUT
		isInBuffer : BOOL;
	END_VAR
	VAR
		ShuttlesAtPositions_0 : ShuttlesAtPositions;
		ShuttlesInRange_0 : ShuttlesInRange;
		MARGIN : REAL := 0.005;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} FUNCTION AreWorkstationsOpposite : BOOL (* *) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		workstationID1 : INT;
		workstationID2 : INT;
	END_VAR
END_FUNCTION

{REDUND_ERROR} FUNCTION AreWorkstationsAdjacent : BOOL
	VAR_INPUT
		workstationID1 : INT;
		workstationID2 : INT;
	END_VAR
END_FUNCTION
