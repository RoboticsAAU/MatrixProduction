
(* TODO: Add your comment here *)
FUNCTION_BLOCK GripperAction
	
	tempWhitePin ACCESS ADR(whitePin);
	tempBlackPin ACCESS ADR(blackPin);
	
	IF action = IDLE THEN
		tempWhitePin := FALSE;
		tempBlackPin := FALSE;
	ELSIF action = OPEN THEN
		tempWhitePin := TRUE;
		tempBlackPin := FALSE;
	ELSIF action = CLOSE THEN
		tempWhitePin := FALSE;
		tempBlackPin := TRUE;
	END_IF
	
END_FUNCTION_BLOCK
