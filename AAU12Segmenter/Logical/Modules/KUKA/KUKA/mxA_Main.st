PROGRAM _INIT
	
	FOR i:=0 TO 5 DO
		KUKAs[i].AxisGroupIdx := i + 1;
		KUKAs[i].gripperAction.whitePin := ADR(gripperWhitePins[i]);
		KUKAs[i].gripperAction.blackPin := ADR(gripperBlackPins[i]);
		KUKAs[i].gripperAction.action := OPEN;
		KUKAs[i].gripperAction();
		KUKAs[i].cm.state := 0;
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
	FOR i:=2 TO 2 DO
		
		
		/////////////////////////////////////////////////////
		// Logic to transform USINT (Input) to BYTE (FUBS) //
		/////////////////////////////////////////////////////
	
		brsmemcpy(ADR(KRC_Input[0]),ADR(InputVariables[i,0]), 254);
	
	
		/////////////////////////////////////////////////////
		// KRC_ReadAxisGroup has to be called at the Begin //
		// of the Cyclic Task to get all the Information   //
		// From the KRC from all KUKAs					   //
		/////////////////////////////////////////////////////
		
		
		KUKAs[i].start.KRC_ReadAxisGroup.KRC4_Input 			:= ADR(KRC_Input); 
		KUKAs[i].start.KRC_ReadAxisGroup.AxisGroupIdx 			:= KUKAs[i].AxisGroupIdx;
		KUKAs[i].start.KRC_ReadAxisGroup.KRC_AxisGroupRefArr 	:= ADR(AxisRef);
		
		KUKAs[i].start.KRC_ReadAxisGroup();
		
		
		/////////////////////////////////////////////////////
		// Call User functions                             //
		/////////////////////////////////////////////////////
		
		mxA_Start;
		//mxA_LinearMovement;
		IF i = 2 THEN
			mxA_JointMovement;
		END_IF
		//mxA_ErrorMessage;
		
		
		// Function calls from Motion.fbd 			
		KUKAs[i].start.KRC_Abort.AxisGroupIdx 				:= KUKAs[i].AxisGroupIdx;
		KUKAs[i].start.KRC_Abort.KRC_AxisGroupRefArr		:= ADR(AxisRef);
		KUKAs[i].start.KRC_Abort.ExecuteCmd					:= FALSE;  /// Used to be set by HMI - Remember to incorporate it later
		KUKAs[i].start.KRC_Abort();	
			
		
		/////////////////////////////////////////////////////
		// FunctionBlock to write the Output on the Struct //
		/////////////////////////////////////////////////////
		
		KUKAs[i].start.KRC_WriteAxisGroup.AxisGroupIdx			:= KUKAs[i].AxisGroupIdx;
		KUKAs[i].start.KRC_WriteAxisGroup.KRC_AxisGroupRefArr 	:= ADR(AxisRef); 
		KUKAs[i].start.KRC_WriteAxisGroup.KRC4_Output 			:= ADR(KRC_Output);
		
		KUKAs[i].start.KRC_WriteAxisGroup();
		
		/////////////////////////////////////////////////////
		// Logic to transform BYTE (FUBS) to USINT (Input) //
		/////////////////////////////////////////////////////
		brsmemcpy(ADR(OutputVariables[i,0]),ADR(KRC_Output[0]), 254);

	END_FOR
	
END_PROGRAM
