
PROGRAM _CYCLIC
	
	CASE mainState OF
		
		0: // RESETTING
			
			FOR i:=0 TO 5 DO
				KUKAs[i].AxisGroupIdx := i + 1;
				KUKAs[i].gripperAction.whitePin := ADR(gripperWhitePins[i]);
				KUKAs[i].gripperAction.blackPin := ADR(gripperBlackPins[i]);
				KUKAs[i].gripperAction.action := OPEN;
				KUKAs[i].gripperAction();
				KUKAs[i].cm.state := 0;
				KUKAs[i].startState := 0;
			END_FOR
			
			KUKAs[0].eeType := COVER_EE;
			KUKAs[1].eeType := DRILL_EE;
			KUKAs[2].eeType := PCB_EE;
			KUKAs[3].eeType := FUSE_EE;
			KUKAs[4].eeType := COVER_EE;
			KUKAs[5].eeType := COVER_EE;
			
			mainState := 1000;
			
		101..999: // INITIALIZING PARAMETERS
			
		
		1000..1999:
			// Loop through each robot for configurations
			FOR i := 0 TO 5 DO
		
				////////// Temporary skip until problem with library for Kuka KR4 is solved///////////
				IF i <> 0 AND i <> 5 THEN
					pKuka ACCESS ADR(KUKAs[i]);
					cm ACCESS ADR(KUKAs[i].cm);	
					
					RobotProgram;
				END_IF

			END_FOR
		
	END_CASE	
	
END_PROGRAM
