
ACTION mxA_LinearMovement:

	CASE pState OF
	
		0:
			// Waiting for robot 1 to be ready to move
			IF 	Status_P > 0 AND Status_S > 0 AND Status_I > 0 AND Status_R > 0 AND Status_EXT > 0 THEN			
				pState := 20;
			END_IF
			
		10: 
			toolCover.X := 0;
			toolCover.Y := 0;
			toolCover.Z := 100;
			toolCover.A := 0;
			toolCover.B := 0;
			toolCover.C := 0;
				
				
				
			KRC_WriteToolData_0.AxisGroupIdx 		:= HMI_AxisGroup;
			KRC_WriteToolData_0.KRC_AxisGroupRefArr := ADR(AxisRef);
			KRC_WriteToolData_0.ToolNo 				:= 1; 
			KRC_WriteToolData_0.ToolData 			:= toolCover;
			KRC_WriteToolData_0.BufferMode 			:= 2;
			KRC_WriteToolData_0.ExecuteCmd			:= TRUE;
			
			
			IF KRC_WriteToolData_0.Done THEN
				KRC_WriteToolData_0.ExecuteCmd		:= FALSE;
				pState := 20;
			END_IF
				
		20: 
				
			//Set frames as coordsys
			mxa_ValuesToCOORDSYS_0.Tool 	:= 1; // Change to 1 when it works 
			mxa_ValuesToCOORDSYS_0.Base 	:= 1; 
			mxa_ValuesToCOORDSYS_0.IPO_Mode := 0;
		
			pState := 30; 
			
		30: 
				
			coordSys := mxa_ValuesToCOORDSYS_0.COORDSYS;
			
			KRC_MoveLinearAbsolute_0.AxisGroupIdx 			:= HMI_AxisGroup;
			KRC_MoveLinearAbsolute_0.KRC_AxisGroupRefArr	:= ADR(AxisRef);
			KRC_MoveLinearAbsolute_0.Velocity				:= 10; 
			KRC_MoveLinearAbsolute_0.Acceleration  			:= 20; 
			KRC_MoveLinearAbsolute_0.CoordinateSystem		:= coordSys;
			KRC_MoveLinearAbsolute_0.OriType 				:= 0;
			KRC_MoveLinearAbsolute_0.BufferMode				:= 2;
			
			pState := 40;
			
		40:
			endPOS.X := 302; 
			endPOS.Y := -2; 
			endPOS.Z := 527; 
			endPOS.A := -178;
			endPOS.B := 26; 
			endPOS.C := -178; 
			endPOS.Status := 2; //010
			endPOS.Turn := 2; //000010
			
			KRC_MoveLinearAbsolute_0.Position			:= endPOS;

			KRC_MoveLinearAbsolute_0.ExecuteCmd 		:= TRUE;
			IF KRC_MoveLinearAbsolute_0.Done THEN 
				KRC_MoveLinearAbsolute_0.ExecuteCmd 	:= FALSE;
				pState 									:= 50; 
			END_IF
		
		50:
			endPOS.X := 430; 
			endPOS.Y := -2; 
			endPOS.Z := 527; 
			endPOS.A := -178;
			endPOS.B := 26; 
			endPOS.C := -178; 
			endPOS.Status := 2; //010
			endPOS.Turn := 2; //000010
			
			KRC_MoveLinearAbsolute_0.Position			:= endPOS;
			
			KRC_MoveLinearAbsolute_0.ExecuteCmd 		:= TRUE;
			IF KRC_MoveLinearAbsolute_0.Done THEN 
				KRC_MoveLinearAbsolute_0.ExecuteCmd 	:= FALSE;
				pState 									:= 40; 
			END_IF
	
	END_CASE
	
	KRC_WriteToolData_0();
	mxa_ValuesToCOORDSYS_0();
	KRC_MoveLinearAbsolute_0();

END_ACTION
