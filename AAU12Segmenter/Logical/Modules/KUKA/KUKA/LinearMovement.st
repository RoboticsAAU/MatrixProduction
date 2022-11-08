
ACTION LinearMovement:

	CASE pKuka.cm.state OF
	
		0:
			//Set frames as coordsys
			mxa_ValuesToCOORDSYS_0.Tool 	:= 1;
			mxa_ValuesToCOORDSYS_0.Base 	:= 1; 
			mxa_ValuesToCOORDSYS_0.IPO_Mode := 0;
			
			pKuka.cm.state := 10; 
			
		10: 
			coordSys := mxa_ValuesToCOORDSYS_0.COORDSYS;
			
			pKuka.motion.KRC_MoveLinearAbsolute.AxisGroupIdx 		:= pKuka.axisGroupIdx;
			pKuka.motion.KRC_MoveLinearAbsolute.KRC_AxisGroupRefArr	:= ADR(AxisRef);
			pKuka.motion.KRC_MoveLinearAbsolute.Velocity			:= 10;
			pKuka.motion.KRC_MoveLinearAbsolute.Acceleration  		:= 20;
			pKuka.motion.KRC_MoveLinearAbsolute.CoordinateSystem	:= coordSys;
			pKuka.motion.KRC_MoveLinearAbsolute.OriType 			:= 0;
			pKuka.motion.KRC_MoveLinearAbsolute.BufferMode			:= 2;
			
			pKuka.cm.state := 20;
			
		20:
			endPOS.X := 302; 
			endPOS.Y := -2; 
			endPOS.Z := 527; 
			endPOS.A := -178;
			endPOS.B := 26; 
			endPOS.C := -178; 
			endPOS.Status := 2; //010
			endPOS.Turn := 2; //000010
			
			pKuka.motion.KRC_MoveLinearAbsolute.Position		:= endPOS;

			pKuka.motion.KRC_MoveLinearAbsolute.ExecuteCmd 		:= TRUE;
			IF pKuka.motion.KRC_MoveLinearAbsolute.Done THEN 
				pKuka.motion.KRC_MoveLinearAbsolute.ExecuteCmd 	:= FALSE;
				pKuka.cm.state := 30; 
			END_IF
		
		30:
			endPOS.X := 430; 
			endPOS.Y := -2; 
			endPOS.Z := 527; 
			endPOS.A := -178;
			endPOS.B := 26; 
			endPOS.C := -178; 
			endPOS.Status := 2; //010
			endPOS.Turn := 2; //000010
			
			pKuka.motion.KRC_MoveLinearAbsolute.Position		:= endPOS;
			
			pKuka.motion.KRC_MoveLinearAbsolute.ExecuteCmd 		:= TRUE;
			IF pKuka.motion.KRC_MoveLinearAbsolute.Done THEN 
				pKuka.motion.KRC_MoveLinearAbsolute.ExecuteCmd 	:= FALSE;
				pKuka.cm.state 	:= 20; 
			END_IF
	
	END_CASE
	
	mxa_ValuesToCOORDSYS_0();
	pKuka.motion.KRC_MoveLinearAbsolute();
	
END_ACTION
