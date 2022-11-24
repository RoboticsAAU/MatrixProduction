
(* TODO: Add your comment here *)
FUNCTION_BLOCK ParabolicBlend
	
	blendDistance := brmpow(velocity, 2)/(2*acceleration);
	
	// Determine at what segment of a polynomial motion profile the image must be taken  
				
	// Segment 1
	IF startPos < evalPos AND evalPos <= blendDistance THEN
		durationAtEvalDist := SQRT((2*(evalPos-startPos))/acceleration);
			
		// Segment 2
	ELSIF blendDistance < evalPos AND evalPos <= endPos - blendDistance THEN
		blendTime := 2*blendDistance/velocity;
		durationAtEvalDist := blendTime + ((evalPos - blendDistance)/(acceleration*blendTime));
					
		// Segment 3
	ELSIF endPos - blendDistance < evalPos AND evalPos <= endPos THEN
		fullDuration := (((endPos-blendDistance) - blendDistance)/(acceleration*blendTime)) + 2*blendTime;
		durationAtEvalDist := fullDuration - SQRT((2*(endPos-evalPos))/acceleration);
		
		// Error
	ELSE 
		durationAtEvalDist := -1;
	END_IF
	
END_FUNCTION_BLOCK
