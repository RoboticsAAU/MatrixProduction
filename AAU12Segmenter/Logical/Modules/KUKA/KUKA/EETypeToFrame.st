
(* TODO: Add your comment here *)
FUNCTION_BLOCK EETypeToFrame
	
	frame.X := 0;
	frame.Y := 0;
	frame.Z := 0;
	frame.A := 0;
	frame.B := 0;
	frame.C := 0;
	
	CASE eeType OF
		
		COVER_EE:
			
			frame.Z := 100;
			
		DRILL_EE:
			
		PCB_EE:
			
		FUSE_EE:
			
	END_CASE
	
END_FUNCTION_BLOCK
