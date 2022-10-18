
ACTION mxA_BottomCover: 
	position1.A1 := 0;
	position1.A2 := -90;
	position1.A3 := 90;
	position1.A4 := 0;
	position1.A5 := 90;
	position1.A6 := 0;	
	KRC_MoveAxisAbsolute_0.AxisGroupIdx := 1;
	KRC_MoveAxisAbsolute_0.ExecuteCmd 	:= TRUE;
	KRC_MoveAxisAbsolute_0.AxisPosition := position1;
	KRC_MoveAxisAbsolute_0.Velocity 	:= 10;
	KRC_MoveAxisAbsolute_0.Acceleration := 20;
	
	(*KRC_MoveAxisAbsolute_0();*)
END_ACTION
