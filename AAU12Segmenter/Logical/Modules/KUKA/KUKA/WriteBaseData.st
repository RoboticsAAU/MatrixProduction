
ACTION WriteBaseData: 
	
	IF NOT writeToolDataDone THEN
	
		CASE mainState OF
			
			101: // BaseNo = 1
				KRC_Write_Tool_Data.AxisGroupIdx 		:= KUKAs[i].AxisGroupIdx;
				KRC_Write_Tool_Data.KRC_AxisGroupRefArr := ADR(AxisRef);
				KRC_Write_Tool_Data.ToolNo 				:= 1; 
				KRC_Write_Tool_Data.ToolData 			:= EETypeToFrame(KUKAs[i].eeType); 
				KRC_Write_Tool_Data.BufferMode 			:= 2;
				KRC_Write_Tool_Data.ExecuteCmd			:= TRUE;
				
				IF KRC_Write_Tool_Data.Done  THEN
					KRC_Write_Tool_Data.ExecuteCmd		:= FALSE;
					tempToolCounter := tempToolCounter + 1;
					
					IF tempToolCounter = 5 THEN
						tempToolCounter := 0;
						writeToolDataDone := TRUE;
					END_IF
						
				END_IF
			
		END_CASE
		
	END_IF
	
END_ACTION
