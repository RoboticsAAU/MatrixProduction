
ACTION WriteToolData: 
	
	CASE pKuka.cm.state OF
		101: // ToolNo = 1
			EETypeToFrame_0.eeType := pKuka.eeType;
			EETypeToFrame_0();
			
			KRC_WriteToolData_0.AxisGroupIdx 		:= pKuka.axisGroupIdx;
			KRC_WriteToolData_0.KRC_AxisGroupRefArr := ADR(AxisRef);
			KRC_WriteToolData_0.ToolNo 				:= 1;
			KRC_WriteToolData_0.ToolData 			:= EETypeToFrame_0.frame;
			KRC_WriteToolData_0.BufferMode 			:= 2;
			KRC_WriteToolData_0.ExecuteCmd			:= TRUE;
			
			IF KRC_WriteToolData_0.Done THEN
				KRC_WriteToolData_0.ExecuteCmd		:= FALSE;
				pKuka.cm.state := 201;
			END_IF
		
	END_CASE
	
	pKuka.write.KRC_WriteToolData();
		
END_ACTION
