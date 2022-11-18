
// Quadrant index to meter position conversion
FUNCTION QuadrantIdxToPos

	QuadrantIdxToPos := quadrantIdx*0.120 + 0.060;
	
END_FUNCTION

FUNCTION PosToQuadrantIdx
	
	PosToQuadrantIdx := REAL_TO_USINT(brmfloor(pos) / 0.120);
	
END_FUNCTION

// Cover type to USINT conversion
FUNCTION COVER_TYPE_TO_USINT
	
	CASE coverType OF
		
		noCover:
			
			COVER_TYPE_TO_USINT := 0; 
		
		blackCover:
			
			COVER_TYPE_TO_USINT := 1; 
		
		whiteCover:
			
			COVER_TYPE_TO_USINT := 2; 
		
		blueCover:
			
			COVER_TYPE_TO_USINT := 3; 
			
	END_CASE
	
END_FUNCTION
