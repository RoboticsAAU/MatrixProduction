
FUNCTION_BLOCK ShuttleTouchQuadrantPos
	
	tempIndex := 0;
	shuttleLength := 0.119;
	
	// Defining the outher perimeters of the shuttle
	minX := shuttlePos.xPos - shuttleLength/2;
	maxX := shuttlePos.xPos + shuttleLength/2;
	minY := shuttlePos.yPos - shuttleLength/2;
	maxY := shuttlePos.yPos + shuttleLength/2;
	
	
	xQuadrantsTouched[0] := PosToQuadrantIdx(minX);
	xQuadrantsTouched[1] := PosToQuadrantIdx(maxX);
	yQuadrantsTouched[0] := PosToQuadrantIdx(minY);
	yQuadrantsTouched[1] := PosToQuadrantIdx(maxY);
	
	
	// Setting the touched quadrants
	quadrantPosX[tempIndex] := xQuadrantsTouched[0];
	quadrantPosY[tempIndex] := yQuadrantsTouched[0];
	tempIndex := tempIndex + 1;
	numTouches := 1;
	
	IF (xQuadrantsTouched[0] <> xQuadrantsTouched[1]) THEN
		quadrantPosX[tempIndex] := xQuadrantsTouched[1];
		quadrantPosY[tempIndex] := yQuadrantsTouched[0];
		tempIndex := tempIndex + 1;
		numTouches := 2;
	END_IF
	
	IF (yQuadrantsTouched[0] <> yQuadrantsTouched[1]) THEN
		quadrantPosX[tempIndex] := xQuadrantsTouched[0];
		quadrantPosY[tempIndex] := yQuadrantsTouched[1];
		tempIndex := tempIndex + 1;
		numTouches := 2;
	END_IF
	
	IF (xQuadrantsTouched[0] <> xQuadrantsTouched[1]) AND (yQuadrantsTouched[0] <> yQuadrantsTouched[1]) THEN
		quadrantPosX[tempIndex] := xQuadrantsTouched[1];
		quadrantPosY[tempIndex] := yQuadrantsTouched[1];
		numTouches := 4;
	END_IF
	
END_FUNCTION_BLOCK

