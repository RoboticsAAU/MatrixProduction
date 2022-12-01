
PROGRAM _INIT
	
	FOR i := 0 TO 5 DO
		KUKAs[i].axisGroupIdx := i + 1;
		KUKAs[i].gripperAction.whitePin := ADR(gripperWhitePins[i]);
		KUKAs[i].gripperAction.blackPin := ADR(gripperBlackPins[i]);
		KUKAs[i].gripperAction.action := OPEN;
		KUKAs[i].gripperAction();
		KUKAs[i].cm.state := 0;
		KUKAs[i].startState := 0;
		KUKAs[i].atMaintenancePos := FALSE;
	END_FOR
	
	// Setting end-effector type
	KUKAs[0].eeType := COVER_EE;
	KUKAs[1].eeType := DRILL_EE;
	KUKAs[2].eeType := PCB_EE;
	KUKAs[3].eeType := FUSE_EE;
	KUKAs[4].eeType := COVER_EE;
	KUKAs[5].eeType := COVER_EE;
	
	// Setting the operation type
	KUKAs[0].operationType := ASSEMBLY;
	KUKAs[1].operationType := PROCESS;
	KUKAs[2].operationType := ASSEMBLY;
	KUKAs[3].operationType := ASSEMBLY;
	KUKAs[4].operationType := ASSEMBLY;
	KUKAs[5].operationType := HANDLING;
	
	gripperWaitTime := 250; // in ms
	
	robotVelocity := 100;
	robotAcceleration := 50;
	robotVelocityOverride := 20;
	
END_PROGRAM

PROGRAM _CYCLIC
	
	FOR i := 0 TO 5 DO // CHANGE TO 0 TO 5 WHEN ALL ROBOTS WORK
		
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
		
		// Stops the robots if pressed on the HMI. 
		IF emergencyStop THEN 
			pKuka.start.KRC_AutoStart.ExecuteReset := TRUE;
			pKuka.cm.state := 0;
		END_IF
		
		// Go to maintenance position if button is pressed
		IF maintenance THEN
			pKuka.cm.state := 600;
		ELSIF BOOL_TO_INT(maintenance) <> BOOL_TO_INT(maintenancePrev[i]) THEN
			pKuka.atMaintenancePos := FALSE;
			pKuka.cm.state := 0;
		END_IF
		maintenancePrev[i] := maintenance;
		
		// If the robot is not enabled, tell Acopos that the robot is already done
		IF NOT robotEnabled[i] THEN
			robotDone[i] := TRUE;
		ELSIF BOOL_TO_INT(robotEnabled[i]) <> BOOL_TO_INT(robotEnabledPrev[i]) THEN
			robotDone[i] := FALSE;
		END_IF
		robotEnabledPrev[i] := robotEnabled[i];
		
		// If the robot is ready, begin actual program
		IF 	pKuka.status.P_ AND pKuka.status.S_ AND pKuka.status.R_ AND pKuka.status.I_ AND pKuka.status.EXT_ THEN
			// Changeable parameters in the HMI
			pKuka.motion.KRC_MoveDirectAbsolute.Velocity := pKuka.motion.KRC_MoveLinearAbsolute.Velocity := pKuka.motion.KRC_MoveLinearRelative.Velocity
				:= robotVelocity; // Velocity in percent		
			pKuka.motion.KRC_MoveDirectAbsolute.Acceleration := pKuka.motion.KRC_MoveLinearAbsolute.Acceleration := pKuka.motion.KRC_MoveLinearRelative.Acceleration
				:= robotAcceleration; // Acceleration in percent
			pKuka.start.KRC_SetOverride.Override := robotVelocityOverride;
			
			CASE cm.state OF
				0: // INITIALIZING
					pKuka.convert.ValuesToCOORDSYS.Tool := 1;
					pKuka.convert.ValuesToPosition.axisGroupIdx := pKuka.axisGroupIdx;
					
					pKuka.motion.KRC_MoveDirectAbsolute.AxisGroupIdx := pKuka.motion.KRC_MoveLinearAbsolute.AxisGroupIdx := pKuka.motion.KRC_MoveLinearRelative.AxisGroupIdx
						:=  pKuka.axisGroupIdx;
					pKuka.motion.KRC_MoveDirectAbsolute.KRC_AxisGroupRefArr := pKuka.motion.KRC_MoveLinearAbsolute.KRC_AxisGroupRefArr := pKuka.motion.KRC_MoveLinearRelative.KRC_AxisGroupRefArr
					:= ADR(AxisRef);
					
					pKuka.motion.KRC_MoveDirectAbsolute.BufferMode := pKuka.motion.KRC_MoveLinearAbsolute.BufferMode := pKuka.motion.KRC_MoveLinearRelative.BufferMode
						:= 2; // BUFFERED
					pKuka.motion.KRC_MoveLinearAbsolute.OriType := pKuka.motion.KRC_MoveLinearRelative.OriType
						:= 0; // 0: VAR | 1: CONSTANT | 2: JOINT
					pKuka.motion.KRC_MoveDirectAbsolute.ExecuteCmd := pKuka.motion.KRC_MoveLinearAbsolute.ExecuteCmd := pKuka.motion.KRC_MoveLinearRelative.ExecuteCmd
						:= FALSE;
					
					cm.state := 101;
					
				100..499: // SETTING TOOL AND BASE DATA
					WriteToolData; // 101..200
					WriteBaseData; // 201..300
					
				500..999: // MOVE ROBOT TO HOME POSITION (position depends on operation type)
					// Set slow speed
					pKuka.start.KRC_SetOverride.Override := 20;
					pKuka.start.KRC_SetOverride();
					pKuka.motion.KRC_MoveDirectAbsolute.Velocity := 20;
					
					CASE cm.state OF
						500: RobotHoming;
						
						600: RobotMaintenance;
					END_CASE
				
				1000..1999: // RUNNING MANIPULATOR PROGRAMS
					CASE pKuka.operationType OF
						ASSEMBLY:
							RobotAssembly;
							
						PROCESS:
							RobotProcess;
							
						HANDLING:
							RobotHandling;
					END_CASE
				
			END_CASE
			
		END_IF
		
		//Calling function blocks to update content
		pKuka.motion.KRC_MoveLinearAbsolute();
		pKuka.motion.KRC_MoveLinearRelative();
		pKuka.motion.KRC_MoveDirectAbsolute();
		pKuka.gripperAction();
		pKuka.TON();
		
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
