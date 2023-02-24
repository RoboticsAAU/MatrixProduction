
ACTION WriteBaseData: // Relative to world 
		
	CASE cm.state OF
		201: // ACOPOS6D base (BaseNo = 1)
			acoposBase.X := 240;
			acoposBase.Y := 240;
			acoposBase.Z := 70;
			acoposBase.A := 0;
			acoposBase.B := 0;
			acoposBase.C := 0;
			
			pKuka.write.KRC_WriteBaseData.AxisGroupIdx 			:= pKuka.axisGroupIdx;
			pKuka.write.KRC_WriteBaseData.KRC_AxisGroupRefArr 	:= ADR(AxisRef);
			pKuka.write.KRC_WriteBaseData.BaseNo 				:= 1;
			pKuka.write.KRC_WriteBaseData.BaseData 				:= acoposBase;
			pKuka.write.KRC_WriteBaseData.BufferMode 			:= 2;
			pKuka.write.KRC_WriteBaseData.ExecuteCmd			:= TRUE;
			
			IF pKuka.write.KRC_WriteBaseData.Done THEN
				pKuka.write.KRC_WriteBaseData.ExecuteCmd		:= FALSE;
				
				IF pKuka.operationType = ASSEMBLY THEN
					cm.state := 202;
				ELSIF pKuka.operationType = PROCESS THEN
					cm.state := 500;
				END_IF
			END_IF
		
		202: // Magazine base (BaseNo = 2)
			pKuka.convert.ValuesToMagazineFrame.axisGroupIdx 	:= pKuka.axisGroupIdx;
			pKuka.convert.ValuesToMagazineFrame();
			
			pKuka.write.KRC_WriteBaseData.AxisGroupIdx 			:= pKuka.axisGroupIdx;
			pKuka.write.KRC_WriteBaseData.KRC_AxisGroupRefArr 	:= ADR(AxisRef);
			pKuka.write.KRC_WriteBaseData.BaseNo 				:= 2;
			pKuka.write.KRC_WriteBaseData.BaseData 				:= pKuka.convert.ValuesToMagazineFrame.outputFrame;
			pKuka.write.KRC_WriteBaseData.BufferMode 			:= 2;
			pKuka.write.KRC_WriteBaseData.ExecuteCmd			:= TRUE;
					
			IF pKuka.write.KRC_WriteBaseData.Done THEN
				pKuka.write.KRC_WriteBaseData.ExecuteCmd		:= FALSE;
				cm.state := 500;
			END_IF
			
	END_CASE
	
	pKuka.write.KRC_WriteBaseData();
	
END_ACTION
