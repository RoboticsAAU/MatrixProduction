
ACTION RobotHoming: 
	
	// Check if current iteration is drilling manipulator
	CASE pKuka.operationType OF
		PROCESS:
			pKuka.convert.ValuesToPosition.posType := APPROACH_WORKSTATION;
					
		ASSEMBLY: 
			pKuka.convert.ValuesToPosition.posType := APPROACH_MAGAZINE;
		
	END_CASE
	
	pKuka.convert.ValuesToPosition();
	pKuka.convert.ValuesToCOORDSYS.Base := pKuka.convert.ValuesToPosition.baseNo;
	pKuka.convert.ValuesToCOORDSYS.IPO_Mode := 0; // #BASE
	pKuka.convert.ValuesToCOORDSYS();
	
	pKuka.tempPosition := pKuka.convert.ValuesToPosition.outputPos;
	
	pKuka.motion.KRC_MoveDirectAbsolute.CoordinateSystem := pKuka.convert.ValuesToCOORDSYS.COORDSYS;
	pKuka.motion.KRC_MoveDirectAbsolute.Position := pKuka.tempPosition;
	
	pKuka.motion.KRC_MoveDirectAbsolute.ExecuteCmd := TRUE;
	IF pKuka.motion.KRC_MoveDirectAbsolute.Done THEN 
		pKuka.motion.KRC_MoveDirectAbsolute.ExecuteCmd := FALSE;
		cm.state := 1000; 
	END_IF
	
END_ACTION
