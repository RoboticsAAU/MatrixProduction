FUNCTION_BLOCK MC_BR_AsmPowerOn_Acp6D (*Switches on the controllers of the Assembly.*)
	VAR_INPUT
		Assembly : REFERENCE TO Mc6DAssemblyType; (*The assembly reference establishes the connection between the function block and the assembly.*)
		Execute : BOOL; (*Execution of the function block begins on a rising edge of this input.*)
	END_VAR
		VAR_OUTPUT
		Done 		: BOOL; (*Execution successful. Function block is finished*)
		Acknowledge : BOOL; (*Command is accepted by the controller. Command placed in motion buffer.*)
		Busy 		:  BOOL; (*Function block is active and must continue to be called.*)
		CommandAborted 	: BOOL; (*Command aborted by another command*)
		Error 		: BOOL; (*Error occurred during execution.*)
		ErrorID 	: DINT; (*Error number*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_AsmPowerOff_Acp6D (*Switches off the controllers of the Assembly.*)
	VAR_INPUT
		Assembly : REFERENCE TO Mc6DAssemblyType; (*The assembly reference establishes the connection between the function block and the assembly.*)
		Execute : BOOL; (*Execution of the function block begins on a rising edge of this input.*)
	END_VAR
		VAR_OUTPUT
		Done 		: BOOL; (*Execution successful. Function block is finished*)
		Acknowledge : BOOL; (*Command is accepted by the controller. Command placed in motion buffer.*)
		Busy 		:  BOOL; (*Function block is active and must continue to be called.*)
		CommandAborted 	: BOOL; (*Command aborted by another command*)
		Error 		: BOOL; (*Error occurred during execution.*)
		ErrorID 	: DINT; (*Error number*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_AsmStop_Acp6D (*Stop all shuttles on the assembly*)
	VAR_INPUT
		Assembly : REFERENCE TO Mc6DAssemblyType; (*The assembly reference establishes the connection between the function block and the assembly.*)
		Execute : BOOL; (*Execution of the function block begins on a rising edge of this input.*)
	END_VAR
		VAR_OUTPUT
		Done 		: BOOL; (*Execution successful. Function block is finished*)
		Acknowledge : BOOL; (*Command is accepted by the controller. Command placed in motion buffer.*)
		Busy 		:  BOOL; (*Function block is active and must continue to be called.*)
		CommandAborted 	: BOOL; (*Command aborted by another command*)
		Error 		: BOOL; (*Error occurred during execution.*)
		ErrorID 	: DINT; (*Error number*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_AsmReboot_Acp6D (*Restart the 6D Controller*)
	VAR_INPUT
		Assembly : REFERENCE TO Mc6DAssemblyType; (*The assembly reference establishes the connection between the function block and the assembly.*)
		Execute : BOOL; (*Execution of the function block begins on a rising edge of this input.*)
	END_VAR
		VAR_OUTPUT
		Done 		: BOOL; (*Execution successful. Function block is finished*)
		Acknowledge : BOOL; (*Command is accepted by the controller. Command placed in motion buffer.*)
		Busy 		:  BOOL; (*Function block is active and must continue to be called.*)
		CommandAborted 	: BOOL; (*Command aborted by another command*)
		Error 		: BOOL; (*Error occurred during execution.*)
		ErrorID 	: DINT; (*Error number*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_AsmHalt_Acp6D (*Resume/Pause all shuttles on the assembly*)
	VAR_INPUT
		Assembly : REFERENCE TO Mc6DAssemblyType; (*The assembly reference establishes the connection between the function block and the assembly.*)
		Execute : BOOL; (*Execution of the function block begins on a rising edge of this input.*)
		Option: McAcp6DHaltOptionEnum; (*Select to resume or pause all shuttles.*)
	END_VAR
		VAR_OUTPUT
		Done 		: BOOL; (*Execution successful. Function block is finished*)
		Acknowledge : BOOL; (*Command is accepted by the controller. Command placed in motion buffer.*)
		Busy 		:  BOOL; (*Function block is active and must continue to be called.*)
		CommandAborted 	: BOOL; (*Command aborted by another command*)
		Error 		: BOOL; (*Error occurred during execution.*)
		ErrorID 	: DINT; (*Error number*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_AsmBuffer_Acp6D (*Control the motion buffer of all shuttles on the assembly*)
	VAR_INPUT
		Assembly : REFERENCE TO Mc6DAssemblyType; (*The assembly reference establishes the connection between the function block and the assembly.*)
		Execute : BOOL; (*Execution of the function block begins on a rising edge of this input.*)
		Option	: McAcp6DAsmBufferOptionEnum; (*Select to block, release or clear the buffer. Get status is currently not available for this command.*)
	END_VAR
		VAR_OUTPUT
		Done 		: BOOL; (*Execution successful. Function block is finished*)
		Busy 		:  BOOL; (*Function block is active and must continue to be called.*)
		CommandAborted 	: BOOL; (*Command aborted by another command*)
		Error 		: BOOL; (*Error occurred during execution.*)
		ErrorID 	: DINT; (*Error number*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_ShForceMode_Acp6D (*Activate/deactivate force mode for a shuttle*)
	VAR_INPUT
		Shuttle : REFERENCE TO Mc6DShuttleType; (*The shuttle reference establishes the connection between the function block and the shuttle.*)
		Execute : BOOL; (*Execution of the function block begins on a rising edge of this input.*)
		Parameters	: McAcp6DForceModeParType; (*Set force input. Tx and Ty not avaialble.*) 
	END_VAR
		VAR_OUTPUT
		Done 		: BOOL; (*Execution successful. Function block is finished*)
		Busy 		:  BOOL; (*Function block is active and must continue to be called.*) 
		CommandAborted 	: BOOL; (*Command aborted by another command*)
		Error 		: BOOL; (*Error occurred during execution.*) 
		ErrorID 	: DINT; (*Error number*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK


FUNCTION_BLOCK MC_BR_ShStereotypeDefine_Acp6D (*Define a shuttle stereotype*)
	VAR_INPUT
		Assembly : REFERENCE TO Mc6DAssemblyType; (*The assembly reference establishes the connection between the function block and the assembly.*)
		Execute : BOOL; (*Execution of the function block begins on a rising edge of this input.*)
		Parameters	: McAcp6DShStereotypeParType; (*Parameters for a shuttle stereotype.*)
	END_VAR
		VAR_OUTPUT
		Done 		: BOOL; (*Execution successful. Function block is finished*)
		Busy 		:  BOOL; (*Function block is active and must continue to be called.*)
		CommandAborted 	: BOOL; (*Command aborted by another command*)
		Error 		: BOOL; (*Error occurred during execution.*)
		ErrorID 	: DINT; (*Error number*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_ShStereotypeAssign_Acp6D (*Assign a shuttle stereotype to a shuttle*)
	VAR_INPUT
		Shuttle : REFERENCE TO Mc6DShuttleType; (*The shuttle reference establishes the connection between the function block and the shuttle.*)
		Execute : BOOL; (*Execution of the function block begins on a rising edge of this input.*)
		Name	: STRING[32]; (*Name identifier for the shuttle stereotype*) 
	END_VAR
		VAR_OUTPUT
		Done 		: BOOL; (*Execution successful. Function block is finished*)
		Busy 		:  BOOL; (*Function block is active and must continue to be called.*) 
		CommandAborted 	: BOOL; (*Command aborted by another command*)
		Error 		: BOOL; (*Error occurred during execution.*) 
		ErrorID 	: DINT; (*Error number*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK


FUNCTION_BLOCK MC_BR_ShStereotypeDelete_Acp6D (*Delete a shuttle stereotype*)
	VAR_INPUT
		Assembly : REFERENCE TO Mc6DAssemblyType; (*The assembly reference establishes the connection between the function block and the assembly.*)
		Execute : BOOL; (*Execution of the function block begins on a rising edge of this input.*)
		Name	: STRING[32]; (*Name identifier for the shuttle stereotype*) 
		Command : McAcp6DShStereotypeDeleteCmdEnum; (*Delete specifc shuttle or delete all. If all selected, input "Name" will be ignored.*) 
	END_VAR
		VAR_OUTPUT
		Done 		: BOOL; (*Execution successful. Function block is finished*)
		Busy 		:  BOOL; (*Function block is active and must continue to be called.*)
		CommandAborted 	: BOOL; (*Command aborted by another command*)
		Error 		: BOOL; (*Error occurred during execution.*)
		ErrorID 	: DINT; (*Error number*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK


FUNCTION_BLOCK MC_BR_MacroDelete_Acp6D (*Delete a macro*)
	VAR_INPUT
		Assembly : REFERENCE TO Mc6DAssemblyType; (*The assembly reference establishes the connection between the function block and the assembly.*)
		Execute : BOOL; (*Execution of the function block begins on a rising edge of this input.*)
		Name	: STRING[32]; (*Name identifier for the macro*) 
		Command : McAcp6DMacroDeleteCmdEnum; (*Delete specifc macro or delete all. If all selected, input "Name" will be ignored.*) 
	END_VAR
		VAR_OUTPUT
		Done 		: BOOL; (*Execution successful. Function block is finished*)
		Busy 		:  BOOL; (*Function block is active and must continue to be called.*)
		CommandAborted 	: BOOL; (*Command aborted by another command*)
		Error 		: BOOL; (*Error occurred during execution.*)
		ErrorID 	: DINT; (*Error number*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK





FUNCTION_BLOCK MC_BR_MacroCreate_Acp6D (*Create a macro and return a shuttle reference*)
	VAR_INPUT
		Assembly : REFERENCE TO Mc6DAssemblyType; (*The assembly reference establishes the connection between the function block and the assembly.*)
		Execute : BOOL; (*Execution of the function block begins on a rising edge of this input.*)
		Parameters	: McAcp6DMacroCreateParType; (*Parameters for a macro.*)
	END_VAR
		VAR_OUTPUT
		Done 		: BOOL; (*Execution successful. Function block is finished*)
		Busy 		:  BOOL; (*Function block is active and must continue to be called.*)
		CommandAborted 	: BOOL; (*Command aborted by another command*)
		Error 		: BOOL; (*Error occurred during execution.*)
		ErrorID 	: DINT; (*Error number*)
		MacroShuttle: Mc6DShuttleType; (* Macro shuttle reference*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_VirtualShCreate_Acp6D (*Create a virtual and return a shuttle reference *)
	VAR_INPUT
		Assembly : REFERENCE TO Mc6DAssemblyType; (*The assembly reference establishes the connection between the function block and the assembly.*)
		Execute : BOOL; (*Execution of the function block begins on a rising edge of this input.*)
	END_VAR
		VAR_OUTPUT
		Done 		: BOOL; (*Execution successful. Function block is finished*)
		Busy 		:  BOOL; (*Function block is active and must continue to be called.*)
		CommandAborted 	: BOOL; (*Command aborted by another command*)
		Error 		: BOOL; (*Error occurred during execution.*)
		ErrorID 	: DINT; (*Error number*)
		VirtualShuttle: Mc6DShuttleType; (* Macro shuttle reference*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_ShGroupCreate_Acp6D (*Create a macro and return a macro shuttle*)
	VAR_INPUT
		Assembly : REFERENCE TO Mc6DAssemblyType; (*The assembly reference establishes the connection between the function block and the assembly.*)
		Execute : BOOL; (*Execution of the function block begins on a rising edge of this input.*)
	END_VAR
		VAR_OUTPUT
		Done 		: BOOL; (*Execution successful. Function block is finished*)
		Busy 		:  BOOL; (*Function block is active and must continue to be called.*)
		CommandAborted 	: BOOL; (*Command aborted by another command*)
		Error 		: BOOL; (*Error occurred during execution.*)
		ErrorID 	: DINT; (*Error number*)
		ShuttleGroup: Mc6DShuttleGroupType; (* Shuttle group shuttle reference*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK



FUNCTION_BLOCK MC_BR_MacroSave_Acp6D (*Save macro*)
	VAR_INPUT
		Shuttle : REFERENCE TO Mc6DShuttleType; (*The shuttle reference establishes the connection between the function block and the shuttle.*)
		Execute : BOOL; (*Execution of the function block begins on a rising edge of this input.*)
	END_VAR
		VAR_OUTPUT
		Done 		: BOOL; (*Execution successful. Function block is finished*)
		Busy 		:  BOOL; (*Function block is active and must continue to be called.*) 
		CommandAborted 	: BOOL; (*Command aborted by another command*)
		Error 		: BOOL; (*Error occurred during execution.*) 
		ErrorID 	: DINT; (*Error number*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_MacroClear_Acp6D (*Clear commands from a macro*)
	VAR_INPUT
		Shuttle : REFERENCE TO Mc6DShuttleType; (*The shuttle reference establishes the connection between the function block and the shuttle.*)
		Execute : BOOL; (*Execution of the function block begins on a rising edge of this input.*)
	END_VAR
		VAR_OUTPUT
		Done 		: BOOL; (*Execution successful. Function block is finished*)
		Busy 		:  BOOL; (*Function block is active and must continue to be called.*) 
		CommandAborted 	: BOOL; (*Command aborted by another command*)
		Error 		: BOOL; (*Error occurred during execution.*) 
		ErrorID 	: DINT; (*Error number*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_MacroRun_Acp6D (*Run a Macro movement on a specific shuttle*)
VAR_INPUT
		Shuttle : REFERENCE TO Mc6DShuttleType; (*The shuttle reference establishes the connection between the function block and the shuttle.*)
		Execute : BOOL; (*Execution of the function block begins on a rising edge of this input.*) 
		Name : STRING[32]; (*Name identifier for the macro to run*)  
		CommandLabel : UINT; (*Optional command label to be associated with this command.*) 
	END_VAR
	VAR_OUTPUT
		Done 		: BOOL; (*Execution successful. Function block is finished*) 
		Acknowledge : BOOL; (*Command is accepted by the controller. Command placed in motion buffer.*) 
		Busy 		:  BOOL; (*Function block is active and must continue to be called.*) 
		CommandAborted 	: BOOL; (*Command aborted by another command*) 
		Error 		: BOOL; (*Error occurred during execution.*) 
		ErrorID 	: DINT; (*Error number*) 
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_ZoneCreate_Acp6D (*Create a new zone*)
	VAR_INPUT
		Assembly : REFERENCE TO Mc6DAssemblyType; (*The assembly reference establishes the connection between the function block and the assembly.*)
		Execute : BOOL; (*Execution of the function block begins on a rising edge of this input.*)
		Parameters	: McAcp6DCreateZoneParType; (*Parameters for a zone.*)
	END_VAR
		VAR_OUTPUT
		Done 		: BOOL; (*Execution successful. Function block is finished*)
		Busy 		:  BOOL; (*Function block is active and must continue to be called.*)
		CommandAborted 	: BOOL; (*Command aborted by another command*)
		Error 		: BOOL; (*Error occurred during execution.*)
		ErrorID 	: DINT; (*Error number*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_AsmLevitation_Acp6D (*Leviate or Land a shuttle*)
	VAR_INPUT
		Assembly : REFERENCE TO Mc6DAssemblyType; (*The assembly reference establishes the connection between the function block and the assembly.*)
		Execute : BOOL; (*Execution of the function block begins on a rising edge of this input.*)
		Parameters: McAcp6DLevitationParType; (*Parameters for levitation.*)
	END_VAR
		VAR_OUTPUT
		Done 		: BOOL; (*Execution successful. Function block is finished*) 
		Acknowledge : BOOL; (*Command is accepted by the controller. Command placed in motion buffer.*) 
		Busy 		:  BOOL; (*Function block is active and must continue to be called.*) 
		CommandAborted 	: BOOL; (*Command aborted by another command*) 
		Error 		: BOOL; (*Error occurred during execution.*) 
		ErrorID 	: DINT; (*Error number*) 
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_AsmGetShuttle_Acp6D (*Loop through a snapshot of shuttles on the assembly.*)
	VAR_INPUT
		Assembly : REFERENCE TO Mc6DAssemblyType; (*The assembly reference establishes the connection between the function block and the assembly.*)
		Enable : BOOL;  (* The function block is active as long as this input is set.*)
		Next : BOOL; (* Show data of next shuttle.*)
	END_VAR
	VAR_OUTPUT
		Valid : BOOL; (* Function block's output values can be used.*)
		Busy : BOOL; (* Function block is active and must continue to be called.*)
		Error : BOOL; (* Execution error*)
		ErrorID : DINT; (* Error number*)
		TotalCount : UINT; (* Total amount of shuttles in the assembly.*)
		RemainingCount : UINT; (* Remaining shuttles to loop through.*)
		Shuttle: Mc6DShuttleType; (* Shuttle Reference*)
		AdditionalInfo : McAcp6DGetShAddInfoType; (*Additional shuttle information*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_AsmGetVirtualSh_Acp6D (*Loop through a snapshot of virtual shuttles on the assembly.*)
	VAR_INPUT
		Assembly : REFERENCE TO Mc6DAssemblyType; (*The assembly reference establishes the connection between the function block and the assembly.*)
		Enable : BOOL;  (* The function block is active as long as this input is set.*)
		Next : BOOL; (* Show data of next shuttle.*)
	END_VAR
	VAR_OUTPUT
		Valid : BOOL; (* Function block's output values can be used.*)
		Busy : BOOL; (* Function block is active and must continue to be called.*)
		Error : BOOL; (* Execution error*)
		ErrorID : DINT; (* Error number*)
		TotalCount : UINT; (* Total amount of shuttles in the assembly.*)
		RemainingCount : UINT; (* Remaining shuttles to loop through.*)
		VirtualShuttle: Mc6DShuttleType; (* Shuttle Reference*)
		AdditionalInfo : McAcp6DGetShAddInfoType; (*Additional shuttle information*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_AsmGetSegment_Acp6D (*Loop through a snapshot of segments on the assembly.*)
	VAR_INPUT
		Assembly : REFERENCE TO Mc6DAssemblyType; (*The assembly reference establishes the connection between the function block and the assembly.*)
		Enable : BOOL;  (* The FB is active as long as this input is set.*)
		Next : BOOL; (* Show data of next segment.*)
	END_VAR
	VAR_OUTPUT
		Valid : BOOL; (* Function block's output values can be used.*)
		Busy : BOOL; (* Function block is active and must continue to be called.*)
		Error : BOOL; (* Execution error*)
		ErrorID : DINT; (* Error number*)
		TotalCount : UINT; (* Total amount of segments in the assembly.*)
		RemainingCount : UINT; (* Remaining segments to loop through.*)
		Segment: Mc6DSegmentType; (* Segment Reference *)
		AdditionalInfo : McAcp6DGetSegAddInfoType; (* Additional segment information *)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK


FUNCTION_BLOCK MC_BR_AsmGetZone_Acp6D (*Loop through a snapshot of zones on the assembly.*)
	VAR_INPUT
		Assembly : REFERENCE TO Mc6DAssemblyType; (*The assembly reference establishes the connection between the function block and the assembly.*)
		Enable : BOOL;  (* The FB is active as long as this input is set.*)
		Next : BOOL; (* Show data of next zone.*)
	END_VAR
	VAR_OUTPUT
		Valid : BOOL; (* Function block's output values can be used.*)
		Busy : BOOL; (* Function block is active and must continue to be called.*)
		Error : BOOL; (* Execution error*)
		ErrorID : DINT; (* Error number*)
		TotalCount : UINT; (* Total amount of zones in the assembly.*)
		RemainingCount : UINT; (* Remaining zones to loop through.*)
		Zone: Mc6DZoneType; (* Zone reference *)
		AdditionalInfo : McAcp6DGetZoneAddInfoType; (* Additional zone information *)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_AsmGetShGroup_Acp6D (*Loop through a snapshot of shuttle groups on the assembly.*)
	VAR_INPUT
		Assembly : REFERENCE TO Mc6DAssemblyType; (*The assembly reference establishes the connection between the function block and the assembly.*)
		Enable : BOOL;  (* The FB is active as long as this input is set.*)
		Next : BOOL; (* Show data of next shuttle groups.*)
	END_VAR
	VAR_OUTPUT
		Valid : BOOL; (* Function block's output values can be used.*)
		Busy : BOOL; (* Function block is active and must continue to be called.*)
		Error : BOOL; (* Execution error*)
		ErrorID : DINT; (* Error number*)
		TotalCount : UINT; (* Total amount of shuttle groups in the assembly.*)
		RemainingCount : UINT; (* Remaining shuttle groups to loop through.*)
		ShuttleGroup: Mc6DShuttleGroupType; (* Shuttle Group reference *)
		AdditionalInfo : McAcp6DGetShGroupAddInfoType; (* Additional group information *)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK


FUNCTION_BLOCK MC_BR_AsmGetInfo_Acp6D (*Get assembly information.*)
	VAR_INPUT
		Assembly : REFERENCE TO Mc6DAssemblyType; (*The assembly reference establishes the connection between the function block and the assembly.*) 
		Execute 	: BOOL; (*Execution of the function block begins on a rising edge of this input.*) 
	END_VAR
	VAR_OUTPUT
		Done 		: BOOL; (*Execution successful. Function block is finished*) 
		Busy 		:  BOOL; (*Function block is active and must continue to be called.*) 
		CommandAborted 	: BOOL; (*Command aborted by another command*) 
		Error 		: BOOL; (*Error occurred during execution.*) 
		ErrorID 	: DINT; (*Error number*) 
		AssemblyInfo  	:  McAcp6DAsmGetInfoType; (*Assembly information*) 
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK



FUNCTION_BLOCK MC_BR_AsmGetErrCode_Acp6D (*Get error codes from the 6D Controller.*)
	VAR_INPUT
		Assembly 	: REFERENCE TO Mc6DAssemblyType; (*The assembly reference establishes the connection between the function block and the assembly.*) 
		Execute 	: BOOL; (*Execution of the function block begins on a rising edge of this input.*) 
	END_VAR
	VAR_OUTPUT
		Done 		: BOOL; (*Execution successful. Function block is finished*) 
		Busy 		:  BOOL; (*Function block is active and must continue to be called.*) 
		CommandAborted 	: BOOL; (*Command aborted by another command*) 
		Error 		: BOOL; (*Error occurred during execution.*) 
		ErrorID 	: DINT := 0; (*Error number*) 
		ErrInfo  	:  McAcp6DErrInfoType; (*Assembly information Type*) 
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK





FUNCTION_BLOCK MC_BR_AsmReadStatus_Acp6D (*Provides the current status (see State diagram) of the assembly.*)
	VAR_INPUT
		Assembly : REFERENCE TO Mc6DAssemblyType; (*The assembly reference establishes the connection between the function block and the assembly.*) 
		Enable : BOOL; (*The function block is active as long as this input is set.*)
	END_VAR
	VAR_OUTPUT
		Valid : BOOL; (*Function block's output values can be used*)
		Busy : BOOL; (*Function block is active and must continue to be called.*)
		Error : BOOL; (*Execution error*)
		ErrorID : DINT; (*Error number*)
		AssemblyDisabled: BOOL; (* The assembly is switched off*)
		AssemblyReady: BOOL;	(*The assembly is switched on*)
		AssemblyHoming: BOOL; (*Shuttle identification is active.*)
		AssemblyStopping: BOOL; (*The assembly is stopped. Shuttle movements are stopped.*)
		AssemblyStartUp: BOOL; (*The assembly is starting up.*)
		AssemblyErrorStop: BOOL; (*The assembly is in an error state. Shuttle movements are stopped*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK


FUNCTION_BLOCK MC_BR_AsmReadInfo_Acp6D (*Read assembly information.*)
	VAR_INPUT
		Assembly : REFERENCE TO Mc6DAssemblyType; (*The assembly reference establishes the connection between the function block and the assembly.*) 
		Enable : BOOL; (*The function block is active as long as this input is set.*)
	END_VAR
	VAR_OUTPUT
		Valid : BOOL; (*Function block's output values can be used*)
		Busy : BOOL; (*Function block is active and must continue to be called.*)
		Error : BOOL; (*Execution error*)
		ErrorID : DINT; (*Error number*)
		AssemblyInfo: McAcp6DAsmInfoType; (* Assembly Information*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_ShReadInfo_Acp6D (*Read shuttle information*)
	VAR_INPUT
		Shuttle : REFERENCE TO Mc6DShuttleType; (*The shuttle reference establishes the connection between the function block and the shuttle.*)
		Enable : BOOL; (*The function block is active as long as this input is set.*)
	END_VAR
	VAR_OUTPUT
		Valid : BOOL; (*Function block's output values can be used*)
		Busy : BOOL; (*Function block is active and must continue to be called.*)
		Error : BOOL; (*Execution error*)
		ErrorID : DINT; (*Error number*)
		ShuttleInfo : McAcp6DShInfoType; (*Shuttle information*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK



FUNCTION_BLOCK MC_BR_ShGetInfo_Acp6D (*Get shuttle information.*)
	VAR_INPUT
		Shuttle : REFERENCE TO Mc6DShuttleType; (*The shuttle reference establishes the connection between the function block and the shuttle.*)
		Execute 	: BOOL; (*Execution of the function block begins on a rising edge of this input.*)
		Option		: McAcp6DShGetInfoOptionEnum; (*Position or force feedback *)
	END_VAR
	VAR_OUTPUT
		Done 		: BOOL; (*Execution successful. Function block is finished*) 
		Busy 		:  BOOL; (*Function block is active and must continue to be called.*) 
		CommandAborted 	: BOOL; (*Command aborted by another command*) 
		Error 		: BOOL; (*Error occurred during execution.*) 
		ErrorID 	: DINT; (*Error number*) 
		ShuttleInfo : McAcp6DShGetInfoType; (*Shuttle information*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_ShGetProperty_Acp6D (*Get shuttle properties.*)
	VAR_INPUT
		Shuttle : REFERENCE TO Mc6DShuttleType; (*The shuttle reference establishes the connection between the function block and the shuttle.*)
		Execute 	: BOOL; (*Execution of the function block begins on a rising edge of this input.*)
	END_VAR
	VAR_OUTPUT
		Done 		: BOOL; (*Execution successful. Function block is finished*) 
		Busy 		:  BOOL; (*Function block is active and must continue to be called.*) 
		CommandAborted 	: BOOL; (*Command aborted by another command*) 
		Error 		: BOOL; (*Error occurred during execution.*) 
		ErrorID 	: DINT; (*Error number*) 
		ShuttleProperty : McAcp6DShGetPropertyType; (*Shuttle property info*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_JogVelocity_Acp6D (*Jog velocity*)
	VAR_INPUT
		Shuttle : REFERENCE TO Mc6DShuttleType; (*The shuttle reference establishes the connection between the function block and the shuttle.*)
		Enable : BOOL; (*The function block is active as long as this input is set.*)
		Parameters : McAcp6DJogVelocityParType; (*Jog parameters*)
	END_VAR
	VAR_OUTPUT
		Ready 			: BOOL; (*Function block's output values can be used*)
		Busy 			: BOOL; (*Function block is active and must continue to be called.*)
		CommandAborted 	: BOOL; (*Command aborted by another command*) 
		Error 			: BOOL; (*Execution error*)
		ErrorID 		: DINT; (*Error number*)
		Jogging			: BOOL;
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK


FUNCTION_BLOCK MC_BR_MoveCyclicPosition_Acp6D (*Move cyclic position*)
	VAR_INPUT
		Shuttle : REFERENCE TO Mc6DShuttleType; (*The shuttle reference establishes the connection between the function block and the shuttle.*)
		Enable : BOOL; (*The function block is active as long as this input is set.*)
		Parameters : McAcp6DMoveCyclicParType; (*Move cyclic parameters*)
		CyclicPosition : McAcp6DShPositionType; (*Cyclic position input.*)
	END_VAR
	VAR_OUTPUT
		Valid : BOOL; (*Function block's output values can be used*)
		Busy : BOOL; (*Function block is active and must continue to be called.*)
		Error : BOOL; (*Execution error*)
		ErrorID : DINT; (*Error number*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK


FUNCTION_BLOCK MC_BR_ReadCyclicPosition_Acp6D (*Read cyclic position*)
	VAR_INPUT
		Shuttle : REFERENCE TO Mc6DShuttleType; (*The shuttle reference establishes the connection between the function block and the shuttle.*)
		Enable : BOOL; (*The function block is active as long as this input is set.*)
		Parameters : McAcp6DReadCyclicParType; (*Read cyclic position paramters*)
	END_VAR
	VAR_OUTPUT
		Valid : BOOL; (*Function block's output values can be used*)
		Busy : BOOL; (*Function block is active and must continue to be called.*)
		Error : BOOL; (*Execution error*)
		ErrorID : DINT; (*Error number*)
		CyclicPosition : McAcp6DShPositionType; (*Cyclic position output*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_ReadCyclicForce_Acp6D (*Read cyclic force parameters*)
	VAR_INPUT
		Shuttle : REFERENCE TO Mc6DShuttleType; (*The shuttle reference establishes the connection between the function block and the shuttle.*)
		Enable : BOOL; (*The function block is active as long as this input is set.*)
		Parameters : McAcp6DReadCyclicParType; (*Read cyclic parameters*)
	END_VAR
	VAR_OUTPUT
		Valid : BOOL; (*Function block's output values can be used*)
		Busy : BOOL; (*Function block is active and must continue to be called.*)
		Error : BOOL; (*Execution error*)
		ErrorID : DINT; (*Error number*)
		CyclicForce : McAcp6DShForceType; (*Cyclic force output*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK


FUNCTION_BLOCK MC_BR_MoveInPlaneAsync_Acp6D (*Move up to 78 shuttles asynchronous *)
	VAR_INPUT
		Assembly : REFERENCE TO Mc6DAssemblyType; (*The controller reference provides the link between the function block and the Acopos6D shuttle.*) 
		Execute : BOOL; (*Execution of the function block begins on a rising edge of this input.*) 
		Parameters: McAcp6DMoveInPlaneAsyncParType; (*Parameters for in plane async movement.*) 
	END_VAR
		VAR_OUTPUT
		Done 		: BOOL; (*Execution successful. Function block is finished*) 
		Acknowledge : BOOL; (*Command is accepted by the controller. Command placed in motion buffer.*) 
		Busy 		:  BOOL; (*Function block is active and must continue to be called.*) 
		CommandAborted 	: BOOL; (*Command aborted by another command*) 
		Error 		: BOOL; (*Error occurred during execution.*) 
		ErrorID 	: DINT; (*Error number*) 
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK





FUNCTION_BLOCK MC_BR_MoveInPlane_Acp6D (*Move a single shuttle in 2D *)
	VAR_INPUT
		Shuttle : REFERENCE TO Mc6DShuttleType; (*The shuttle reference establishes the connection between the function block and the shuttle.*)
		Execute : BOOL; (*Execution of the function block begins on a rising edge of this input.*) 
		Parameters: McAcp6DInPlaneParType; (*Parameters for in plane movement.*) 
		CommandLabel : UINT; (*Optional command label to be associated with this command.*) 
	END_VAR
		VAR_OUTPUT
		Done 		: BOOL; (*Execution successful. Function block is finished*) 
		Acknowledge : BOOL; (*Command is accepted by the controller. Command placed in motion buffer.*) 
		Busy 		:  BOOL; (*Function block is active and must continue to be called.*) 
		CommandAborted 	: BOOL; (*Command aborted by another command*) 
		Error 		: BOOL; (*Error occurred during execution.*) 
		ErrorID 	: DINT; (*Error number*) 
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK
	
FUNCTION_BLOCK MC_BR_MoveShortAxis_Acp6D (*Move a single shuttle in 4D (Z, Rx, Ry, Rz) *)
	VAR_INPUT
		Shuttle : REFERENCE TO Mc6DShuttleType; (*The shuttle reference establishes the connection between the function block and the shuttle.*)
		Execute : BOOL; (*Execution of the function block begins on a rising edge of this input.*) 
		Parameters: McAcp6DShortAxParType; (*Parameters for short axis movement.*) 
		CommandLabel : UINT; (*Optional command label to be associated with this command.*) 
	END_VAR
		VAR_OUTPUT
		Done 		: BOOL; (*Execution successful. Function block is finished*) 
		Acknowledge : BOOL; (*Command is accepted by the controller. Command placed in motion buffer.*) 
		Busy 		:  BOOL; (*Function block is active and must continue to be called.*) 
		CommandAborted 	: BOOL; (*Command aborted by another command*) 
		Error 		: BOOL; (*Error occurred during execution.*) 
		ErrorID 	: DINT; (*Error number*) 
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_MoveArc_Acp6D (*Move a single shuttle in an arc movement in 2D*)
	VAR_INPUT
		Shuttle : REFERENCE TO Mc6DShuttleType; (*The shuttle reference establishes the connection between the function block and the shuttle.*)
		Execute : BOOL; (*Execution of the function block begins on a rising edge of this input.*) 
		Parameters: McAcp6DArcParType; (*Parameters for arc movement.*) 
		CommandLabel : UINT; (*Optional command label to be associated with this command.*) 
	END_VAR
		VAR_OUTPUT
		Done 		: BOOL; (*Execution successful. Function block is finished*) 
		Acknowledge : BOOL; (*Command is accepted by the controller. Command placed in motion buffer.*) 
		Busy 		:  BOOL; (*Function block is active and must continue to be called.*) 
		CommandAborted 	: BOOL; (*Command aborted by another command*) 
		Error 		: BOOL; (*Error occurred during execution.*) 
		ErrorID 	: DINT; (*Error number*) 
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_ShLevitation_Acp6D (*Leviate/Land a single shuttle*)
	VAR_INPUT
		Shuttle : REFERENCE TO Mc6DShuttleType; (*The shuttle reference establishes the connection between the function block and the shuttle.*)
		Execute : BOOL; (*Execution of the function block begins on a rising edge of this input.*) 
		Parameters: McAcp6DLevitationParType; (*Parameters for levitation.*) 
	END_VAR
		VAR_OUTPUT
		Done 		: BOOL; (*Execution successful. Function block is finished*) 
		Acknowledge : BOOL; (*Command is accepted by the controller. Command placed in motion buffer.*) 
		Busy 		:  BOOL; (*Function block is active and must continue to be called.*) 
		CommandAborted 	: BOOL; (*Command aborted by another command*) 
		Error 		: BOOL; (*Error occurred during execution.*) 
		ErrorID 	: DINT; (*Error number*) 
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_Move6D_Acp6D (*Move a single shuttle in 6D*)
	VAR_INPUT
		Shuttle : REFERENCE TO Mc6DShuttleType; (*The shuttle reference establishes the connection between the function block and the shuttle.*)
		Execute : BOOL; (*Execution of the function block begins on a rising edge of this input.*) 
		Parameters: McAcp6DMove6DParType; (*Parameters for 6D movement.*) 
		CommandLabel : UINT; (*Optional command label to be associated with this command.*) 
	END_VAR
		VAR_OUTPUT
		Done 		: BOOL; (*Execution successful. Function block is finished*) 
		Acknowledge : BOOL; (*Command is accepted by the controller. Command placed in motion buffer.*) 
		Busy 		:  BOOL; (*Function block is active and must continue to be called.*) 
		CommandAborted 	: BOOL; (*Command aborted by another command*) 
		Error 		: BOOL; (*Error occurred during execution.*) 
		ErrorID 	: DINT; (*Error number*) 
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_ShBuffer_Acp6D (*Control the motion buffer of a single shuttle*)
	VAR_INPUT
		Shuttle : REFERENCE TO Mc6DShuttleType; (*The shuttle reference establishes the connection between the function block and the shuttle.*)
		Execute : BOOL; (*Execution of the function block begins on a rising edge of this input.*) 
		Option	: McAcp6DBufferOptionEnum; (*Block, release, clear or get status of the motion buffer*) 
	END_VAR
		VAR_OUTPUT
		Done 		: BOOL; (*Execution successful. Function block is finished*)
		Busy 		:  BOOL; (*Function block is active and must continue to be called.*)
		CommandAborted 	: BOOL; (*Command aborted by another command*)
		Error 		: BOOL; (*Error occurred during execution.*) 
		ErrorID 	: DINT; (*Error number*)
		BufferInfo : McAcp6DBufferInfoType; (*Motion buffer information*) 
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_ShStop_Acp6D (*Stop a single shuttle*) 
	VAR_INPUT
		Shuttle : REFERENCE TO Mc6DShuttleType; (*The shuttle reference establishes the connection between the function block and the shuttle.*)
		Execute : BOOL; (*Execution of the function block begins on a rising edge of this input.*) 
	END_VAR
		VAR_OUTPUT
		Done 		: BOOL; (*Execution successful. Function block is finished*) 
		Acknowledge : BOOL; (*Command is accepted by the controller. Command placed in motion buffer.*) 
		Busy 		:  BOOL; (*Function block is active and must continue to be called.*) 
		CommandAborted 	: BOOL; (*Command aborted by another command*) 
		Error 		: BOOL; (*Error occurred during execution.*) 
		ErrorID 	: DINT; (*Error number*) 
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_ShGetPayload_Acp6D (*Get payload of a shuttle*) 
	VAR_INPUT
		Shuttle : REFERENCE TO Mc6DShuttleType; (*The shuttle reference establishes the connection between the function block and the shuttle.*)
		Execute : BOOL; (*Execution of the function block begins on a rising edge of this input.*) 
	END_VAR
		VAR_OUTPUT
		Done 		: BOOL; (*Execution successful. Function block is finished*) 
		Acknowledge : BOOL; (*Command is accepted by the controller. Command placed in motion buffer.*) 
		Busy 		:  BOOL; (*Function block is active and must continue to be called.*) 
		CommandAborted 	: BOOL; (*Command aborted by another command*) 
		Error 		: BOOL; (*Error occurred during execution.*) 
		ErrorID 	: DINT; (*Error number*) 
		Payload		: REAL; (*Payload output*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_ShHalt_Acp6D (*Resume/Pause a single shuttle*)
	VAR_INPUT
		Shuttle : REFERENCE TO Mc6DShuttleType; (*The shuttle reference establishes the connection between the function block and the shuttle.*)
		Execute : BOOL; (*Execution of the function block begins on a rising edge of this input.*) 
		Option: McAcp6DHaltOptionEnum; (*Resume or pause selection*)
	END_VAR
		VAR_OUTPUT
		Done 		: BOOL; (*Execution successful. Function block is finished*) 
		Acknowledge : BOOL; (*Command is accepted by the controller. Command placed in motion buffer.*) 
		Busy 		:  BOOL; (*Function block is active and must continue to be called.*) 
		CommandAborted 	: BOOL; (*Command aborted by another command*) 
		Error 		: BOOL; (*Error occurred during execution.*) 
		ErrorID 	: DINT; (*Error number*) 
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_ShRecover_Acp6D (*Recover a shuttle in error state *)
	VAR_INPUT
		Shuttle : REFERENCE TO Mc6DShuttleType; (*The shuttle reference establishes the connection between the function block and the shuttle.*)
		Execute : BOOL; (*Execution of the function block begins on a rising edge of this input.*) 
	END_VAR
		VAR_OUTPUT
		Done 		: BOOL; (*Execution successful. Function block is finished*) 
		Busy 		:  BOOL; (*Function block is active and must continue to be called.*) 
		CommandAborted 	: BOOL; (*Command aborted by another command*) 
		Error 		: BOOL; (*Error occurred during execution.*) 
		ErrorID 	: DINT; (*Error number*) 
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK


FUNCTION_BLOCK MC_BR_SegGetInfo_Acp6D (*Get segment information*)
	VAR_INPUT
		Segment 	: REFERENCE TO Mc6DSegmentType; (*The segment reference establishes the connection between the function block and the segment.*) 
		Execute 	: BOOL; (*Execution of the function block begins on a rising edge of this input.*) 
	END_VAR
	VAR_OUTPUT
		Done 		: BOOL; (*Execution successful. Function block is finished*) 
		Busy 		:  BOOL; (*Function block is active and must continue to be called.*) 
		CommandAborted 	: BOOL; (*Command aborted by another command*) 
		Error 		: BOOL; (*Error occurred during execution.*) 
		ErrorID 	: DINT; (*Error number*) 
		SegInfo  	:  McAcp6DSegInfoType; (*Segment information*) 
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_SegGetBarrierInfo_Acp6D (*Get barrier information on the segment*)
	VAR_INPUT
		Segment 	: REFERENCE TO Mc6DSegmentType; (*The segment reference establishes the connection between the function block and the segment.*) 
		Execute 	: BOOL; (*Execution of the function block begins on a rising edge of this input.*) 
	END_VAR
	VAR_OUTPUT
		Done 		: BOOL; (*Execution successful. Function block is finished*) 
		Busy 		:  BOOL; (*Function block is active and must continue to be called.*) 
		CommandAborted 	: BOOL; (*Command aborted by another command*) 
		Error 		: BOOL; (*Error occurred during execution.*) 
		ErrorID 	: DINT; (*Error number*) 
		BarrierInfo  	:  McAcp6DSegBarrierInfoType; (*Barrier information*) 
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK



FUNCTION_BLOCK MC_BR_SegBarrierCommand_Acp6D (*Open or release barrier on the segment*)
	VAR_INPUT
		Segment 	: REFERENCE TO Mc6DSegmentType; (*The segment reference establishes the connection between the function block and the segment.*) 
		Execute : BOOL; (*Execution of the function block begins on a rising edge of this input.*) 
		Parameters : McAcp6DBarrierCmdParType; (* Open or close selection*)
	END_VAR
		VAR_OUTPUT
		Done 		: BOOL; (*Execution successful. Function block is finished*) 
		Busy 		:  BOOL; (*Function block is active and must continue to be called.*) 
		CommandAborted 	: BOOL; (*Command aborted by another command*) 
		Error 		: BOOL; (*Error occurred during execution.*) 
		ErrorID 	: DINT; (*Error number*) 
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK


FUNCTION_BLOCK MC_BR_SegPowerOff_Acp6D (*Power off shuttles on the segment*)
	VAR_INPUT
		Segment 	: REFERENCE TO Mc6DSegmentType; (*The segment reference establishes the connection between the function block and the segment.*) 
		Execute : BOOL; (*Execution of the function block begins on a rising edge of this input.*) 
	END_VAR
		VAR_OUTPUT
		Done 		: BOOL; (*Execution successful. Function block is finished*) 
		Acknowledge : BOOL; (*Command is accepted by the controller. Command placed in motion buffer.*) 
		Busy 		:  BOOL; (*Function block is active and must continue to be called.*) 
		CommandAborted 	: BOOL; (*Command aborted by another command*) 
		Error 		: BOOL; (*Error occurred during execution.*) 
		ErrorID 	: DINT; (*Error number*) 
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_SegPowerOn_Acp6D (*Power on shuttles on the segment*)
	VAR_INPUT
		Segment 	: REFERENCE TO Mc6DSegmentType; (*The segment reference establishes the connection between the function block and the segment.*) 
		Execute : BOOL; (*Execution of the function block begins on a rising edge of this input.*) 
	END_VAR
		VAR_OUTPUT
		Done 		: BOOL; (*Execution successful. Function block is finished*) 
		Acknowledge : BOOL; (*Command is accepted by the controller. Command placed in motion buffer.*) 
		Busy 		:  BOOL; (*Function block is active and must continue to be called.*) 
		CommandAborted 	: BOOL; (*Command aborted by another command*) 
		Error 		: BOOL; (*Error occurred during execution.*) 
		ErrorID 	: DINT; (*Error number*) 
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_ZonePowerOff_Acp6D (*Power of shuttles inside the zone *)
	VAR_INPUT
		Zone 	: REFERENCE TO Mc6DZoneType; (*The zone reference establishes the connection between the function block and the zone.*) 
		Execute : BOOL; (*Execution of the function block begins on a rising edge of this input.*) 
	END_VAR
		VAR_OUTPUT
		Done 		: BOOL; (*Execution successful. Function block is finished*) 
		Acknowledge : BOOL; (*Command is accepted by the controller. Command placed in motion buffer.*) 
		Busy 		:  BOOL; (*Function block is active and must continue to be called.*) 
		CommandAborted 	: BOOL; (*Command aborted by another command*) 
		Error 		: BOOL; (*Error occurred during execution.*) 
		ErrorID 	: DINT; (*Error number*) 
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_ZonePowerOn_Acp6D (*Power on shuttles inside the zone*)
	VAR_INPUT
		Zone 	: REFERENCE TO Mc6DZoneType; (*The zone reference establishes the connection between the function block and the zone.*) 
		Execute : BOOL; (*Execution of the function block begins on a rising edge of this input.*) 
	END_VAR
		VAR_OUTPUT
		Done 		: BOOL; (*Execution successful. Function block is finished*) 
		Acknowledge : BOOL; (*Command is accepted by the controller. Command placed in motion buffer.*) 
		Busy 		:  BOOL; (*Function block is active and must continue to be called.*) 
		CommandAborted 	: BOOL; (*Command aborted by another command*) 
		Error 		: BOOL; (*Error occurred during execution.*) 
		ErrorID 	: DINT; (*Error number*) 
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_ZoneBarrierCommand_Acp6D (*Open or close barrier*) 
	VAR_INPUT
		Zone 	: REFERENCE TO Mc6DZoneType; (*The zone reference establishes the connection between the function block and the zone.*) 
		Execute : BOOL; (*Execution of the function block begins on a rising edge of this input.*) 
		Parameters : McAcp6DBarrierCmdParType; (*Open or close selection*)
	END_VAR
		VAR_OUTPUT
		Done 		: BOOL; (*Execution successful. Function block is finished*) 
		Busy 		:  BOOL; (*Function block is active and must continue to be called.*) 
		CommandAborted 	: BOOL; (*Command aborted by another command*) 
		Error 		: BOOL; (*Error occurred during execution.*) 
		ErrorID 	: DINT; (*Error number*) 
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_ZoneGetBarrierInfo_Acp6D (*Get barrier information*)
	VAR_INPUT
		Zone 		: REFERENCE TO Mc6DZoneType; (*The zone reference establishes the connection between the function block and the zone.*) 
		Execute 	: BOOL; (*Execution of the function block begins on a rising edge of this input.*) 
	END_VAR
	VAR_OUTPUT
		Done 			: BOOL; (*Execution successful. Function block is finished*) 
		Busy 			:  BOOL; (*Function block is active and must continue to be called.*) 
		CommandAborted 	: BOOL; (*Command aborted by another command*) 
		Error 		: BOOL; (*Error occurred during execution.*) 
		ErrorID 	: DINT; (*Error number*) 
		BarrierInfo  	:  McAcp6DZoneBarrierInfoType; (*Barrier information*) 
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_AsmReset_Acp6D (*Reset assembly from error state *)
	VAR_INPUT
		Assembly : REFERENCE TO Mc6DAssemblyType; (*The assembly reference establishes the connection between the function block and the assembly.*) 
		Execute : BOOL; (*Execution of the function block begins on a rising edge of this input.*) 
	END_VAR
		VAR_OUTPUT
		Done 		: BOOL; (*Execution successful. Function block is finished*) 
		Acknowledge : BOOL; (*Command is accepted by the controller. Command placed in motion buffer.*) 
		Busy 		:  BOOL; (*Function block is active and must continue to be called.*) 
		CommandAborted 	: BOOL; (*Command aborted by another command*) 
		Error 		: BOOL; (*Error occurred during execution.*) 
		ErrorID 	: DINT; (*Error number*) 
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_ShPlanet_Acp6D (*Add/Remove up to 32 planet shuttles *)
	VAR_INPUT
		Shuttle : REFERENCE TO Mc6DShuttleType; (*Sun reference. The controller reference provides the link between the function block and the Acopos6D shuttle.*) 
		Execute : BOOL; (*Execution of the function block begins on a rising edge of this input.*) 
		Parameters: McAcp6DPlanetParType; (*Parameters for add shuttles to sun/planet system group.*) 
	END_VAR
		VAR_OUTPUT
		Done 		: BOOL; (*Execution successful. Function block is finished*) 
		Busy 		:  BOOL; (*Function block is active and must continue to be called.*) 
		CommandAborted 	: BOOL; (*Command aborted by another command*) 
		Error 		: BOOL; (*Error occurred during execution.*) 
		ErrorID 	: DINT; (*Error number*) 
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_ShGroupAddShuttle_Acp6D (*Add up to 32 shuttles to a shuttle group *)
	VAR_INPUT
		ShuttleGroup : REFERENCE TO Mc6DShuttleGroupType; (*The shuttle reference provides the link between the function block and the Acopos6D shuttle.*) 
		Execute : BOOL; (*Execution of the function block begins on a rising edge of this input.*) 
		Parameters: McAcp6DShGroupAddShParType; (*Parameters for add shuttles to shuttle group.*) 
	END_VAR
		VAR_OUTPUT
		Done 		: BOOL; (*Execution successful. Function block is finished*) 
		Busy 		:  BOOL; (*Function block is active and must continue to be called.*) 
		CommandAborted 	: BOOL; (*Command aborted by another command*) 
		Error 		: BOOL; (*Error occurred during execution.*) 
		ErrorID 	: DINT; (*Error number*) 
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_ShGroupClear_Acp6D (*Clear all shuttles from a shuttle group*)
	VAR_INPUT
		ShuttleGroup : REFERENCE TO Mc6DShuttleGroupType; (*The shuttle reference provides the link between the function block and the Acopos6D shuttle.*) 
		Execute : BOOL; (*Execution of the function block begins on a rising edge of this input.*) 
	END_VAR
		VAR_OUTPUT
		Done 		: BOOL; (*Execution successful. Function block is finished*) 
		Busy 		:  BOOL; (*Function block is active and must continue to be called.*) 
		CommandAborted 	: BOOL; (*Command aborted by another command*) 
		Error 		: BOOL; (*Error occurred during execution.*) 
		ErrorID 	: DINT; (*Error number*) 
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_ShGroupGetInfo_Acp6D (*Get info from a shuttle group*)
	VAR_INPUT
		ShuttleGroup : REFERENCE TO Mc6DShuttleGroupType; (*The shuttle reference provides the link between the function block and the Acopos6D shuttle.*) 
		Execute : BOOL; (*Execution of the function block begins on a rising edge of this input.*) 
	END_VAR
		VAR_OUTPUT
		Done 		: BOOL; (*Execution successful. Function block is finished*) 
		Busy 		:  BOOL; (*Function block is active and must continue to be called.*) 
		CommandAborted 	: BOOL; (*Command aborted by another command*) 
		Error 		: BOOL; (*Error occurred during execution.*) 
		ErrorID 	: DINT; (*Error number*)
		Info		: McAcp6DShGroupInfoType;
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_ShGroupCoupleCtrl_Acp6D (*Couple or decouple a shuttle group*)
	VAR_INPUT
		ShuttleGroup : REFERENCE TO Mc6DShuttleGroupType; (*The shuttle reference provides the link between the function block and the Acopos6D shuttle.*) 
		Execute : BOOL; (*Execution of the function block begins on a rising edge of this input.*)
		Parameters : McAcp6DShGroupCoupleCtrlParType; (* Parameters for coupling a shuttle group. *)
	END_VAR
		VAR_OUTPUT
		Done 		: BOOL; (*Execution successful. Function block is finished*) 
		Busy 		:  BOOL; (*Function block is active and must continue to be called.*) 
		CommandAborted 	: BOOL; (*Command aborted by another command*) 
		Error 		: BOOL; (*Error occurred during execution.*) 
		ErrorID 	: DINT; (*Error number*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_ShGroupBuffer_Acp6D (*Block and release a shuttle group buffer or decouple a shuttle group*)
	VAR_INPUT
		ShuttleGroup : REFERENCE TO Mc6DShuttleGroupType; (*The shuttle reference provides the link between the function block and the Acopos6D shuttle.*) 
		Execute : BOOL; (*Execution of the function block begins on a rising edge of this input.*)
		Option : McAcp6DShGroupBufferOptionEnum; (*Buffer parameters*)
	END_VAR
		VAR_OUTPUT
		Done 		: BOOL; (*Execution successful. Function block is finished*) 
		Busy 		:  BOOL; (*Function block is active and must continue to be called.*) 
		CommandAborted 	: BOOL; (*Command aborted by another command*) 
		Error 		: BOOL; (*Error occurred during execution.*) 
		ErrorID 	: DINT; (*Error number*)
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_ShGroupDelete_Acp6D (*Delete a shuttle group*)
	VAR_INPUT
		ShuttleGroup : REFERENCE TO Mc6DShuttleGroupType; (*The shuttle reference provides the link between the function block and the Acopos6D shuttle.*) 
		Execute : BOOL; (*Execution of the function block begins on a rising edge of this input.*) 
	END_VAR
		VAR_OUTPUT
		Done 		: BOOL; (*Execution successful. Function block is finished*) 
		Busy 		:  BOOL; (*Function block is active and must continue to be called.*) 
		CommandAborted 	: BOOL; (*Command aborted by another command*) 
		Error 		: BOOL; (*Error occurred during execution.*) 
		ErrorID 	: DINT; (*Error number*) 
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_RotaryMotion_Acp6D (*Move a single shuttle in a 0-360 degree motion *)
	VAR_INPUT
		Shuttle : REFERENCE TO Mc6DShuttleType; (*The shuttle reference establishes the connection between the function block and the shuttle.*)
		Execute : BOOL; (*Execution of the function block begins on a rising edge of this input.*) 
		Parameters: McAcp6DRotaryMotionParType; (*Parameters for a rotary motion.*) 
		CommandLabel : UINT; (*Optional command label to be associated with this command.*) 
	END_VAR
		VAR_OUTPUT
		Done 		: BOOL; (*Execution successful. Function block is finished*) 
		Acknowledge : BOOL; (*Command is accepted by the controller. Command placed in motion buffer.*) 
		Busy 		:  BOOL; (*Function block is active and must continue to be called.*) 
		CommandAborted 	: BOOL; (*Command aborted by another command*) 
		Error 		: BOOL; (*Error occurred during execution.*) 
		ErrorID 	: DINT; (*Error number*) 
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK

FUNCTION_BLOCK MC_BR_RotaryMotionSpin_Acp6D (*Move a single shuttle in a finite or infinite rotary motion *)
	VAR_INPUT
		Shuttle : REFERENCE TO Mc6DShuttleType; (*The shuttle reference establishes the connection between the function block and the shuttle.*)
		Execute : BOOL; (*Execution of the function block begins on a rising edge of this input.*) 
		Parameters: McAcp6DRotaryMotionSpinParType; (*Parameters for a rotary motion.*) 
		CommandLabel : UINT; (*Optional command label to be associated with this command.*) 
	END_VAR
		VAR_OUTPUT
		Done 		: BOOL; (*Execution successful. Function block is finished*) 
		Acknowledge : BOOL; (*Command is accepted by the controller. Command placed in motion buffer.*) 
		Busy 		:  BOOL; (*Function block is active and must continue to be called.*) 
		CommandAborted 	: BOOL; (*Command aborted by another command*) 
		Error 		: BOOL; (*Error occurred during execution.*) 
		ErrorID 	: DINT; (*Error number*) 
	END_VAR
	VAR
		Internal : McInternalType;
	END_VAR
END_FUNCTION_BLOCK



