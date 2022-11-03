
ACTION drawMotorSegments: 
	//manual shuttle config

	
	IF showTyleSvg OR init THEN
		IF i = 0 THEN
			showMotorSegments := '';
			brdkStrCat(ADR(showMotorSegments), ADR('[{"select":"#MS'));
		ELSE
			brdkStrCat(ADR(showMotorSegments), ADR('{"select":"#MS'));
		END_IF
		
		tmpString := USINT_TO_STRING(i+1);
		brdkStrCat(ADR(showMotorSegments), ADR(tmpString));
		brdkStrCat(ADR(showMotorSegments), ADR('","display":'));
		IF pSegments.visible THEN
			brdkStrCat(ADR(showMotorSegments), ADR('true'));
		ELSE
			brdkStrCat(ADR(showMotorSegments), ADR('false'));
		END_IF
		
		IF i = NR_OF_SEGMENTS THEN
			brdkStrCat(ADR(showMotorSegments), ADR('}]'));
		ELSE
			brdkStrCat(ADR(showMotorSegments), ADR('},'));
		END_IF
	END_IF
	
END_ACTION
