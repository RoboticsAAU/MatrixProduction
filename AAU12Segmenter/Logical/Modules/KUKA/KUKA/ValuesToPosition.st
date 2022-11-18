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
					outputPos.Status := 2; // 010
					outputPos.Turn := 2; // 000010
					
					baseNo := 0;
					
				APPROACH_MAGAZINE: 
					outputPos.X := 200.000;
					outputPos.Y := 203.066;
					outputPos.Z := 157.556;
					outputPos.A := 0;
					outputPos.B := 0;
					outputPos.C := 135;
					outputPos.Status := 2; // 010 Third bit is different from manual
					outputPos.Turn := 10; // 001010
				
					baseNo := 2;
					
				APPROACH_WORKSTATION:
					outputPos.X := 660;
					outputPos.Y := 60;
					outputPos.Z := (1 + 9.85 + 5) + relativeDistance + 2; 
					outputPos.A := 0;
					outputPos.B := 0;
					outputPos.C := 180;
					outputPos.Status := 2; // 010
					outputPos.Turn := 2; // 000010
				
					baseNo := 1;
				
			END_CASE
			

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
					outputPos.Status := 2; // 010
					outputPos.Turn := 2; // 000010
					
					baseNo := 0;
				
				APPROACH_WORKSTATION:
					outputPos.X := 660 + 27; //Last term is x offset of bottom right hole
					outputPos.Y := 420 - 53; //Last term is y offset of bottom right hole
					outputPos.Z := (1 + 9.85 + 5 + 13) + relativeDistance + 100; // Remember to change 
					outputPos.A := 0;
					outputPos.B := 0;
					outputPos.C := 180;
					outputPos.Status := 2; // 010
					outputPos.Turn := 35; // 100011
					
					baseNo := 1;	
				
			END_CASE
			

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
					outputPos.Status := 2; // 010
					outputPos.Turn := 2; // 000010
					
					baseNo := 0;
				
				APPROACH_MAGAZINE: 
					outputPos.X := 152.740;
					outputPos.Y := 219.477;
					outputPos.Z := 148.927; 
					outputPos.A := -90.000;
					outputPos.B := -45.000;
					outputPos.C := -180.000;
					outputPos.Status := 2; // 010
					outputPos.Turn := 3; // 000011
					
					baseNo := 2;
				
				APPROACH_WORKSTATION:
					outputPos.X := 660; 
					outputPos.Y := 780 + 32.79; // 32.79 represents shift from center to fuse bracket 
					outputPos.Z := (1 + 9.85 + 5 + 6.7 + 1.5 + 2) + relativeDistance + 2; 
					outputPos.A := 0;
					outputPos.B := 0;
					outputPos.C := 180;
					outputPos.Status := 2; // 010
					outputPos.Turn := 35; // 100011
				
					baseNo := 1;
					
			END_CASE
						
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
					outputPos.Status := 2; // 010
					outputPos.Turn := 2; // 000010
					
					baseNo := 0;
				
				APPROACH_MAGAZINE:
					outputPos.X := 120;
					outputPos.Y := 250.263;
					outputPos.Z := 196.383;
					outputPos.A := 0;
					outputPos.B := 0;
					outputPos.C := 135;
					outputPos.Status := 2; // 010
					outputPos.Turn := 10; // 001010
					
					baseNo := 2;
				
				APPROACH_WORKSTATION:
					outputPos.X := 60;
					outputPos.Y := 780;
					outputPos.Z := (1 + 9.85 + 5 + 6.7 + 1.5 + 2 + 0.5) + relativeDistance + 2;
					outputPos.A := -180;
					outputPos.B := 0;
					outputPos.C := 180;
					outputPos.Status := 2; // 010
					outputPos.Turn := 2; // 000010
				
					baseNo := 1;
				
			END_CASE
		
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
					outputPos.Status := 2; // 010
					outputPos.Turn := 2; // 000010
					
					baseNo := 0;
				
				APPROACH_MAGAZINE: 
					outputPos.X := 40;
					outputPos.Y := 203.067;
					outputPos.Z := 157.557;
					outputPos.A := 0;
					outputPos.B := 0;
					outputPos.C := 135;
					outputPos.Status := 2; // 010
					outputPos.Turn := 2; // 000010
					
					baseNo := 2;
				
				APPROACH_WORKSTATION:
					outputPos.X := 60;
					outputPos.Y := 420;
					outputPos.Z := (1 + 9.85 + 5 + 13) + relativeDistance;
					outputPos.A := -180;
					outputPos.B := 0;
					outputPos.C := 180;
					outputPos.Status := 2; // 010
					outputPos.Turn := 2; // 000010
				
					baseNo := 1;
				
			END_CASE

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
					outputPos.Status := 2; // 010
					outputPos.Turn := 2; // 000010
					
					baseNo := 0;
				
				APPROACH_MAGAZINE:
					outputPos.X := -60;
					outputPos.Y := 160;
					outputPos.Z := 290;
					outputPos.A := -180;
					outputPos.B := 0;
					outputPos.C := 180;
					outputPos.Status := 2; // 010
					outputPos.Turn := 35; // 100011
					
					baseNo := 2;
				
				APPROACH_WORKSTATION:
					outputPos.X := 60;
					outputPos.Y := 60;
					outputPos.Z := (1 + 9.85 + 5) + relativeDistance + 2; 
					outputPos.A := -180;
					outputPos.B := 0;
					outputPos.C := 180;
					outputPos.Status := 2; // 010
					outputPos.Turn := 35; // 100011
				
					baseNo := 1;
				
			END_CASE
		
	END_CASE
	
	ValuesToCorrection_0.baseNo := baseNo;
	ValuesToCorrection_0.robotIdx := axisGroupIdx;
	ValuesToCorrection_0();
	
	outputPos.X := outputPos.X + ValuesToCorrection_0.posCorrections.X;
	outputPos.Y := outputPos.Y + ValuesToCorrection_0.posCorrections.Y;
	outputPos.Z := outputPos.Z + ValuesToCorrection_0.posCorrections.Z;
	outputPos.A := outputPos.A + ValuesToCorrection_0.posCorrections.A;
	outputPos.B := outputPos.B + ValuesToCorrection_0.posCorrections.B;
	outputPos.C := outputPos.C + ValuesToCorrection_0.posCorrections.C;
	
END_FUNCTION_BLOCK
