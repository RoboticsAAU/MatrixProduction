
FUNCTION_BLOCK MovementColumnSelection
	
	// Accessing the address
	availablePosition ACCESS ADR(availablePosition);
	
	// Determining the start and end row levels
	startRowLevel := PosToQuadrantIdx(pos := startWorkstation.par.departPosY);
	endRowLevel := PosToQuadrantIdx(pos := endWorkstation.par.approachPosY);
	
	// If the movementDone is not set, find the closest available column
	IF NOT opt_movementDone THEN
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
				IF NOT availablePosition[selectedColumn, k] THEN
					columnIsPossible := FALSE;
					EXIT;
				END_IF
			END_FOR
			
			// If movement in the column is possible, occupy this column (selected column is already set)
			IF columnIsPossible THEN
				FOR k := startRowLevel TO endRowLevel DO
					availablePosition[selectedColumn, k] := FALSE;
				END_FOR
				EXIT;
			ELSE
				selectedColumn := -1;
			END_IF
		END_FOR
	ELSE
		FOR k := startRowLevel TO endRowLevel DO
			availablePosition[opt_resetColumn, k] := TRUE;
		END_FOR
		
		opt_resetColumn := FALSE;
		opt_movementDone := FALSE;
	END_IF
	
END_FUNCTION_BLOCK

