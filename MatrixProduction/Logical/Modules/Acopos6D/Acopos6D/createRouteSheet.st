
(* TODO: Add your comment here *)
FUNCTION_BLOCK CreateRouteSheet
	
	routeSize := SIZEOF(outputRouteSheet)/SIZEOF(outputRouteSheet[0]);
	tempIndex := 0;
	
	FOR i := 0 TO routeSize DO
		outputRouteSheet[i] := 0;
	END_FOR
	
	// Check if visitation to drilling station is required
	IF inputProductOrder.Holes <> 0 THEN
		
		outputRouteSheet[tempIndex] := 1; // WORKSTATION 1
		tempIndex := tempIndex + 1;
		
	END_IF
	
	// Check if visitation to PCB station is required
	IF inputProductOrder.PCB THEN
		
		outputRouteSheet[tempIndex] := 2; // WORKSTATION 2
		tempIndex := tempIndex + 1;
		
		// Check if visitation to fuse station is required
		IF inputProductOrder.Fuses > 0 THEN
			
			outputRouteSheet[tempIndex] := 3; // WORKSTATION 3
			tempIndex := tempIndex + 1;
			
		END_IF
		
	END_IF
	
	
	// Check if visitation to top cover station is required
	IF inputProductOrder.topCover <> noCover THEN
		
		outputRouteSheet[tempIndex] := 4; // WORKSTATION 4
		tempIndex := tempIndex + 1;
		
	END_IF
	
	// The order is unloaded
	outputRouteSheet[tempIndex] := 5; // WORKSTATION 5
	
END_FUNCTION_BLOCK