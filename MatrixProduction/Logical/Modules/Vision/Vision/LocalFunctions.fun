
{REDUND_ERROR} FUNCTION_BLOCK SetCamSettings (*TODO: Add your comment here*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		hwCamRef : REFERENCE TO brdkViBase_cam_hw_typ;
		camIdx : USINT;
		coverType : {REDUND_UNREPLICABLE} USINT;
	END_VAR
	VAR
		tempRef : REFERENCE TO brdkViBase_cam_hw_typ;
	END_VAR
END_FUNCTION_BLOCK
