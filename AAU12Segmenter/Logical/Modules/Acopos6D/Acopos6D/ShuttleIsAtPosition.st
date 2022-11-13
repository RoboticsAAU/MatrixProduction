
(* TODO: Add your comment here *)
FUNCTION ShuttleIsAtPosition
	
	IF (shuttlePos.X > checkPosX - MARGIN AND shuttlePos.X < checkPosX + MARGIN) AND
		(shuttlePos.Y > checkPosY - MARGIN AND shuttlePos.Y < checkPosY + MARGIN) THEN
		ShuttleIsAtPosition := TRUE;
	ELSE
		ShuttleIsAtPosition := FALSE;
	END_IF
	
END_FUNCTION
