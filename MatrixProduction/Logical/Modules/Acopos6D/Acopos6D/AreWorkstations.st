
(* TODO: Add your comment here *)

FUNCTION ArePositionsOnSameRow
	
	yQuadrantPos1 := PosToQuadrantIdx(yPos1);
	yQuadrantPos2 := PosToQuadrantIdx(yPos2);
	
	IF yQuadrantPos1 = yQuadrantPos2 THEN
		ArePositionsOnSameRow := TRUE;
	ELSE
		ArePositionsOnSameRow := FALSE;
	END_IF
	
END_FUNCTION

FUNCTION ArePositionsOnSameColumn
	
	xQuadrantPos1 := PosToQuadrantIdx(xPos1);
	xQuadrantPos2 := PosToQuadrantIdx(xPos2);
	
	IF xQuadrantPos1 = xQuadrantPos2 THEN
		ArePositionsOnSameColumn := TRUE;
	ELSE
		ArePositionsOnSameColumn := FALSE;
	END_IF

END_FUNCTION



FUNCTION AreWorkstationsOpposite
	
	IF (workstationID1 + workstationID2 = 5) THEN
		AreWorkstationsOpposite := TRUE;
	ELSE
		AreWorkstationsOpposite := FALSE;
	END_IF
	
END_FUNCTION

FUNCTION AreWorkstationsAdjacent
	
	IF ABS(workstationID1 - workstationID2) = 1 OR ABS(workstationID1 - workstationID2) = 5 THEN
		AreWorkstationsAdjacent := TRUE;
	ELSE
		AreWorkstationsAdjacent := FALSE;
	END_IF
	
END_FUNCTION