
(* TODO: Add your comment here *)
FUNCTION_BLOCK EETypeToFrame
	
	frame.X := 0;
	frame.Y := 0;
	frame.Z := SchunkLength;
	frame.A := 0;
	frame.B := 0;
	frame.C := 0;
	
	
	CASE eeType OF
		
		COVER_EE:
			
			frame.Z := frame.Z; // Change when we know
			
		DRILL_EE:
			frame.Z := frame.Z; // Change when we know
			
		PCB_EE:
			frame.Z := frame.Z + 16.91;
			
		FUSE_EE:
			frame.Z := frame.Z; // Change when we know
			
	END_CASE
	
END_FUNCTION_BLOCK
