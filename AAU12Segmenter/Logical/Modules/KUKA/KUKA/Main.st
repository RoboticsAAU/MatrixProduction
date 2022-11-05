
PROGRAM _CYCLIC
	
	CASE mainState OF
		
		0: // RESETTING
			
			FOR i:=0 TO 5 DO
				KUKAs[i].axisGroupIdx := i + 1;
				KUKAs[i].gripperAction.whitePin := ADR(gripperWhitePins[i]);
				KUKAs[i].gripperAction.blackPin := ADR(gripperBlackPins[i]);
				KUKAs[i].gripperAction.action := OPEN;
				KUKAs[i].gripperAction();
				KUKAs[i].cm.state := 0;
				KUKAs[i].startState := 0;
			END_FOR
			
			// Setting end-effector type
			KUKAs[0].eeType := COVER_EE;
			KUKAs[1].eeType := DRILL_EE;
			KUKAs[2].eeType := PCB_EE;
			KUKAs[3].eeType := FUSE_EE;
			KUKAs[4].eeType := COVER_EE;
			KUKAs[5].eeType := COVER_EE;
			
			tempToolCounter := 0;
			tempBaseCounter := 0;
			writeToolDataDone := FALSE;
			writeBaseDataDone := FALSE; 
			
			mainState := 101;
			
			
		100..999: // INITIALIZING PARAMETERS
			WriteToolData;
			WriteBaseData;
			
			IF writeToolDataDone AND writeBaseDataDone THEN
				mainState := 1000;
			END_IF
			
		1000..1999: // RUNNING MANIPULATOR PROGRAMS
			// Loop through each robot for configurations
			FOR i := 0 TO 5 DO
		
				////////// Temporary skip until problem with library for Kuka KR4 is solved ///////////
				IF i <> 0 AND i <> 5 THEN
					pKuka ACCESS ADR(KUKAs[i]);
					cm ACCESS ADR(KUKAs[i].cm);	
					
					RobotProgram;
				END_IF

			END_FOR
		
	END_CASE	
	
END_PROGRAM
