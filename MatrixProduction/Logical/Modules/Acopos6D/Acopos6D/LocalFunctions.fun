
{REDUND_ERROR} FUNCTION_BLOCK CreateRouteSheet (*TODO: Add your comment here*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		inputProductOrder : product_order;
	END_VAR
	VAR_OUTPUT
		outputRouteSheet : ARRAY[0..5] OF USINT;
	END_VAR
	VAR
		i : USINT;
		tempIndex : USINT;
		routeSize : USINT;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} FUNCTION_BLOCK MovementColumnSelection
	VAR_INPUT
		occupiedPosition : REFERENCE TO ARRAY[0..3,0..7] OF BOOL; (*4 highway columns and 8 highway rows*)
		startPosY : REAL;
		endPosY : REAL;
		prioritiseLowColumns : BOOL;
		opt_movementDone : BOOL; (*Reset the positions that were occupied by the movement*)
		opt_resetColumn : SINT;
	END_VAR
	VAR_OUTPUT
		selectedHighwayColumn : SINT;
	END_VAR
	VAR
		tempOccupiedPosition : REFERENCE TO ARRAY[0..3,0..7] OF BOOL;
		columnIsPossible : BOOL;
		startRowLevel : USINT;
		endRowLevel : USINT;
		bottomRowLevel : USINT;
		topRowLevel : USINT;
		i : USINT;
		k : USINT;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} FUNCTION_BLOCK ShuttlesAtPositions (*TODO: Add your comment here*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		shuttleInfo : REFERENCE TO ARRAY[0..NUM_SHUTTLES] OF ShuttleInfoType;
		checkPosX : ARRAY[0..7] OF REAL; (*Should technically be 48 (12 segments * 4 positions)*)
		checkPosY : ARRAY[0..7] OF REAL; (*Should technically be 48 (12 segments * 4 positions)*)
		opt_checkShuttleState : ARRAY[0..7] OF McAcp6DShStateEnum := [8(0)]; (*Don't set if all states should be checked*)
		numCheckedPos : USINT;
	END_VAR
	VAR_OUTPUT
		isAtCheckPos : BOOL;
		shuttleID : USINT;
	END_VAR
	VAR
		i : USINT;
		k : USINT;
		MARGIN : REAL := 0.005;
		numShuttles : USINT := 8;
		tempShuttleInfo : REFERENCE TO ARRAY[0..NUM_SHUTTLES] OF ShuttleInfoType;
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
		i : USINT;
	END_VAR
	VAR CONSTANT
		MARGIN : REAL := 0.005;
		numShuttles : USINT := 8;
	END_VAR
	VAR
		tempShuttleInfo : REFERENCE TO ARRAY[0..NUM_SHUTTLES] OF ShuttleInfoType;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} FUNCTION_BLOCK ShuttlesInWorkstationBuffer
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
	END_VAR
	VAR CONSTANT
		MARGIN : REAL := 0.005;
	END_VAR
	VAR
		tempShuttleInfo : REFERENCE TO ARRAY[0..NUM_SHUTTLES] OF ShuttleInfoType;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} FUNCTION_BLOCK ShuttleTouchQuadrantPos
	VAR_INPUT
		shuttlePos : shuttlePos;
	END_VAR
	VAR_OUTPUT
		quadrantPosX : ARRAY[0..3] OF USINT;
		quadrantPosY : ARRAY[0..3] OF USINT;
		numTouches : USINT;
	END_VAR
	VAR
		shuttleLength : REAL;
		minX : REAL;
		maxX : REAL;
		minY : REAL;
		maxY : REAL;
		xQuadrantTouched : ARRAY[0..1] OF USINT;
		yQuadrantTouched : ARRAY[0..1] OF USINT;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} FUNCTION_BLOCK ParabolicBlend (*TODO: Add your comment here*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		absVelocity : {REDUND_UNREPLICABLE} REAL;
		absAcceleration : {REDUND_UNREPLICABLE} REAL;
		evalPos : REAL;
		startPos : {REDUND_UNREPLICABLE} REAL;
		endPos : REAL;
	END_VAR
	VAR_OUTPUT
		durationAtEvalDist : {REDUND_UNREPLICABLE} REAL;
	END_VAR
	VAR
		blendDistance : REAL;
		blendTime : REAL;
		tempPos : REAL;
		fullDuration : REAL;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} FUNCTION_BLOCK RandomOrderGeneration
	VAR_INPUT
		refOrder : REFERENCE TO product_order;
		generate : BOOL;
		opt_randOrderAmount : USINT;
	END_VAR
	VAR
		tempRefOrder : REFERENCE TO product_order;
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

{REDUND_ERROR} FUNCTION ArePositionsOnSameRow : BOOL
	VAR_INPUT
		yPos1 : REAL;
		yPos2 : REAL;
	END_VAR
	VAR
		yQuadrantPos1 : SINT;
		yQuadrantPos2 : SINT;
	END_VAR
END_FUNCTION

{REDUND_ERROR} FUNCTION ArePositionsOnSameColumn : BOOL
	VAR_INPUT
		xPos1 : REAL;
		xPos2 : REAL;
	END_VAR
	VAR
		xQuadrantPos1 : SINT;
		xQuadrantPos2 : SINT;
	END_VAR
END_FUNCTION

{REDUND_ERROR} FUNCTION QuadrantIdxToPos : REAL
	VAR_INPUT
		quadrantIdx : USINT;
	END_VAR
END_FUNCTION

{REDUND_ERROR} FUNCTION PosToQuadrantIdx : USINT
	VAR_INPUT
		pos : REAL;
	END_VAR
END_FUNCTION

{REDUND_ERROR} FUNCTION COVER_TYPE_TO_USINT : USINT (*TODO: Add your comment here*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		coverType : cover_types;
	END_VAR
END_FUNCTION
