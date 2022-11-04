
{REDUND_OK} FUNCTION_BLOCK GripperAction (*TODO: Add your comment here*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		whitePin : REFERENCE TO BOOL;
		blackPin : REFERENCE TO BOOL;
		action : gripper_action_type;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} {REDUND_UNREPLICABLE} FUNCTION_BLOCK EETypeToFrame (*TODO: Add your comment here*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		eeType : end_effector_type;
	END_VAR
	VAR_OUTPUT
		frame : FRAME;
	END_VAR
END_FUNCTION_BLOCK
