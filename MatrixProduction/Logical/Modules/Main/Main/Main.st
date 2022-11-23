
PROGRAM _INIT
	em.setup.name := 'main';
	em();
	
	MC_BR_AsmReboot_Acp6D_0.Assembly 		:= ADR(gAssembly6D_1); 
	MC_BR_AsmHalt_Acp6D_0.Assembly			:= ADR(gAssembly6D_1);
	
	FBin;
	FBout;
	 
END_PROGRAM

PROGRAM _CYCLIC
	
	IF gMain.cmd.restartCtrl THEN
		MC_BR_AsmReboot_Acp6D_0.Execute := TRUE;
		IF MC_BR_AsmReboot_Acp6D_0.Acknowledge OR MC_BR_AsmReboot_Acp6D_0.Error THEN
			SYSreset(TRUE, 1);
		END_IF
	END_IF
	
	// Statuslight
	gMain.status.powerOff := gMain.status.powerOn := gMain.status.running := gMain.status.error := 0;
	gAcp6DCtrl.Par.modeSelector := modeSelector;
	
	CASE em.state OF
		STATE_STOPPED:
			gMain.status.powerOff := 1;
			IF gMain.cmd.start THEN
				gMain.cmd.start := FALSE;
				em.cmd.reset := TRUE;
				em.cmd.sc := TRUE;
			END_IF
			
		STATE_RESETTING:
			gMain.status.powerOn := 1;
			em.description := 'wait for sytem to reset variables';
			gMain.status.powerOn := 1;
			em.cmd.sc := TRUE;

		STATE_IDLE:
			gMain.status.powerOn := 1;
			em.description := 'wait for start cmd';
			TON_0.PT := t#500ms;
			TON_0.IN := TRUE;
			IF TON_0.Q THEN
				TON_0.IN := FALSE;
				em.cmd.sc := TRUE;
				em.cmd.start := TRUE;
			END_IF
			
			
		STATE_STARTING:
			gMain.status.powerOn := 1;
			em.description :='Wait for system to power on';
			em.cmd.sc := TRUE;
			
			
		STATE_EXECUTE:
			// New mode has been selected while old program is running.
			IF em.cmd.sc AND gAcp6DCtrl.Par.modeSelector <> modeSelectorOldValue THEN
				em.cmd.complete := TRUE;
			END_IF
			
			modeSelectorOldValue := gAcp6DCtrl.Par.modeSelector;
			gMain.status.running := 1;
			IF gMain.cmd.pause THEN
				gMain.cmd.pause := FALSE;
				em.cmd.hold := TRUE;
			END_IF
			
			IF gMain.cmd.stop THEN
				gMain.cmd.stop := FALSE;
				em.cmd.stop := TRUE;
			END_IF			
			em.cmd.sc := TRUE;
			
		STATE_HOLDING:
			MC_BR_AsmHalt_Acp6D_0.Option := mcACP6D_HALT;
			MC_BR_AsmHalt_Acp6D_0.Execute := TRUE;
			IF MC_BR_AsmHalt_Acp6D_0.Done THEN
				MC_BR_AsmHalt_Acp6D_0.Execute := FALSE;
				em.cmd.sc := TRUE;
			END_IF
			
		STATE_HELD:
			IF gMain.cmd.start THEN
				gMain.cmd.start := FALSE;
				em.cmd.sc		:= TRUE;
				em.cmd.start	:= TRUE;
			END_IF
			
		STATE_UNHOLDING:
			MC_BR_AsmHalt_Acp6D_0.Option := mcACP6D_CONTINUE;
			MC_BR_AsmHalt_Acp6D_0.Execute := TRUE;
			IF MC_BR_AsmHalt_Acp6D_0.Done THEN
				MC_BR_AsmHalt_Acp6D_0.Execute := FALSE;
				em.cmd.sc := TRUE;
			END_IF
			
		STATE_STOPPING:
			gMain.status.powerOff 								:= 1;
			em.cmd.sc											:= TRUE;
			
		STATE_ABORTED:
			gMain.status.error := 1;
			//gAcp6DCtrl.Cmd.PowerOff								:= TRUE;
			IF gMain.cmd.reset THEN
				gMain.cmd.reset									:= FALSE;
				em.cmd.clear									:= TRUE;
			END_IF
			em.cmd.sc											:= TRUE;
			
		STATE_CLEARING:
			gMain.cmd.start := FALSE;
			gMain.cmd.pause := FALSE;
			em.cmd.sc := TRUE;
			
		STATE_COMPLETE:
			em.cmd.reset := TRUE;
			em.cmd.sc := TRUE;

			
			
		ELSE
			em.cmd.sc := TRUE;
	END_CASE
	em();
	TON_0();
	MC_BR_MoveInPlane_Acp6D_0();
	MC_BR_AsmHalt_Acp6D_0();
	MC_BR_AsmReboot_Acp6D_0();
	
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM

