
ACTION WriteToolData: 
	
	IF NOT writeToolDataDone THEN
		
		CASE mainState OF
			101: // ToolNo = 1
				EETypeToFrame_0.eeType := KUKAs[tempBaseCounter].eeType;
				EETypeToFrame_0();
				
				KRC_WriteToolData_0.AxisGroupIdx 		:= KUKAs[tempBaseCounter].axisGroupIdx;
				KRC_WriteToolData_0.KRC_AxisGroupRefArr := ADR(AxisRef);
				KRC_WriteToolData_0.ToolNo 				:= 1;
				KRC_WriteToolData_0.ToolData 			:= EETypeToFrame_0.frame;
				KRC_WriteToolData_0.BufferMode 			:= 2;
				KRC_WriteToolData_0.ExecuteCmd			:= TRUE;
				
				IF KRC_WriteToolData_0.Done THEN
					KRC_WriteToolData_0.ExecuteCmd		:= FALSE;
					tempToolCounter := tempToolCounter + 1;
					
					IF tempToolCounter = 5 THEN
						tempToolCounter := 0;
						writeToolDataDone := TRUE;
					END_IF
					
				END_IF
			
		END_CASE
		
	END_IF
	
	KRC_WriteToolData_0();
		
END_ACTION
