
(* TODO: Add your comment here *)

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