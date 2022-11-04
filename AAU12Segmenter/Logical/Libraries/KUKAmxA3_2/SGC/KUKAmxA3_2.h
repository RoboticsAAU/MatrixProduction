/* Automation Studio generated header file */
/* Do not edit ! */
/* KUKAmxA3_2 3.02.0 */

#ifndef _KUKAMXA3_2_
#define _KUKAMXA3_2_
#ifdef __cplusplus
extern "C" 
{
#endif
#ifndef _KUKAmxA3_2_VERSION
#define _KUKAmxA3_2_VERSION 3.02.0
#endif

#include <bur/plctypes.h>

#ifndef _BUR_PUBLIC
#define _BUR_PUBLIC
#endif
/* Datatypes and datatypes of function blocks */
#ifdef _BUR_USE_DECLARATION_IN_IEC
typedef float MXA_CMD_PAR_REAL[100];
#else
/* Data type MXA_CMD_PAR_REAL not declared. Derived data types with an array data type as base type whose starting index is not equal to zero cannot be used in ANSI C programs / libraries.*/
#endif

#ifdef _BUR_USE_DECLARATION_IN_IEC
typedef signed long MXA_CMD_PAR_INT[50];
#else
/* Data type MXA_CMD_PAR_INT not declared. Derived data types with an array data type as base type whose starting index is not equal to zero cannot be used in ANSI C programs / libraries.*/
#endif

#ifdef _BUR_USE_DECLARATION_IN_IEC
typedef plcbit MXA_CMD_PAR_BOOL[50];
#else
/* Data type MXA_CMD_PAR_BOOL not declared. Derived data types with an array data type as base type whose starting index is not equal to zero cannot be used in ANSI C programs / libraries.*/
#endif

typedef struct MXA_COMMAND
{	signed long CommandID;
	signed long OrderID;
	signed long BufferMode;
	signed short CommandSize;
	MXA_CMD_PAR_REAL CmdParReal;
	MXA_CMD_PAR_INT CmdParInt;
	MXA_CMD_PAR_BOOL CmdParBool;
} MXA_COMMAND;

typedef struct MXA_CMD_STATE_RET
{	signed long SR_OrderID;
	signed short SR_State;
} MXA_CMD_STATE_RET;

#ifdef _BUR_USE_DECLARATION_IN_IEC
typedef MXA_CMD_STATE_RET MXA_CMD_SR_ARR[10];
#else
/* Data type MXA_CMD_SR_ARR not declared. Derived data types with an array data type as base type whose starting index is not equal to zero cannot be used in ANSI C programs / libraries.*/
#endif

#ifdef _BUR_USE_DECLARATION_IN_IEC
typedef float MXA_CMD_DATA_RET[12];
#else
/* Data type MXA_CMD_DATA_RET not declared. Derived data types with an array data type as base type whose starting index is not equal to zero cannot be used in ANSI C programs / libraries.*/
#endif

typedef struct MXA_COMMAND_STATUS
{	signed long CmdIDRet;
	signed long OrderIDRet;
	signed short TransmissionNoRet;
	MXA_CMD_SR_ARR StateReturn;
	MXA_CMD_DATA_RET CmdDataReturn;
	signed long CmdDataRetCSKRC;
	signed long CmdDataRetCSPLC;
} MXA_COMMAND_STATUS;

typedef struct MXA_AUTEXT_CONTROL
{	plcbyte PGNO;
	plcbit PGNO_PARITY;
	plcbit PGNO_VALID;
	plcbit EXT_START;
	plcbit MOVE_ENABLE;
	plcbit MOVE_DISABLE;
	plcbit CONF_MESS;
	plcbit DrivesON;
	plcbit DrivesOFF;
	plcbit BRAKETEST_REQ_EXT;
	plcbit MASTERINGTEST_REQ_EXT;
} MXA_AUTEXT_CONTROL;

typedef struct MXA_AUTEXT_STATE
{	plcbit RC_RDY1;
	plcbit ALARM_STOP;
	plcbit USER_SAFE;
	plcbit PERI_RDY;
	plcbit ROB_CAL;
	plcbit IO_ACTCONF;
	plcbit STOPMESS;
	plcbit PGNO_FBIT_REFL;
	plcbit IntNotAus;
	plcbit PRO_ACT;
	plcbit PGNO_REQ;
	plcbit APPL_RUN;
	plcbit PRO_MOVE;
	plcbit IN_HOME;
	plcbit ON_PATH;
	plcbit NEAR_POSRET;
	plcbit ROB_STOPPED;
	plcbit T1;
	plcbit T2;
	plcbit AUT;
	plcbit EXT;
	plcbit KCP_CONNECT;
	plcbit BRAKETEST_MONTIME;
	plcbit BRAKETEST_REQ_INT;
	plcbit BRAKETEST_WORK;
	plcbit BRAKES_OK;
	plcbit BRAKETEST_WARN;
	plcbit MASTERINGTEST_REQ_INT;
	plcbit MASTERINGTESTSWITCH_OK;
} MXA_AUTEXT_STATE;

typedef struct E6POS
{	float X;
	float Y;
	float Z;
	float A;
	float B;
	float C;
	signed short Status;
	signed short Turn;
	float E1;
	float E2;
	float E3;
	float E4;
	float E5;
	float E6;
} E6POS;

typedef struct E6AXIS
{	float A1;
	float A2;
	float A3;
	float A4;
	float A5;
	float A6;
	float E1;
	float E2;
	float E3;
	float E4;
	float E5;
	float E6;
} E6AXIS;

#ifdef _BUR_USE_DECLARATION_IN_IEC
typedef signed short MXA_IR_STATE[8];
#else
/* Data type MXA_IR_STATE not declared. Derived data types with an array data type as base type whose starting index is not equal to zero cannot be used in ANSI C programs / libraries.*/
#endif

typedef struct MXA_KRC_STATE
{	struct E6POS PosAct;
	signed short ToolAct;
	signed short BaseAct;
	signed short IpoModeAct;
	plcbit PosActValid;
	struct E6AXIS AxisAct;
	plcbit AxisActValid;
	signed short OvProAct;
	float VelAct;
	plcbit BrakeActive;
	signed short Workstates;
	signed short AxWorkstates;
	signed short GroupState;
	signed long ErrorID;
	signed long ErrorIDSub;
	signed long ErrorIDPCOS;
	signed long ActivePosOrderID;
	signed long ActiveOrderIDB;
	signed short Heartbeat;
	signed short HeartbeatPCOS;
	MXA_IR_STATE InterruptState;
	signed short QueueCount;
	plcbit TouchUP;
	signed short TouchUP_Index;
	signed short IN_VAL_1TO8;
} MXA_KRC_STATE;

typedef struct MXA_KRC_CONTROL
{	plcbit RESET;
	signed short Override;
	plcbit Brake;
	plcbit BrakeF;
	plcbit ReleaseBrake;
	plcbit ShowTrace;
	plcbit MessageReset;
	plcbit OUT_VAL_1;
	plcbit OUT_VAL_2;
	plcbit OUT_VAL_3;
	plcbit OUT_VAL_4;
	plcbit OUT_VAL_5;
	plcbit OUT_VAL_6;
	plcbit OUT_VAL_7;
	plcbit OUT_VAL_8;
	plcbit WRITE_OUT_1TO8;
} MXA_KRC_CONTROL;

typedef struct AXIS_GROUP_REF
{	plcbit Initialized;
	plcbit Online;
	signed long LastOrderID;
	plcbit ReadAxisGroupInit;
	plcbit ReadDone;
	signed long IntErrorID;
	signed long IntFBErrorID;
	signed long HeartBeatTO;
	signed long PLC_Major;
	signed long PLC_Minor;
	float DEF_VEL_CP;
	float DEF_ACC_CP;
	struct MXA_COMMAND Command;
	struct MXA_COMMAND_STATUS CmdState;
	struct MXA_AUTEXT_CONTROL AutExtControl;
	struct MXA_AUTEXT_STATE AutExtState;
	struct MXA_KRC_STATE KRCState;
	struct MXA_KRC_CONTROL KRCControl;
} AXIS_GROUP_REF;

typedef struct APO
{	signed short PTP_MODE;
	signed short CP_MODE;
	signed short CPTP;
	float CDIS;
	float CORI;
	signed short CVEL;
} APO;

typedef struct COORDSYS
{	signed short TOOL;
	signed short BASE;
	signed short IPO_Mode;
} COORDSYS;

typedef struct FRAME
{	float X;
	float Y;
	float Z;
	float A;
	float B;
	float C;
} FRAME;

#ifdef _BUR_USE_DECLARATION_IN_IEC
typedef struct PNetWriteData
{	unsigned long udiAPI;
	unsigned long udiDataLength;
	unsigned short uiSlot;
	unsigned short uiSubslot;
	unsigned short uiIndex;
	signed long OrderID;
	signed long CommandID;
	signed long BufferMode;
	signed long CheckSum;
	signed long Reserve1;
	signed long Reserve2;
	signed long Reserve3;
	signed long Reserve4;
	signed long Reserve5;
	signed long Reserve6;
	signed long Reserve7;
	signed long Reserve8;
	signed long Reserve9;
	signed long Reserve10;
	signed long Reserve11;
	signed long Reserve12;
	signed long Reserve13;
	signed long Reserve14;
	signed long Reserve15;
	signed long Reserve16;
	plcdword CmdParBool_Byte1;
	plcdword CmdParBool_Byte2;
	signed long CmdParBoolInt[50];
	float CmdParBoolReal[100];
} PNetWriteData;
#else
/* Data type PNetWriteData not declared. Data types with array elements whose starting indexes are not equal to zero cannot be used in ANSI C programs / libraries.*/
#endif

typedef struct POSITION
{	struct COORDSYS COORDSYS;
	struct E6POS E6POS;
	struct E6AXIS E6AXIS;
} POSITION;

typedef struct AXBOX
{	float A1_N;
	float A2_N;
	float A3_N;
	float A4_N;
	float A5_N;
	float A6_N;
	float A1_P;
	float A2_P;
	float A3_P;
	float A4_P;
	float A5_P;
	float A6_P;
	float E1_N;
	float E2_N;
	float E3_N;
	float E4_N;
	float E5_N;
	float E6_N;
	float E1_P;
	float E2_P;
	float E3_P;
	float E4_P;
	float E5_P;
	float E6_P;
} AXBOX;

typedef struct BOX
{	float X;
	float Y;
	float Z;
	float A;
	float B;
	float C;
	float X1;
	float X2;
	float Y1;
	float Y2;
	float Z1;
	float Z2;
} BOX;

#ifdef _BUR_USE_DECLARATION_IN_IEC
typedef AXIS_GROUP_REF AXIS_GROUP_REF_ARR[5];
#else
/* Data type AXIS_GROUP_REF_ARR not declared. Derived data types with an array data type as base type whose starting index is not equal to zero cannot be used in ANSI C programs / libraries.*/
#endif

#ifdef _BUR_USE_DECLARATION_IN_IEC
typedef struct mxA_ResetCommand
{
	/* VAR_INPUT (analog) */
	signed short AxisGroupIdx;
	struct AXIS_GROUP_REF (*KRC_AxisGroupRefArr)[5];
	/* VAR (analog) */
	signed short i;
	unsigned char Robots;
} mxA_ResetCommand_typ;
#else
/* Data type mxA_ResetCommand not declared. Data types with array elements whose starting indexes are not equal to zero cannot be used in ANSI C programs / libraries.*/
#endif

typedef struct mxA_GetOrderState
{
	/* VAR_INPUT (analog) */
	signed short AxisGroupIdx;
	AXIS_GROUP_REF_ARR* KRC_AxisGroupRefArr;
	signed long OrderID;
	/* VAR_OUTPUT (analog) */
	signed short OrderState;
	/* VAR (analog) */
	signed short i;
	signed short m_OrderState;
} mxA_GetOrderState_typ;

typedef struct mxA_ExecuteCommand
{
	/* VAR_INPUT (analog) */
	signed short AxisGroupIdx;
	AXIS_GROUP_REF_ARR* KRC_AxisGroupRefArr;
	signed long CmdID;
	signed short BufferMode;
	signed short CommandSize;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct mxA_ResetCommand ResetCommand_1;
	struct mxA_GetOrderState GetOrderState_1;
	signed short m_State;
	signed long m_OrderID;
	signed short m_CommandSize;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	plcbit EnableDirectExe;
	plcbit EnableQueueExe;
	plcbit IgnoreInit;
	/* VAR_OUTPUT (digital) */
	plcbit WriteCmdPar;
	plcbit Busy;
	plcbit Active;
	plcbit Done;
	plcbit CmdSpecific1;
	plcbit Aborted;
	plcbit Error;
	plcbit ReadCmdDataRet;
	/* VAR (digital) */
	plcbit m_ExecuteLast;
	plcbit m_RE_Execute;
} mxA_ExecuteCommand_typ;

typedef struct KRC_Abort
{
	/* VAR_INPUT (analog) */
	signed short AxisGroupIdx;
	AXIS_GROUP_REF_ARR* KRC_AxisGroupRefArr;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct mxA_ExecuteCommand mxA_ExecuteCommand_1;
	/* VAR_INPUT (digital) */
	plcbit ExecuteCmd;
	/* VAR_OUTPUT (digital) */
	plcbit Busy;
	plcbit Done;
	plcbit Error;
} KRC_Abort_typ;

typedef struct KRC_ActivateConvInterrupt
{
	/* VAR_INPUT (analog) */
	signed short AxisGroupIdx;
	AXIS_GROUP_REF_ARR* KRC_AxisGroupRefArr;
	signed short ConveyorNumber;
	signed short BufferMode;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct mxA_ExecuteCommand mxA_ExecuteCommand_1;
	/* VAR_INPUT (digital) */
	plcbit ExecuteCmd;
	/* VAR_OUTPUT (digital) */
	plcbit Busy;
	plcbit Active;
	plcbit Done;
	plcbit Aborted;
	plcbit Error;
} KRC_ActivateConvInterrupt_typ;

typedef struct KRC_ActivateInterrupt
{
	/* VAR_INPUT (analog) */
	signed short AxisGroupIdx;
	AXIS_GROUP_REF_ARR* KRC_AxisGroupRefArr;
	signed short Interrupt;
	signed short BufferMode;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct mxA_ExecuteCommand mxA_ExecuteCommand_1;
	/* VAR_INPUT (digital) */
	plcbit ExecuteCmd;
	/* VAR_OUTPUT (digital) */
	plcbit Busy;
	plcbit Done;
	plcbit Aborted;
	plcbit Error;
} KRC_ActivateInterrupt_typ;

typedef struct KRC_AutomaticExternal
{
	/* VAR_INPUT (analog) */
	signed short AxisGroupIdx;
	AXIS_GROUP_REF_ARR* KRC_AxisGroupRefArr;
	/* VAR_INPUT (digital) */
	plcbit MOVE_ENABLE;
	plcbit CONF_MESS;
	plcbit DRIVES_ON;
	plcbit DRIVES_OFF;
	plcbit EXT_START;
	plcbit RESET;
	plcbit ENABLE_T1;
	plcbit ENABLE_T2;
	plcbit ENABLE_AUT;
	plcbit ENABLE_EXT;
	/* VAR_OUTPUT (digital) */
	plcbit Valid;
	plcbit RC_RDY1;
	plcbit ALARM_STOP;
	plcbit USER_SAFE;
	plcbit PERI_RDY;
	plcbit ROB_CAL;
	plcbit IO_ACTCONF;
	plcbit STOPMESS;
	plcbit INT_E_STOP;
	plcbit PRO_ACT;
	plcbit APPL_RUN;
	plcbit PRO_MOVE;
	plcbit ON_PATH;
	plcbit NEAR_POSRET;
	plcbit ROB_STOPPED;
	plcbit T1;
	plcbit T2;
	plcbit AUT;
	plcbit EXT;
} KRC_AutomaticExternal_typ;

typedef struct KRC_ReadMXAError
{
	/* VAR_INPUT (analog) */
	signed short AxisGroupIdx;
	AXIS_GROUP_REF_ARR* KRC_AxisGroupRefArr;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR_OUTPUT (digital) */
	plcbit Error;
} KRC_ReadMXAError_typ;

typedef struct KRC_MessageReset
{
	/* VAR_INPUT (analog) */
	signed short AxisGroupIdx;
	AXIS_GROUP_REF_ARR* KRC_AxisGroupRefArr;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	signed short i;
	/* VAR_INPUT (digital) */
	plcbit MessageReset;
	/* VAR_OUTPUT (digital) */
	plcbit Error;
} KRC_MessageReset_typ;

typedef struct KRC_AutoStart
{
	/* VAR_INPUT (analog) */
	signed short AxisGroupIdx;
	AXIS_GROUP_REF_ARR* KRC_AxisGroupRefArr;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	signed long m_State;
	struct KRC_ReadMXAError KRC_ReadMXAError;
	struct KRC_MessageReset KRC_MessageReset;
	struct TON TON_ON;
	struct TON TON_OFF;
	struct TON TON_1;
	struct TON TON_2;
	struct TON TON_3;
	struct TON TON_4;
	struct F_TRIG F_TRIG_1;
	struct TP TP_1;
	/* VAR_INPUT (digital) */
	plcbit ExecuteReset;
	/* VAR_OUTPUT (digital) */
	plcbit Busy;
	plcbit Done;
	plcbit DispActive;
	plcbit ResetValid;
	plcbit Error;
	/* VAR (digital) */
	plcbit m_ConfMess;
	plcbit m_Reset;
	plcbit m_RE_ExecuteReset;
	plcbit m_ExecuteResetLast;
} KRC_AutoStart_typ;

typedef struct KRC_Move
{
	/* VAR_INPUT (analog) */
	signed short AxisGroupIdx;
	AXIS_GROUP_REF_ARR* KRC_AxisGroupRefArr;
	signed long CmdID;
	signed short MoveType;
	struct E6POS Position;
	struct E6POS CircHP;
	struct E6AXIS AxisPosition;
	signed short Velocity;
	signed short Acceleration;
	float AbsoluteAcceleration;
	struct COORDSYS CoordinateSystem;
	signed short OriType;
	struct APO Approximate;
	signed short CircType;
	float CircAngle;
	signed short BufferMode;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct mxA_ExecuteCommand mxA_ExecuteCommand_1;
	signed short CommandSize;
	signed short AbsoluteVelocity;
	signed long m_Velocity;
	signed long m_Acceleration;
	/* VAR_INPUT (digital) */
	plcbit ExecuteCmd;
	plcbit PosValidX;
	plcbit PosValidY;
	plcbit PosValidZ;
	plcbit PosValidA;
	plcbit PosValidB;
	plcbit PosValidC;
	plcbit PosValidE1;
	plcbit PosValidE2;
	plcbit PosValidE3;
	plcbit PosValidE4;
	plcbit PosValidE5;
	plcbit PosValidE6;
	plcbit PosValidS;
	plcbit PosValidT;
	/* VAR_OUTPUT (digital) */
	plcbit Busy;
	plcbit Active;
	plcbit Done;
	plcbit Aborted;
	plcbit Error;
} KRC_Move_typ;

typedef struct KRC_BrakeTest
{
	/* VAR_INPUT (analog) */
	signed short AxisGroupIdx;
	AXIS_GROUP_REF_ARR* KRC_AxisGroupRefArr;
	struct E6POS ParkPosition;
	signed short ParkVelocity;
	signed short ParkAcceleration;
	struct COORDSYS ParkCoordinateSystem;
	signed short BufferMode;
	/* VAR_OUTPUT (analog) */
	signed long Result;
	signed long ErrorID;
	/* VAR (analog) */
	struct KRC_Move KRC_Move_1;
	/* VAR_INPUT (digital) */
	plcbit ExecuteCmd;
	/* VAR_OUTPUT (digital) */
	plcbit Busy;
	plcbit Active;
	plcbit Done;
	plcbit Aborted;
	plcbit Error;
} KRC_BrakeTest_typ;

typedef struct KRC_Continue
{
	/* VAR_INPUT (analog) */
	signed short AxisGroupIdx;
	AXIS_GROUP_REF_ARR* KRC_AxisGroupRefArr;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	/* VAR_OUTPUT (digital) */
	plcbit Error;
} KRC_Continue_typ;

typedef struct KRC_ConvFollow
{
	/* VAR_INPUT (analog) */
	signed short AxisGroupIdx;
	AXIS_GROUP_REF_ARR* KRC_AxisGroupRefArr;
	signed short ConveyorNumber;
	float StartDistance;
	float MaxDistance;
	signed short BufferMode;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct mxA_ExecuteCommand mxA_ExecuteCommand_1;
	/* VAR_INPUT (digital) */
	plcbit ExecuteCmd;
	/* VAR_OUTPUT (digital) */
	plcbit Busy;
	plcbit Active;
	plcbit Done;
	plcbit Aborted;
	plcbit MaxDistanceReached;
	plcbit Error;
} KRC_ConvFollow_typ;

typedef struct KRC_ConvIniOff
{
	/* VAR_INPUT (analog) */
	signed short AxisGroupIdx;
	AXIS_GROUP_REF_ARR* KRC_AxisGroupRefArr;
	signed short ConveyorNumber;
	signed short BufferMode;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct mxA_ExecuteCommand mxA_ExecuteCommand_1;
	/* VAR_INPUT (digital) */
	plcbit ExecuteCmd;
	/* VAR_OUTPUT (digital) */
	plcbit Busy;
	plcbit Done;
	plcbit Aborted;
	plcbit Error;
} KRC_ConvIniOff_typ;

typedef struct KRC_ConvOn
{
	/* VAR_INPUT (analog) */
	signed short AxisGroupIdx;
	AXIS_GROUP_REF_ARR* KRC_AxisGroupRefArr;
	signed short ConveyorNumber;
	signed short BufferMode;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct mxA_ExecuteCommand mxA_ExecuteCommand_1;
	/* VAR_INPUT (digital) */
	plcbit ExecuteCmd;
	/* VAR_OUTPUT (digital) */
	plcbit Busy;
	plcbit Done;
	plcbit Aborted;
	plcbit Error;
} KRC_ConvOn_typ;

typedef struct KRC_ConvSkip
{
	/* VAR_INPUT (analog) */
	signed short AxisGroupIdx;
	AXIS_GROUP_REF_ARR* KRC_AxisGroupRefArr;
	signed short ConveyorNumber;
	signed short PieceNumber;
	float StartDistance;
	float MaxDistance;
	signed short BufferMode;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct mxA_ExecuteCommand mxA_ExecuteCommand_1;
	/* VAR_INPUT (digital) */
	plcbit ExecuteCmd;
	/* VAR_OUTPUT (digital) */
	plcbit Busy;
	plcbit Active;
	plcbit Done;
	plcbit Aborted;
	plcbit MaxDistanceReached;
	plcbit Error;
} KRC_ConvSkip_typ;

typedef struct KRC_DeactivateConvInterrupt
{
	/* VAR_INPUT (analog) */
	signed short AxisGroupIdx;
	AXIS_GROUP_REF_ARR* KRC_AxisGroupRefArr;
	signed short ConveyorNumber;
	signed short BufferMode;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct mxA_ExecuteCommand mxA_ExecuteCommand_1;
	/* VAR_INPUT (digital) */
	plcbit ExecuteCmd;
	/* VAR_OUTPUT (digital) */
	plcbit Busy;
	plcbit Active;
	plcbit Done;
	plcbit Aborted;
	plcbit Error;
} KRC_DeactivateConvInterrupt_typ;

typedef struct KRC_DeactivateInterrupt
{
	/* VAR_INPUT (analog) */
	signed short AxisGroupIdx;
	AXIS_GROUP_REF_ARR* KRC_AxisGroupRefArr;
	signed short Interrupt;
	signed short BufferMode;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct mxA_ExecuteCommand mxA_ExecuteCommand_1;
	/* VAR_INPUT (digital) */
	plcbit ExecuteCmd;
	/* VAR_OUTPUT (digital) */
	plcbit Busy;
	plcbit Done;
	plcbit Aborted;
	plcbit Error;
} KRC_DeactivateInterrupt_typ;

typedef struct KRC_DeclareInterrupt
{
	/* VAR_INPUT (analog) */
	signed short AxisGroupIdx;
	AXIS_GROUP_REF_ARR* KRC_AxisGroupRefArr;
	signed short Interrupt;
	signed short Input;
	signed short Reaction;
	signed short BufferMode;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct mxA_ExecuteCommand mxA_ExecuteCommand_1;
	/* VAR_INPUT (digital) */
	plcbit ExecuteCmd;
	plcbit InputValue;
	/* VAR_OUTPUT (digital) */
	plcbit Busy;
	plcbit Done;
	plcbit Aborted;
	plcbit Error;
} KRC_DeclareInterrupt_typ;

typedef struct KRC_Diag
{
	/* VAR_INPUT (analog) */
	signed short AxisGroupIdx;
	AXIS_GROUP_REF_ARR* KRC_AxisGroupRefArr;
	signed short MaxSubmitCycle;
	/* VAR_OUTPUT (analog) */
	signed short QueueCount;
	signed short SubmitHeartbeat;
	signed short SubmitCyc_Act;
	signed short SubmitCyc_Min;
	signed short SubmitCyc_Max;
	signed short SubmitCyc_Avg;
	signed long ActivePosOrderID;
	signed long ActiveOrderIDB;
	signed long Avg_Duration;
	signed short ProconosHeartbeat;
	signed short ProconosCyc_Act;
	signed short ProconosCyc_Min;
	signed short ProconosCyc_Max;
	signed short ProconosCyc_Avg;
	signed long ErrorID_RI;
	signed long ErrorID_SI;
	signed long ErrorID_PLC;
	signed long ErrorID_PCOS;
	signed long ErrorID;
	/* VAR (analog) */
	struct TON TON_1Sec;
	signed short HBLast;
	signed short HBCycDiff;
	signed long HBSum;
	signed long CyclCnt;
	signed long PCOSHBLast;
	signed long PCOSHBCycDiff;
	signed long PCOSHBSum;
	signed long SecSum;
	signed long HBCycDiff1000;
	signed long CyclCnt1000;
	signed long PCOSHBCycDiff1000;
	/* VAR_INPUT (digital) */
	plcbit ShowTrace;
	/* VAR_OUTPUT (digital) */
	plcbit Valid;
	plcbit PosActValid;
	plcbit BrakeActive;
	plcbit Error;
} KRC_Diag_typ;

typedef struct KRC_Error
{
	/* VAR_INPUT (analog) */
	signed short AxisGroupIdx;
	AXIS_GROUP_REF_ARR* KRC_AxisGroupRefArr;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct KRC_ReadMXAError KRC_ReadMXAError_1;
	struct KRC_MessageReset KRC_MessageReset_1;
	struct TON TON_ON;
	struct TON TON_OFF;
	struct TON TON_HBSub;
	struct TON TON_HBPCOS;
	signed short m_HeartbeatLast;
	signed short m_HeartbeatLastPCOS;
	/* VAR_INPUT (digital) */
	plcbit MessageReset;
	/* VAR_OUTPUT (digital) */
	plcbit Error;
	plcbit NoHeartbeatKRC;
	plcbit NoHeartbeatPCOS;
	plcbit NotOnline;
	plcbit NotInitialized;
	plcbit NoOpModeExt;
	plcbit NoMoveEnable;
	plcbit UserSafeNotOK;
	plcbit KrcErrorActive;
	plcbit DrivesNotReady;
	plcbit NoProgActive;
	/* VAR (digital) */
	plcbit EnableTONSubmit;
	plcbit EnableTONPCOS;
} KRC_Error_typ;

typedef struct KRC_Forward
{
	/* VAR_INPUT (analog) */
	signed short AxisGroupIdx;
	AXIS_GROUP_REF_ARR* KRC_AxisGroupRefArr;
	struct E6AXIS Axis_Values;
	signed short BufferMode;
	/* VAR_OUTPUT (analog) */
	struct E6POS Position;
	signed long ErrorID;
	/* VAR (analog) */
	signed short nState;
	struct mxA_ExecuteCommand mxA_ExecuteCommand_0;
	struct mxA_ExecuteCommand mxA_ExecuteCommand_1;
	struct mxA_ExecuteCommand mxA_ExecuteCommand_2;
	signed long nOrderID;
	float ERR_STATUS;
	struct E6POS m_Position;
	signed short nErr;
	/* VAR_INPUT (digital) */
	plcbit ExecuteCmd;
	plcbit CheckSoftEnd;
	/* VAR_OUTPUT (digital) */
	plcbit Busy;
	plcbit Done;
	plcbit Aborted;
	plcbit Error;
} KRC_Forward_typ;

typedef struct KRC_GetAdvance
{
	/* VAR_INPUT (analog) */
	signed short AxisGroupIdx;
	AXIS_GROUP_REF_ARR* KRC_AxisGroupRefArr;
	/* VAR_OUTPUT (analog) */
	signed short Count;
	signed short MaxWaitTime;
	signed short Mode;
	signed long ErrorID;
	/* VAR (analog) */
	struct mxA_ExecuteCommand mxA_ExecuteCommand;
	/* VAR_INPUT (digital) */
	plcbit ExecuteCmd;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Error;
} KRC_GetAdvance_typ;

typedef struct KRC_Initialize
{
	/* VAR_INPUT (analog) */
	signed short AxisGroupIdx;
	AXIS_GROUP_REF_ARR* KRC_AxisGroupRefArr;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	signed long KRC_Serial;
	signed long KRC_Major;
	signed long KRC_Minor;
	signed long KRC_Revision;
	signed long PLC_Major;
	signed long PLC_Minor;
	signed long PLC_Revision;
	/* VAR (analog) */
	struct mxA_ExecuteCommand mxA_ExecuteCommand;
	struct mxA_ResetCommand mxA_ResetCommand;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Error;
} KRC_Initialize_typ;

typedef struct KRC_Interrupt
{
	/* VAR_INPUT (analog) */
	signed short AxisGroupIdx;
	AXIS_GROUP_REF_ARR* KRC_AxisGroupRefArr;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	plcbit Fast;
	/* VAR_OUTPUT (digital) */
	plcbit BrakeActive;
	plcbit Error;
} KRC_Interrupt_typ;

typedef struct KRC_Inverse
{
	/* VAR_INPUT (analog) */
	signed short AxisGroupIdx;
	AXIS_GROUP_REF_ARR* KRC_AxisGroupRefArr;
	struct E6POS Position;
	struct E6AXIS Start_Axis;
	signed short BufferMode;
	/* VAR_OUTPUT (analog) */
	struct E6AXIS AxisPosition;
	signed long ErrorID;
	/* VAR (analog) */
	signed short nState;
	struct mxA_ExecuteCommand mxA_ExecuteCommand_0;
	struct mxA_ExecuteCommand mxA_ExecuteCommand_1;
	struct mxA_ExecuteCommand mxA_ExecuteCommand_2;
	signed long nOrderID;
	float ERR_STATUS;
	struct E6AXIS m_Position;
	signed short nErr;
	/* VAR_INPUT (digital) */
	plcbit ExecuteCmd;
	plcbit PosValidS;
	plcbit PosValidT;
	plcbit CheckSoftEnd;
	/* VAR_OUTPUT (digital) */
	plcbit Busy;
	plcbit Done;
	plcbit Aborted;
	plcbit Error;
} KRC_Inverse_typ;

typedef struct KRC_Jog
{
	/* VAR_INPUT (analog) */
	signed short AxisGroupIdx;
	AXIS_GROUP_REF_ARR* KRC_AxisGroupRefArr;
	signed short MoveType;
	signed short Velocity;
	signed short Acceleration;
	float Increment;
	struct COORDSYS CoordinateSystem;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct KRC_Move KRC_Move_1;
	struct KRC_Abort KRC_Abort_1;
	struct E6POS m_Position;
	struct E6AXIS m_AxisPosition;
	signed short m_MoveType;
	float m_MaxDelta;
	/* VAR_INPUT (digital) */
	plcbit A1_X_P;
	plcbit A1_X_M;
	plcbit A2_Y_P;
	plcbit A2_Y_M;
	plcbit A3_Z_P;
	plcbit A3_Z_M;
	plcbit A4_A_P;
	plcbit A4_A_M;
	plcbit A5_B_P;
	plcbit A5_B_M;
	plcbit A6_C_P;
	plcbit A6_C_M;
	plcbit E1_P;
	plcbit E1_M;
	plcbit E2_P;
	plcbit E2_M;
	plcbit E3_P;
	plcbit E3_M;
	plcbit E4_P;
	plcbit E4_M;
	plcbit E5_P;
	plcbit E5_M;
	plcbit E6_P;
	plcbit E6_M;
	/* VAR_OUTPUT (digital) */
	plcbit Busy;
	plcbit Active;
	plcbit Done;
	plcbit Aborted;
	plcbit Error;
	/* VAR (digital) */
	plcbit m_ExecuteCmd;
	plcbit m_CmdInputActive;
	plcbit m_CmdInputActiveLast;
	plcbit m_CmdInputActiveChanged;
	plcbit m_CmdInputChanged;
	plcbit m_IncrementActive;
	plcbit m_ExecuteAbort;
	plcbit A1_X_P_Last;
	plcbit A1_X_M_Last;
	plcbit A2_Y_P_Last;
	plcbit A2_Y_M_Last;
	plcbit A3_Z_P_Last;
	plcbit A3_Z_M_Last;
	plcbit A4_A_P_Last;
	plcbit A4_A_M_Last;
	plcbit A5_B_P_Last;
	plcbit A5_B_M_Last;
	plcbit A6_C_P_Last;
	plcbit A6_C_M_Last;
	plcbit E1_P_Last;
	plcbit E1_M_Last;
	plcbit E2_P_Last;
	plcbit E2_M_Last;
	plcbit E3_P_Last;
	plcbit E3_M_Last;
	plcbit E4_P_Last;
	plcbit E4_M_Last;
	plcbit E5_P_Last;
	plcbit E5_M_Last;
	plcbit E6_P_Last;
	plcbit E6_M_Last;
	plcbit m_ExecuteCmd_Finished;
} KRC_Jog_typ;

typedef struct KRC_JogLinearRelative
{
	/* VAR_INPUT (analog) */
	signed short AxisGroupIdx;
	AXIS_GROUP_REF_ARR* KRC_AxisGroupRefArr;
	struct E6POS Position;
	signed short Velocity;
	signed short Acceleration;
	struct COORDSYS CoordinateSystem;
	signed short OriType;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct KRC_Move KRC_Move_1;
	/* VAR_INPUT (digital) */
	plcbit ExecuteCmd;
	/* VAR_OUTPUT (digital) */
	plcbit Busy;
	plcbit Active;
	plcbit Done;
	plcbit Aborted;
	plcbit Error;
} KRC_JogLinearRelative_typ;

typedef struct KRC_JogToolRelative
{
	/* VAR_INPUT (analog) */
	signed short AxisGroupIdx;
	AXIS_GROUP_REF_ARR* KRC_AxisGroupRefArr;
	struct E6POS Position;
	signed short Velocity;
	signed short Acceleration;
	struct COORDSYS CoordinateSystem;
	signed short OriType;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct KRC_Move KRC_Move_1;
	/* VAR_INPUT (digital) */
	plcbit ExecuteCmd;
	/* VAR_OUTPUT (digital) */
	plcbit Busy;
	plcbit Active;
	plcbit Done;
	plcbit Aborted;
	plcbit Error;
} KRC_JogToolRelative_typ;

typedef struct KRC_MasRef
{
	/* VAR_INPUT (analog) */
	signed short AxisGroupIdx;
	AXIS_GROUP_REF_ARR* KRC_AxisGroupRefArr;
	struct E6POS Position;
	signed short Velocity;
	signed short Acceleration;
	struct COORDSYS CoordinateSystem;
	signed short BufferMode;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct KRC_Move KRC_Move_1;
	/* VAR_INPUT (digital) */
	plcbit ExecuteCmd;
	/* VAR_OUTPUT (digital) */
	plcbit Busy;
	plcbit Active;
	plcbit Done;
	plcbit Aborted;
	plcbit Error;
	plcbit MasRefRequest;
} KRC_MasRef_typ;

typedef struct KRC_MoveAxisAbsolute
{
	/* VAR_INPUT (analog) */
	signed short AxisGroupIdx;
	AXIS_GROUP_REF_ARR* KRC_AxisGroupRefArr;
	struct E6AXIS AxisPosition;
	signed short Velocity;
	signed short Acceleration;
	struct APO Approximate;
	signed short BufferMode;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct KRC_Move KRC_Move;
	struct E6POS m_CircHP;
	struct E6POS m_Position;
	signed short m_OriType;
	struct COORDSYS m_CoordinateSystem;
	/* VAR_INPUT (digital) */
	plcbit ExecuteCmd;
	/* VAR_OUTPUT (digital) */
	plcbit Busy;
	plcbit Active;
	plcbit Done;
	plcbit Aborted;
	plcbit Error;
} KRC_MoveAxisAbsolute_typ;

typedef struct KRC_MoveCircAbsolute
{
	/* VAR_INPUT (analog) */
	signed short AxisGroupIdx;
	AXIS_GROUP_REF_ARR* KRC_AxisGroupRefArr;
	struct E6POS Position;
	struct E6POS CircHP;
	float Angle;
	signed short Velocity;
	signed short Acceleration;
	struct COORDSYS CoordinateSystem;
	signed short OriType;
	signed short CircType;
	struct APO Approximate;
	signed short BufferMode;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct KRC_Move KRC_Move;
	struct COORDSYS m_CoordinateSystem;
	struct E6AXIS m_AxisPosition;
	/* VAR_INPUT (digital) */
	plcbit ExecuteCmd;
	/* VAR_OUTPUT (digital) */
	plcbit Busy;
	plcbit Active;
	plcbit Done;
	plcbit Aborted;
	plcbit Error;
} KRC_MoveCircAbsolute_typ;

typedef struct KRC_MoveCircRelative
{
	/* VAR_INPUT (analog) */
	signed short AxisGroupIdx;
	AXIS_GROUP_REF_ARR* KRC_AxisGroupRefArr;
	struct E6POS Position;
	struct E6POS CircHP;
	float Angle;
	signed short Velocity;
	signed short Acceleration;
	struct COORDSYS CoordinateSystem;
	signed short OriType;
	signed short CircType;
	struct APO Approximate;
	signed short BufferMode;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct KRC_Move KRC_Move;
	struct COORDSYS m_CoordinateSystem;
	struct E6AXIS m_AxisPosition;
	/* VAR_INPUT (digital) */
	plcbit ExecuteCmd;
	/* VAR_OUTPUT (digital) */
	plcbit Busy;
	plcbit Active;
	plcbit Done;
	plcbit Aborted;
	plcbit Error;
} KRC_MoveCircRelative_typ;

typedef struct KRC_MoveDirectAbsolute
{
	/* VAR_INPUT (analog) */
	signed short AxisGroupIdx;
	AXIS_GROUP_REF_ARR* KRC_AxisGroupRefArr;
	struct E6POS Position;
	signed short Velocity;
	signed short Acceleration;
	struct COORDSYS CoordinateSystem;
	struct APO Approximate;
	signed short BufferMode;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct KRC_Move KRC_Move;
	struct E6POS m_CircHP;
	struct E6AXIS m_AxisPosition;
	signed short m_OriType;
	/* VAR_INPUT (digital) */
	plcbit ExecuteCmd;
	/* VAR_OUTPUT (digital) */
	plcbit Busy;
	plcbit Active;
	plcbit Done;
	plcbit Aborted;
	plcbit Error;
} KRC_MoveDirectAbsolute_typ;

typedef struct KRC_MoveDirectRelative
{
	/* VAR_INPUT (analog) */
	signed short AxisGroupIdx;
	AXIS_GROUP_REF_ARR* KRC_AxisGroupRefArr;
	struct E6POS Position;
	signed short Velocity;
	signed short Acceleration;
	struct COORDSYS CoordinateSystem;
	struct APO Approximate;
	signed short BufferMode;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct KRC_Move KRC_Move;
	struct E6POS m_CircHP;
	struct E6AXIS m_AxisPosition;
	signed short m_OriType;
	/* VAR_INPUT (digital) */
	plcbit ExecuteCmd;
	/* VAR_OUTPUT (digital) */
	plcbit Busy;
	plcbit Active;
	plcbit Done;
	plcbit Aborted;
	plcbit Error;
} KRC_MoveDirectRelative_typ;

typedef struct KRC_MoveLinearAbsolute
{
	/* VAR_INPUT (analog) */
	signed short AxisGroupIdx;
	AXIS_GROUP_REF_ARR* KRC_AxisGroupRefArr;
	struct E6POS Position;
	signed short Velocity;
	signed short Acceleration;
	struct COORDSYS CoordinateSystem;
	signed short OriType;
	struct APO Approximate;
	signed short BufferMode;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct KRC_Move KRC_Move;
	struct E6POS m_CircHP;
	struct E6AXIS m_AxisPosition;
	/* VAR_INPUT (digital) */
	plcbit ExecuteCmd;
	/* VAR_OUTPUT (digital) */
	plcbit Busy;
	plcbit Active;
	plcbit Done;
	plcbit Aborted;
	plcbit Error;
} KRC_MoveLinearAbsolute_typ;

typedef struct KRC_MoveLinearRelative
{
	/* VAR_INPUT (analog) */
	signed short AxisGroupIdx;
	AXIS_GROUP_REF_ARR* KRC_AxisGroupRefArr;
	struct E6POS Position;
	signed short Velocity;
	signed short Acceleration;
	struct COORDSYS CoordinateSystem;
	signed short OriType;
	struct APO Approximate;
	signed short BufferMode;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct KRC_Move KRC_Move;
	struct E6POS m_CircHP;
	struct E6AXIS m_AxisPosition;
	/* VAR_INPUT (digital) */
	plcbit ExecuteCmd;
	/* VAR_OUTPUT (digital) */
	plcbit Busy;
	plcbit Active;
	plcbit Done;
	plcbit Aborted;
	plcbit Error;
} KRC_MoveLinearRelative_typ;

typedef struct KRC_ReadActualAcceleration
{
	/* VAR_INPUT (analog) */
	signed short AxisGroupIdx;
	AXIS_GROUP_REF_ARR* KRC_AxisGroupRefArr;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	float Acc_ABS;
	float X;
	float Y;
	float Z;
	float A;
	float B;
	float C;
	/* VAR (analog) */
	struct mxA_ExecuteCommand mxA_ExecuteCommand;
	/* VAR_INPUT (digital) */
	plcbit ExecuteCmd;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Error;
} KRC_ReadActualAcceleration_typ;

typedef struct KRC_ReadActualAxisPosition
{
	/* VAR_INPUT (analog) */
	signed short AxisGroupIdx;
	AXIS_GROUP_REF_ARR* KRC_AxisGroupRefArr;
	/* VAR_OUTPUT (analog) */
	struct E6AXIS AxisPosition;
	float A1;
	float A2;
	float A3;
	float A4;
	float A5;
	float A6;
	float E1;
	float E2;
	float E3;
	float E4;
	float E5;
	float E6;
	/* VAR_OUTPUT (digital) */
	plcbit Valid;
} KRC_ReadActualAxisPosition_typ;

typedef struct KRC_ReadActualAxisVelocity
{
	/* VAR_INPUT (analog) */
	signed short AxisGroupIdx;
	AXIS_GROUP_REF_ARR* KRC_AxisGroupRefArr;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	signed short A1;
	signed short A2;
	signed short A3;
	signed short A4;
	signed short A5;
	signed short A6;
	signed short E1;
	signed short E2;
	signed short E3;
	signed short E4;
	signed short E5;
	signed short E6;
	/* VAR (analog) */
	struct mxA_ExecuteCommand mxA_ExecuteCommand;
	/* VAR_INPUT (digital) */
	plcbit ExecuteCmd;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Error;
} KRC_ReadActualAxisVelocity_typ;

typedef struct KRC_ReadActualPosition
{
	/* VAR_INPUT (analog) */
	signed short AxisGroupIdx;
	AXIS_GROUP_REF_ARR* KRC_AxisGroupRefArr;
	/* VAR_OUTPUT (analog) */
	struct E6POS Position;
	float X;
	float Y;
	float Z;
	float A;
	float B;
	float C;
	signed short Status;
	signed short Turn;
	signed short Tool;
	signed short Base;
	signed short IPOMode;
	/* VAR_OUTPUT (digital) */
	plcbit Valid;
} KRC_ReadActualPosition_typ;

typedef struct KRC_ReadActualVelocity
{
	/* VAR_INPUT (analog) */
	signed short AxisGroupIdx;
	AXIS_GROUP_REF_ARR* KRC_AxisGroupRefArr;
	/* VAR_OUTPUT (analog) */
	float Value;
	/* VAR_OUTPUT (digital) */
	plcbit Valid;
} KRC_ReadActualVelocity_typ;

typedef struct KRC_ReadAnalogInput
{
	/* VAR_INPUT (analog) */
	signed short AxisGroupIdx;
	AXIS_GROUP_REF_ARR* KRC_AxisGroupRefArr;
	signed short Number;
	/* VAR_OUTPUT (analog) */
	float Value;
	signed long ErrorID;
	/* VAR (analog) */
	struct mxA_ExecuteCommand mxA_ExecuteCommand;
	/* VAR_INPUT (digital) */
	plcbit ExecuteCmd;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Error;
} KRC_ReadAnalogInput_typ;

typedef struct KRC_ReadAnalogOutput
{
	/* VAR_INPUT (analog) */
	signed short AxisGroupIdx;
	AXIS_GROUP_REF_ARR* KRC_AxisGroupRefArr;
	signed short Number;
	/* VAR_OUTPUT (analog) */
	float Value;
	signed long ErrorID;
	/* VAR (analog) */
	struct mxA_ExecuteCommand mxA_ExecuteCommand;
	/* VAR_INPUT (digital) */
	plcbit ExecuteCmd;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Error;
} KRC_ReadAnalogOutput_typ;

typedef struct KRC_ReadAxisGroup
{
	/* VAR_INPUT (analog) */
	plcbyte (*KRC4_Input)[255];
	AXIS_GROUP_REF_ARR* KRC_AxisGroupRefArr;
	signed short AxisGroupIdx;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	signed short m_HeartbeatSubmit;
	signed short m_IN_VAL_1To8;
	signed short m_TouchUp_PosNo;
	signed long m_SR_Order1_ID;
	signed long m_SR_Order2_ID;
	signed long m_SR_Order3_ID;
	signed long m_SR_Order4_ID;
	signed long m_SR_Order5_ID;
	signed long m_SR_Order6_ID;
	signed long m_SR_Order7_ID;
	signed long m_SR_Order8_ID;
	signed long m_SR_Order9_ID;
	signed long m_SR_Order10_ID;
	signed short m_SR_Order1_State;
	signed short m_SR_Order2_State;
	signed short m_SR_Order3_State;
	signed short m_SR_Order4_State;
	signed short m_SR_Order5_State;
	signed short m_SR_Order6_State;
	signed short m_SR_Order7_State;
	signed short m_SR_Order8_State;
	signed short m_SR_Order9_State;
	signed short m_SR_Order10_State;
	signed short m_HeartbeatPCOS;
	signed short m_Override;
	float m_PosAct_X;
	float m_PosAct_Y;
	float m_PosAct_Z;
	float m_PosAct_A;
	float m_PosAct_B;
	float m_PosAct_C;
	signed long m_PosAct_Status;
	signed short m_PosAct_Turn;
	signed char m_ToolAct;
	signed char m_BaseAct;
	signed short m_IPOMode;
	float m_AxisAct_A1;
	float m_AxisAct_A2;
	float m_AxisAct_A3;
	float m_AxisAct_A4;
	float m_AxisAct_A5;
	float m_AxisAct_A6;
	float m_AxisAct_A7;
	float m_AxisAct_A8;
	float m_AxisAct_A9;
	float m_AxisAct_A10;
	float m_AxisAct_A11;
	float m_AxisAct_A12;
	float m_VelAct;
	signed char m_VelAxis_A1;
	signed char m_VelAxis_A2;
	signed char m_VelAxis_A3;
	signed char m_VelAxis_A4;
	signed char m_VelAxis_A5;
	signed char m_VelAxis_A6;
	signed char m_VelAxis_A7;
	signed char m_VelAxis_A8;
	signed char m_VelAxis_A9;
	signed char m_VelAxis_A10;
	signed char m_VelAxis_A11;
	signed char m_VelAxis_A12;
	signed short m_GroupState;
	signed short m_ErrorID;
	signed short m_ErrorIDSub;
	signed long m_ActivePosOrderID;
	signed long m_ActiveOrderIDB;
	signed short m_QueueCount;
	signed short m_IR_Status1;
	signed short m_IR_Status2;
	signed short m_IR_Status3;
	signed short m_IR_Status4;
	signed short m_IR_Status5;
	signed short m_IR_Status6;
	signed short m_IR_Status7;
	signed short m_IR_Status8;
	signed short m_ErrorIDPcos;
	signed short m_FREE_FOR_WOV;
	signed short m_TransmissionNoRet;
	signed long m_OrderIdRet;
	signed long m_CmdIdRet;
	signed long m_CmdDataRetCS;
	signed long m_Reserve190;
	float m_CmdDataRet1;
	float m_CmdDataRet2;
	float m_CmdDataRet3;
	float m_CmdDataRet4;
	float m_CmdDataRet5;
	float m_CmdDataRet6;
	float m_CmdDataRet7;
	float m_CmdDataRet8;
	float m_CmdDataRet9;
	float m_CmdDataRet10;
	float m_CmdDataRet11;
	float m_CmdDataRet12;
	signed long m_Reserve242;
	plcdword nCheckSum;
	float fTmp;
	signed long nTMP1;
	float fTMP1;
	signed short i;
	signed short m_HeartbeatLast;
	signed short m_HeartbeatLastPCOS;
	plctime HeartBeatTO;
	struct TON TON_1;
	struct TON TON_2;
	signed long m_LastOrderID;
	struct R_TRIG R_TRIG_1;
	signed short m_FirstCycles;
	struct mxA_ResetCommand mxA_ResetCommand;
	signed short m_Workstates;
	signed short m_AxWorkstates;
	/* VAR_OUTPUT (digital) */
	plcbit Error;
	/* VAR (digital) */
	plcbit m_AE_RC_RDY1;
	plcbit m_AE_ALARM_STOP;
	plcbit m_AE_USER_SAF;
	plcbit m_AE_PERI_RDY;
	plcbit m_AE_ROB_CAL;
	plcbit m_AE_IO_ACTCONF;
	plcbit m_AE_STOPMESS;
	plcbit m_AE_PGNO_FBIT_REFL;
	plcbit m_AE_INT_ESTOP;
	plcbit m_AE_PRO_ACT;
	plcbit m_AE_PGNO_REQ;
	plcbit m_AE_APPL_RUN;
	plcbit m_AE_PRO_MOVE;
	plcbit m_AE_IN_HOME;
	plcbit m_AE_ON_PATH;
	plcbit m_AE_NEAR_POSRET;
	plcbit m_AE_ROB_STOPPED;
	plcbit m_AE_T1;
	plcbit m_AE_T2;
	plcbit m_AE_AUT;
	plcbit m_AE_EXT;
	plcbit m_BRAKETEST_MONTIME;
	plcbit m_BRAKETEST_REQ_INT;
	plcbit m_BRAKETEST_WORK;
	plcbit m_BRAKES_OK;
	plcbit m_BRAKETEST_WARN;
	plcbit m_Reserve2075;
	plcbit m_BRAKEACTIVE;
	plcbit m_KCP_CONNECT;
	plcbit m_TouchUp;
	plcbit m_MASTEST_REQ_INT;
	plcbit m_MASTESTSWITCH_OK;
	plcbit m_POS_ACT_VALID;
	plcbit bTMP1;
	plcbit onF_TRIG;
	plcbit EnableTONSubmit;
	plcbit EnableTONPCOS;
	plcbit m_InitOK;
	plcbit m_ConnectionOK;
	plcbit m_F_TRIG;
} KRC_ReadAxisGroup_typ;

typedef struct KRC_ReadAxWorkspace
{
	/* VAR_INPUT (analog) */
	signed short AxisGroupIdx;
	AXIS_GROUP_REF_ARR* KRC_AxisGroupRefArr;
	signed short WorkspaceNo;
	/* VAR_OUTPUT (analog) */
	signed short WorkspaceMode;
	struct AXBOX WorkspaceData;
	signed long ErrorID;
	/* VAR (analog) */
	signed short nState;
	struct mxA_ExecuteCommand mxA_ExecuteCommand_0;
	struct mxA_ExecuteCommand mxA_ExecuteCommand_1;
	struct mxA_ExecuteCommand mxA_ExecuteCommand_2;
	signed short m_WorkspaceMode;
	struct AXBOX m_WorkspaceData;
	/* VAR_INPUT (digital) */
	plcbit ExecuteCmd;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Error;
} KRC_ReadAxWorkspace_typ;

typedef struct KRC_ReadBaseData
{
	/* VAR_INPUT (analog) */
	signed short AxisGroupIdx;
	AXIS_GROUP_REF_ARR* KRC_AxisGroupRefArr;
	signed short BaseNo;
	/* VAR_OUTPUT (analog) */
	struct FRAME BaseData;
	signed long ErrorID;
	/* VAR (analog) */
	struct mxA_ExecuteCommand mxA_ExecuteCommand;
	/* VAR_INPUT (digital) */
	plcbit ExecuteCmd;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Error;
} KRC_ReadBaseData_typ;

typedef struct KRC_ReadDigitalInput
{
	/* VAR_INPUT (analog) */
	signed short AxisGroupIdx;
	AXIS_GROUP_REF_ARR* KRC_AxisGroupRefArr;
	signed short Number;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct mxA_ExecuteCommand mxA_ExecuteCommand;
	/* VAR_INPUT (digital) */
	plcbit ExecuteCmd;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Value;
	plcbit Error;
} KRC_ReadDigitalInput_typ;

typedef struct KRC_ReadDigitalInput1To8
{
	/* VAR_INPUT (analog) */
	signed short AxisGroupIdx;
	AXIS_GROUP_REF_ARR* KRC_AxisGroupRefArr;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR_OUTPUT (digital) */
	plcbit Valid;
	plcbit IN1;
	plcbit IN2;
	plcbit IN3;
	plcbit IN4;
	plcbit IN5;
	plcbit IN6;
	plcbit IN7;
	plcbit IN8;
	plcbit Error;
} KRC_ReadDigitalInput1To8_typ;

#ifdef _BUR_USE_DECLARATION_IN_IEC
typedef struct KRC_ReadDigitalInputArray
{
	/* VAR_INPUT (analog) */
	signed short AxisGroupIdx;
	AXIS_GROUP_REF_ARR* KRC_AxisGroupRefArr;
	signed short Startnumber;
	signed short Length;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	plcdword DW1;
	plcdword DW2;
	plcdword DW3;
	plcdword DW4;
	plcdword DW5;
	plcdword DW6;
	plcdword DW7;
	plcdword DW8;
	plcdword DW9;
	plcdword DW10;
	struct mxA_ExecuteCommand mxA_ExecuteCommand;
	/* VAR_INPUT (digital) */
	plcbit ExecuteCmd;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Values[200];
	plcbit Error;
} KRC_ReadDigitalInputArray_typ;
#else
/* Data type KRC_ReadDigitalInputArray not declared. Data types with array elements whose starting indexes are not equal to zero cannot be used in ANSI C programs / libraries.*/
#endif

typedef struct KRC_ReadDigitalOutput
{
	/* VAR_INPUT (analog) */
	signed short AxisGroupIdx;
	AXIS_GROUP_REF_ARR* KRC_AxisGroupRefArr;
	signed short Number;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct mxA_ExecuteCommand mxA_ExecuteCommand;
	/* VAR_INPUT (digital) */
	plcbit ExecuteCmd;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Value;
	plcbit Error;
} KRC_ReadDigitalOutput_typ;

typedef struct KRC_ReadInterruptState
{
	/* VAR_INPUT (analog) */
	signed short AxisGroupIdx;
	AXIS_GROUP_REF_ARR* KRC_AxisGroupRefArr;
	signed short Interrupt;
	/* VAR_OUTPUT (analog) */
	signed short Value;
	signed long ErrorID;
	/* VAR_OUTPUT (digital) */
	plcbit Valid;
	plcbit Error;
} KRC_ReadInterruptState_typ;

typedef struct KRC_ReadKRCError
{
	/* VAR_INPUT (analog) */
	signed short AxisGroupIdx;
	AXIS_GROUP_REF_ARR* KRC_AxisGroupRefArr;
	signed short Offset;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	signed short MessageCount;
	signed long Message1;
	signed long Message2;
	signed long Message3;
	signed long Message4;
	signed long Message5;
	signed long Message6;
	signed long Message7;
	signed long Message8;
	signed long Message9;
	signed long Message10;
	/* VAR (analog) */
	struct mxA_ExecuteCommand mxA_ExecuteCommand;
	/* VAR_INPUT (digital) */
	plcbit ExecuteCmd;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Error;
	plcbit STOPMESS;
} KRC_ReadKRCError_typ;

typedef struct KRC_ReadLoadData
{
	/* VAR_INPUT (analog) */
	signed short AxisGroupIdx;
	AXIS_GROUP_REF_ARR* KRC_AxisGroupRefArr;
	signed short Tool;
	/* VAR_OUTPUT (analog) */
	float M;
	float X;
	float Y;
	float Z;
	float A;
	float B;
	float C;
	float JX;
	float JY;
	float JZ;
	signed long ErrorID;
	/* VAR (analog) */
	struct mxA_ExecuteCommand mxA_ExecuteCommand;
	/* VAR_INPUT (digital) */
	plcbit ExecuteCmd;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Error;
} KRC_ReadLoadData_typ;

typedef struct KRC_ReadMXAStatus
{
	/* VAR_INPUT (analog) */
	signed short AxisGroupIdx;
	AXIS_GROUP_REF_ARR* KRC_AxisGroupRefArr;
	/* VAR_OUTPUT (analog) */
	signed short Status;
	signed long ErrorID;
	/* VAR_OUTPUT (digital) */
	plcbit Error;
} KRC_ReadMXAStatus_typ;

typedef struct KRC_ReadSafeOPStatus
{
	/* VAR_INPUT (analog) */
	signed short AxisGroupIdx;
	AXIS_GROUP_REF_ARR* KRC_AxisGroupRefArr;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR_INPUT (digital) */
	plcbit MASTERINGTEST_REQ_EXT;
	plcbit BRAKETEST_REQ_EXT;
	/* VAR_OUTPUT (digital) */
	plcbit Valid;
	plcbit BRAKETEST_REQ_INT;
	plcbit MASTERINGTEST_REQ_INT;
	plcbit BRAKETEST_MONTIME;
	plcbit BRAKETEST_WORK;
	plcbit BRAKES_OK;
	plcbit BRAKETEST_WARN;
	plcbit MASTERINGTESTSWITCH_OK;
	plcbit Error;
} KRC_ReadSafeOPStatus_typ;

typedef struct KRC_ReadSoftEnd
{
	/* VAR_INPUT (analog) */
	signed short AxisGroupIdx;
	AXIS_GROUP_REF_ARR* KRC_AxisGroupRefArr;
	/* VAR_OUTPUT (analog) */
	float A1_Min;
	float A1_Max;
	float A2_Min;
	float A2_Max;
	float A3_Min;
	float A3_Max;
	float A4_Min;
	float A4_Max;
	float A5_Min;
	float A5_Max;
	float A6_Min;
	float A6_Max;
	signed long ErrorID;
	/* VAR (analog) */
	struct mxA_ExecuteCommand mxA_ExecuteCommand;
	/* VAR_INPUT (digital) */
	plcbit ExecuteCmd;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Error;
} KRC_ReadSoftEnd_typ;

typedef struct KRC_ReadSoftEndExt
{
	/* VAR_INPUT (analog) */
	signed short AxisGroupIdx;
	AXIS_GROUP_REF_ARR* KRC_AxisGroupRefArr;
	/* VAR_OUTPUT (analog) */
	float E1_Min;
	float E1_Max;
	float E2_Min;
	float E2_Max;
	float E3_Min;
	float E3_Max;
	float E4_Min;
	float E4_Max;
	float E5_Min;
	float E5_Max;
	float E6_Min;
	float E6_Max;
	signed long ErrorID;
	/* VAR (analog) */
	struct mxA_ExecuteCommand mxA_ExecuteCommand;
	/* VAR_INPUT (digital) */
	plcbit ExecuteCmd;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Error;
} KRC_ReadSoftEndExt_typ;

typedef struct KRC_ReadSysVar
{
	/* VAR_INPUT (analog) */
	signed short AxisGroupIdx;
	AXIS_GROUP_REF_ARR* KRC_AxisGroupRefArr;
	signed short Index;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	float Value1;
	float Value2;
	float Value3;
	float Value4;
	float Value5;
	float Value6;
	float Value7;
	float Value8;
	float Value9;
	float Value10;
	/* VAR (analog) */
	struct mxA_ExecuteCommand mxA_ExecuteCommand;
	/* VAR_INPUT (digital) */
	plcbit ExecuteCmd;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Error;
} KRC_ReadSysVar_typ;

typedef struct KRC_ReadToolData
{
	/* VAR_INPUT (analog) */
	signed short AxisGroupIdx;
	AXIS_GROUP_REF_ARR* KRC_AxisGroupRefArr;
	signed short ToolNo;
	/* VAR_OUTPUT (analog) */
	struct FRAME ToolData;
	signed long ErrorID;
	/* VAR (analog) */
	struct mxA_ExecuteCommand mxA_ExecuteCommand;
	/* VAR_INPUT (digital) */
	plcbit ExecuteCmd;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Error;
} KRC_ReadToolData_typ;

typedef struct KRC_ReadTouchUPState
{
	/* VAR_INPUT (analog) */
	signed short AxisGroupIdx;
	AXIS_GROUP_REF_ARR* KRC_AxisGroupRefArr;
	/* VAR_OUTPUT (analog) */
	signed short Index;
	signed long ErrorID;
	/* VAR_OUTPUT (digital) */
	plcbit Valid;
	plcbit TouchUP;
	plcbit Error;
} KRC_ReadTouchUPState_typ;

typedef struct KRC_ReadWorkspace
{
	/* VAR_INPUT (analog) */
	signed short AxisGroupIdx;
	AXIS_GROUP_REF_ARR* KRC_AxisGroupRefArr;
	signed short WorkspaceNo;
	/* VAR_OUTPUT (analog) */
	signed short WorkspaceMode;
	struct BOX WorkspaceData;
	signed long ErrorID;
	/* VAR (analog) */
	signed short nState;
	struct mxA_ExecuteCommand mxA_ExecuteCommand_0;
	struct mxA_ExecuteCommand mxA_ExecuteCommand_1;
	signed short m_WorkspaceMode;
	struct BOX m_WorkspaceData;
	/* VAR_INPUT (digital) */
	plcbit ExecuteCmd;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Error;
} KRC_ReadWorkspace_typ;

typedef struct KRC_ReadWorkstates
{
	/* VAR_INPUT (analog) */
	signed short AxisGroupIdx;
	AXIS_GROUP_REF_ARR* KRC_AxisGroupRefArr;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR_OUTPUT (digital) */
	plcbit Valid;
	plcbit WORKSTATE1;
	plcbit WORKSTATE2;
	plcbit WORKSTATE3;
	plcbit WORKSTATE4;
	plcbit WORKSTATE5;
	plcbit WORKSTATE6;
	plcbit WORKSTATE7;
	plcbit WORKSTATE8;
	plcbit AXWORKSTATE1;
	plcbit AXWORKSTATE2;
	plcbit AXWORKSTATE3;
	plcbit AXWORKSTATE4;
	plcbit AXWORKSTATE5;
	plcbit AXWORKSTATE6;
	plcbit AXWORKSTATE7;
	plcbit AXWORKSTATE8;
	plcbit Error;
} KRC_ReadWorkstates_typ;

typedef struct KRC_SetAdvance
{
	/* VAR_INPUT (analog) */
	signed short AxisGroupIdx;
	AXIS_GROUP_REF_ARR* KRC_AxisGroupRefArr;
	signed short Count;
	signed short MaxWaitTime;
	signed short Mode;
	signed short BufferMode;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct mxA_ExecuteCommand mxA_ExecuteCommand_1;
	/* VAR_INPUT (digital) */
	plcbit ExecuteCmd;
	/* VAR_OUTPUT (digital) */
	plcbit Busy;
	plcbit Done;
	plcbit Aborted;
	plcbit Error;
} KRC_SetAdvance_typ;

typedef struct KRC_SetCoordSys
{
	/* VAR_INPUT (analog) */
	signed short AxisGroupIdx;
	AXIS_GROUP_REF_ARR* KRC_AxisGroupRefArr;
	struct COORDSYS CoordinateSystem;
	signed short BufferMode;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct mxA_ExecuteCommand mxA_ExecuteCommand;
	/* VAR_INPUT (digital) */
	plcbit ExecuteCmd;
	/* VAR_OUTPUT (digital) */
	plcbit Busy;
	plcbit Done;
	plcbit Aborted;
	plcbit Error;
} KRC_SetCoordSys_typ;

typedef struct KRC_SetDistanceTrigger
{
	/* VAR_INPUT (analog) */
	signed short AxisGroupIdx;
	AXIS_GROUP_REF_ARR* KRC_AxisGroupRefArr;
	signed short Distance;
	signed short Delay;
	signed short Output;
	float Pulse;
	signed short BufferMode;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct mxA_ExecuteCommand mxA_ExecuteCommand;
	/* VAR_INPUT (digital) */
	plcbit ExecuteCmd;
	plcbit Value;
	/* VAR_OUTPUT (digital) */
	plcbit Busy;
	plcbit Done;
	plcbit Aborted;
	plcbit Error;
} KRC_SetDistanceTrigger_typ;

typedef struct KRC_SetOverride
{
	/* VAR_INPUT (analog) */
	signed short AxisGroupIdx;
	AXIS_GROUP_REF_ARR* KRC_AxisGroupRefArr;
	signed short Override;
	/* VAR_OUTPUT (analog) */
	signed short ActualOverride;
	signed long ErrorID;
	/* VAR_OUTPUT (digital) */
	plcbit Valid;
	plcbit Error;
} KRC_SetOverride_typ;

typedef struct KRC_SetPathTrigger
{
	/* VAR_INPUT (analog) */
	signed short AxisGroupIdx;
	AXIS_GROUP_REF_ARR* KRC_AxisGroupRefArr;
	float Path;
	signed short Delay;
	signed short Output;
	float Pulse;
	signed short BufferMode;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct mxA_ExecuteCommand mxA_ExecuteCommand;
	/* VAR_INPUT (digital) */
	plcbit ExecuteCmd;
	plcbit Value;
	/* VAR_OUTPUT (digital) */
	plcbit Busy;
	plcbit Done;
	plcbit Aborted;
	plcbit Error;
} KRC_SetPathTrigger_typ;

#ifdef _BUR_USE_DECLARATION_IN_IEC
typedef plcbit BOOL_ARRAY_40[40];
#else
/* Data type BOOL_ARRAY_40 not declared. Derived data types with an array data type as base type whose starting index is not equal to zero cannot be used in ANSI C programs / libraries.*/
#endif

#ifdef _BUR_USE_DECLARATION_IN_IEC
typedef signed long INT32_ARRAY_40[40];
#else
/* Data type INT32_ARRAY_40 not declared. Derived data types with an array data type as base type whose starting index is not equal to zero cannot be used in ANSI C programs / libraries.*/
#endif

#ifdef _BUR_USE_DECLARATION_IN_IEC
typedef float REAL_ARRAY_40[40];
#else
/* Data type REAL_ARRAY_40 not declared. Derived data types with an array data type as base type whose starting index is not equal to zero cannot be used in ANSI C programs / libraries.*/
#endif

typedef struct KRC_TechFunction
{
	/* VAR_INPUT (analog) */
	signed short AxisGroupIdx;
	AXIS_GROUP_REF_ARR* KRC_AxisGroupRefArr;
	signed short TechFunctionID;
	signed short BufferMode;
	INT32_ARRAY_40 INT_DATA;
	REAL_ARRAY_40 REAL_DATA;
	signed short ParameterCount;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	signed short i;
	struct mxA_ExecuteCommand mxA_ExecuteCommand_1;
	/* VAR_INPUT (digital) */
	plcbit ExecuteCmd;
	BOOL_ARRAY_40 BOOL_DATA;
	/* VAR_OUTPUT (digital) */
	plcbit Error;
	plcbit Busy;
	plcbit Active;
	plcbit Done;
	plcbit Aborted;
} KRC_TechFunction_typ;

typedef struct KRC_Test_TechFunction
{
	/* VAR_INPUT (analog) */
	signed short AxisGroupIdx;
	AXIS_GROUP_REF_ARR* KRC_AxisGroupRefArr;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	signed short i;
	INT32_ARRAY_40 INT_DATA;
	REAL_ARRAY_40 REAL_DATA;
	struct KRC_TechFunction KRC_Techfunction_1;
	/* VAR_INPUT (digital) */
	plcbit ExecuteCmd;
	/* VAR_OUTPUT (digital) */
	plcbit Busy;
	plcbit Active;
	plcbit Done;
	plcbit Aborted;
	plcbit Error;
	/* VAR (digital) */
	BOOL_ARRAY_40 BOOL_DATA;
} KRC_Test_TechFunction_typ;

#ifdef _BUR_USE_DECLARATION_IN_IEC
typedef POSITION POSITION_ARRAY[100];
#else
/* Data type POSITION_ARRAY not declared. Derived data types with an array data type as base type whose starting index is not equal to zero cannot be used in ANSI C programs / libraries.*/
#endif

typedef struct KRC_TouchUP
{
	/* VAR_INPUT (analog) */
	signed short AxisGroupIdx;
	AXIS_GROUP_REF_ARR* KRC_AxisGroupRefArr;
	signed short Index;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	POSITION_ARRAY PositionArray;
	/* VAR (analog) */
	struct mxA_ExecuteCommand mxA_ExecuteCommand_1;
	struct R_TRIG R_TRIG_1;
	signed short m_PosIndex;
	/* VAR_INPUT (digital) */
	plcbit ExecuteCmd;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Error;
} KRC_TouchUP_typ;

typedef struct KRC_VectorMoveOff
{
	/* VAR_INPUT (analog) */
	signed short AxisGroupIdx;
	AXIS_GROUP_REF_ARR* KRC_AxisGroupRefArr;
	signed short BufferMode;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct mxA_ExecuteCommand mxA_ExecuteCommand_1;
	/* VAR_INPUT (digital) */
	plcbit ExecuteCmd;
	/* VAR_OUTPUT (digital) */
	plcbit Busy;
	plcbit Done;
	plcbit Aborted;
	plcbit Error;
} KRC_VectorMoveOff_typ;

typedef struct KRC_VectorMoveOn
{
	/* VAR_INPUT (analog) */
	signed short AxisGroupIdx;
	AXIS_GROUP_REF_ARR* KRC_AxisGroupRefArr;
	float X;
	float Y;
	float Z;
	float A;
	float B;
	float C;
	float VectorLimit;
	float MaxDuration;
	float TorqueOffsetValue;
	signed short BufferMode;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct mxA_ExecuteCommand mxA_ExecuteCommand_1;
	/* VAR_INPUT (digital) */
	plcbit ExecuteCmd;
	/* VAR_OUTPUT (digital) */
	plcbit Busy;
	plcbit Done;
	plcbit Aborted;
	plcbit Error;
} KRC_VectorMoveOn_typ;

typedef struct KRC_WaitForInput
{
	/* VAR_INPUT (analog) */
	signed short AxisGroupIdx;
	AXIS_GROUP_REF_ARR* KRC_AxisGroupRefArr;
	signed short Number;
	signed short BufferMode;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct mxA_ExecuteCommand mxA_ExecuteCommand;
	/* VAR_INPUT (digital) */
	plcbit ExecuteCmd;
	plcbit Value;
	plcbit bContinue;
	/* VAR_OUTPUT (digital) */
	plcbit Busy;
	plcbit Active;
	plcbit Done;
	plcbit Aborted;
	plcbit Error;
} KRC_WaitForInput_typ;

typedef struct KRC_WriteAnalogOutput
{
	/* VAR_INPUT (analog) */
	signed short AxisGroupIdx;
	AXIS_GROUP_REF_ARR* KRC_AxisGroupRefArr;
	signed short Number;
	float Value;
	signed short BufferMode;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct mxA_ExecuteCommand mxA_ExecuteCommand;
	/* VAR_INPUT (digital) */
	plcbit ExecuteCmd;
	plcbit bContinue;
	/* VAR_OUTPUT (digital) */
	plcbit Busy;
	plcbit Done;
	plcbit Aborted;
	plcbit Error;
} KRC_WriteAnalogOutput_typ;

typedef struct KRC_WriteAxisGroup
{
	/* VAR_INPUT (analog) */
	signed short AxisGroupIdx;
	AXIS_GROUP_REF_ARR* KRC_AxisGroupRefArr;
	plcbyte (*KRC4_Output)[255];
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	float fTmp;
	signed long nTMP1;
	float fTMP1;
	struct mxA_ResetCommand mxA_ResetCommand;
	plcdword nCheckSum;
	signed short i;
	signed long LastOrderID;
	signed short LastTGNumber;
	signed short LastTGType;
	signed long m_CommandID;
	signed long m_OrderID;
	plcdword m_ProfiNetStatus;
	signed short m_AnzTelegramme;
	plcbyte Heartbeat_Val;
	plcbyte Override_Val;
	signed long PLC_Major_Val;
	signed long PLC_Minor_Val;
	signed long SR_Order1_ID_Val;
	signed long SR_Order2_ID_Val;
	signed long SR_Order3_ID_Val;
	signed long SR_Order4_ID_Val;
	signed long SR_Order5_ID_Val;
	signed long SR_Order6_ID_Val;
	signed long SR_Order7_ID_Val;
	signed long SR_Order8_ID_Val;
	signed long SR_Order9_ID_Val;
	signed long SR_Order10_ID_Val;
	plcbyte SR_Order1_State_Val;
	plcbyte SR_Order2_State_Val;
	plcbyte SR_Order3_State_Val;
	plcbyte SR_Order4_State_Val;
	plcbyte SR_Order5_State_Val;
	plcbyte SR_Order6_State_Val;
	plcbyte SR_Order7_State_Val;
	plcbyte SR_Order8_State_Val;
	plcbyte SR_Order9_State_Val;
	plcbyte SR_Order10_State_Val;
	signed long CmdPar_INT1_Val;
	signed long CmdPar_INT2_Val;
	signed long CmdPar_INT3_Val;
	signed long CmdPar_INT4_Val;
	signed long CmdPar_INT5_Val;
	signed long CmdPar_INT6_Val;
	signed long CmdPar_INT7_Val;
	signed long CmdPar_INT8_Val;
	signed long CmdPar_INT9_Val;
	signed long CmdPar_INT10_Val;
	signed long CmdPar_INT11_Val;
	signed long CmdPar_INT12_Val;
	signed long CmdPar_INT13_Val;
	signed long CmdPar_INT14_Val;
	signed long CmdPar_INT15_Val;
	float CmdPar_REAL1_Val;
	float CmdPar_REAL2_Val;
	float CmdPar_REAL3_Val;
	float CmdPar_REAL4_Val;
	float CmdPar_REAL5_Val;
	float CmdPar_REAL6_Val;
	float CmdPar_REAL7_Val;
	float CmdPar_REAL8_Val;
	float CmdPar_REAL9_Val;
	float CmdPar_REAL10_Val;
	float CmdPar_REAL11_Val;
	float CmdPar_REAL12_Val;
	float CmdPar_REAL13_Val;
	float CmdPar_REAL14_Val;
	float CmdPar_REAL15_Val;
	plcdword CheckSum_Val;
	signed short TransmissionNO1_Val;
	signed short TransmissionNO2_Val;
	signed short TransmissionType_Val;
	signed long OrderID_Val;
	signed short CmdID_Val;
	signed short BufferMode_Val;
	plcword BoolValues1;
	/* VAR_OUTPUT (digital) */
	plcbit Error;
	/* VAR (digital) */
	plcbit bTMP1;
	plcbit bMaxRealErr;
	plcbit m_ProfiNetErr;
	plcbit AE_PGNO_FBIT_Val;
	plcbit AE_PGNO_Bit1_Val;
	plcbit AE_PGNO_Bit2_Val;
	plcbit AE_PGNO_Bit3_Val;
	plcbit AE_PGNO_Bit4_Val;
	plcbit AE_PGNO_Bit5_Val;
	plcbit AE_PGNO_Bit6_Val;
	plcbit AE_PGNO_Bit7_Val;
	plcbit AE_PGNO_PARITY_Val;
	plcbit AE_PGNO_VALID_Val;
	plcbit AE_EXT_START_Val;
	plcbit AE_MOVE_ENABLE_Val;
	plcbit AE_CONF_MESS_Val;
	plcbit AE_DRIVES_OFF_Val;
	plcbit AE_DRIVES_ON_Val;
	plcbit MASTEST_REQ_EXT_Val;
	plcbit BRAKETEST_REQ_EXT_Val;
	plcbit AE_RESET_Val;
	plcbit BRAKE_Val;
	plcbit BRAKE_F_Val;
	plcbit RELEASE_BRAKE_Val;
	plcbit SHOW_TRACE_Val;
	plcbit MESSAGE_RESET_Val;
	plcbit OUT_VAL_1_Val;
	plcbit OUT_VAL_2_Val;
	plcbit OUT_VAL_3_Val;
	plcbit OUT_VAL_4_Val;
	plcbit OUT_VAL_5_Val;
	plcbit OUT_VAL_6_Val;
	plcbit OUT_VAL_7_Val;
	plcbit OUT_VAL_8_Val;
	plcbit WRITE_OUT_1TO8_Val;
} KRC_WriteAxisGroup_typ;

typedef struct KRC_WriteAxWorkspace
{
	/* VAR_INPUT (analog) */
	signed short AxisGroupIdx;
	AXIS_GROUP_REF_ARR* KRC_AxisGroupRefArr;
	signed short WorkspaceNo;
	signed short WorkspaceMode;
	struct AXBOX WorkspaceData;
	signed short BufferMode;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct mxA_ExecuteCommand mxA_ExecuteCommand;
	/* VAR_INPUT (digital) */
	plcbit ExecuteCmd;
	/* VAR_OUTPUT (digital) */
	plcbit Busy;
	plcbit Done;
	plcbit Aborted;
	plcbit Error;
} KRC_WriteAxWorkspace_typ;

typedef struct KRC_WriteBaseData
{
	/* VAR_INPUT (analog) */
	signed short AxisGroupIdx;
	AXIS_GROUP_REF_ARR* KRC_AxisGroupRefArr;
	signed short BaseNo;
	struct FRAME BaseData;
	signed short BufferMode;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct mxA_ExecuteCommand mxA_ExecuteCommand;
	/* VAR_INPUT (digital) */
	plcbit ExecuteCmd;
	/* VAR_OUTPUT (digital) */
	plcbit Busy;
	plcbit Done;
	plcbit Aborted;
	plcbit Error;
} KRC_WriteBaseData_typ;

typedef struct KRC_WriteDigitalOutput
{
	/* VAR_INPUT (analog) */
	signed short AxisGroupIdx;
	AXIS_GROUP_REF_ARR* KRC_AxisGroupRefArr;
	signed short Number;
	float Pulse;
	signed short BufferMode;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct mxA_ExecuteCommand mxA_ExecuteCommand;
	/* VAR_INPUT (digital) */
	plcbit ExecuteCmd;
	plcbit Value;
	plcbit bContinue;
	/* VAR_OUTPUT (digital) */
	plcbit Busy;
	plcbit Done;
	plcbit Aborted;
	plcbit Error;
} KRC_WriteDigitalOutput_typ;

typedef struct KRC_WriteDigitalOutput1To8
{
	/* VAR_INPUT (analog) */
	signed short AxisGroupIdx;
	AXIS_GROUP_REF_ARR* KRC_AxisGroupRefArr;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR_INPUT (digital) */
	plcbit OUT1;
	plcbit OUT2;
	plcbit OUT3;
	plcbit OUT4;
	plcbit OUT5;
	plcbit OUT6;
	plcbit OUT7;
	plcbit OUT8;
	/* VAR_OUTPUT (digital) */
	plcbit Error;
} KRC_WriteDigitalOutput1To8_typ;

typedef struct KRC_WriteLoadData
{
	/* VAR_INPUT (analog) */
	signed short AxisGroupIdx;
	AXIS_GROUP_REF_ARR* KRC_AxisGroupRefArr;
	signed short Tool;
	float M;
	float X;
	float Y;
	float Z;
	float A;
	float B;
	float C;
	float JX;
	float JY;
	float JZ;
	signed short BufferMode;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct mxA_ExecuteCommand mxA_ExecuteCommand;
	/* VAR_INPUT (digital) */
	plcbit ExecuteCmd;
	/* VAR_OUTPUT (digital) */
	plcbit Busy;
	plcbit Done;
	plcbit Aborted;
	plcbit Error;
} KRC_WriteLoadData_typ;

typedef struct KRC_WriteSoftEnd
{
	/* VAR_INPUT (analog) */
	signed short AxisGroupIdx;
	AXIS_GROUP_REF_ARR* KRC_AxisGroupRefArr;
	float A1_Min;
	float A1_Max;
	float A2_Min;
	float A2_Max;
	float A3_Min;
	float A3_Max;
	float A4_Min;
	float A4_Max;
	float A5_Min;
	float A5_Max;
	float A6_Min;
	float A6_Max;
	signed short BufferMode;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct mxA_ExecuteCommand mxA_ExecuteCommand;
	/* VAR_INPUT (digital) */
	plcbit ExecuteCmd;
	/* VAR_OUTPUT (digital) */
	plcbit Busy;
	plcbit Done;
	plcbit Aborted;
	plcbit Error;
} KRC_WriteSoftEnd_typ;

typedef struct KRC_WriteSoftEndExt
{
	/* VAR_INPUT (analog) */
	signed short AxisGroupIdx;
	AXIS_GROUP_REF_ARR* KRC_AxisGroupRefArr;
	float E1_Min;
	float E1_Max;
	float E2_Min;
	float E2_Max;
	float E3_Min;
	float E3_Max;
	float E4_Min;
	float E4_Max;
	float E5_Min;
	float E5_Max;
	float E6_Min;
	float E6_Max;
	signed short BufferMode;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct mxA_ExecuteCommand mxA_ExecuteCommand;
	/* VAR_INPUT (digital) */
	plcbit ExecuteCmd;
	/* VAR_OUTPUT (digital) */
	plcbit Busy;
	plcbit Done;
	plcbit Aborted;
	plcbit Error;
} KRC_WriteSoftEndExt_typ;

typedef struct KRC_WriteSysVar
{
	/* VAR_INPUT (analog) */
	signed short AxisGroupIdx;
	AXIS_GROUP_REF_ARR* KRC_AxisGroupRefArr;
	signed short Index;
	float Value1;
	float Value2;
	float Value3;
	float Value4;
	float Value5;
	float Value6;
	float Value7;
	float Value8;
	float Value9;
	float Value10;
	signed short BufferMode;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct mxA_ExecuteCommand mxA_ExecuteCommand;
	/* VAR_INPUT (digital) */
	plcbit ExecuteCmd;
	plcbit bContinue;
	/* VAR_OUTPUT (digital) */
	plcbit Busy;
	plcbit Done;
	plcbit Aborted;
	plcbit Error;
} KRC_WriteSysVar_typ;

typedef struct KRC_WriteToolData
{
	/* VAR_INPUT (analog) */
	signed short AxisGroupIdx;
	AXIS_GROUP_REF_ARR* KRC_AxisGroupRefArr;
	signed short ToolNo;
	struct FRAME ToolData;
	signed short BufferMode;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct mxA_ExecuteCommand mxA_ExecuteCommand;
	/* VAR_INPUT (digital) */
	plcbit ExecuteCmd;
	/* VAR_OUTPUT (digital) */
	plcbit Busy;
	plcbit Done;
	plcbit Aborted;
	plcbit Error;
} KRC_WriteToolData_typ;

typedef struct KRC_WriteWorkspace
{
	/* VAR_INPUT (analog) */
	signed short AxisGroupIdx;
	AXIS_GROUP_REF_ARR* KRC_AxisGroupRefArr;
	signed short WorkspaceNo;
	signed short WorkspaceMode;
	struct BOX WorkspaceData;
	signed short BufferMode;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct mxA_ExecuteCommand mxA_ExecuteCommand;
	/* VAR_INPUT (digital) */
	plcbit ExecuteCmd;
	/* VAR_OUTPUT (digital) */
	plcbit Busy;
	plcbit Done;
	plcbit Aborted;
	plcbit Error;
} KRC_WriteWorkspace_typ;

typedef struct mc_ExecuteCommand
{
	/* VAR_INPUT (analog) */
	signed short AxisGroupIdx;
	AXIS_GROUP_REF_ARR* KRC_AxisGroupRefArr;
	signed long CmdID;
	signed short QueueMode;
	signed short CommandSize;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct mxA_ResetCommand ResetCommand_1;
	struct mxA_GetOrderState GetOrderState_1;
	struct KRC_Error KRC_Error_1;
	signed short m_State;
	signed long m_OrderID;
	signed short m_CommandSize;
	signed long m_IntErrorID;
	signed long m_GlobalErrorID;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	plcbit EnableDirectExe;
	plcbit EnableQueueExe;
	plcbit IgnoreInit;
	/* VAR_OUTPUT (digital) */
	plcbit WriteCmdPar;
	plcbit ComDone;
	plcbit ComBusy;
	plcbit Busy;
	plcbit Active;
	plcbit Done;
	plcbit CommandAborted;
	plcbit Error;
	plcbit ReadCmdDataRet;
	/* VAR (digital) */
	plcbit m_ExecuteLast;
	plcbit m_RE_Execute;
	plcbit m_FE_Execute;
} mc_ExecuteCommand_typ;

typedef struct MC_Move
{
	/* VAR_INPUT (analog) */
	signed short AxisGroupIdx;
	signed long CmdID;
	AXIS_GROUP_REF_ARR* KRC_AxisGroupRefArr;
	signed short MoveType;
	struct E6POS Position;
	struct E6AXIS AxisPosition;
	struct E6POS CircHP;
	float Velocity;
	float AbsoluteVelocity;
	float Acceleration;
	float AbsoluteAcceleration;
	struct COORDSYS CoordinateSystem;
	signed short OriType;
	signed short CircType;
	float CircAngle;
	struct APO Approximate;
	signed short QueueMode;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	signed short CommandSize;
	signed long m_Velocity;
	signed long m_Acceleration;
	struct mc_ExecuteCommand mc_ExecuteCommand_1;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	plcbit PosValidX;
	plcbit PosValidY;
	plcbit PosValidZ;
	plcbit PosValidA;
	plcbit PosValidB;
	plcbit PosValidC;
	plcbit PosValidE1;
	plcbit PosValidE2;
	plcbit PosValidE3;
	plcbit PosValidE4;
	plcbit PosValidE5;
	plcbit PosValidE6;
	plcbit PosValidS;
	plcbit PosValidT;
	/* VAR_OUTPUT (digital) */
	plcbit ComAcpt;
	plcbit ComBusy;
	plcbit Busy;
	plcbit Active;
	plcbit Done;
	plcbit CommandAborted;
	plcbit Error;
} MC_Move_typ;

typedef struct MC_MoveAxisAbsolute
{
	/* VAR_INPUT (analog) */
	signed short AxisGroupIdx;
	AXIS_GROUP_REF_ARR* KRC_AxisGroupRefArr;
	struct E6AXIS AxisPosition;
	float Velocity;
	float Acceleration;
	struct APO Approximate;
	signed short QueueMode;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct MC_Move MC_Move;
	struct E6POS m_CircHP;
	struct E6POS m_Position;
	signed short m_OriType;
	struct COORDSYS m_CoordinateSystem;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit ComAcpt;
	plcbit ComBusy;
	plcbit Busy;
	plcbit Active;
	plcbit Done;
	plcbit CommandAborted;
	plcbit Error;
} MC_MoveAxisAbsolute_typ;

typedef struct MC_MoveCircularAbsolute
{
	/* VAR_INPUT (analog) */
	signed short AxisGroupIdx;
	AXIS_GROUP_REF_ARR* KRC_AxisGroupRefArr;
	struct E6POS Position;
	struct E6POS CircHP;
	float Angle;
	float Velocity;
	float Acceleration;
	struct COORDSYS CoordinateSystem;
	signed short OriType;
	signed short CircType;
	struct APO Approximate;
	signed short QueueMode;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct MC_Move MC_Move;
	struct COORDSYS m_CoordinateSystem;
	struct E6AXIS m_AxisPosition;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit ComAcpt;
	plcbit ComBusy;
	plcbit Busy;
	plcbit Active;
	plcbit Done;
	plcbit CommandAborted;
	plcbit Error;
} MC_MoveCircularAbsolute_typ;

typedef struct MC_MoveCircularRelative
{
	/* VAR_INPUT (analog) */
	signed short AxisGroupIdx;
	AXIS_GROUP_REF_ARR* KRC_AxisGroupRefArr;
	struct E6POS Distance;
	struct E6POS CircHP;
	float Angle;
	float Velocity;
	float Acceleration;
	struct COORDSYS CoordinateSystem;
	signed short OriType;
	signed short CircType;
	struct APO Approximate;
	signed short QueueMode;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct MC_Move MC_Move;
	struct COORDSYS m_CoordinateSystem;
	struct E6AXIS m_AxisPosition;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit ComAcpt;
	plcbit ComBusy;
	plcbit Busy;
	plcbit Active;
	plcbit Done;
	plcbit CommandAborted;
	plcbit Error;
} MC_MoveCircularRelative_typ;

typedef struct MC_MoveDirectAbsolute
{
	/* VAR_INPUT (analog) */
	signed short AxisGroupIdx;
	AXIS_GROUP_REF_ARR* KRC_AxisGroupRefArr;
	struct E6POS Position;
	float Velocity;
	float Acceleration;
	struct COORDSYS CoordinateSystem;
	struct APO Approximate;
	signed short QueueMode;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct MC_Move MC_Move;
	struct E6POS m_CircHP;
	struct E6AXIS m_AxisPosition;
	signed short m_OriType;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit ComAcpt;
	plcbit ComBusy;
	plcbit Busy;
	plcbit Active;
	plcbit Done;
	plcbit CommandAborted;
	plcbit Error;
} MC_MoveDirectAbsolute_typ;

typedef struct MC_MoveDirectRelative
{
	/* VAR_INPUT (analog) */
	signed short AxisGroupIdx;
	AXIS_GROUP_REF_ARR* KRC_AxisGroupRefArr;
	struct E6POS Distance;
	float Velocity;
	float Acceleration;
	struct COORDSYS CoordinateSystem;
	struct APO Approximate;
	signed short QueueMode;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct MC_Move MC_Move;
	struct E6POS m_CircHP;
	struct E6AXIS m_AxisPosition;
	signed short m_OriType;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit ComAcpt;
	plcbit ComBusy;
	plcbit Busy;
	plcbit Active;
	plcbit Done;
	plcbit CommandAborted;
	plcbit Error;
} MC_MoveDirectRelative_typ;

typedef struct MC_MoveLinearAbsolute
{
	/* VAR_INPUT (analog) */
	signed short AxisGroupIdx;
	AXIS_GROUP_REF_ARR* KRC_AxisGroupRefArr;
	struct E6POS Position;
	float Velocity;
	float Acceleration;
	struct COORDSYS CoordinateSystem;
	signed short OriType;
	struct APO Approximate;
	signed short QueueMode;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct MC_Move MC_Move;
	struct E6POS m_CircHP;
	struct E6AXIS m_AxisPosition;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit ComAcpt;
	plcbit ComBusy;
	plcbit Busy;
	plcbit Active;
	plcbit Done;
	plcbit CommandAborted;
	plcbit Error;
} MC_MoveLinearAbsolute_typ;

typedef struct MC_MoveLinearRelative
{
	/* VAR_INPUT (analog) */
	signed short AxisGroupIdx;
	AXIS_GROUP_REF_ARR* KRC_AxisGroupRefArr;
	struct E6POS Distance;
	float Velocity;
	float Acceleration;
	struct COORDSYS CoordinateSystem;
	signed short OriType;
	struct APO Approximate;
	signed short QueueMode;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct MC_Move MC_Move;
	struct E6POS m_CircHP;
	struct E6AXIS m_AxisPosition;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit ComAcpt;
	plcbit ComBusy;
	plcbit Busy;
	plcbit Active;
	plcbit Done;
	plcbit CommandAborted;
	plcbit Error;
} MC_MoveLinearRelative_typ;

typedef struct mxa_ValuesToAPO
{
	/* VAR_INPUT (analog) */
	signed short PTP_MODE;
	signed short CP_MODE;
	signed short CPTP;
	float CDIS;
	float CORI;
	signed short CVEL;
	/* VAR_OUTPUT (analog) */
	struct APO APO;
} mxa_ValuesToAPO_typ;

typedef struct mxa_ValuesToCOORDSYS
{
	/* VAR_INPUT (analog) */
	signed short Tool;
	signed short Base;
	signed short IPO_Mode;
	/* VAR_OUTPUT (analog) */
	struct COORDSYS COORDSYS;
} mxa_ValuesToCOORDSYS_typ;

typedef struct mxA_ValuesToE6AXIS
{
	/* VAR_INPUT (analog) */
	float A1;
	float A2;
	float A3;
	float A4;
	float A5;
	float A6;
	float E1;
	float E2;
	float E3;
	float E4;
	float E5;
	float E6;
	/* VAR_OUTPUT (analog) */
	struct E6AXIS E6Axis;
} mxA_ValuesToE6AXIS_typ;

typedef struct mxA_ValuesToE6POS
{
	/* VAR_INPUT (analog) */
	float X;
	float Y;
	float Z;
	float A;
	float B;
	float C;
	signed short Status;
	signed short Turn;
	float E1;
	float E2;
	float E3;
	float E4;
	float E5;
	float E6;
	/* VAR_OUTPUT (analog) */
	struct E6POS E6POS;
} mxA_ValuesToE6POS_typ;

typedef struct mxA_ValuesToFRAME
{
	/* VAR_INPUT (analog) */
	float X;
	float Y;
	float Z;
	float A;
	float B;
	float C;
	/* VAR_OUTPUT (analog) */
	struct FRAME FRAME;
} mxA_ValuesToFRAME_typ;

#ifdef _BUR_USE_DECLARATION_IN_IEC
typedef signed short AXIS_VEL[12];
#else
/* Data type AXIS_VEL not declared. Derived data types with an array data type as base type whose starting index is not equal to zero cannot be used in ANSI C programs / libraries.*/
#endif

#ifdef _BUR_USE_DECLARATION_IN_IEC
typedef plcbit MXA_SYNC_IO[2032];
#else
/* Data type MXA_SYNC_IO not declared. Derived data types with an array data type as base type whose starting index is not equal to zero cannot be used in ANSI C programs / libraries.*/
#endif



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void KRC_Abort(struct KRC_Abort* inst);
_BUR_PUBLIC void KRC_ActivateConvInterrupt(struct KRC_ActivateConvInterrupt* inst);
_BUR_PUBLIC void KRC_ActivateInterrupt(struct KRC_ActivateInterrupt* inst);
_BUR_PUBLIC void KRC_AutomaticExternal(struct KRC_AutomaticExternal* inst);
_BUR_PUBLIC void KRC_AutoStart(struct KRC_AutoStart* inst);
_BUR_PUBLIC void KRC_BrakeTest(struct KRC_BrakeTest* inst);
_BUR_PUBLIC void KRC_Continue(struct KRC_Continue* inst);
_BUR_PUBLIC void KRC_ConvFollow(struct KRC_ConvFollow* inst);
_BUR_PUBLIC void KRC_ConvIniOff(struct KRC_ConvIniOff* inst);
_BUR_PUBLIC void KRC_ConvOn(struct KRC_ConvOn* inst);
_BUR_PUBLIC void KRC_ConvSkip(struct KRC_ConvSkip* inst);
_BUR_PUBLIC void KRC_DeactivateConvInterrupt(struct KRC_DeactivateConvInterrupt* inst);
_BUR_PUBLIC void KRC_DeactivateInterrupt(struct KRC_DeactivateInterrupt* inst);
_BUR_PUBLIC void KRC_DeclareInterrupt(struct KRC_DeclareInterrupt* inst);
_BUR_PUBLIC void KRC_Diag(struct KRC_Diag* inst);
_BUR_PUBLIC void KRC_Error(struct KRC_Error* inst);
_BUR_PUBLIC void KRC_Forward(struct KRC_Forward* inst);
_BUR_PUBLIC void KRC_GetAdvance(struct KRC_GetAdvance* inst);
_BUR_PUBLIC void KRC_Initialize(struct KRC_Initialize* inst);
_BUR_PUBLIC void KRC_Interrupt(struct KRC_Interrupt* inst);
_BUR_PUBLIC void KRC_Inverse(struct KRC_Inverse* inst);
_BUR_PUBLIC void KRC_Jog(struct KRC_Jog* inst);
_BUR_PUBLIC void KRC_JogLinearRelative(struct KRC_JogLinearRelative* inst);
_BUR_PUBLIC void KRC_JogToolRelative(struct KRC_JogToolRelative* inst);
_BUR_PUBLIC void KRC_MasRef(struct KRC_MasRef* inst);
_BUR_PUBLIC void KRC_MessageReset(struct KRC_MessageReset* inst);
_BUR_PUBLIC void KRC_Move(struct KRC_Move* inst);
_BUR_PUBLIC void KRC_MoveAxisAbsolute(struct KRC_MoveAxisAbsolute* inst);
_BUR_PUBLIC void KRC_MoveCircAbsolute(struct KRC_MoveCircAbsolute* inst);
_BUR_PUBLIC void KRC_MoveCircRelative(struct KRC_MoveCircRelative* inst);
_BUR_PUBLIC void KRC_MoveDirectAbsolute(struct KRC_MoveDirectAbsolute* inst);
_BUR_PUBLIC void KRC_MoveDirectRelative(struct KRC_MoveDirectRelative* inst);
_BUR_PUBLIC void KRC_MoveLinearAbsolute(struct KRC_MoveLinearAbsolute* inst);
_BUR_PUBLIC void KRC_MoveLinearRelative(struct KRC_MoveLinearRelative* inst);
_BUR_PUBLIC void KRC_ReadActualAcceleration(struct KRC_ReadActualAcceleration* inst);
_BUR_PUBLIC void KRC_ReadActualAxisPosition(struct KRC_ReadActualAxisPosition* inst);
_BUR_PUBLIC void KRC_ReadActualAxisVelocity(struct KRC_ReadActualAxisVelocity* inst);
_BUR_PUBLIC void KRC_ReadActualPosition(struct KRC_ReadActualPosition* inst);
_BUR_PUBLIC void KRC_ReadActualVelocity(struct KRC_ReadActualVelocity* inst);
_BUR_PUBLIC void KRC_ReadAnalogInput(struct KRC_ReadAnalogInput* inst);
_BUR_PUBLIC void KRC_ReadAnalogOutput(struct KRC_ReadAnalogOutput* inst);
_BUR_PUBLIC void KRC_ReadAxisGroup(struct KRC_ReadAxisGroup* inst);
_BUR_PUBLIC void KRC_ReadAxWorkspace(struct KRC_ReadAxWorkspace* inst);
_BUR_PUBLIC void KRC_ReadBaseData(struct KRC_ReadBaseData* inst);
_BUR_PUBLIC void KRC_ReadDigitalInput(struct KRC_ReadDigitalInput* inst);
_BUR_PUBLIC void KRC_ReadDigitalInput1To8(struct KRC_ReadDigitalInput1To8* inst);
_BUR_PUBLIC void KRC_ReadDigitalInputArray(struct KRC_ReadDigitalInputArray* inst);
_BUR_PUBLIC void KRC_ReadDigitalOutput(struct KRC_ReadDigitalOutput* inst);
_BUR_PUBLIC void KRC_ReadInterruptState(struct KRC_ReadInterruptState* inst);
_BUR_PUBLIC void KRC_ReadKRCError(struct KRC_ReadKRCError* inst);
_BUR_PUBLIC void KRC_ReadLoadData(struct KRC_ReadLoadData* inst);
_BUR_PUBLIC void KRC_ReadMXAError(struct KRC_ReadMXAError* inst);
_BUR_PUBLIC void KRC_ReadMXAStatus(struct KRC_ReadMXAStatus* inst);
_BUR_PUBLIC void KRC_ReadSafeOPStatus(struct KRC_ReadSafeOPStatus* inst);
_BUR_PUBLIC void KRC_ReadSoftEnd(struct KRC_ReadSoftEnd* inst);
_BUR_PUBLIC void KRC_ReadSoftEndExt(struct KRC_ReadSoftEndExt* inst);
_BUR_PUBLIC void KRC_ReadSysVar(struct KRC_ReadSysVar* inst);
_BUR_PUBLIC void KRC_ReadToolData(struct KRC_ReadToolData* inst);
_BUR_PUBLIC void KRC_ReadTouchUPState(struct KRC_ReadTouchUPState* inst);
_BUR_PUBLIC void KRC_ReadWorkspace(struct KRC_ReadWorkspace* inst);
_BUR_PUBLIC void KRC_ReadWorkstates(struct KRC_ReadWorkstates* inst);
_BUR_PUBLIC void KRC_SetAdvance(struct KRC_SetAdvance* inst);
_BUR_PUBLIC void KRC_SetCoordSys(struct KRC_SetCoordSys* inst);
_BUR_PUBLIC void KRC_SetDistanceTrigger(struct KRC_SetDistanceTrigger* inst);
_BUR_PUBLIC void KRC_SetOverride(struct KRC_SetOverride* inst);
_BUR_PUBLIC void KRC_SetPathTrigger(struct KRC_SetPathTrigger* inst);
_BUR_PUBLIC void KRC_TechFunction(struct KRC_TechFunction* inst);
_BUR_PUBLIC void KRC_Test_TechFunction(struct KRC_Test_TechFunction* inst);
_BUR_PUBLIC void KRC_TouchUP(struct KRC_TouchUP* inst);
_BUR_PUBLIC void KRC_VectorMoveOff(struct KRC_VectorMoveOff* inst);
_BUR_PUBLIC void KRC_VectorMoveOn(struct KRC_VectorMoveOn* inst);
_BUR_PUBLIC void KRC_WaitForInput(struct KRC_WaitForInput* inst);
_BUR_PUBLIC void KRC_WriteAnalogOutput(struct KRC_WriteAnalogOutput* inst);
_BUR_PUBLIC void KRC_WriteAxisGroup(struct KRC_WriteAxisGroup* inst);
_BUR_PUBLIC void KRC_WriteAxWorkspace(struct KRC_WriteAxWorkspace* inst);
_BUR_PUBLIC void KRC_WriteBaseData(struct KRC_WriteBaseData* inst);
_BUR_PUBLIC void KRC_WriteDigitalOutput(struct KRC_WriteDigitalOutput* inst);
_BUR_PUBLIC void KRC_WriteDigitalOutput1To8(struct KRC_WriteDigitalOutput1To8* inst);
_BUR_PUBLIC void KRC_WriteLoadData(struct KRC_WriteLoadData* inst);
_BUR_PUBLIC void KRC_WriteSoftEnd(struct KRC_WriteSoftEnd* inst);
_BUR_PUBLIC void KRC_WriteSoftEndExt(struct KRC_WriteSoftEndExt* inst);
_BUR_PUBLIC void KRC_WriteSysVar(struct KRC_WriteSysVar* inst);
_BUR_PUBLIC void KRC_WriteToolData(struct KRC_WriteToolData* inst);
_BUR_PUBLIC void KRC_WriteWorkspace(struct KRC_WriteWorkspace* inst);
_BUR_PUBLIC void mc_ExecuteCommand(struct mc_ExecuteCommand* inst);
_BUR_PUBLIC void MC_Move(struct MC_Move* inst);
_BUR_PUBLIC void MC_MoveAxisAbsolute(struct MC_MoveAxisAbsolute* inst);
_BUR_PUBLIC void MC_MoveCircularAbsolute(struct MC_MoveCircularAbsolute* inst);
_BUR_PUBLIC void MC_MoveCircularRelative(struct MC_MoveCircularRelative* inst);
_BUR_PUBLIC void MC_MoveDirectAbsolute(struct MC_MoveDirectAbsolute* inst);
_BUR_PUBLIC void MC_MoveDirectRelative(struct MC_MoveDirectRelative* inst);
_BUR_PUBLIC void MC_MoveLinearAbsolute(struct MC_MoveLinearAbsolute* inst);
_BUR_PUBLIC void MC_MoveLinearRelative(struct MC_MoveLinearRelative* inst);
_BUR_PUBLIC void mxA_ExecuteCommand(struct mxA_ExecuteCommand* inst);
_BUR_PUBLIC void mxA_GetOrderState(struct mxA_GetOrderState* inst);
_BUR_PUBLIC void mxA_ResetCommand(struct mxA_ResetCommand* inst);
_BUR_PUBLIC void mxa_ValuesToAPO(struct mxa_ValuesToAPO* inst);
_BUR_PUBLIC void mxa_ValuesToCOORDSYS(struct mxa_ValuesToCOORDSYS* inst);
_BUR_PUBLIC void mxA_ValuesToE6AXIS(struct mxA_ValuesToE6AXIS* inst);
_BUR_PUBLIC void mxA_ValuesToE6POS(struct mxA_ValuesToE6POS* inst);
_BUR_PUBLIC void mxA_ValuesToFRAME(struct mxA_ValuesToFRAME* inst);
_BUR_PUBLIC plcbit mxA_GetIO_BYTE(signed short BytePos, plcbyte (*KRC4_Input)[255], signed short* O);
_BUR_PUBLIC plcbit mxA_GetIO_DINT(signed short BytePos, plcbyte (*KRC4_Input)[255], signed long* O);
_BUR_PUBLIC plcbit mxA_GetIO_INT(signed short BytePos, plcbyte (*KRC4_Input)[255], signed short* O);
_BUR_PUBLIC plcbit mxA_GetIO_NIBBLE(signed short BytePos, plcbyte (*KRC4_Input)[255], signed short* N1, signed short* N2);
_BUR_PUBLIC plcbit mxA_GetIO_REAL(signed short BytePos, plcbyte (*KRC4_Input)[255], float* O);
_BUR_PUBLIC plcbit mxA_GetIO_SINT(signed short BytePos, plcbyte (*KRC4_Input)[255], signed char* O);
_BUR_PUBLIC plcbit mxA_WriteIO_BYTE(signed short BytePos, signed short Val, plcbyte KRC4_Output[255]);
_BUR_PUBLIC plcbit mxA_WriteIO_DINT(signed short BytePos, signed long Val, plcbyte KRC4_Output[255]);
_BUR_PUBLIC plcbit mxA_WriteIO_DWORD(signed short BytePos, plcdword Val, plcbyte KRC4_Output[255]);
_BUR_PUBLIC plcbit mxA_WriteIO_REAL(signed short BytePos, float Val, plcbyte KRC4_Output[255]);
_BUR_PUBLIC plcbit mxA_WriteIO_WORD(signed short BytePos, plcword Val, plcbyte KRC4_Output[255]);


#ifdef __cplusplus
};
#endif
#endif /* _KUKAMXA3_2_ */

