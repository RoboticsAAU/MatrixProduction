
(* TODO: Add your comment here *)
FUNCTION_BLOCK ValuesToMagazineFrame
	
	outputFrame.X := 0;
	outputFrame.Y := 0;
	outputFrame.Z := 0;
	outputFrame.A := 0;
	outputFrame.B := 0;
	outputFrame.C := 0;
	
	CASE axisGroupIdx OF
		1: // Bottom cover magazine frame
			outputFrame.X := 1200;
			outputFrame.Y := 360;
			outputFrame.Z := 0;
			outputFrame.A := 90;
			outputFrame.B := 0;
			outputFrame.C := 0;
		
		2: // DRILLING HAS NO MAGAZINE
			
		3: // PCB magazine frame
			outputFrame.X := 840;
			outputFrame.Y := 1440;
			outputFrame.Z := 0;
			outputFrame.A := 180;
			outputFrame.B := 0;
			outputFrame.C := 0;
		
		4: // Fuse magazine frame
			outputFrame.X := 600;
			outputFrame.Y := 1440;
			outputFrame.Z := 0;
			outputFrame.A := 180;
			outputFrame.B := 0;
			outputFrame.C := 0;
		
		5: // Top cover magazine frame
			outputFrame.X := 0;
			outputFrame.Y := 600;
			outputFrame.Z := 0;
			outputFrame.A := -90;
			outputFrame.B := 0;
			outputFrame.C := 0;
		
		6: // Unloading frame
			outputFrame.X := 360;
			outputFrame.Y := 0;
			outputFrame.Z := 0;
			outputFrame.A := 0;
			outputFrame.B := 0;
			outputFrame.C := 0;
		
	END_CASE
	
END_FUNCTION_BLOCK
