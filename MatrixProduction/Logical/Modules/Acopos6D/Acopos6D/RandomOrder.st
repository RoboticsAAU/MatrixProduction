
FUNCTION_BLOCK RandomOrderGeneration
	
	// Access the adress of the inserted order
	tempRefOrder ACCESS ADR(refOrder);
	
	IF opt_randOrderAmount <> 0 THEN
		// Set amount to random number between 1 and 10
		tempRefOrder.amount := UDINT_TO_USINT(rand_interval(1 , 10));
		opt_randOrderAmount := 0;
	END_IF
	
	// Set bottom cover to random number between 1 and 3
	tempRefOrder.bottomCover := UDINT_TO_USINT(rand_interval(1, 3));
	
	// Set holes to random number of either 0, 2 or 4
	tempRefOrder.Holes := 2 * UDINT_TO_USINT(rand_interval(0, 2));
	
	// Set PCB to random number of either 0 or 1
	tempRefOrder.PCB := UDINT_TO_BOOL(rand_interval(0, 1));
	
	IF tempRefOrder.PCB THEN
		// Set fuses to random number of between 0 and 2
		tempRefOrder.Fuses := UDINT_TO_USINT(rand_interval(0, 2));
	ELSE
		tempRefOrder.Fuses := 0;
	END_IF
	
	// Set top cover to random number between 1 and 3
	tempRefOrder.topCover := UDINT_TO_USINT(rand_interval(0, 3));
	
	
	// Increase ID to trigger HMI change
	tempRefOrder.ID := tempRefOrder.ID + 1;
	
END_FUNCTION_BLOCK

