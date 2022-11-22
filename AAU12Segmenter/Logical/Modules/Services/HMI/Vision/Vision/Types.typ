
TYPE
	CodeReader_typ : 	STRUCT 
		NumberSearch : USINT := 1;
		enableRobustness : BOOL := TRUE;
		codeType : USINT := 7;
		enable : BOOL := TRUE;
	END_STRUCT;
	BlobOutput_typ : 	STRUCT 
		enable : BOOL := TRUE;
		numSearchMax : USINT := 1;
		offsetROIX : DINT := 0;
		offsetROIY : DINT := 0;
	END_STRUCT;
	BlobInput_typ : 	STRUCT 
		numResults : USINT;
		functionProcessingTime : UINT;
		modelNumber : USINT;
		meanGrayValue : USINT;
		area : UDINT;
		rectangularity : USINT;
		positionX : DINT;
		positionY : DINT;
	END_STRUCT;
END_TYPE
