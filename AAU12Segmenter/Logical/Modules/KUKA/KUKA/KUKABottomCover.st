
ACTION KUKABottomCover: 
	
	CASE cm.state OF
		
		0: // Wait for "perform proccess" flag from shuttle
			
			
		10: // Perform movement 1
			
		20: // Perform movement 2
			
		30: // Perform movement n and set "process done" flag, allowing the shuttle to move
		
		40: // Move to appropriate start position (e.g. near fixtures) and set "workstation ready" flag
			
			cm.state := 0;
		
	END_CASE
		
	
	
END_ACTION
