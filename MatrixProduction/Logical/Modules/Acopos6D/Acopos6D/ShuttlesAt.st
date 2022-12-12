
FUNCTION_BLOCK ShuttlesAtPositions
	
	// Access the shuttle information
	tempShuttleInfo ACCESS ADR(shuttleInfo); 
	
	// Shuttle is not at checkPos by default
	isAtCheckPos := FALSE;
	
	// Check if a shuttle is at any of the positions
	FOR k := 0 TO (numCheckedPos - 1) DO
		FOR i := 0 TO (numShuttles - 1) DO
			IF ((tempShuttleInfo[i].Position.X > checkPosX[k] - MARGIN AND tempShuttleInfo[i].Position.X < checkPosX[k] + MARGIN) AND
				(tempShuttleInfo[i].Position.Y > checkPosY[k] - MARGIN AND tempShuttleInfo[i].Position.Y < checkPosY[k] + MARGIN)) AND
				(opt_checkShuttleState[k] = 0 OR tempShuttleInfo[i].State = opt_checkShuttleState[k]) THEN // Shuttle state 0 corresponds to any state being accepted
				isAtCheckPos := TRUE;
				shuttleID := i;
				EXIT;
			END_IF
		END_FOR
		
		IF isAtCheckPos THEN
			 // Done such that shuttleID will be the first checked position with shuttle (in case there are shuttles at several of the checked positions)
			EXIT;
		END_IF
	END_FOR
	
	// Reset checkShuttleState for next time FB is called
	FOR k := 0 TO (numCheckedPos - 1) DO
		opt_checkShuttleState[k] := 0;
	END_FOR
	
END_FUNCTION_BLOCK

FUNCTION_BLOCK ShuttlesInRange
	
	// Access the shuttle information
	tempShuttleInfo ACCESS ADR(shuttleInfo);
	
	// Setting start and end range of X
	IF checkRangeX1 < checkRangeX2 THEN
		checkRangeStartX := checkRangeX1;
		checkRangeEndX := checkRangeX2;
	ELSE
		checkRangeStartX := checkRangeX2;
		checkRangeEndX := checkRangeX1;
	END_IF
	
	// Setting start and end range of Y
	IF checkRangeY1 < checkRangeY2 THEN
		checkRangeStartY := checkRangeY1;
		checkRangeEndY := checkRangeY2;
	ELSE
		checkRangeStartY := checkRangeY2;
		checkRangeEndY := checkRangeY1;
	END_IF
	
	// Shuttle is not in the range by default
	isInRange := FALSE;
	
	// Check if the shuttle is in the rectangular range
	FOR i := 0 TO (numShuttles - 1) DO
		IF (tempShuttleInfo[i].Position.X > checkRangeStartX - MARGIN AND tempShuttleInfo[i].Position.X < checkRangeEndX + MARGIN) AND
			(tempShuttleInfo[i].Position.Y > checkRangeStartY - MARGIN AND tempShuttleInfo[i].Position.Y < checkRangeEndY + MARGIN) THEN
			isInRange := TRUE;
			EXIT;
		END_IF
	END_FOR
	
END_FUNCTION_BLOCK

FUNCTION_BLOCK ShuttlesInWorkstationBuffer
	
	// Set the address of shuttleinfo to the function blocks
	ShuttlesAtPositions_0.shuttleInfo := ADR(shuttleInfo);
	ShuttlesInRange_0.shuttleInfo := ADR(shuttleInfo);
	
	// Shuttle is not in the buffer by default
	isInBuffer := FALSE;
	
	// Check idle shuttle at approach point
	ShuttlesAtPositions_0.checkPosX[0] := workstation.par.approachPosX;
	ShuttlesAtPositions_0.checkPosY[0] := workstation.par.approachPosY;
	ShuttlesAtPositions_0.opt_checkShuttleState[0] := mcACP6D_SH_STATE_IDLING;
	ShuttlesAtPositions_0.numCheckedPos := 1;
	ShuttlesAtPositions_0();
	
	// Check rest of buffer
	IF workstation.par.workstationID <= 2 THEN
		ShuttlesInRange_0.checkRangeX1 := workstation.par.approachPosX + 2*MARGIN; // 2*MARGIN to avoid checking approach point
	ELSE
		ShuttlesInRange_0.checkRangeX1 := workstation.par.approachPosX - 2*MARGIN;
	END_IF
	ShuttlesInRange_0.checkRangeX2 := workstation.par.xLocation;
	ShuttlesInRange_0.checkRangeY1 := workstation.par.approachPosY;
	ShuttlesInRange_0.checkRangeY2 := workstation.par.approachPosY;
	ShuttlesInRange_0();
	
	IF ShuttlesAtPositions_0.isAtCheckPos OR ShuttlesInRange_0.isInRange THEN
		isInBuffer := TRUE;
	END_IF
	
END_FUNCTION_BLOCK