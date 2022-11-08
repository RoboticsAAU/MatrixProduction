
{REDUND_OK} FUNCTION_BLOCK GripperAction (*TODO: Add your comment here*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		whitePin : REFERENCE TO BOOL;
		blackPin : REFERENCE TO BOOL;
		action : gripper_action_type;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} {REDUND_UNREPLICABLE} FUNCTION_BLOCK EETypeToFrame (*TODO: Add your comment here*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		eeType : {REDUND_UNREPLICABLE} end_effector_type;
	END_VAR
	VAR_OUTPUT
		frame : {REDUND_UNREPLICABLE} FRAME;
	END_VAR
	VAR CONSTANT
		SchunkLength : REAL := 72.7+2*3.25;
	END_VAR
END_FUNCTION_BLOCK

{REDUND_ERROR} FUNCTION_BLOCK ValuesToPosition (*TODO: Add your comment here*) (*$GROUP=User,$CAT=User,$GROUPICON=User.png,$CATICON=User.png*)
	VAR_INPUT
		axisGroupIdx : {REDUND_UNREPLICABLE} USINT;
		posType : robot_position_type;
	END_VAR
	VAR_OUTPUT
		outputPos : E6POS;
	END_VAR
END_FUNCTION_BLOCK
