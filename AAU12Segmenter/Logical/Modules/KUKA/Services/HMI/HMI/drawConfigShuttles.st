
ACTION drawConfigShuttles: 
	IF shuttleStartPosSvg OR init THEN
		IF i = 0 THEN
		showConfigShuttles := '';
		tmpString := showMotorSegments;
		brdkStrRemove(ADR(tmpString),-1,1);
		brdkStrCat(ADR(showConfigShuttles), ADR(tmpString));
		brdkStrCat(ADR(showConfigShuttles), ADR(','));
		END_IF
		
		brdkStrCat(ADR(showConfigShuttles), ADR('{"select":"#rect'));
		
		tmpString := USINT_TO_STRING(i+1);
		brdkStrCat(ADR(showConfigShuttles), ADR(tmpString));
		brdkStrCat(ADR(showConfigShuttles), ADR('","display":'));
		IF (nrOfShuttlesHMI >= (i+1)) THEN
			brdkStrCat(ADR(showConfigShuttles), ADR('true'));
		ELSE
			brdkStrCat(ADR(showConfigShuttles), ADR('false'));
		END_IF
		
		brdkStrCat(ADR(showConfigShuttles), ADR(',"translate":['));
		
		tmpCalc := (pShuttleStartupInfo.initXPos*1000)-60;
		tmpString := REAL_TO_STRING(tmpCalc);
		brdkStrCat(ADR(showConfigShuttles), ADR(tmpString));
		brdkStrCat(ADR(showConfigShuttles), ADR(','));
		
		tmpCalc := 1200 - (pShuttleStartupInfo.initYPos*1000) - 60;
		tmpString := REAL_TO_STRING(tmpCalc);
		brdkStrCat(ADR(showConfigShuttles), ADR(tmpString));
			
		IF i = NUM_SHUTTLES THEN
			brdkStrCat(ADR(showConfigShuttles), ADR(']}]'));
		ELSE
		brdkStrCat(ADR(showConfigShuttles), ADR(']},'));
		END_IF
	END_IF
	

	

END_ACTION
