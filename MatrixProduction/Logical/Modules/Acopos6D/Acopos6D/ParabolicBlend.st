
(* TODO: Add your comment here *)
FUNCTION_BLOCK ParabolicBlend
	
	// Compute the blend distance (distance covered during acceleration)
	blendDistance := brmpow(velocity, 2)/(2*acceleration);
	
	// If max speed is never reached, set the new blend distance to half the full distance (half for each of acceleration and deceleration)
	IF blendDistance >= (ABS(endPos - startPos) / 2) THEN
		blendDistance := ABS(endPos - startPos) / 2;
		velocity := SQRT(2*acceleration*blendDistance);
	END_IF
	
	blendTime := 2*blendDistance/velocity;
	fullDuration :=  2*blendTime + ((endPos - startPos) - 2*blendDistance)/velocity;
	
	// Determine at what segment of a polynomial motion profile the image must be taken 
	// Segment 1 (starting blend segment)
	IF (startPos < evalPos) AND (evalPos <= startPos + blendDistance) THEN
		durationAtEvalDist := SQRT((2*(evalPos - startPos))/acceleration);
	
	// Segment 2 (linear segment)
	ELSIF (startPos + blendDistance < evalPos) AND (evalPos <= endPos - blendDistance) THEN
		durationAtEvalDist := blendTime + ((evalPos - (startPos + blendDistance))/velocity;
	
	// Segment 3 (ending blend segment)
	ELSIF (endPos - blendDistance < evalPos) AND (evalPos <= endPos) THEN
		durationAtEvalDist := fullDuration - SQRT((2*(endPos - evalPos))/acceleration);
	
	// Error
	ELSE
		durationAtEvalDist := -1;
	END_IF
	
END_FUNCTION_BLOCK
