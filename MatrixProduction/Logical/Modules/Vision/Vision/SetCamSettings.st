
(* TODO: Add your comment here *)
FUNCTION_BLOCK SetCamSettings
	
	tempHwCamRef ACCESS ADR(hwCamRef); 
	
	tempHwCamRef.out.par.focus := 437; 	// Camera FocusScale is defined in mm
	tempHwCamRef.out.par.gainLevel := 1; 		// Gain factor	
	
	CASE camIdx OF 
	
		0:
			CASE coverType OF
				0: // Default
					tempHwCamRef.out.par.exposureTime := 1000; 
					tempHwCamRef.out.par.flashColor := 4; // Lime
					tempHwCamRef.out.par.flashSegment := 15; // All segments
					
				1: // Black
					tempHwCamRef.out.par.exposureTime := 1100; 
					tempHwCamRef.out.par.flashColor := 1; // Red
					tempHwCamRef.out.par.flashSegment := 15; // All segments
					
				2: // White
					tempHwCamRef.out.par.exposureTime := 900; 
					tempHwCamRef.out.par.flashColor := 3; // Blue
					tempHwCamRef.out.par.flashSegment := 15; // All segments
					
				3: // Blue
					tempHwCamRef.out.par.exposureTime := 1000; 
					tempHwCamRef.out.par.flashColor := 1; // Red
					tempHwCamRef.out.par.flashSegment := 15; // All segments
				
			END_CASE
	
	END_CASE
		
END_FUNCTION_BLOCK
