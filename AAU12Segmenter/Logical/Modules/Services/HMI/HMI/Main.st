
PROGRAM _INIT
	init := TRUE;
	
	FOR i := 0 TO NR_OF_SEGMENTS DO
		gSegments[i].ID := USINT_TO_STRING(i+1);
		CASE i OF
			0:	gSegments[i].visible := TRUE;
			1:	gSegments[i].visible := FALSE;
			5:	gSegments[i].visible := TRUE;
			6:	gSegments[i].visible := FALSE;
			ELSE
				gSegments[i].visible := FALSE;
		END_CASE
		
	END_FOR
	 
END_PROGRAM

PROGRAM _CYCLIC
	IF currentHMIPage = 'page_digitalTwin' OR init THEN
		// draw Shuttles 
		FOR i := 0 TO NUM_SHUTTLES DO
			pShuttleInfo ACCESS ADR(gAcp6DCtrl.Status.ShuttleInfo[i]);
			drawShuttles;
			pShuttleStartupInfo ACCESS ADR(shuttleStartupInfo[i]);
			drawConfigShuttles;
		END_FOR
	
		// draw Motor Segments;
		FOR i := 0 TO NR_OF_SEGMENTS DO
			pSegments ACCESS ADR(gSegments[i]);
			drawMotorSegments;
		END_FOR
	
		// Reset segment Layout
		IF resetMotorSegmentLayoutCmd THEN
			resetMotorSegmentLayoutCmd := FALSE;
			FOR i := 0 TO NR_OF_SEGMENTS DO
				gSegments[i].visible := TRUE;
			END_FOR
		END_IF
	
		// Reset Shuttle Startup Layout
		IF resetShuttleInitLayoutCmd THEN
			resetShuttleInitLayoutCmd := FALSE;
			FOR i := 0 TO NUM_SHUTTLES DO
				shuttleStartupInfo[i].initXPos := 0.42+0.12*(i);
				shuttleStartupInfo[i].initYPos := 0.060;
			END_FOR
		END_IF	
	
		// Handle tyle click configuration
		IF this.tableConfigClick THEN
			this.tableConfigClick := FALSE;
			brdkStrRemove(ADR(this.tableConfigString),0,3);
			tmpString := this.tableConfigString;
			this.tableConfigID := STRING_TO_USINT(tmpString);
			this.tableConfigID := this.tableConfigID - 1;
			IF gSegments[this.tableConfigID].visible THEN
				gSegments[this.tableConfigID].visible := FALSE;
			ELSE
				gSegments[this.tableConfigID].visible := TRUE;
			END_IF
		END_IF
	
		// Handle different svg views on config page
		IF showConfigSvgCmd THEN
			showConfigSvgCmd := FALSE;
			showConfigSvg := TRUE;
			showTyleSvg := FALSE;
			shuttleStartPosSvg := FALSE;
		END_IF
	
		// Handle different svg views on config page
		IF showTyleSvgCmd THEN
			showTyleSvgCmd := FALSE;
			showTyleSvg := TRUE;
			showConfigSvg := FALSE;
			shuttleStartPosSvg := FALSE;
		END_IF
	
		// Handle different svg views on config page
		IF shuttleStartPosSvgCmd THEN
			shuttleStartPosSvgCmd := FALSE;
			showTyleSvg := FALSE;
			showConfigSvg := FALSE;
			shuttleStartPosSvg := TRUE;
		END_IF
	END_IF

	init := FALSE;
	
	lightOutputs[0] := FALSE;
	lightOutputs[1] := FALSE;
	lightOutputs[2] := FALSE;
	lightOutputs[3] := FALSE;
	lightOutputs[4] := FALSE;
	lightOutputs[5] := FALSE;
	
	
	
	IF lightValue <> lightValueOld  THEN
		lightTON.PT := t#500ms;
		lightTON.IN := TRUE;
		lightOutputs[0] := lightValue.0;
		lightOutputs[1] := lightValue.1;
		lightOutputs[2] := lightValue.2;
		lightOutputs[3] := lightValue.3;
		lightOutputs[4] := lightValue.4;
		lightOutputs[5] := lightValue.5;
		IF lightTON.Q THEN
			lightValueOld := lightValue;
			lightTON.IN := FALSE;
		END_IF
	END_IF
	
	lightTON();
	 
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM

