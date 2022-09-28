
ACTION drawShuttles:
	IF i = 0 THEN
		showShuttles := '';
		tmpString := showMotorSegments;
		brdkStrRemove(ADR(tmpString),-1,1);
		brdkStrCat(ADR(showShuttles), ADR(tmpString));
		brdkStrCat(ADR(showShuttles), ADR(','));
	END_IF
	
	brdkStrCat(ADR(showShuttles), ADR('{"select":"#rect'));

	
	tmpString := USINT_TO_STRING(i+1);
	brdkStrCat(ADR(showShuttles), ADR(tmpString));
	brdkStrCat(ADR(showShuttles), ADR('","display":'));
	IF (nrOfShuttlesHMI >= (i+1)) THEN
		brdkStrCat(ADR(showShuttles), ADR('true'));
	ELSE
		brdkStrCat(ADR(showShuttles), ADR('false'));
	END_IF
	
	IF pShuttleInfo.State = mcACP6D_SH_STATE_DISABLED THEN
		brdkStrCat(ADR(showShuttles), ADR(',"fill":3'));
	ELSE
		brdkStrCat(ADR(showShuttles), ADR(',"fill":4'));
	END_IF
	
	IF pShuttleInfo.State = mcACP6D_SH_STATE_LANDED THEN
		brdkStrCat(ADR(showShuttles), ADR(',"fill":2'));
	ELSE
		brdkStrCat(ADR(showShuttles), ADR(',"fill":4'));
	END_IF
		
	brdkStrCat(ADR(showShuttles), ADR(',"translate":['));
	
	tmpCalc := (pShuttleInfo.Position.X*1000)-60;
	tmpString := REAL_TO_STRING(tmpCalc);
	brdkStrCat(ADR(showShuttles), ADR(tmpString));
	brdkStrCat(ADR(showShuttles), ADR(','));
	
	tmpCalc := 1200 - (pShuttleInfo.Position.Y*1000) - 60;
	tmpString := REAL_TO_STRING(tmpCalc);
	brdkStrCat(ADR(showShuttles), ADR(tmpString));
		
	IF i = NUM_SHUTTLES THEN
		brdkStrCat(ADR(showShuttles), ADR(']}]'));
	ELSE
		brdkStrCat(ADR(showShuttles), ADR(']},'));
	END_IF

	sizeOfArray := brdkStrLen(ADR(showShuttles));
	

	
	//showShuttles := '';
	//showShuttles := '[{"select":"#rect1","display":false, "translate":[100,100]}]';
END_ACTION
