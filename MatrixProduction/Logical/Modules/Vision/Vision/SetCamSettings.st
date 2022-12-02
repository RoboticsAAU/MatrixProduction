
(* TODO: Add your comment here *)
FUNCTION_BLOCK SetCamSettings
	
	tempRef ACCESS ADR(hwCamRef); 
	
	tempRef.out.par.focus := 437; 	// Camera FocusScale is defined in mm
	tempRef.out.par.gainLevel := 1; 		// Gain factor	
	
	CASE camIdx OF 
	
		0:
			CASE coverType OF
				0: // Default
					tempRef.out.par.exposureTime := 1000; 
					tempRef.out.par.flashColor := 4; // Lime
					tempRef.out.par.flashSegment := 15; // All segments
					
				1: // Black
					tempRef.out.par.exposureTime := 1100; 
					tempRef.out.par.flashColor := 1; // Red
					tempRef.out.par.flashSegment := 15; // All segments
					
				2: // White
					hwCamRef.out.par.exposureTime := 900; 
					hwCamRef.out.par.flashColor := 3; // Blue
					hwCamRef.out.par.flashSegment := 15; // All segments
					
				3: // Blue
					tempRef.out.par.exposureTime := 1000; 
					tempRef.out.par.flashColor := 1; // Red
					tempRef.out.par.flashSegment := 15; // All segments
				
			END_CASE
	
	END_CASE
		
END_FUNCTION_BLOCK
