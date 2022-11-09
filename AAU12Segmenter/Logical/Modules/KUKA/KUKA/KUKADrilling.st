
ACTION KUKADrilling: 
	
	CASE cm.state OF
		
		1000:
			cm.description := 'Initialising parameters';
			
			pKuka.convert.ValuesToCOORDSYS.Tool := 1;
			pKuka.convert.ValuesToCOORDSYS();
			
			pKuka.convert.ValuesToPosition.axisGroupIdx := pKuka.axisGroupIdx;
			pKuka.convert.ValuesToPosition();
			
			pKuka.motion.KRC_MoveDirectAbsolute.AxisGroupIdx := pKuka.motion.KRC_MoveLinearAbsolute.AxisGroupIdx := pKuka.motion.KRC_MoveLinearRelative.AxisGroupIdx
				:=  pKuka.axisGroupIdx;
			pKuka.motion.KRC_MoveDirectAbsolute.KRC_AxisGroupRefArr := pKuka.motion.KRC_MoveLinearAbsolute.KRC_AxisGroupRefArr := pKuka.motion.KRC_MoveLinearRelative.KRC_AxisGroupRefArr
				:= ADR(AxisRef);
			pKuka.motion.KRC_MoveDirectAbsolute.Velocity := pKuka.motion.KRC_MoveLinearAbsolute.Velocity := pKuka.motion.KRC_MoveLinearRelative.Velocity
				:= 5; // Velocity in percent
			pKuka.motion.KRC_MoveDirectAbsolute.Acceleration := pKuka.motion.KRC_MoveLinearAbsolute.Acceleration := pKuka.motion.KRC_MoveLinearRelative.Acceleration
				:= 20; // Acceleration in percent
			pKuka.motion.KRC_MoveDirectAbsolute.BufferMode := pKuka.motion.KRC_MoveLinearAbsolute.BufferMode := pKuka.motion.KRC_MoveLinearRelative.BufferMode
				:= 2; // BUFFERED
			pKuka.motion.KRC_MoveLinearAbsolute.OriType := pKuka.motion.KRC_MoveLinearRelative.OriType
				:= 0; // 0: VAR | 1: CONSTANT | 2: JOINT
			pKuka.motion.KRC_MoveDirectAbsolute.ExecuteCmd := pKuka.motion.KRC_MoveLinearAbsolute.ExecuteCmd := pKuka.motion.KRC_MoveLinearRelative.ExecuteCmd
				:= FALSE;
			
			cm.state := 1010;
			
			
		1010:
			cm.description := 'Waiting for flag to start movement';
			
			IF robotOperating[i] THEN
				holeCounter := 0;
				cm.state := 1020;
			END_IF
			
			
		1020:
			cm.description := 'Move to first drilling approach point with absolute joint movement';
			
			pKuka.convert.ValuesToCOORDSYS.Base := 1; // ACOPOS6D frame
			pKuka.convert.ValuesToCOORDSYS.IPO_Mode := 0; // #BASE
			pKuka.convert.ValuesToCOORDSYS();
			
			pKuka.convert.ValuesToPosition.posType := APPROACH_WORKSTATION;
			pKuka.convert.ValuesToPosition();
			
			pKuka.tempPosition := pKuka.convert.ValuesToPosition.outputPos;
			
			pKuka.motion.KRC_MoveDirectAbsolute.CoordinateSystem := pKuka.convert.ValuesToCOORDSYS.COORDSYS;
			pKuka.motion.KRC_MoveDirectAbsolute.Position := pKuka.tempPosition;
			
			pKuka.motion.KRC_MoveDirectAbsolute.ExecuteCmd := TRUE;
			IF pKuka.motion.KRC_MoveDirectAbsolute.Done THEN 
				pKuka.motion.KRC_MoveDirectAbsolute.ExecuteCmd := FALSE;
				cm.state := 1030; 
			END_IF
			
			
		1030:
			cm.description := 'Move down to imitate drilling two holes using relative linear movement';
			
			pKuka.convert.ValuesToCOORDSYS.IPO_Mode := 1; // #TOOL
			pKuka.convert.ValuesToCOORDSYS();
			
			pKuka.motion.KRC_MoveLinearRelative.CoordinateSystem := pKuka.convert.ValuesToCOORDSYS.COORDSYS;
			
			pKuka.tempPosition.X := pKuka.tempPosition.Y := pKuka.tempPosition.Z := pKuka.tempPosition.A := pKuka.tempPosition.B := pKuka.tempPosition.C
				:= 0;
			pKuka.tempPosition.Z := 100; // Move 100 mm forwards to pickup position
			// Status and turn is already set from moving to approach point
			
			pKuka.motion.KRC_MoveLinearRelative.Position := pKuka.tempPosition;
			
			pKuka.motion.KRC_MoveLinearRelative.ExecuteCmd := TRUE;
			IF pKuka.motion.KRC_MoveLinearRelative.Done THEN
				pKuka.motion.KRC_MoveLinearRelative.ExecuteCmd := FALSE;
				cm.state := 1040;
			END_IF
			
			
		1040:
			cm.description := 'Move back up again with relative linear movement';
			
			// Almost everythings is already set from previous relative linear movement
			pKuka.tempPosition.Z := -100; // Move 100 mm backwards to magazine approach position
			// Status and turn is already set from moving to approach point
			
			pKuka.motion.KRC_MoveLinearRelative.Position := pKuka.tempPosition;
			
			pKuka.motion.KRC_MoveLinearRelative.ExecuteCmd := TRUE;
			IF pKuka.motion.KRC_MoveLinearRelative.Done THEN
				pKuka.motion.KRC_MoveLinearRelative.ExecuteCmd := FALSE;
				
				holeCounter := holeCounter + 2;
				
				IF holeCounter = orderSpec[i] THEN
					cm.state := 1060;
				ELSE
					cm.state := 1050;
				END_IF
					
			END_IF
			
			
		1050:
			cm.description := 'Move to second drilling approach point with relative linear movement';
			
			pKuka.tempPosition.X := pKuka.tempPosition.Y := pKuka.tempPosition.Z := pKuka.tempPosition.A := pKuka.tempPosition.B := pKuka.tempPosition.C
				:= 0;
			pKuka.tempPosition.Y := 100; // Move 100 mm laterally to pickup position (NEED TO CHANGE)
			// Status and turn is already set from moving to approach point
			
			pKuka.motion.KRC_MoveLinearRelative.Position := pKuka.tempPosition;
			
			pKuka.motion.KRC_MoveLinearRelative.ExecuteCmd := TRUE;
			IF pKuka.motion.KRC_MoveLinearRelative.Done THEN
				pKuka.motion.KRC_MoveLinearRelative.ExecuteCmd := FALSE;
				cm.state := 1030;
			END_IF
			
			
		
		1060:
			cm.description := 'Move to default point with absolute joint movement';
			
			pKuka.convert.ValuesToCOORDSYS.Base := 0; // World frame
			pKuka.convert.ValuesToCOORDSYS.IPO_Mode := 0; // #BASE
			pKuka.convert.ValuesToCOORDSYS();
			
			pKuka.convert.ValuesToPosition.posType := DEFAULT;
			pKuka.convert.ValuesToPosition();
			
			pKuka.tempPosition := pKuka.convert.ValuesToPosition.outputPos;
			
			pKuka.motion.KRC_MoveDirectAbsolute.CoordinateSystem := pKuka.convert.ValuesToCOORDSYS.COORDSYS;
			pKuka.motion.KRC_MoveDirectAbsolute.Position := pKuka.tempPosition;
			
			pKuka.motion.KRC_MoveDirectAbsolute.ExecuteCmd := TRUE;
			IF pKuka.motion.KRC_MoveDirectAbsolute.Done THEN 
				pKuka.motion.KRC_MoveDirectAbsolute.ExecuteCmd := FALSE;
				pKuka.cm.state := 1010;
			END_IF
			
	END_CASE

	pKuka.motion.KRC_MoveLinearAbsolute();
	pKuka.motion.KRC_MoveLinearRelative();
	pKuka.motion.KRC_MoveDirectAbsolute();

END_ACTION
