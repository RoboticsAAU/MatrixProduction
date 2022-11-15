
ACTION RobotHoming: 
	
	// Check if current iteration is drilling manipulator
	CASE pKuka.operationType OF
		PROCESS:
			pKuka.convert.ValuesToCOORDSYS.Base := 1; // ACOPOS6D frame
			pKuka.convert.ValuesToPosition.posType := APPROACH_WORKSTATION;
					
		ASSEMBLY: 
			pKuka.convert.ValuesToCOORDSYS.Base := 2; // Magazine frame
			pKuka.convert.ValuesToPosition.posType := APPROACH_MAGAZINE;
	END_CASE
			
	pKuka.convert.ValuesToCOORDSYS.IPO_Mode := 0; // #BASE
	pKuka.convert.ValuesToCOORDSYS();

	pKuka.convert.ValuesToPosition();
			
	pKuka.tempPosition := pKuka.convert.ValuesToPosition.outputPos;
	
	pKuka.motion.KRC_MoveDirectAbsolute.CoordinateSystem := pKuka.convert.ValuesToCOORDSYS.COORDSYS;
	pKuka.motion.KRC_MoveDirectAbsolute.Position := pKuka.tempPosition;
			
	pKuka.motion.KRC_MoveDirectAbsolute.ExecuteCmd := TRUE;
	IF pKuka.motion.KRC_MoveDirectAbsolute.Done THEN 
		pKuka.motion.KRC_MoveDirectAbsolute.ExecuteCmd := FALSE;
		cm.state := 1000; 
	END_IF
	
END_ACTION
