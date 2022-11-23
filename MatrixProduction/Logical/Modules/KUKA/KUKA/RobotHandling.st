
ACTION RobotHandling: 
	CASE cm.state OF	
						
		1000:	
			IF robotExecute[i] THEN
				cm.description := 'Move to pickup point with relative linear movement';
				robotBusy[i] := TRUE;
				pKuka.convert.ValuesToCOORDSYS.IPO_Mode := 1; // #TOOL
				pKuka.convert.ValuesToCOORDSYS();
					
				pKuka.motion.KRC_MoveLinearRelative.CoordinateSystem := pKuka.convert.ValuesToCOORDSYS.COORDSYS;
					
				pKuka.tempPosition.X := pKuka.tempPosition.Y := pKuka.tempPosition.Z := pKuka.tempPosition.A := pKuka.tempPosition.B := pKuka.tempPosition.C
				:= 0;
				pKuka.tempPosition.Z := -relativeDistance; 
				// Status and turn is already set from moving to approach point
					
				pKuka.motion.KRC_MoveLinearRelative.Position := pKuka.tempPosition;
					
				pKuka.motion.KRC_MoveLinearRelative.ExecuteCmd := TRUE;
				IF pKuka.motion.KRC_MoveLinearRelative.Done THEN
					pKuka.motion.KRC_MoveLinearRelative.ExecuteCmd := FALSE;
					cm.state := 1010;
				END_IF
			END_IF
				
		1010:	
			cm.description := 'Close gripper and wait a little before moving to ensure proper grip';
				
			pKuka.gripperAction.action := CLOSE;
				
			pKuka.TON.PT := REAL_TO_TIME(gripperWaitTime); // in ms
			pKuka.TON.IN := TRUE;
			IF pKuka.TON.Q THEN
				pKuka.TON.IN := FALSE;
				cm.state := 1020;
			END_IF	
				
		1020:
			cm.description := 'Move back to approach point with relative linear movement';
				
			pKuka.tempPosition.X := pKuka.tempPosition.Y := pKuka.tempPosition.Z := pKuka.tempPosition.A := pKuka.tempPosition.B := pKuka.tempPosition.C
			:= 0;
			pKuka.tempPosition.Z := relativeDistance; 
			// Status and turn is already set from moving to approach point
				
			pKuka.motion.KRC_MoveLinearRelative.Position := pKuka.tempPosition;
				
			pKuka.motion.KRC_MoveLinearRelative.ExecuteCmd := TRUE;
			IF pKuka.motion.KRC_MoveLinearRelative.Done THEN
				pKuka.motion.KRC_MoveLinearRelative.ExecuteCmd := FALSE;
				cm.state := 1030;
			END_IF
				
		1030:	
			cm.description := 'Move to approach point of magazine with absolute direct movement';
			
			pKuka.convert.ValuesToPosition.posType := APPROACH_MAGAZINE;
			pKuka.convert.ValuesToPosition();
			
			pKuka.convert.ValuesToCOORDSYS.Base := pKuka.convert.ValuesToPosition.baseNo; // Magazine frame
			pKuka.convert.ValuesToCOORDSYS.IPO_Mode := 0; // #BASE
			pKuka.convert.ValuesToCOORDSYS();
				
			pKuka.tempPosition := pKuka.convert.ValuesToPosition.outputPos;
				
			pKuka.motion.KRC_MoveDirectAbsolute.CoordinateSystem := pKuka.convert.ValuesToCOORDSYS.COORDSYS;
			pKuka.motion.KRC_MoveDirectAbsolute.Position := pKuka.tempPosition;
				
			pKuka.motion.KRC_MoveDirectAbsolute.ExecuteCmd := TRUE;
			IF pKuka.motion.KRC_MoveDirectAbsolute.Done THEN 
				pKuka.motion.KRC_MoveDirectAbsolute.ExecuteCmd := FALSE;
				cm.state := 1040;
			END_IF
			
		1040:
			cm.description := 'Define order-specific approach point at magazine';
			
			CASE pKuka.axisGroupIdx OF
				6:
					// Check if any stacks are allocated
					FOR k := 0 TO (unloadSizeX*unloadSizeY) - 1 DO
						xIdxTemp := k MOD unloadSizeX;
						yIdxTemp := REAL_TO_INT(brmfloor(k/unloadSizeY));
							
						IF idAtStack[xIdxTemp, yIdxTemp] = orderSpec[i] THEN
							IF xIdx <> -1 THEN
								idAtStack[xIdx, yIdx] := -1;
							END_IF
							xIdx := xIdxTemp;
							yIdx := yIdxTemp; 
							EXIT;
						END_IF
						
						IF xIdxTemp = -1 AND (idAtStack[xIdx, yIdx] = -1 AND stackCounter[xIdx, yIdx] + orderAmount <= unloadSizeZ) THEN
							xIdx := xIdxTemp;
							yIdx := yIdxTemp;
							idAtStack[xIdx, yIdx] := orderSpec[i];
						END_IF
						
					END_FOR
					
					pKuka.convert.ValuesToPosition.posType := APPROACH_MAGAZINE;
					pKuka.convert.ValuesToPosition();
					
					pKuka.tempPosition := pKuka.convert.ValuesToPosition.outputPos;
					
					pKuka.tempPosition.X := pKuka.tempPosition.X + xIdx*120;
					pKuka.tempPosition.Y := pKuka.tempPosition.Y - yIdx*80;
				
			END_CASE
			
			cm.state := 1050;
			
			
		1050:
			cm.description := 'Move to order-specific approach point at magazine';
			pKuka.convert.ValuesToCOORDSYS.IPO_Mode := 0; // #BASE
			pKuka.convert.ValuesToCOORDSYS();
			
			pKuka.motion.KRC_MoveDirectAbsolute.CoordinateSystem := pKuka.convert.ValuesToCOORDSYS.COORDSYS;
				
			pKuka.motion.KRC_MoveDirectAbsolute.Position := pKuka.tempPosition;
				
			pKuka.motion.KRC_MoveDirectAbsolute.ExecuteCmd := TRUE;
			IF pKuka.motion.KRC_MoveDirectAbsolute.Done THEN
				pKuka.motion.KRC_MoveDirectAbsolute.ExecuteCmd := FALSE;
				cm.state := 1060;
			END_IF
			
		
		1060:
			cm.description := 'Move to place point at magazine with relative movement';
			
			pKuka.convert.ValuesToCOORDSYS.IPO_Mode := 1; // #TOOL
			pKuka.convert.ValuesToCOORDSYS();
			
			pKuka.motion.KRC_MoveLinearRelative.CoordinateSystem := pKuka.convert.ValuesToCOORDSYS.COORDSYS;
			
			pKuka.tempPosition.X := pKuka.tempPosition.Y := pKuka.tempPosition.A := pKuka.tempPosition.B := pKuka.tempPosition.C
			:= 0;
			pKuka.tempPosition.Z := -(pKuka.tempPosition.Z - (unloadSizeZ - stackCounter[xIdx,yIdx])* 21);
			// Status and turn is already set from moving to approach point
			
			pKuka.motion.KRC_MoveLinearRelative.Position := pKuka.tempPosition;
			
			pKuka.motion.KRC_MoveLinearRelative.ExecuteCmd := TRUE;
			IF pKuka.motion.KRC_MoveLinearRelative.Done THEN
				pKuka.motion.KRC_MoveLinearRelative.ExecuteCmd := FALSE;
				cm.state := 1070;
			END_IF	
			
			
		1070:
			cm.description := 'Open gripper and wait a little before moving to ensure proper grip';
			
			pKuka.gripperAction.action := OPEN;
			
			pKuka.TON.PT := REAL_TO_TIME(gripperWaitTime); // in ms
			pKuka.TON.IN := TRUE;
			IF pKuka.TON.Q THEN
				pKuka.TON.IN := FALSE;
				cm.state := 1080;
			END_IF
			
		1080:
			cm.description := 'Move to place point at magazine with relative movement';
			
			pKuka.convert.ValuesToCOORDSYS.IPO_Mode := 1; // #TOOL
			pKuka.convert.ValuesToCOORDSYS();
			
			pKuka.motion.KRC_MoveLinearRelative.CoordinateSystem := pKuka.convert.ValuesToCOORDSYS.COORDSYS;
			
			pKuka.tempPosition.X := pKuka.tempPosition.Y := pKuka.tempPosition.A := pKuka.tempPosition.B := pKuka.tempPosition.C
			:= 0;
			pKuka.tempPosition.Z := (pKuka.tempPosition.Z - (unloadSizeZ - stackCounter[xIdx,yIdx])* 21);
			// Status and turn is already set from moving to approach point
			
			pKuka.motion.KRC_MoveLinearRelative.Position := pKuka.tempPosition;
			
			pKuka.motion.KRC_MoveLinearRelative.ExecuteCmd := TRUE;
			IF pKuka.motion.KRC_MoveLinearRelative.Done THEN
				pKuka.motion.KRC_MoveLinearRelative.ExecuteCmd := FALSE;
				robotDone[i] := TRUE;
				cm.state := 1090;
			END_IF	

			
		1090:
			cm.description := 'Move back to home position';
			orderCounter[xIdx, yIdx] := orderCounter[xIdx,yIdx] + 1;
			stackCounter[xIdx, yIdx] := stackCounter[xIdx,yIdx] + 1;
			IF orderCounter[xIdx, yIdx] = orderAmount THEN 
				idAtStack[xIdx, yIdx] := -1;
				orderCounter[xIdx, yIdx] := 0;
			END_IF
			
			RobotHoming;
		
	END_CASE
END_ACTION
