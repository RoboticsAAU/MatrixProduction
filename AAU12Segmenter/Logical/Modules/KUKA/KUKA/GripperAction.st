
(* TODO: Add your comment here *)
FUNCTION_BLOCK GripperAction
	
	whitePin ACCESS ADR(whitePin);
	blackPin ACCESS ADR(blackPin);
	
	IF action = OPEN THEN
		whitePin := TRUE;
		blackPin := FALSE;
	ELSIF action = CLOSE THEN
		whitePin := FALSE;
		blackPin := TRUE;	
	END_IF
	
END_FUNCTION_BLOCK
