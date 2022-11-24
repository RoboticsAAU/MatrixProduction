
(* TODO: Add your comment here *)
FUNCTION_BLOCK ParabolicBlend
	
	// Compute the blend distance (distance covered during acceleration)
	blendDistance := brmpow(velocity, 2)/(2*acceleration);
	
	// If max speed is never reached, set the new blend distance to half the full distance (half for each of acceleration and deceleration)
	IF blendDistance >= (ABS(endPos - startPos) / 2) THEN
		blendDistance := ABS(endPos - startPos) / 2;
	END_IF
	
	// Determine at what segment of a polynomial motion profile the image must be taken 
	// Segment 1
	IF startPos < evalPos AND evalPos <= blendDistance THEN
		durationAtEvalDist := SQRT((2*(evalPos-startPos))/acceleration);
	
	// Segment 2
	ELSIF blendDistance < evalPos AND evalPos <= endPos - blendDistance THEN
		blendTime := 2*blendDistance/velocity;
		durationAtEvalDist := blendTime + (evalPos - blendDistance)/(acceleration*blendTime);
	
	// Segment 3
	ELSIF endPos - blendDistance < evalPos AND evalPos <= endPos THEN
		fullDuration :=  2*blendTime + ((endPos-blendDistance) - blendDistance)/(acceleration*blendTime);
		durationAtEvalDist := fullDuration - SQRT((2*(endPos-evalPos))/acceleration);
	
	// Error
	ELSE 
		durationAtEvalDist := -1;
	END_IF
	
END_FUNCTION_BLOCK
