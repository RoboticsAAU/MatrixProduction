
ACTION RobotProgram: 
	
	/////////////////////////////////////////////////////
	// Logic to transform USINT (Input) to BYTE (FUBS) //
	/////////////////////////////////////////////////////
	
	brsmemcpy(ADR(KRC_Input[0]),ADR(InputVariables[i,0]), 254);
		
	
	/////////////////////////////////////////////////////
	// KRC_ReadAxisGroup has to be called at the Begin //
	// of the Cyclic Task to get all the Information   //
	// From the KRC from all KUKAs					   //
	/////////////////////////////////////////////////////
		
		
	pKuka.start.KRC_ReadAxisGroup.KRC4_Input 			:= ADR(KRC_Input); 
	pKuka.start.KRC_ReadAxisGroup.AxisGroupIdx 			:= pKuka.AxisGroupIdx;
	pKuka.start.KRC_ReadAxisGroup.KRC_AxisGroupRefArr 	:= ADR(AxisRef);
		
	pKuka.start.KRC_ReadAxisGroup();
		
		
	/////////////////////////////////////////////////////
	// Call User functions                             //
	/////////////////////////////////////////////////////
		
		
	// RobotStart contains FB calls associated with initialization of the robots and diagnosis
	RobotStart;
		
	IF 	pKuka.status.P_ AND pKuka.status.S_ AND pKuka.status.R_ AND pKuka.status.I_ AND pKuka.status.EXT_ THEN		
		
		
		//JointMovement;
		//LinearMovement;
		//ErrorMessage;
			
		CASE pKuka.AxisGroupIdx OF
			1:
				KUKABottomCover;
					
			2:
				//KUKADrilling;
				LinearMovement;
					
			3:
				//KUKAPcb;
				LinearMovement;
					
			4:
				KUKAFuse;
					
			5:
				KUKATopCover;
					
			6:
				KUKAUnloading;
				
		END_CASE
		
	END_IF
			
		
	/////////////////////////////////////////////////////
	// FunctionBlock to write the Output on the Struct //
	/////////////////////////////////////////////////////
		
	pKuka.start.KRC_WriteAxisGroup.AxisGroupIdx			:= pKuka.AxisGroupIdx;
	pKuka.start.KRC_WriteAxisGroup.KRC_AxisGroupRefArr 	:= ADR(AxisRef); 
	pKuka.start.KRC_WriteAxisGroup.KRC4_Output 			:= ADR(KRC_Output);
		
	pKuka.start.KRC_WriteAxisGroup();
		
	/////////////////////////////////////////////////////
	// Logic to transform BYTE (FUBS) to USINT (Input) //
	/////////////////////////////////////////////////////
	brsmemcpy(ADR(OutputVariables[i,0]),ADR(KRC_Output[0]), 254);
	
END_ACTION
