
PROGRAM _INIT
	
	FOR i := 0 TO 5 DO
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
	
END_PROGRAM

PROGRAM _CYCLIC

	FOR i := 1 TO 4 DO // CHANGE TO 0 TO 5 WHEN ALL ROBOTS WORK
		// Accessing the specific KUKA for easier naming
		pKuka ACCESS ADR(KUKAs[i]);
		cm ACCESS ADR(KUKAs[i].cm);	
		
		// Logic to transform USINT (Input) to BYTE (FUBS)
		brsmemcpy(ADR(KRC_Input[0]), ADR(InputVariables[i,0]), 254);
		
		/////////////////////////////////////////////////////
		// KRC_ReadAxisGroup has to be called at the Begin //
		// of the Cyclic Task to get all the Information   //
		// From the KRC from all KUKAs					   //
		/////////////////////////////////////////////////////
		
		pKuka.read.KRC_ReadAxisGroup.KRC4_Input 			:= ADR(KRC_Input); 
		pKuka.read.KRC_ReadAxisGroup.AxisGroupIdx 			:= pKuka.axisGroupIdx;
		pKuka.read.KRC_ReadAxisGroup.KRC_AxisGroupRefArr 	:= ADR(AxisRef);
		
		pKuka.read.KRC_ReadAxisGroup();
		
		// RobotStart contains FB calls associated with initialization of the robots and diagnosis
		RobotStart;
		
		robotOperating[0] := robotOperating[1] := robotOperating[3] := robotOperating[4] := robotOperating[5] := FALSE;
		
		// If the robot is ready, begin actual program
		IF 	pKuka.status.P_ AND pKuka.status.S_ AND pKuka.status.R_ AND pKuka.status.I_ AND pKuka.status.EXT_ THEN
			CASE cm.state OF
				0: // RESETTING
					cm.state := 101;
					
				100..999: // SETTING TOOL AND BASE DATA
					WriteToolData; // 101..200
					WriteBaseData; // 201..300
				
				1000..1999: // RUNNING MANIPULATOR PROGRAMS
					CASE pKuka.axisGroupIdx OF
						1:
							KUKABottomCover;
						
						2:
							KUKADrilling;
						
						3:
							KUKAPcb;
						
						4:
							KUKAFuse;
						
						5:
							KUKATopCover;
						
						6:
							KUKAUnloading;
						
					END_CASE
				
			END_CASE
			
		END_IF
		
		/////////////////////////////////////////////////////
		// FunctionBlock to write the Output on the Struct //
		/////////////////////////////////////////////////////
		
		pKuka.write.KRC_WriteAxisGroup.AxisGroupIdx			:= pKuka.axisGroupIdx;
		pKuka.write.KRC_WriteAxisGroup.KRC_AxisGroupRefArr 	:= ADR(AxisRef); 
		pKuka.write.KRC_WriteAxisGroup.KRC4_Output 			:= ADR(KRC_Output);
		
		pKuka.write.KRC_WriteAxisGroup();
		
		// Logic to transform BYTE (FUBS) to USINT (Input)
		brsmemcpy(ADR(OutputVariables[i,0]), ADR(KRC_Output[0]), 254);
		
	END_FOR
	
END_PROGRAM
