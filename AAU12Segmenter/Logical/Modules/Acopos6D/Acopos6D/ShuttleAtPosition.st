
(* TODO: Add your comment here *)
FUNCTION_BLOCK ShuttleAtPosition
	
	IF (shuttlePos.X > checkPosX - MARGIN AND shuttlePos.X < checkPosX + MARGIN) AND
		(shuttlePos.Y > checkPosY - MARGIN AND shuttlePos.Y < checkPosY + MARGIN) THEN
		isAtCheckPos := TRUE;
	ELSE
		isAtCheckPos := FALSE;
	END_IF
	
END_FUNCTION_BLOCK
