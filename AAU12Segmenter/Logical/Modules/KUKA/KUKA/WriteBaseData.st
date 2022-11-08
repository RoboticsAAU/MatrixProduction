// For now each robot knows all bases even though it only needs to now the ACOPOS6D base and its own magazine base
ACTION WriteBaseData: // Relative to world (can only be used when each robots world has been changed)
		
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
				cm.state := 202;
			END_IF
		
		202: // Bottom cover magazine base (BaseNo = 2)
			bottomCoverMagazineBase.X := 1200;
			bottomCoverMagazineBase.Y := 360;
			bottomCoverMagazineBase.Z := 0;
			bottomCoverMagazineBase.A := 90;
			bottomCoverMagazineBase.B := 0;
			bottomCoverMagazineBase.C := 0;
			
			pKuka.write.KRC_WriteBaseData.AxisGroupIdx 			:= pKuka.axisGroupIdx;
			pKuka.write.KRC_WriteBaseData.KRC_AxisGroupRefArr 	:= ADR(AxisRef);
			pKuka.write.KRC_WriteBaseData.BaseNo 				:= 2;
			pKuka.write.KRC_WriteBaseData.BaseData 				:= bottomCoverMagazineBase;
			pKuka.write.KRC_WriteBaseData.BufferMode 			:= 2;
			pKuka.write.KRC_WriteBaseData.ExecuteCmd			:= TRUE;
			
			IF pKuka.write.KRC_WriteBaseData.Done THEN
				pKuka.write.KRC_WriteBaseData.ExecuteCmd		:= FALSE;
				cm.state := 203;
			END_IF
		
		203: // PCB magazine base (BaseNo = 3)
			pcbMagazineBase.X := 840;
			pcbMagazineBase.Y := 1440;
			pcbMagazineBase.Z := 0;
			pcbMagazineBase.A := 180;
			pcbMagazineBase.B := 0;
			pcbMagazineBase.C := 0;
			
			pKuka.write.KRC_WriteBaseData.AxisGroupIdx 			:= pKuka.axisGroupIdx;
			pKuka.write.KRC_WriteBaseData.KRC_AxisGroupRefArr 	:= ADR(AxisRef);
			pKuka.write.KRC_WriteBaseData.BaseNo 				:= 3;
			pKuka.write.KRC_WriteBaseData.BaseData 				:= pcbMagazineBase;
			pKuka.write.KRC_WriteBaseData.BufferMode 			:= 2;
			pKuka.write.KRC_WriteBaseData.ExecuteCmd			:= TRUE;
			
			IF pKuka.write.KRC_WriteBaseData.Done THEN
				pKuka.write.KRC_WriteBaseData.ExecuteCmd		:= FALSE;
				cm.state := 204;
			END_IF
		
		204: // Fuse magazine base (BaseNo = 4)
			fuseMagazineBase.X := 600;
			fuseMagazineBase.Y := 1440;
			fuseMagazineBase.Z := 0;
			fuseMagazineBase.A := 180;
			fuseMagazineBase.B := 0;
			fuseMagazineBase.C := 0;
			
			pKuka.write.KRC_WriteBaseData.AxisGroupIdx 			:= pKuka.axisGroupIdx;
			pKuka.write.KRC_WriteBaseData.KRC_AxisGroupRefArr 	:= ADR(AxisRef);
			pKuka.write.KRC_WriteBaseData.BaseNo 				:= 4;
			pKuka.write.KRC_WriteBaseData.BaseData 				:= fuseMagazineBase;
			pKuka.write.KRC_WriteBaseData.BufferMode 			:= 2;
			pKuka.write.KRC_WriteBaseData.ExecuteCmd			:= TRUE;
			
			IF pKuka.write.KRC_WriteBaseData.Done THEN
				pKuka.write.KRC_WriteBaseData.ExecuteCmd		:= FALSE;
				cm.state := 205;
			END_IF
		
		205: // Top cover magazine base (BaseNo = 5)
			topCoverMagazineBase.X := 0;
			topCoverMagazineBase.Y := 600;
			topCoverMagazineBase.Z := 0;
			topCoverMagazineBase.A := -90;
			topCoverMagazineBase.B := 0;
			topCoverMagazineBase.C := 0;
			
			pKuka.write.KRC_WriteBaseData.AxisGroupIdx 			:= pKuka.axisGroupIdx;
			pKuka.write.KRC_WriteBaseData.KRC_AxisGroupRefArr	:= ADR(AxisRef);
			pKuka.write.KRC_WriteBaseData.BaseNo 				:= 5;
			pKuka.write.KRC_WriteBaseData.BaseData 				:= topCoverMagazineBase;
			pKuka.write.KRC_WriteBaseData.BufferMode 			:= 2;
			pKuka.write.KRC_WriteBaseData.ExecuteCmd			:= TRUE;
			
			IF pKuka.write.KRC_WriteBaseData.Done THEN
				pKuka.write.KRC_WriteBaseData.ExecuteCmd		:= FALSE;
				cm.state := 206;
			END_IF
		
		206: // Unloading base (BaseNo = 6)
			unloadingBase.X := 360;
			unloadingBase.Y := 0;
			unloadingBase.Z := 0;
			unloadingBase.A := 0;
			unloadingBase.B := 0;
			unloadingBase.C := 0;
			
			pKuka.write.KRC_WriteBaseData.AxisGroupIdx 			:= pKuka.axisGroupIdx;
			pKuka.write.KRC_WriteBaseData.KRC_AxisGroupRefArr	:= ADR(AxisRef);
			pKuka.write.KRC_WriteBaseData.BaseNo 				:= 6;
			pKuka.write.KRC_WriteBaseData.BaseData 				:= unloadingBase;
			pKuka.write.KRC_WriteBaseData.BufferMode 			:= 2;
			pKuka.write.KRC_WriteBaseData.ExecuteCmd			:= TRUE;
			
			IF pKuka.write.KRC_WriteBaseData.Done THEN
				pKuka.write.KRC_WriteBaseData.ExecuteCmd		:= FALSE;
				cm.state := 1000;
			END_IF
		
	END_CASE
	
	pKuka.write.KRC_WriteBaseData();
	
END_ACTION
