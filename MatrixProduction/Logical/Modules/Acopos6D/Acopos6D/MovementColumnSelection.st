
FUNCTION_BLOCK MovementColumnSelection
	
	// Accessing the address
	tempOccupiedPosition ACCESS ADR(occupiedPosition);
	
	// Set parameters for setting occupied positions
	bottomRowLevel := startRowLevel := PosToQuadrantIdx(startPosY);
	topRowLevel := endRowLevel := PosToQuadrantIdx(endPosY);
	
	IF startRowLevel > endRowLevel THEN
		bottomRowLevel := endRowLevel;
		topRowLevel := startRowLevel;
	END_IF
	
	IF opt_movementDone THEN
		FOR k := bottomRowLevel TO topRowLevel DO
			tempOccupiedPosition[opt_resetColumn, k] := FALSE;
		END_FOR
		
		opt_resetColumn := FALSE;
		opt_movementDone := FALSE;
		RETURN;
	END_IF
	
	// If the movementDone is not set, find the closest available column
	FOR i := 0 TO 3 DO
		// Setting the index for the column looked at
		IF prioritiseLowColumns THEN
			selectedHighwayColumn := i;
		ELSE
			selectedHighwayColumn := 3-i;
		END_IF
		
		// Assume column is possible (and try to deny it)
		columnIsPossible := TRUE;
		
		// Going trough the rows the movement would go through and seing if it is possible
		FOR k := bottomRowLevel TO topRowLevel DO
			IF tempOccupiedPosition[selectedHighwayColumn, k] THEN
				columnIsPossible := FALSE;
				EXIT;
			END_IF
		END_FOR
		
		// If movement in the column is possible, occupy this column (selected column is already set)
		IF columnIsPossible THEN
			FOR k := bottomRowLevel TO topRowLevel DO
				tempOccupiedPosition[selectedHighwayColumn, k] := TRUE;
			END_FOR
			RETURN;
		END_IF
	
	END_FOR
	
	// If no column was available, set it to -1
	selectedHighwayColumn := -1;
	
END_FUNCTION_BLOCK