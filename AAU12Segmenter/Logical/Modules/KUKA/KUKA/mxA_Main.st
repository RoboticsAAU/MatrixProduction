PROGRAM _INIT
	
	FOR i:=0 TO 5 DO
		KUKAs[i].AxisGroupIdx := i + 1;
		
	END_FOR
	
	KUKAs[0].eeType := COVER_EE;
	KUKAs[1].eeType := DRILL_EE;
	KUKAs[2].eeType := PCB_EE;
	KUKAs[3].eeType := FUSE_EE;
	KUKAs[4].eeType := COVER_EE;
	KUKAs[5].eeType := COVER_EE;	
	
END_PROGRAM

PROGRAM _CYCLIC

	// Loop through each robot for configurations
	FOR i:=0 TO 5 DO
		
		
		/////////////////////////////////////////////////////
		// Logic to transform USINT (Input) to BYTE (FUBS) //
		/////////////////////////////////////////////////////
	
		brsmemcpy(ADR(KRC_Input),ADR(InputVariables[i,0]), 254);
	
	
		/////////////////////////////////////////////////////
		// KRC_ReadAxisGroup has to be called at the Begin //
		// of the Cyclic Task to get all the Information   //
		// From the KRC from all KUKAs					   //
		/////////////////////////////////////////////////////
		
		KRC_Read_Axis_Group.KRC4_Input 				:= ADR(KRC_Input); 
		KRC_Read_Axis_Group.AxisGroupIdx 			:= KUKAs[i].AxisGroupIdx;
		KRC_Read_Axis_Group.KRC_AxisGroupRefArr 	:= ADR(AxisRef);
		
		KRC_Read_Axis_Group();
		
		
		/////////////////////////////////////////////////////
		// Call User functions                             //
		/////////////////////////////////////////////////////
		
		mxA_Start;
		//mxA_LinearMovement;
		//mxA_JointMovement;
		//mxA_ErrorMessage;
		
		
		// Function calls from Motion.fbd 			
		KUKAs[i].init.KRC_Abort.AxisGroupIdx 				:= KUKAs[i].AxisGroupIdx;
		KUKAs[i].init.KRC_Abort.KRC_AxisGroupRefArr			:= ADR(AxisRef);
		KUKAs[i].init.KRC_Abort.ExecuteCmd					:= 0;  /// Used to be set by HMI - Remember to incorporate it later
		KUKAs[i].init.KRC_Abort();	
			
		
		/////////////////////////////////////////////////////
		// FunctionBlock to write the Output on the Struct //
		/////////////////////////////////////////////////////
		
		KRC_Write_Axis_Group.AxisGroupIdx			:= KUKAs[i].AxisGroupIdx;
		KRC_Write_Axis_Group.KRC_AxisGroupRefArr 	:= ADR(AxisRef); 
		KRC_Write_Axis_Group.KRC4_Output 			:= ADR(KRC_Output);
		
		KRC_Write_Axis_Group();
		
		
		/////////////////////////////////////////////////////
		// Logic to transform BYTE (FUBS) to USINT (Input) //
		/////////////////////////////////////////////////////
		brsmemcpy(ADR(OutputVariables[i,0]),ADR(KRC_Output), 254);

	END_FOR
	
END_PROGRAM
