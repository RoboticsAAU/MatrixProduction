
ACTION writeOrder: 

	orderBuffer[writeIndex] := tempProductOrder;
	
	// Insert data into orderHistory array
	orderHistory[tempProductOrder.ID].productOrder := tempProductOrder;
	orderHistory[tempProductOrder.ID].finishedProductCount := 0;
	orderHistory[tempProductOrder.ID].status := AWAITING;
	
	tempProductOrder.ID := tempProductOrder.ID + 1;
	bufferEmpty := FALSE;
	writeIndex := (writeIndex + 1) MOD bufferSize;
	
		
	IF (writeIndex MOD bufferSize) = readIndex THEN
		
		bufferFull := TRUE; 
		
	ELSE
		
		bufferFull := FALSE;
		
	END_IF
				
END_ACTION

ACTION readOrder: 
	
	productOrder := orderBuffer[readIndex];
	readIndex := (readIndex + 1) MOD bufferSize;
	bufferFull := FALSE;
	
	// Create the route sheet
	CreateRouteSheet_0.inputProductOrder := productOrder;
	CreateRouteSheet_0();
	
	// Insert data into orderHistory array
	orderHistory[productOrder.ID].routingSheet := CreateRouteSheet_0.outputRouteSheet;
	orderHistory[productOrder.ID].status := ACTIVE;
	orderHistory[productOrder.ID].orderStartingTime := DTGetTime_0.DT1;
	
	// Check if the buffer is empty
	IF (readIndex = writeIndex) AND NOT bufferFull THEN
		
		bufferEmpty := TRUE;
		
	ELSE
		
		bufferEmpty := FALSE;
		
	END_IF
	
	//	
//	IF (NOT readIndex = writeIndex) OR bufferFull THEN
//
//		productOrder := orderBuffer[readIndex];
//		readIndex := (readIndex + 1) MOD bufferSize;
//		bufferFull := FALSE;
//		
//	END_IF
	
	
				
END_ACTION