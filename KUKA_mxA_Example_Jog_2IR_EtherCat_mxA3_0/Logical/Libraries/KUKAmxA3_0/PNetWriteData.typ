TYPE PNetWriteData :
STRUCT
	udiAPI : UDINT := 0;
	udiDataLength : UDINT := 688;
	uiSlot : UINT := 2;
	uiSubslot : UINT := 1;
	uiIndex	: UINT;
	
(*-------- Data*)
   OrderID : DINT ;	
   CommandID : DINT ;	
   BufferMode : DINT ;	
   CheckSum : DINT ;	
   Reserve1 : DINT ;	
   Reserve2 : DINT ;	
   Reserve3 : DINT ;	
   Reserve4 : DINT ;	
   Reserve5 : DINT ;	
   Reserve6 : DINT ;	
   Reserve7 : DINT ;	
   Reserve8 : DINT ;	
   Reserve9 : DINT ;	
   Reserve10 : DINT ;	
   Reserve11 : DINT ;	
   Reserve12 : DINT ;	
   Reserve13 : DINT ;	
   Reserve14 : DINT ;	
   Reserve15 : DINT ;	
   Reserve16 : DINT ;	
   CmdParBool_Byte1 : DWORD; 
   CmdParBool_Byte2 : DWORD; 
   CmdParBoolInt : ARRAY  [1 .. 50 ] OF DINT ;	
   CmdParBoolReal : ARRAY  [1 .. 100 ] OF REAL ;	
END_STRUCT;
END_TYPE
