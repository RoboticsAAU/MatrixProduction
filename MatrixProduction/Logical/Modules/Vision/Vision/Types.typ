
TYPE
	BlobOutput_typ : 	STRUCT 
		numResults : USINT;
		functionProcessingTime : UINT;
		modelNumber : USINT;
		meanGrayValue : USINT;
		area : UDINT;
		rectangularity : USINT;
		positionX : DINT;
		positionY : DINT;
	END_STRUCT;
	BlobInput_typ : 	STRUCT 
		enable : BOOL := TRUE;
		numSearchMax : USINT := 1;
		offsetROIX : DINT := 0;
		offsetROIY : DINT := 0;
		enhancedBlobInformation : BOOL := FALSE;
	END_STRUCT;
END_TYPE
