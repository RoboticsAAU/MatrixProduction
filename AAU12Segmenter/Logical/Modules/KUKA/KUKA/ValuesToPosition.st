// DEFAULT is 0, -120, 120, 0, 90, 0 in joint angles (without tool - remember to add tool for nice configuration)

// DEFAULT is with reference to WORLD frame
// APPROACH_MAGAZINE is with reference to its own magazine frame
// APPROACH_WORKSTATION is with reference to ACOPOS6D frame

FUNCTION_BLOCK ValuesToPosition
	CASE axisGroupIdx OF
		///////////////// ROBOT 1 /////////////////
		1:
			CASE posType OF
				DEFAULT:
					outputPos.X := 915;
					outputPos.Y := 120;
					outputPos.Z := 536.147;
					outputPos.A := 0;
					outputPos.B := 0;
					outputPos.C := 180;
					outputPos.Status := 6; // 110
					outputPos.Turn := 2; // 000010
					
				APPROACH_MAGAZINE:
				
				APPROACH_WORKSTATION:
					outputPos.X := 660;
					outputPos.Y := 60;
					outputPos.Z := 116.5; // Remember to change
					outputPos.A := 0;
					outputPos.B := 0;
					outputPos.C := 180;
					outputPos.Status := 6; // 110
					outputPos.Turn := 2; // 000010
				
			END_CASE
			
			// From world to base (only temporary)
			outputPos.X := 1080 - outputPos.X;
			outputPos.Y := 120 - outputPos.Y;
			outputPos.Z := outputPos.Z - 10;
			outputPos.A := outputPos.A - 180;
		///////////////////////////////////////////
		
		
		///////////////// ROBOT 2 /////////////////
		2:
			CASE posType OF
				DEFAULT:
					outputPos.X := 930;
					outputPos.Y := 840;
					outputPos.Z := 525.167;
					outputPos.A := 0;
					outputPos.B := 0;
					outputPos.C := 180;
					outputPos.Status := 6; // 110
					outputPos.Turn := 2; // 000010
				
				//APPROACH_MAGAZINE:
				
				APPROACH_WORKSTATION:
					outputPos.X := 660;
					outputPos.Y := 420;
					outputPos.Z := 116.5; // Remember to change
					outputPos.A := 0;
					outputPos.B := 0;
					outputPos.C := 180;
					outputPos.Status := 6; // 110
					outputPos.Turn := 35; // 100011
				
			END_CASE
			
			// From world to base (only temporary)
			outputPos.X := 1080 - outputPos.X;
			outputPos.Y := 840 - outputPos.Y;
			outputPos.Z := outputPos.Z - 10;
			outputPos.A := outputPos.A - 180;
		///////////////////////////////////////////
		
		
		///////////////// ROBOT 3 /////////////////
		3:
			CASE posType OF
				DEFAULT:
					outputPos.X := 930;
					outputPos.Y := 1320;
					outputPos.Z := 525.167;
					outputPos.A := 0;
					outputPos.B := 0;
					outputPos.C := 180;
					outputPos.Status := 6; // 110
					outputPos.Turn := 2; // 000010
				
				APPROACH_MAGAZINE:
				
				APPROACH_WORKSTATION:
					outputPos.X := 660;
					outputPos.Y := 780;
					outputPos.Z := 116.5; // Remember to change
					outputPos.A := 0;
					outputPos.B := 0;
					outputPos.C := 180;
					outputPos.Status := 6; // 110
					outputPos.Turn := 35; // 100011
				
			END_CASE
			
			// From world to base (only temporary)
			outputPos.X := 1080 - outputPos.X;
			outputPos.Y := 1320 - outputPos.Y;
			outputPos.Z := outputPos.Z - 10;
			outputPos.A := outputPos.A - 180;
		///////////////////////////////////////////
		
		
		///////////////// ROBOT 4 /////////////////
		4:
			CASE posType OF
				DEFAULT:
					outputPos.X := 270;
					outputPos.Y := 1320;
					outputPos.Z := 525.167;
					outputPos.A := -180;
					outputPos.B := 0;
					outputPos.C := 180;
					outputPos.Status := 6; // 110
					outputPos.Turn := 2; // 000010
				
				APPROACH_MAGAZINE:
				
				APPROACH_WORKSTATION:
					outputPos.X := 60;
					outputPos.Y := 780;
					outputPos.Z := 116.5; // Remember to change
					outputPos.A := -180;
					outputPos.B := 0;
					outputPos.C := 180;
					outputPos.Status := 6; // 110
					outputPos.Turn := 2; // 000010
				
			END_CASE
			
			// From world to base (only temporary)
			outputPos.X := outputPos.X - 120;
			outputPos.Y := outputPos.Y - 1320;
			outputPos.Z := outputPos.Z - 10;
		///////////////////////////////////////////
		
		
		///////////////// ROBOT 5 /////////////////
		5:
			CASE posType OF
				DEFAULT:
					outputPos.X := 270;
					outputPos.Y := 840;
					outputPos.Z := 525.167;
					outputPos.A := -180;
					outputPos.B := 0;
					outputPos.C := 180;
					outputPos.Status := 6; // 110
					outputPos.Turn := 2; // 000010
				
				APPROACH_MAGAZINE:
				
				APPROACH_WORKSTATION:
					outputPos.X := 60;
					outputPos.Y := 420;
					outputPos.Z := 116.5; // Remember to change
					outputPos.A := -180;
					outputPos.B := 0;
					outputPos.C := 180;
					outputPos.Status := 6; // 110
					outputPos.Turn := 2; // 000010
				
			END_CASE
			
			// From world to base (only temporary)
			outputPos.X := outputPos.X - 120;
			outputPos.Y := outputPos.Y - 840;
			outputPos.Z := outputPos.Z - 10;
		///////////////////////////////////////////
		
		
		///////////////// ROBOT 6 /////////////////
		6:
			CASE posType OF
				DEFAULT:
					outputPos.X := 285;
					outputPos.Y := 120;
					outputPos.Z := 536.147;
					outputPos.A := -180;
					outputPos.B := 0;
					outputPos.C := 180;
					outputPos.Status := 6; // 110
					outputPos.Turn := 2; // 000010
				
				APPROACH_MAGAZINE:
				
				APPROACH_WORKSTATION:
					outputPos.X := 60;
					outputPos.Y := 60;
					outputPos.Z := 116.5; // Remember to change
					outputPos.A := -180;
					outputPos.B := 0;
					outputPos.C := 180;
					outputPos.Status := 6; // 110
					outputPos.Turn := 35; // 100011
				
			END_CASE
			
			// From world to base (only temporary)
			outputPos.X := outputPos.X - 120;
			outputPos.Y := outputPos.Y - 120;
			outputPos.Z := outputPos.Z - 10;
		///////////////////////////////////////////
		
		
	END_CASE
	
END_FUNCTION_BLOCK
