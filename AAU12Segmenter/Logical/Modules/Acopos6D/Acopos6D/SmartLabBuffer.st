
ACTION writeOrder: 

	orderBuffer[writeIndex] := tempProductOrder;
	//orderBuffer[writeIndex].ID := orderBuffer[writeIndex].ID + 1; // Seems wrong - shouldn't it be orderBuffer[writeIndex].ID := orderBuffer[writeIndex-1].ID + 1?
	bufferEmpty := FALSE;
	writeIndex := (writeIndex + 1) MOD bufferSize;
	
		
	IF (writeIndex MOD bufferSize) = readIndex THEN
		
		bufferFull := TRUE; 
		
	ELSE
		
		bufferFull := FALSE;
		
	END_IF
				
END_ACTION

ACTION readOrder: 
		
	IF NOT bufferEmpty THEN

		productOrder := orderBuffer[readIndex];
		readIndex := (readIndex + 1) MOD bufferSize;
		bufferFull := FALSE;
		
	END_IF
	
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