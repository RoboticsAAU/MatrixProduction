
(* TODO: Add your comment here *)
FUNCTION_BLOCK EETypeToFrame
	
	frame.X := 0;
	frame.Y := 0;
	frame.Z := 0;
	frame.A := 0;
	frame.B := 0;
	frame.C := 0;
	
	SchunkLength := 72.7+2*3.2; //79.1 (with base plate)
	
	CASE eeType OF
		
		COVER_EE:
			frame.Z := SchunkLength + 29.40;
			
		DRILL_EE:
			frame.Z := 60.4;
			
		PCB_EE:
			frame.Z := SchunkLength + 25.11;
			
		FUSE_EE:
			frame.Z := SchunkLength + 20;
			
	END_CASE
	
END_FUNCTION_BLOCK