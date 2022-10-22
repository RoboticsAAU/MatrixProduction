
{REDUND_OK} FUNCTION_BLOCK createRouteSheet (*TODO: Add your comment here*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		inputProductOrder : product_order;
	END_VAR
	VAR_OUTPUT
		outputRouteSheet : ARRAY[0..3] OF STRING[10];
	END_VAR
	VAR
		tempIndex : USINT;
		routeSize : USINT;
		i : USINT;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION quadrantIdxToPos : REAL
	VAR_INPUT
		quadrantIdx : USINT;
	END_VAR
END_FUNCTION
