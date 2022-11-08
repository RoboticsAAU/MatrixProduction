
ACTION RobotProgram: 
	
	//JointMovement;
	//LinearMovement;
	//ErrorMessage;
	
	IF robotOperating[i] THEN
		CASE pKuka.axisGroupIdx OF
			1:
				KUKABottomCover;
				
			2:
				//KUKADrilling;
				LinearMovement;
				
			3:
				KUKAPcb;
				
			4:
				KUKAFuse;
				
			5:
				KUKATopCover;
				
			6:
				KUKAUnloading;
				
		END_CASE
	END_IF
	
END_ACTION
