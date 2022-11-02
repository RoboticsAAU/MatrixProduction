
ACTION mxA_KUKA1: 
	
	CASE cm.state OF
		0: // Wait for the robot to be ready
			IF 	pKuka.status.P_ AND pKuka.status.S_ AND pKuka.status.R_ AND pKuka.status.I_ AND pKuka.status.EXT_ THEN			
				pKuka.cm.state := 10;		
			END_IF
		
		10: // Wait for "perform proccess" flag from shuttle
		
		20: // Perform movement 1
			
		30: // Perform movement 2
			
		40: // Perform movement n and set "process done" flag, allowing the shuttle to move
		
		50: // Move to appropriate start position (e.g. near fixtures) and set "workstation ready" flag
			cm.state := 10;
		
	END_CASE
		
	
END_ACTION
