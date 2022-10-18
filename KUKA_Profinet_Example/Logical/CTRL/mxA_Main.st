


PROGRAM _CYCLIC



	/////////////////////////////////////////////////////
	// Logic to transform USINT (Input) to BYTE (FUBS) //
	/////////////////////////////////////////////////////
	
	brsmemcpy(ADR(KRC4_Input),ADR(InputVariablePL), 254);
	//brsmemcpy(ADR(KRC4_Input_1),ADR(InputVariablePL_1), 254);
	
	/////////////////////////////////////////////////////
	// KRC_ReadAxisGroup has to be called at the Begin //
	// of the Cyclic Task to get all the Information   //
	// From the KRC from KUKA						   //
	/////////////////////////////////////////////////////
	
	KRC_ReadAxisGroup_0.KRC4_Input 			:= ADR(KRC4_Input); 
	KRC_ReadAxisGroup_0.AxisGroupIdx 		:= 1;
	KRC_ReadAxisGroup_0.KRC_AxisGroupRefArr := ADR(AxisRef);

	KRC_ReadAxisGroup_0();
		


	//KRC_ReadAxisGroup_1.KRC4_Input 			:= ADR(KRC4_Input_1); 
	//KRC_ReadAxisGroup_1.AxisGroupIdx 		:= 2;
	//KRC_ReadAxisGroup_1.KRC_AxisGroupRefArr := ADR(AxisRef);

	//KRC_ReadAxisGroup_1();

	
	/////////////////////////////////////////////////////
	// Call User functions                             //
	/////////////////////////////////////////////////////

	mxA_Start;
	mxA_Motion;
	mxA_ErrorMessage;
	
	
	
	
	
	/////////////////////////////////////////////////////
	// FunctionBlock to write the Output on the Struct //
	/////////////////////////////////////////////////////
	
	KRC_WriteAxisGroup_0.AxisGroupIdx			:= 1;
	KRC_WriteAxisGroup_0.KRC_AxisGroupRefArr 	:= ADR(AxisRef); 
	KRC_WriteAxisGroup_0.KRC4_Output 			:= ADR(KRC4_Output);
	
	KRC_WriteAxisGroup_0();
	
	
	//KRC_WriteAxisGroup_1.AxisGroupIdx 			:= 2;
	//KRC_WriteAxisGroup_1.KRC_AxisGroupRefArr 	:= ADR(AxisRef); 
	//KRC_WriteAxisGroup_1.KRC4_Output 			:= ADR(KRC4_Output_1);
	
	//KRC_WriteAxisGroup_1();

	
	/////////////////////////////////////////////////////
	// Logic to transform BYTE (FUBS) to USINT (Input) //
	/////////////////////////////////////////////////////
	
	brsmemcpy(ADR(OutputVariablePL),ADR(KRC4_Output), 254);
	//brsmemcpy(ADR(OutputVariablePL_1),ADR(KRC4_Output_1), 254);
	
	
	END_PROGRAM
