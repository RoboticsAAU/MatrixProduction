
PROGRAM _INIT
	em.setup.name := 'Acopos6D';
	em.setup.parent.name := 'main';
	em();
	
	MC_BR_AsmGetInfo_Acp6D_0.Assembly			:= ADR(gAssembly6D_1);
	MC_BR_AsmGetShuttle_Acp6D_0.Assembly 		:= ADR(gAssembly6D_1);
	MC_BR_AsmReadStatus_Acp6D_0.Assembly 		:= ADR(gAssembly6D_1);
	MC_BR_AsmPowerOn_Acp6D_0.Assembly			:= ADR(gAssembly6D_1);
	MC_BR_AsmPowerOff_Acp6D_0.Assembly			:= ADR(gAssembly6D_1);
	MC_BR_AsmStop_Acp6D_0.Assembly				:= ADR(gAssembly6D_1);
	MC_BR_MoveInPlaneAsync_Acp6D_0.Assembly		:= ADR(gAssembly6D_1);
	MC_BR_ShGroupCreate_Acp6D_0.Assembly 		:= ADR(gAssembly6D_1);
	MC_BR_ShGroupCreate_Acp6D_1.Assembly 		:= ADR(gAssembly6D_1);
	MC_BR_ShGroupCreate_Acp6D_2.Assembly 		:= ADR(gAssembly6D_1);
	MC_BR_ShGroupCreate_Acp6D_3.Assembly 		:= ADR(gAssembly6D_1);
	MC_BR_ShGroupCreate_Acp6D_4.Assembly		:= ADR(gAssembly6D_1);
	MC_BR_MacroCreate_Acp6D_0.Assembly			:= ADR(gAssembly6D_1);
	MC_BR_AsmLevitation_Acp6D_0.Assembly		:= ADR(gAssembly6D_1);
	
	MC_BR_AsmReadStatus_Acp6D_0.Enable			:= TRUE;
	//MC_BR_AsmGetInfo_Acp6D_0.Execute := TRUE;
	 
	MC_BR_AsmReadStatus_Acp6D_0();
END_PROGRAM

PROGRAM _CYCLIC
	// Setup config parameters
	config;
	
	
	// IF 6D Controller goes into Error PackML State machine will follow
	IF MC_BR_AsmReadStatus_Acp6D_0.Valid AND MC_BR_AsmReadStatus_Acp6D_0.AssemblyErrorStop THEN
		em.cmd.abort := TRUE;
	END_IF
	
	CASE em.state OF
		STATE_STOPPED:
			em.description := 'Waiting for reset cmd';
			IF MC_BR_AsmReadStatus_Acp6D_0.AssemblyDisabled AND NOT MC_BR_AsmReadStatus_Acp6D_0.AssemblyErrorStop THEN
				em.cmd.sc := TRUE;
			ELSE
				em.cmd.sc := FALSE;
			END_IF
			
		STATE_RESETTING:
			CASE em.substate OF
				0:
					em.description := 'Reset all inputs';
					ResetInput;
					em.substate := 2;
					
				2:
					MC_BR_AsmGetInfo_Acp6D_0.Execute := TRUE;
					IF MC_BR_AsmGetInfo_Acp6D_0.Done THEN
						gAcp6DCtrl.Status.currentNumShuttles := MC_BR_AsmGetInfo_Acp6D_0.AssemblyInfo.NumberOfShuttles;
						localCurrentNumShuttles := gAcp6DCtrl.Status.currentNumShuttles;
						MC_BR_AsmGetInfo_Acp6D_0.Execute := FALSE;
						IF gAcp6DCtrl.Status.currentNumShuttles > 0 THEN
							em.substate := 5;
						ELSE
							em.cmd.abort := TRUE;
						END_IF
					END_IF
					
				5:
					em.description := 'Load shuttle IDs';
					MC_BR_AsmGetShuttle_Acp6D_0.Enable := TRUE;
					gAcp6DCtrl.Status.currentNumShuttles := MC_BR_AsmGetInfo_Acp6D_0.AssemblyInfo.NumberOfShuttles;
					IF MC_BR_AsmGetShuttle_Acp6D_0.Valid AND MC_BR_AsmGetShuttle_Acp6D_0.Busy THEN
						tempCounter := 0; 
						em.substate := 6;
					END_IF
					
				6:
					em.description := 'copy shuttle ref';
					MC_BR_AsmGetShuttle_Acp6D_0.Next := FALSE;
					gAcp6DCtrl.Status.ShuttleInfo[MC_BR_AsmGetShuttle_Acp6D_0.AdditionalInfo.ShuttleID-1].ID := MC_BR_AsmGetShuttle_Acp6D_0.AdditionalInfo.ShuttleID;
					gAcp6DCtrl.Status.ShuttleInfo[MC_BR_AsmGetShuttle_Acp6D_0.AdditionalInfo.ShuttleID-1].shuttleRef := MC_BR_AsmGetShuttle_Acp6D_0.Shuttle;
					IF MC_BR_AsmGetShuttle_Acp6D_0.RemainingCount = 0 THEN
						//MC_BR_AsmGetShuttle_Acp6D_0.Enable := FALSE;
						em.substate := 10;
					ELSE
						em.substate := 7;
					END_IF
					
				7:
					MC_BR_AsmGetShuttle_Acp6D_0.Next := TRUE;
					em.substate := 6;	
					
				10:
					em.description := 'Power on 6DController';
					IF MC_BR_AsmReadStatus_Acp6D_0.AssemblyReady THEN
						em.substate := 15;
					ELSE
						MC_BR_AsmPowerOn_Acp6D_0.Execute 			:= TRUE;
						IF(MC_BR_AsmPowerOn_Acp6D_0.Acknowledge AND MC_BR_AsmPowerOn_Acp6D_0.Done)THEN
							MC_BR_AsmPowerOn_Acp6D_0.Execute 		:= FALSE;
							em.substate  							:= 15;
						ELSIF(MC_BR_AsmPowerOn_Acp6D_0.Error)THEN
							MC_BR_AsmPowerOn_Acp6D_0.Execute 		:= FALSE;
							em.cmd.abort							:= TRUE;
						END_IF;
					END_IF
				
				15:
					em.description := 'Check Assembly Ready';
					IF MC_BR_AsmReadStatus_Acp6D_0.AssemblyReady THEN
						em.substate := 23;
						tempShuttleCnt := 0;
					ELSE
						em.substate := 10; //Sometimes AsmPowerOn dont power on the system
					END_IF				
					
				23:
					em.description := 'Break all shuttles';
					MC_BR_AsmStop_Acp6D_0.Execute := TRUE;
					IF MC_BR_AsmStop_Acp6D_0.Done THEN
						MC_BR_AsmStop_Acp6D_0.Execute := FALSE;
						em.substate := 25;
					END_IF
					
				25:
					em.description := 'Check all shuttles states';
					IF gAcp6DCtrl.Status.ShuttleInfo[tempShuttleCnt].State = mcACP6D_SH_STATE_IDLING THEN
						tempShuttleCnt := tempShuttleCnt + 1;
						em.substate := 27;
					ELSE
						em.substate := 15;
					END_IF
					
				27:
					em.description := 'all shuttles checked?';
					IF tempShuttleCnt > localCurrentNumShuttles-1 THEN
						em.substate := 40;
					ELSE
						em.substate := 25;
					END_IF						
					
				40:
					em.description := 'Check one shuttle to see if MoveInPlaceAsync is done';
					IF gAcp6DCtrl.Status.ShuttleInfo[0].State =  mcACP6D_SH_STATE_IDLING THEN
						em.substate := 90; //cant use Async when stereoType is defined
					END_IF
					
				90:
					shuttleGroups;
					macroCreatorAction;
					IF createShGroup = 100 AND macroCreater = 70 THEN
						em.substate := 100;
					END_IF	
					
				100:
					MC_BR_ShGroupGetInfo_Acp6D_0.ShuttleGroup := shGroupShuttle1_2;
					MC_BR_ShGroupGetInfo_Acp6D_0.Execute := TRUE;
					em.cmd.sc := TRUE;
			END_CASE
			
		STATE_STARTING:
			CASE em.substate OF
				0:
					FOR i := 0 TO NUM_SHUTTLES DO
						IF gAcp6DCtrl.Status.ShuttleInfo[i].State = mcACP6D_SH_STATE_IDLING OR gAcp6DCtrl.Status.ShuttleInfo[i].State = mcACP6D_SH_STATE_LANDED THEN
						ELSE
							EXIT;
						END_IF
					END_FOR
					IF i > NUM_SHUTTLES THEN
						em.substate := 2;
					END_IF
					
				2:
					em.description := 'Break all shuttles';
					MC_BR_AsmStop_Acp6D_0.Execute := TRUE;
					IF MC_BR_AsmStop_Acp6D_0.Done THEN
						MC_BR_AsmStop_Acp6D_0.Execute := FALSE;
						em.substate := 3;
					END_IF
					
				3:
					FOR i := 0 TO NUM_SHUTTLES DO
						IF gAcp6DCtrl.Status.ShuttleInfo[i].State = mcACP6D_SH_STATE_IDLING OR gAcp6DCtrl.Status.ShuttleInfo[i].State = mcACP6D_SH_STATE_LANDED THEN
						ELSE
							EXIT;
						END_IF
					END_FOR
					IF i > NUM_SHUTTLES THEN
						em.substate := 5;
					END_IF
					
				5:	
					em.description := 'Move to start pos';
					TON_watchdog.IN := FALSE; // Firmware bugfix
					TON_watchdog.PT := t#4s; // Firmware bugfix
					MC_BR_MoveInPlaneAsync_Acp6D_0.Parameters.Acceleration := gAcp6DCtrl.Par.Acceleration;
					MC_BR_MoveInPlaneAsync_Acp6D_0.Parameters.Velocity := gAcp6DCtrl.Par.Velocity;
					FOR i := 0 TO UINT_TO_USINT(localCurrentNumShuttles-1) DO
						MC_BR_MoveInPlaneAsync_Acp6D_0.Parameters.AsyncPar[i].Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[i].shuttleRef);
						MC_BR_MoveInPlaneAsync_Acp6D_0.Parameters.AsyncPar[i].X := shuttleStartupInfo[i].initXPos;
						MC_BR_MoveInPlaneAsync_Acp6D_0.Parameters.AsyncPar[i].Y := shuttleStartupInfo[i].initYPos;
					END_FOR
					MC_BR_MoveInPlaneAsync_Acp6D_0.Execute := TRUE;
					IF MC_BR_MoveInPlaneAsync_Acp6D_0.Done THEN
						MC_BR_MoveInPlaneAsync_Acp6D_0.Execute := FALSE;
						em.substate := 10;
					END_IF
					// Firmware bugfix - Sometimes MoveInPlaneAsync is stuck and will need a FB reset
//					IF MC_BR_MoveInPlaneAsync_Acp6D_0.Busy THEN
//						TON_watchdog.IN := TRUE;
//						IF TON_watchdog.Q THEN
//							MC_BR_MoveInPlaneAsync_Acp6D_0.Execute := FALSE;
//						END_IF
//					END_IF
					
				10:
					em.cmd.sc := TRUE;
			END_CASE			
			
		STATE_EXECUTE:
			em.description := 'Shuttle program with selected mode is running';
			gAcp6DCtrl.Status.Ready := TRUE;
			em.cmd.sc := TRUE;
			
			CASE em.substate OF
				0:
					CASE gAcp6DCtrl.Par.modeSelector OF
						weight: em.substate := 2000;
						linkMovement: em.substate := 3000;
						dialGauge: em.substate := 7000;
						workstationMovement: em.substate := 8000;
						conveyorStationMovement: em.substate := 9000;
						flaskProgram: em.substate := 12000;
						boxProgram: em.substate := 13000;
						rotationProgram: em.substate := 14000;
						steelSheet: em.substate := 15000;
						test: em.substate := 16000;
						smartLab: em.substate := 17000;
						
					END_CASE
						
				2000..2999:
					enableButtons := FALSE;
					em.cmd.sc := FALSE;
					em.description := 'Weight Program';
					
					FOR i := 0 TO NUM_SHUTTLES DO
						pShuttle ACCESS ADR(gShuttles[i]);
						cm ACCESS ADR (gShuttles[i].cm);
						pShuttle.cm.setup.parent.name := 'main';
						pShuttle.cm.setup.nameIdx := i;
						pShuttle.par.shuttleID := i;
						
						//Chosen action pr shuttle
						CASE i OF 
							0:weightProgram;
							3:MovementRx;
							2:MovementRy;
							1:MovementZ;
						END_CASE
					END_FOR
					em.cmd.sc := TRUE;
				
				3000..3999:
						em.description := 'linkMovement Program';
						
						linkMovementProgram;
						
				7000:
					em.description := 'dialGauge Program';
							
					FOR i := 0 TO NUM_SHUTTLES DO
						pShuttle ACCESS ADR(gShuttles[i]);
						cm ACCESS ADR (gShuttles[i].cm);
						pShuttle.cm.setup.parent.name := 'main';
						pShuttle.cm.setup.nameIdx := i;
						pShuttle.par.shuttleID := i;
						
						//Chosen action pr shuttle
						CASE i OF 
							6: BasicMoveDialGauge;
							1: MovementZ;
							2: MovementRx;
							3: MovementRy;
						END_CASE
					END_FOR
					em.cmd.sc := TRUE;
						
						
				8000..8005:
					workStationSetup;
					
				8006..8999:
					workStationSetup;
					em.description := 'intelligentMovement';
					FOR i := 0 TO NR_OF_WORKSTATIONS DO
							pWorkstation ACCESS ADR (gWorkstations[i]); 
							cm ACCESS ADR (gWorkstations[i].cm);
							pWorkstation.cm.setup.parent.name := 'main';
							//pShuttle.cm.setup.nameIdx := i;
							workStationMovement;
						END_FOR
						
				9000..9005:
					conveyorStationSetup;
				
				9006..9999:
					em.description := 'ConveyorMovement';
					
					conveyorStationSetup;
					FOR i := 0 TO NR_OF_WORKSTATIONS DO
						pWorkstation ACCESS ADR (gWorkstations[i]); 
						cm ACCESS ADR (gWorkstations[i].cm);
						pWorkstation.cm.setup.parent.name := 'main';
						//pShuttle.cm.setup.nameIdx := i;
						conveyourStationMovement;
					END_FOR
					
				12000..12019:
					em.description := 'Flask Program';
					flaskProgramTask;
						
					
				12020..12999:
						em.description := 'Flask Program';
						flaskProgramTask;
						FOR i := 0 TO NUM_SHUTTLES-1 DO
							pShuttle ACCESS ADR(gShuttles[i]);
							cm ACCESS ADR (gShuttles[i].cm);
							pShuttle.cm.setup.parent.name := 'main';
							pShuttle.cm.setup.nameIdx := i;
							pShuttle.par.shuttleID := i;
							
							//Chosen action pr shuttle
							CASE i OF 
								0:MovementRy;
								1:MovementZ;
								2:MovementRx;
							END_CASE
						END_FOR
					
				13000..13999:
					em.description := 'Box Program';
					boxProgramTask;
					
					
				14000..14049:
					em.description := 'Rotation program';
					em.cmd.sc := FALSE;
					rotationTask;
					
				14050..14999:
					em.description := 'Rotation program';
					em.cmd.sc := FALSE;
					FOR i := 0 TO NR_OF_WORKSTATIONS DO
						pWorkstation ACCESS ADR (gWorkstations[i]); 
						cm ACCESS ADR (gWorkstations[i].cm);
						pWorkstation.cm.setup.parent.name := 'main';
						rotationStation;
					END_FOR
					rotationTask; // Controls em.cmd.sc so the program can be stopped at the correct time.
					
				15000..15009:
					em.description := 'Steelsheet program';
					steelSheetTask;
					
				15010..15999:
					em.description := 'Steelsheet program';
					FOR i := 0 TO NR_OF_WORKSTATIONS DO
						pWorkstation ACCESS ADR (gWorkstations[i]); 
						cm ACCESS ADR (gWorkstations[i].cm);
						pWorkstation.cm.setup.parent.name := 'main';
						steelSheetStation;
					END_FOR
					
				16000..16009:
					em.description := 'Test program - Setup';
					testProgram;
					
				16010..16999:
					em.description := 'Test program - Movements';
					testProgram;
					FOR i := 0 TO NUM_SHUTTLES DO
						cm ACCESS ADR (gShuttles[i].cm);
						pShuttle ACCESS ADR(gShuttles[i]);
						pShuttle.cm.setup.parent.name := 'main';
						pShuttle.cm.setup.nameIdx := i;
						pShuttle.par.shuttleID := i;
						
						CASE i OF 
							0..3: testMovements;
						END_CASE
					END_FOR
				
					
					
				17000..17009:
					em.description := 'Smart Lab program - Setup';
					smartLabSetup;
					
					
				17010..17014:
					em.description := 'Smart Lab Program - Write order if it has been placed';
					// The user has requested an order which is added to the buffer
					IF executeOrder THEN
						
						TON_0.PT := REAL_TO_TIME(200);
						TON_0.IN := TRUE;
						IF TON_0.Q THEN
							TON_0.IN := FALSE;
							executeOrder := FALSE;
							
							// Write the order if the buffer is not full
							IF NOT bufferFull THEN
								writeOrder;
							END_IF
							
							em.substate := 17015;
						END_IF
					END_IF
					
				
				17015..17019:
					em.description := 'Smart Lab Program - Read order if the shuttles are ready to';
					// Read a new order if the entire other order has been initiated and the buffer is not empty
					IF remainingOrderAmount = 0 AND NOT bufferEmpty THEN
						readOrder;
						
						remainingOrderAmount := productOrder.amount;
						activeShuttles := activeShuttles + productOrder.amount;
					END_IF
					
					em.substate := 17020;
					
					
				17020..17999:
					em.description := 'Smart Lab program - Workstation movement';
					// Go through the workstations and run program for these
					FOR i := 0 TO (smartLabNumWorkstations - 1) DO
						pWorkstation ACCESS ADR (gWorkstations[i]); 
						cm ACCESS ADR (gWorkstations[i].cm);
						pWorkstation.cm.setup.parent.name := 'main';
						pWorkstation.par.workstationID := i;
						
						smartLabWorkstationOperation;
					END_FOR
					
					// Go through the shuttles and run program for these
					FOR i := 0 TO (smartLabNumShuttles - 1) DO
						pShuttle ACCESS ADR(gShuttles[i]);
						cm ACCESS ADR (gShuttles[i].cm);
						pShuttle.cm.setup.parent.name := 'main';
						pShuttle.par.shuttleID := i;
						
						pShuttlePlan ACCESS ADR(shuttlePlans[pShuttle.par.shuttleID]);
						pOrderHistory ACCESS ADR(orderHistory[pShuttlePlan.productOrder.ID]);
						
						IF pShuttlePlan.isActive THEN
							pOrderHistory.orderDuration := DT_TO_DINT(DTGetTime_0.DT1) - DT_TO_DINT(pOrderHistory.orderStartingTime);
						END_IF
						
						smartLabShuttleMovement;
						smartLabCameraProcess;
					END_FOR
					
					// Set the order and product history for the HMI
					HMIorderHistory := orderHistory[HMIorderID];
					HMIproductHistory := HMIorderHistory.product[HMIproductID];
					
					// Go to write order if a new order is made or there are no active orders
					IF executeOrder THEN
						em.substate := 17010;
					END_IF
				
			END_CASE
			
		STATE_STOPPING,STATE_ABORTING:
			ResetInput;
			em.description := 'Power off 6D System';
			CASE em.substate OF
				0:
					IF MC_BR_AsmReadStatus_Acp6D_0.AssemblyReady OR MC_BR_AsmReadStatus_Acp6D_0.AssemblyHoming THEN
						em.substate := 10;
					ELSE
						em.substate := 100;
					END_IF
						
				10:
					em.description := 'Break all shuttles and shut down the system';
					MC_BR_AsmPowerOff_Acp6D_0.Execute := TRUE;
					IF MC_BR_AsmPowerOff_Acp6D_0.Done THEN
						ResetInput; //Reset all FB
						createShGroup := 0;
						MC_BR_AsmPowerOff_Acp6D_0.Execute := FALSE;
						em.substate := 100;
					END_IF
					
				100:
					em.description := 'Check if system is off';
					createShGroup := 0;
					em.cmd.sc := TRUE;
			END_CASE
			
		STATE_COMPLETING:
			ResetInput;
			em.description := 'Break all shuttles and clear Motion Buffer';
			CASE em.substate OF
				0:
					em.description := 'Break all shuttles';
					MC_BR_AsmStop_Acp6D_0.Execute := TRUE;
					IF MC_BR_AsmStop_Acp6D_0.Done THEN
						MC_BR_AsmStop_Acp6D_0.Execute := FALSE;
						tempCounter := 0;
						em.substate := 5;
					END_IF
					
				5:
					FOR i := 0 TO NUM_SHUTTLES DO
						IF gAcp6DCtrl.Status.ShuttleInfo[i].State = mcACP6D_SH_STATE_IDLING OR gAcp6DCtrl.Status.ShuttleInfo[i].State = mcACP6D_SH_STATE_LANDED THEN
						ELSE
							EXIT;
						END_IF
					END_FOR
					IF i > NUM_SHUTTLES THEN
						em.substate := 10;
					END_IF
						
				10:
					em.description := 'Levitate if any shuttle is landed';
					MC_BR_AsmLevitation_Acp6D_0.Parameters.Speed := 5; //1-5
					MC_BR_AsmLevitation_Acp6D_0.Parameters.Level := 1;
					MC_BR_AsmLevitation_Acp6D_0.Execute := TRUE;
					IF MC_BR_AsmLevitation_Acp6D_0.Done THEN
						MC_BR_AsmLevitation_Acp6D_0.Execute := FALSE;
						em.substate := 100;
					END_IF
					IF MC_BR_AsmLevitation_Acp6D_0.Error THEN
						em.cmd.abort := TRUE;
					END_IF
					
				100:
					FOR i := 0 TO NUM_SHUTTLES DO
						IF gAcp6DCtrl.Status.ShuttleInfo[i].State = mcACP6D_SH_STATE_IDLING THEN
						ELSE
							EXIT;
						END_IF
					END_FOR
					IF i > NUM_SHUTTLES THEN
						em.substate := 110;
					END_IF
					
				110:
					ResetInput;
					em.cmd.reset := TRUE;
					em.cmd.sc := TRUE;
			END_CASE
			
		ELSE
			em.cmd.sc := TRUE;
	END_CASE
	
	//Shuttle pos update
	FOR i := 0 TO NUM_SHUTTLES DO
		// check there is a shuttle
		IF gAcp6DCtrl.Status.ShuttleInfo[i].shuttleRef.controlif > 0 THEN
			MC_BR_ShReadInfo_Acp6D_0[i].Shuttle := ADR(gAcp6DCtrl.Status.ShuttleInfo[i].shuttleRef);
			MC_BR_ShReadInfo_Acp6D_0[i].Enable := TRUE;
			gAcp6DCtrl.Status.ShuttleInfo[i].Position := MC_BR_ShReadInfo_Acp6D_0[i].ShuttleInfo.Position;
			gAcp6DCtrl.Status.ShuttleInfo[i].State := MC_BR_ShReadInfo_Acp6D_0[i].ShuttleInfo.State;
			MC_BR_ShReadInfo_Acp6D_0[i]();
			
			//Turn off system if shuttle is not detected (removed by hand)
			IF em.state = STATE_EXECUTE AND (MC_BR_ShReadInfo_Acp6D_0[i].ShuttleInfo.State = mcACP6D_SH_STATE_RESERVED OR MC_BR_ShReadInfo_Acp6D_0[i].ShuttleInfo.State = mcACP6D_SH_STATE_DISABLED) THEN
				em.cmd.abort := TRUE;
			END_IF
		END_IF
	END_FOR
	
	em();
	MC_BR_AsmGetShuttle_Acp6D_0();
	MC_BR_AsmReadStatus_Acp6D_0();
	MC_BR_AsmPowerOn_Acp6D_0();
	MC_BR_AsmPowerOff_Acp6D_0();
	MC_BR_AsmStop_Acp6D_0();
	MC_BR_AsmLevitation_Acp6D_0();
	MC_BR_MoveInPlaneAsync_Acp6D_0();
	MC_BR_ShLevitation_Acp6D_0();
	MC_BR_MoveInPlane_Acp6D_0();
	MC_BR_MoveArc_Acp6D_0();
	MC_BR_ShGroupCreate_Acp6D_0();
	MC_BR_ShGroupCreate_Acp6D_1();
	MC_BR_ShGroupCreate_Acp6D_2();
	MC_BR_ShGroupCreate_Acp6D_3();
	MC_BR_ShGroupCreate_Acp6D_4();
	MC_BR_ShGroupAddShuttle_Acp6D_0();
	MC_BR_ShGroupCoupleCtrl_Acp6D_0();
	MC_BR_ShGroupGetInfo_Acp6D_0();
	MC_BR_ShGetPayload_Acp6D_0();
	MC_BR_ReadCyclicPosition_Acp6D_0();
	MC_BR_ReadCyclicPosition_Acp6D_1();
	MC_BR_ReadCyclicPosition_Acp6D_2();
	MC_BR_ReadCyclicPosition_Acp6D_3();
	MC_BR_MacroCreate_Acp6D_0();				
	MC_BR_Move6D_Acp6D_0();
	MC_BR_MacroRun_Acp6D_0();					
	MC_BR_MacroSave_Acp6D_0();
	MC_BR_AsmGetInfo_Acp6D_0();
	MC_BR_RotaryMotionSpin_Acp6D_0();
	MC_BR_RotaryMotion_Acp6D_0();
	TON_watchdog();
	TON_0();
	DTGetTime_0();
	
END_PROGRAM

PROGRAM _EXIT
	(* Insert code here *)
	 
END_PROGRAM

