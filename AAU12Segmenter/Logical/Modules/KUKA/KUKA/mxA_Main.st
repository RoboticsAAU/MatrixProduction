PROGRAM _INIT
	
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
	
	
END_PROGRAM

PROGRAM _CYCLIC

	// Loop through each robot for configurations
	FOR i := 0 TO 5 DO
		
		////////// Temporary skip until problem with library for Kuka KR4 is solved///////////
		IF i = 0 OR i = 5 THEN
			
			RETURN;
			
		END_IF
		
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
		
		pKuka ACCESS ADR(KUKAs[i]);
		cm ACCESS ADR(KUKAs[i].cm);
		
		// mxA_Start contains FB calls associated with initialization of the robots and diagnosis
		mxA_Start;
		
		//mxA_JointMovement;
		//mxA_LinearMovement;
		//mxA_ErrorMessage;
		
		CASE i OF
			1:
				mxA_KUKA1;
				
			2:
				mxA_KUKA2;
				
			3:
				mxA_KUKA3;
				
			4:
				mxA_KUKA4;
				
			5:
				mxA_KUKA5;
				
			6:
				mxA_KUKA6;
			
		END_CASE
	
		//mxA_KUKA6; 
			
		
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
