
(* TODO: Add your comment here *)
FUNCTION_BLOCK EETypeToFrame
	
	frame.X := 0;
	frame.Y := 0;
	frame.Z := SchunkLength; //79.1 (with base plate)
	frame.A := 0;
	frame.B := 0;
	frame.C := 0;
	
	
	CASE eeType OF
		
		COVER_EE:
			
			frame.Z := frame.Z; // Change when we know
			
		DRILL_EE:
			frame.Z := frame.Z; // Change when we know
			
		PCB_EE:
			frame.Z := frame.Z + 25.11;
			//frame.C := 180;
			
		FUSE_EE:
			frame.Z := frame.Z; // Change when we know
			
	END_CASE
	
END_FUNCTION_BLOCK
