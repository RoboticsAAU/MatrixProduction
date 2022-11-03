
ACTION ErrorMessage: 

	
	CASE step_UDPConnect OF
		
		//////////////////////////////////////////////////////////
		//			Opening the 2 Ports to communicate			//
		//	Port 55555 is used for Receiving					//
		//	Port 50055 is used for Sending						//
		//////////////////////////////////////////////////////////
		STATE_OPEN:						
			UdpOpen_0.enable := 1; 										//opening port for Receiving
			UdpOpen_0.port := 55555; 					
			UdpOpen_0();
		
			UdpOpen_1.enable := 1;  									//opening port for Sending
			UdpOpen_1.port := 50055;
			UdpOpen_1();
			
			IF UdpOpen_0.status = ERR_OK AND UdpOpen_1.status = ERR_OK THEN		//if both ports are open send request
				step_UDPConnect := STATE_WAIT;
			END_IF
		
		
		
		
		//////////////////////////////////////////////////////////
		//		Waiting State for the manual trigger			//
		//		to get all the Messages	 (request)				//
		//////////////////////////////////////////////////////////
		STATE_WAIT: 
			
			TON_0.IN := 0;
		
			IF ReloadMsg = 1 OR WorkAroundCounter = 1 THEN				//Var WorkAroundCounter is just a Workaround to Reload the messages 2 times
				step_UDPConnect := STATE_SEND;							// otherwise messages are displayed when requensting the first time!
			END_IF
		
			IF WorkAroundCounter >= 2 THEN
				WorkAroundCounter := 0;
			END_IF
		
		
		
		
		//////////////////////////////////////////////////////////
		//		Sending the Message to the KRC to 				//
		//		get all the Messages							//
		//////////////////////////////////////////////////////////
		STATE_SEND:
			
			
			
			FOR counterMsg := 0 TO 15 DO						//Reseting the Array with the Messages
				TextArray[counterMsg] := '';
			END_FOR
			
			i := 0;												//Reseting counter for the Message Array
			MsgToKrc := 'GetAllKrcMessages';					//Message to KRC -> to get the Messages from KRC
			
			
			UdpSend_0.enable := 1;
			UdpSend_0.ident := UdpOpen_1.ident; 
			UdpSend_0.pHost := ADR('192.168.1.2'); 
			UdpSend_0.port := 50055; 
			UdpSend_0.pData := ADR(MsgToKrc); 
			UdpSend_0.datalen := SIZEOF(MsgToKrc); 
			UdpSend_0();

			IF UdpSend_0.status = ERR_OK THEN					//ERR_OK -> NO ERROR
				WorkAroundCounter := WorkAroundCounter +1;
				step_UDPConnect := STATE_RECEIVE;
			END_IF
		

		
		//////////////////////////////////////////////////////////
		//		Receiving the Messages from KRC					//
		//		Per cycle 1 msg will be received				//
		// 		If no message after 1s change to STATE_WAIT		//
		//////////////////////////////////////////////////////////
		STATE_RECEIVE:
			UdpRecv_0.enable := 1; 
			UdpRecv_0.ident := UdpOpen_0.ident; 
			UdpRecv_0.pData := ADR(InputUDPString);
			UdpRecv_0.datamax := 255; 
			UdpRecv_0();
	

			IF UdpRecv_0.status = ERR_OK THEN					//ERR_OK -> NO ERROR
				
				InputUDPString 	:= LEFT(InputUDPString, UDINT_TO_INT(UdpRecv_0.recvlen));
				TON_0.IN 		:= 0; // Reset timer - msg received
				step_UDPConnect 		:= STATE_DISPLAY;
				
			ELSIF (UdpRecv_0.status = udpERR_NO_DATA) THEN
				
				TON_0.IN := 1; // set timer - no msg available, after 1 sec change state to wait
				TON_0.PT := T#1s;
				
			END_IF
			
			// check if timer is set to true
			IF TON_0.Q = 1 THEN
				
				step_UDPConnect := STATE_WAIT;
			END_IF
		
		
		
		
		//////////////////////////////////////////////////////////
		//		State to transfer the Message					//
		//		to the Array which is displayed at Visu			//
		//////////////////////////////////////////////////////////	
		STATE_DISPLAY:
			
			TextArray[i] := InputUDPString;								//write current message to array to display
			IF i >= 14 THEN		
				i := 0;
			ELSE	
				memset(ADR(InputUDPString),0,SIZEOF(InputUDPString));	//Clear / Reset the input of the Variable
				i := i + 1;
				step_UDPConnect := STATE_RECEIVE;						//Go to Receive state, to see if another message available
			END_IF;	
						



	END_CASE; 


	

	//Call of the Timer for the TimeOut when no Message
	TON_0();
	
END_ACTION
