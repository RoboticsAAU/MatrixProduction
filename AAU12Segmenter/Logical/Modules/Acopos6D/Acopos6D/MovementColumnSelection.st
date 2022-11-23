
FUNCTION_BLOCK MovementColumnSelection
	
	// Accessing the address
	occupiedPosition ACCESS ADR(occupiedPosition);
	
	// Determining the start and end row levels
	startRowLevel := PosToQuadrantIdx(pos := startWorkstation.par.departPosY);
	endRowLevel := PosToQuadrantIdx(pos := endWorkstation.par.approachPosY);
	
	IF opt_movementDone THEN
		FOR k := startRowLevel TO endRowLevel DO
			occupiedPosition[opt_resetColumn, k] := FALSE;
		END_FOR
		
		opt_resetColumn := FALSE;
		opt_movementDone := FALSE;
		RETURN;
	END_IF
	
	// If the movementDone is not set, find the closest available column
	FOR i := 0 TO 3 DO
		// Setting the index for the column looked at
		IF startWorkstation.par.workstationID <= 2 THEN
			selectedColumn := 3-i;
		ELSE
			selectedColumn := i;
		END_IF
		
		// Assume column is possible (and try to deny it)
		columnIsPossible := TRUE;
		
		// Going trough the rows the movement would go through and seing if it is possible
		FOR k := startRowLevel TO endRowLevel DO
			IF occupiedPosition[selectedColumn, k] THEN
				columnIsPossible := FALSE;
				EXIT;
			END_IF
		END_FOR
		
		// If movement in the column is possible, occupy this column (selected column is already set)
		IF columnIsPossible THEN
			FOR k := startRowLevel TO endRowLevel DO
				occupiedPosition[selectedColumn, k] := TRUE;
			END_FOR
			RETURN;
		END_IF
	
	END_FOR
	
	// If no column was available, set it to -1
	selectedColumn := -1;
	
END_FUNCTION_BLOCK

