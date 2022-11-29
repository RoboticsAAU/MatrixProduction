
FUNCTION_BLOCK ShuttleTouchQuadrantPos
	
	shuttleLength := 0.119;
	
	// Defining the outher perimeters of the shuttle
	minX := shuttlePos.xPos - shuttleLength/2;
	maxX := shuttlePos.xPos + shuttleLength/2;
	minY := shuttlePos.yPos - shuttleLength/2;
	maxY := shuttlePos.yPos + shuttleLength/2;
	
	
	xQuadrantTouched[0] := PosToQuadrantIdx(minX);
	xQuadrantTouched[1] := PosToQuadrantIdx(maxX);
	yQuadrantTouched[0] := PosToQuadrantIdx(minY);
	yQuadrantTouched[1] := PosToQuadrantIdx(maxY);
	
	
	// Setting the touched quadrants
	quadrantPosX[0] := xQuadrantTouched[0];
	quadrantPosY[0] := yQuadrantTouched[0];
	numTouches := 1;
	
	IF (xQuadrantTouched[0] <> xQuadrantTouched[1]) AND (yQuadrantTouched[0] <> yQuadrantTouched[1]) THEN
		quadrantPosX[1] := xQuadrantTouched[1];
		quadrantPosY[1] := yQuadrantTouched[0];
		
		quadrantPosX[2] := xQuadrantTouched[0];
		quadrantPosY[2] := yQuadrantTouched[1];
		
		quadrantPosX[3] := xQuadrantTouched[1];
		quadrantPosY[3] := yQuadrantTouched[1];
		numTouches := 4;
		
	ELSIF (xQuadrantTouched[0] <> xQuadrantTouched[1]) THEN
		quadrantPosX[1] := xQuadrantTouched[1];
		quadrantPosY[1] := yQuadrantTouched[0];
		numTouches := 2;
		
	ELSIF (yQuadrantTouched[0] <> yQuadrantTouched[1]) THEN
		quadrantPosX[1] := xQuadrantTouched[0];
		quadrantPosY[1] := yQuadrantTouched[1];
		numTouches := 2;
	
	END_IF
	
END_FUNCTION_BLOCK

