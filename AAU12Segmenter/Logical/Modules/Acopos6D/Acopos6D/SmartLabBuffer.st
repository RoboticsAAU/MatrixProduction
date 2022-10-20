
ACTION writeOrder: 
	
	IF NOT bufferFull THEN
		
		orderBuffer[writeIndex] := tempProductOrder;
		writeIndex := (writeIndex + 1) MOD bufferSize; 
			
		IF (writeIndex MOD bufferSize) = readIndex THEN
			bufferFull := TRUE; 
		ELSE
			bufferFull := FALSE;
		END_IF
		
	END_IF
					
END_ACTION

ACTION readOrder: 

	IF ((NOT readIndex = writeIndex) OR bufferFull) AND orderFinished THEN

		productOrder := orderBuffer[readIndex];
		readIndex := (readIndex + 1) MOD bufferSize;
		bufferFull := FALSE;
		
	END_IF
				
END_ACTION