
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
			
		2:
		
		3:
			CASE baseNo OF
				0: // w.r.t world frame
					
				1: // w.r.t acopos frame
					posCorrections.X := 2;
					posCorrections.Y := 0.5;
				2: // w.r.t magazine frame
					posCorrections.X := 1;
					posCorrections.Y := 0.5;
					posCorrections.Z := -0.5;
			END_CASE
		
		4:
		
		5:
		
		6:
		
	END_CASE
	
END_FUNCTION_BLOCK
