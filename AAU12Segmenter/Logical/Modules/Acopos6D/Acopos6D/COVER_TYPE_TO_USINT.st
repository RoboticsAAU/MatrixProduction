
(* TODO: Add your comment here *)
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
