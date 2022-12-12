
ACTION WriteToolData: 
	
	CASE pKuka.cm.state OF
		101: // ToolNo = 1
			EETypeToFrame_0.eeType := pKuka.eeType;
			EETypeToFrame_0();
			
			pKuka.write.KRC_WriteToolData.AxisGroupIdx 			:= pKuka.axisGroupIdx;
			pKuka.write.KRC_WriteToolData.KRC_AxisGroupRefArr 	:= ADR(AxisRef);
			pKuka.write.KRC_WriteToolData.ToolNo 				:= 1;
			pKuka.write.KRC_WriteToolData.ToolData 				:= EETypeToFrame_0.frame;
			pKuka.write.KRC_WriteToolData.BufferMode 			:= 2;
			pKuka.write.KRC_WriteToolData.ExecuteCmd			:= TRUE;
			
			IF pKuka.write.KRC_WriteToolData.Done THEN
				pKuka.write.KRC_WriteToolData.ExecuteCmd		:= FALSE;
				pKuka.cm.state := 201;
			END_IF
		
	END_CASE
	
	pKuka.write.KRC_WriteToolData();
		
END_ACTION
