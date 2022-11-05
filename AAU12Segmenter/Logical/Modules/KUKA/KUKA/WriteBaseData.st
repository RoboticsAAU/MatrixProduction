// For now each robot knows all bases even though it only needs to now the ACOPOS6D base and its own magazine base
ACTION WriteBaseData: // Relative to world (can only be used when each robots world has been changed)
	
	IF NOT writeBaseDataDone THEN
	
		CASE mainState OF
			101: // ACOPOS6D base (BaseNo = 1)
				acoposBase.X := 240;
				acoposBase.Y := 240;
				acoposBase.Z := 70;
				acoposBase.A := 0;
				acoposBase.B := 0;
				acoposBase.C := 0;
				
				KRC_WriteBaseData_0.AxisGroupIdx 		:= KUKAs[tempBaseCounter].axisGroupIdx;
				KRC_WriteBaseData_0.KRC_AxisGroupRefArr := ADR(AxisRef);
				KRC_WriteBaseData_0.BaseNo 				:= 1;
				KRC_WriteBaseData_0.BaseData 			:= acoposBase;
				KRC_WriteBaseData_0.BufferMode 			:= 2;
				KRC_WriteBaseData_0.ExecuteCmd			:= TRUE;
				
				IF KRC_WriteBaseData_0.Done THEN
					KRC_WriteBaseData_0.ExecuteCmd		:= FALSE;
					tempBaseCounter := tempBaseCounter + 1;
					
					IF tempBaseCounter = 5 THEN
						tempBaseCounter := 0;
						mainState := 102;
					END_IF
					
				END_IF
			
			102: // Bottom cover magazine base (BaseNo = 2)
				// FILL IN WHEN WE HAVE THE DATA
				bottomCoverMagazineBase.X := 0;
				bottomCoverMagazineBase.Y := 0;
				bottomCoverMagazineBase.Z := 0;
				bottomCoverMagazineBase.A := 0;
				bottomCoverMagazineBase.B := 0;
				bottomCoverMagazineBase.C := 0;
				
				KRC_WriteBaseData_0.AxisGroupIdx 		:= KUKAs[tempBaseCounter].axisGroupIdx;
				KRC_WriteBaseData_0.KRC_AxisGroupRefArr := ADR(AxisRef);
				KRC_WriteBaseData_0.BaseNo 				:= 2;
				KRC_WriteBaseData_0.BaseData 			:= bottomCoverMagazineBase;
				KRC_WriteBaseData_0.BufferMode 			:= 2;
				KRC_WriteBaseData_0.ExecuteCmd			:= TRUE;
				
				IF KRC_WriteBaseData_0.Done THEN
					KRC_WriteBaseData_0.ExecuteCmd		:= FALSE;
					tempBaseCounter := tempBaseCounter + 1;
					
					IF tempBaseCounter = 5 THEN
						tempBaseCounter := 0;
						mainState := 103;
					END_IF
					
				END_IF
			
			103: // PCB magazine base (BaseNo = 3)
				// FILL IN WHEN WE HAVE THE DATA
				pcbMagazineBase.X := 0;
				pcbMagazineBase.Y := 0;
				pcbMagazineBase.Z := 0;
				pcbMagazineBase.A := 0;
				pcbMagazineBase.B := 0;
				pcbMagazineBase.C := 0;
				
				KRC_WriteBaseData_0.AxisGroupIdx 		:= KUKAs[tempBaseCounter].axisGroupIdx;
				KRC_WriteBaseData_0.KRC_AxisGroupRefArr := ADR(AxisRef);
				KRC_WriteBaseData_0.BaseNo 				:= 3;
				KRC_WriteBaseData_0.BaseData 			:= pcbMagazineBase;
				KRC_WriteBaseData_0.BufferMode 			:= 2;
				KRC_WriteBaseData_0.ExecuteCmd			:= TRUE;
				
				IF KRC_WriteBaseData_0.Done THEN
					KRC_WriteBaseData_0.ExecuteCmd		:= FALSE;
					tempBaseCounter := tempBaseCounter + 1;
					
					IF tempBaseCounter = 5 THEN
						tempBaseCounter := 0;
						mainState := 104;
					END_IF
					
				END_IF
			
			104: // Fuse magazine base (BaseNo = 4)
				// FILL IN WHEN WE HAVE THE DATA
				fuseMagazineBase.X := 0;
				fuseMagazineBase.Y := 0;
				fuseMagazineBase.Z := 0;
				fuseMagazineBase.A := 0;
				fuseMagazineBase.B := 0;
				fuseMagazineBase.C := 0;
				
				KRC_WriteBaseData_0.AxisGroupIdx 		:= KUKAs[tempBaseCounter].axisGroupIdx;
				KRC_WriteBaseData_0.KRC_AxisGroupRefArr := ADR(AxisRef);
				KRC_WriteBaseData_0.BaseNo 				:= 4;
				KRC_WriteBaseData_0.BaseData 			:= fuseMagazineBase;
				KRC_WriteBaseData_0.BufferMode 			:= 2;
				KRC_WriteBaseData_0.ExecuteCmd			:= TRUE;
				
				IF KRC_WriteBaseData_0.Done THEN
					KRC_WriteBaseData_0.ExecuteCmd		:= FALSE;
					tempBaseCounter := tempBaseCounter + 1;
					
					IF tempBaseCounter = 5 THEN
						tempBaseCounter := 0;
						mainState := 105;
					END_IF
					
				END_IF
			
			105: // Top cover magazine base (BaseNo = 5)
				// FILL IN WHEN WE HAVE THE DATA
				topCoverMagazineBase.X := 0;
				topCoverMagazineBase.Y := 0;
				topCoverMagazineBase.Z := 0;
				topCoverMagazineBase.A := 0;
				topCoverMagazineBase.B := 0;
				topCoverMagazineBase.C := 0;
				
				KRC_WriteBaseData_0.AxisGroupIdx 		:= KUKAs[tempBaseCounter].axisGroupIdx;
				KRC_WriteBaseData_0.KRC_AxisGroupRefArr := ADR(AxisRef);
				KRC_WriteBaseData_0.BaseNo 				:= 5;
				KRC_WriteBaseData_0.BaseData 			:= topCoverMagazineBase;
				KRC_WriteBaseData_0.BufferMode 			:= 2;
				KRC_WriteBaseData_0.ExecuteCmd			:= TRUE;
				
				IF KRC_WriteBaseData_0.Done THEN
					KRC_WriteBaseData_0.ExecuteCmd		:= FALSE;
					tempBaseCounter := tempBaseCounter + 1;
					
					IF tempBaseCounter = 5 THEN
						tempBaseCounter := 0;
						mainState := 106;
					END_IF
					
				END_IF
			
			106: // Unloading base (BaseNo = 6)
				// FILL IN WHEN WE HAVE THE DATA
				unloadingBase.X := 0;
				unloadingBase.Y := 0;
				unloadingBase.Z := 0;
				unloadingBase.A := 0;
				unloadingBase.B := 0;
				unloadingBase.C := 0;
				
				KRC_WriteBaseData_0.AxisGroupIdx 		:= KUKAs[tempBaseCounter].axisGroupIdx;
				KRC_WriteBaseData_0.KRC_AxisGroupRefArr := ADR(AxisRef);
				KRC_WriteBaseData_0.BaseNo 				:= 6;
				KRC_WriteBaseData_0.BaseData 			:= unloadingBase;
				KRC_WriteBaseData_0.BufferMode 			:= 2;
				KRC_WriteBaseData_0.ExecuteCmd			:= TRUE;
				
				IF KRC_WriteBaseData_0.Done THEN
					KRC_WriteBaseData_0.ExecuteCmd		:= FALSE;
					tempBaseCounter := tempBaseCounter + 1;
					
					IF tempBaseCounter = 5 THEN
						tempBaseCounter := 0;
						writeBaseDataDone := TRUE;
					END_IF
					
				END_IF
			
		END_CASE
		
	END_IF
	
	KRC_WriteBaseData_0();
	
END_ACTION
