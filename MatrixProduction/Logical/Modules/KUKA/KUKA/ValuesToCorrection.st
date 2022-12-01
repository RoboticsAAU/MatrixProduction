
(* TODO: Add your comment here *)
FUNCTION_BLOCK ValuesToCorrection
	
	posCorrections.X := 0;
	posCorrections.Y := 0;
	posCorrections.Z := 0;
	posCorrections.A := 0;
	posCorrections.B := 0;
	posCorrections.C := 0;
	
	CASE robotIdx OF
	
		1:	
			CASE baseNo OF
				1: // w.r.t acopos frame
					posCorrections.Y := 1.4;
					
				2: // w.r.t magazine frame
					posCorrections.X := -4;
					posCorrections.Y := 2;
					posCorrections.Z := 2;
			END_CASE
		
		2:
			CASE baseNo OF
				1: // w.r.t acopos frame
					posCorrections.X := -0.1;
					posCorrections.Z := -2.6;
				
			END_CASE
			
		3:
			CASE baseNo OF					
				1: // w.r.t acopos frame
					posCorrections.X := 2;
					posCorrections.Y := -0.2;
					
				2: // w.r.t magazine frame
					posCorrections.X := 1;
					posCorrections.Y := 0.5;
					posCorrections.Z := -0.5;
			END_CASE
		
		4:
			CASE baseNo OF
				1: // w.r.t acopos frame
					posCorrections.X := -1;
					posCorrections.Y := -0.3;
					posCorrections.Z := 1;
					
				2: // w.r.t magazine frame
					posCorrections.X := 0.85;
					posCorrections.Y := 1;
					posCorrections.Z := 5;
			
			END_CASE
		
		5:
			CASE baseNo OF
				1: // w.r.t acopos frame
					posCorrections.X := -0.5;
					posCorrections.Y := 3;
					posCorrections.Z := -6;
					
				2: // w.r.t magazine frame
					posCorrections.X := 2;
					posCorrections.Y := -5.5;
					posCorrections.Z := 8.5;
			
			END_CASE
		
		6:
		
	END_CASE
	
END_FUNCTION_BLOCK
