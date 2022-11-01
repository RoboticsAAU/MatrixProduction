

PROGRAM _CYCLIC



	/////////////////////////////////////////////////////
	// Logic to transform USINT (Input) to BYTE (FUBS) //
	/////////////////////////////////////////////////////
	FOR i:=0 TO 5 DO
		brsmemcpy(ADR(KRC_Input[i,0]),ADR(InputVariables[i,0]), 254);
	END_FOR
	
	
	/////////////////////////////////////////////////////
	// KRC_ReadAxisGroup has to be called at the Begin //
	// of the Cyclic Task to get all the Information   //
	// From the KRC from KUKA						   //
	/////////////////////////////////////////////////////
	
	KRC_ReadAxisGroup_0.KRC4_Input 			:= ADR(KRC_Input[0,0]); 
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
	//mxA_Motion;
	//mxA_JointMovement;
	mxA_LinearMovement;
	//mxA_ErrorMessage;

	
	// Function calls from Motion.fbd 
	KRC_ReadActualAxisPosition_0.AxisGroupIdx 			:= HMI_AxisGroup; 
	KRC_ReadActualAxisPosition_0.KRC_AxisGroupRefArr 	:= ADR(AxisRef); 
	KRC_ReadActualAxisPosition_0();
	
	HMI_A1 												:= KRC_ReadActualAxisPosition_0.A1;
	HMI_A2 												:= KRC_ReadActualAxisPosition_0.A2;
	HMI_A3 												:= KRC_ReadActualAxisPosition_0.A3;
	HMI_A4 												:= KRC_ReadActualAxisPosition_0.A4;
	HMI_A5 												:= KRC_ReadActualAxisPosition_0.A5;
	HMI_A6 												:= KRC_ReadActualAxisPosition_0.A6;
	
	
	KRC_ReadActualPosition_0.AxisGroupIdx 				:= HMI_AxisGroup; 
	KRC_ReadActualPosition_0.KRC_AxisGroupRefArr 		:= ADR(AxisRef);
	KRC_ReadActualPosition_0();
	
	HMI_X												:= KRC_ReadActualPosition_0.X;
	HMI_Y												:= KRC_ReadActualPosition_0.Y;
	HMI_Z												:= KRC_ReadActualPosition_0.Z;
	HMI_A												:= KRC_ReadActualPosition_0.A;
	HMI_B												:= KRC_ReadActualPosition_0.B;
	HMI_C												:= KRC_ReadActualPosition_0.C;
	
	
	KRC_Abort_0.AxisGroupIdx 							:= HMI_AxisGroup;
	KRC_Abort_0.KRC_AxisGroupRefArr						:= ADR(AxisRef);
	KRC_Abort_0.ExecuteCmd								:= HMI_ExeAbort; 
	KRC_Abort_0();	
	
	
	
	
	
	
	
	
	
	
	
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
	FOR i:=0 TO 5 DO
		brsmemcpy(ADR(OutputVariables[i,0]),ADR(KRC_Output[i,0]), 254);
	END_FOR
	
	
	END_PROGRAM
