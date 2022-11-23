/* Automation Studio generated header file */
/* Do not edit ! */
/* McAcp6D 1.02.9 */

#ifndef _MCACP6D_
#define _MCACP6D_
#ifdef __cplusplus
extern "C" 
{
#endif
#ifndef _McAcp6D_VERSION
#define _McAcp6D_VERSION 1.02.9
#endif

#include <bur/plctypes.h>

#ifndef _BUR_PUBLIC
#define _BUR_PUBLIC
#endif

#ifdef _SG4
#include <McBase.h>
#endif
 
#ifdef _SG3
#include <McBase.h>
#endif
 
#ifdef _SGC
#include <McBase.h>
#endif

/* Datatypes and datatypes of function blocks */
typedef enum McAcp6DControllerStateEnum
{	mcACP6D_STATE_BOOTING = 0,
	mcACP6D_STATE_INACTIVE = 1,
	mcACP6D_STATE_ACTIVATING = 2,
	mcACP6D_STATE_OPERATION = 5,
	mcACP6D_STATE_DEACTIVATING = 7,
	mcACP6D_STATE_ERROR_HANDLING = 8,
	mcACP6D_STATE_ERROR = 9
} McAcp6DControllerStateEnum;

typedef enum McAcp6DShStereotypeDeleteCmdEnum
{	mcACP6D_SH_ST_DELETE_SPECIFIC = 0,
	mcACP6D_SH_ST_DELETE_ALL = 1
} McAcp6DShStereotypeDeleteCmdEnum;

typedef enum McAcp6DShGetInfoOptionEnum
{	mcACP6D_POSITION_FEEDBACK = 0,
	mcACP6D_FORCE_FEEDBACK = 1
} McAcp6DShGetInfoOptionEnum;

typedef enum McAcp6DMacroDeleteCmdEnum
{	mcACP6D_MACRO_DELETE_SPECIFIC = 0,
	mcACP6D_MACRO_DELETE_ALL = 1
} McAcp6DMacroDeleteCmdEnum;

typedef enum McAcp6dPLCopenStateEnum
{	mcACP6D_DISABLED = 0,
	mcACP6D_HOMING = 1,
	mcACP6D_READY = 2,
	mcACP6D_STOPPING = 3,
	mcACP6D_ERRORSTOP = 4,
	mcACP6D_STARTUP = 5,
	mcACP6D_INVALID_CONFIGURATION = 6
} McAcp6dPLCopenStateEnum;

typedef enum McAcp6DShStateEnum
{	mcACP6D_SH_STATE_UNDETECTED = 0,
	mcACP6D_SH_STATE_DISCOVERING = 1,
	mcACP6D_SH_STATE_LANDED = 2,
	mcACP6D_SH_STATE_IDLING = 3,
	mcACP6D_SH_STATE_DISABLED = 4,
	mcACP6D_SH_STATE_MOTION = 5,
	mcACP6D_SH_STATE_WAIT = 6,
	mcACP6D_SH_STATE_STOPPING = 7,
	mcACP6D_SH_STATE_OBSTACLE = 8,
	mcACP6D_SH_STATE_HOLD = 9,
	mcACP6D_SH_STATE_STOPPED = 10,
	mcACP6D_SH_STATE_ERROR = 14,
	mcACP6D_SH_STATE_RESERVED = 15
} McAcp6DShStateEnum;

typedef enum McAcp6DZoneStateEnum
{	mcACP6D_ZONE_NOT_AVAILABLE = 0,
	mcACP6D_ZONE_ACTIVE_OPEN = 1,
	mcACP6D_ZONE_DEACTIVATING = 2,
	mcACP6D_ZONE_LOADING = 3,
	mcACP6D_ZONE_ACTIVATING = 4,
	mcACP6D_ZONE_ACTIVE_CLOSED = 5
} McAcp6DZoneStateEnum;

typedef enum McAcp6DPlanetCtrlOptionEnum
{	mcACP6D_PLANET_REMOVE_SH = 0,
	mcACP6D_PLANET_ADD_SH = 1
} McAcp6DPlanetCtrlOptionEnum;

typedef enum McAcp6DShGroupCoupleStateEnum
{	mcACP6D_SH_GROUP_DECOUPLED = 0,
	mcACP6D_SH_GROUP_COUPLED = 1
} McAcp6DShGroupCoupleStateEnum;

typedef enum McAcp6DShGroupCoupleOptionEnum
{	mcACP6D_SH_GROUP_DECOUPLE = 0,
	mcACP6D_SH_GROUP_COUPLE = 1
} McAcp6DShGroupCoupleOptionEnum;

typedef enum McAcp6DShGroupCoupleModeEnum
{	mcACP6D_SH_GROUP_INDV_ROT_REF = 0,
	mcACP6D_SH_GROUP_CMN_ROT_REF = 1
} McAcp6DShGroupCoupleModeEnum;

typedef enum McAcp6DZoneTypeEnum
{	mcACP6D_ZONE_TYPE_NORMAL = 0
} McAcp6DZoneTypeEnum;

typedef enum McAcp6DForceModeOptionEnum
{	mcACP6D_FORCE_MODE_EXIT = 0,
	mcACP6D_FORCE_MODE_Z = 1,
	mcACP6D_FORCE_MODE_X = 2,
	mcACP6D_FORCE_MODE_Y = 3,
	mcACP6D_FORCE_MODE_XY = 4
} McAcp6DForceModeOptionEnum;

typedef enum McAcp6DMoveModeEnum
{	mcACP6D_MOVE_ABSOLUTE = 0,
	mcACP6D_MOVE_RELATIVE = 1
} McAcp6DMoveModeEnum;

typedef enum McAcp6DInPlanePathEnum
{	mcACP6D_PATH_DIRECT = 0,
	mcACP6D_PATH_X_THEN_Y = 1,
	mcACP6D_PATH_Y_THEN_X = 2
} McAcp6DInPlanePathEnum;

typedef enum McAcp6DArcDirectionEnum
{	mcACP6D_ARC_CLOCKWISE = 0,
	mcACP6D_ARC_COUNTER_CLOCKWISE = 1
} McAcp6DArcDirectionEnum;

typedef enum McAcp6DArcOptionEnum
{	mcACP6D_ARC_RADIUS = 0,
	mcACP6D_ARC_ANGULAR = 1
} McAcp6DArcOptionEnum;

typedef enum McAcp6DArcTypeEnum
{	mcACP6D_ARC_MINOR,
	mcACP6D_ARC_MAJOR
} McAcp6DArcTypeEnum;

typedef enum McAcp6DShortAxRotEnum
{	mcACP6D_SHORT_AX_ROT_ONLY,
	mcACP6D_SHORT_AX_ROT_CENTER
} McAcp6DShortAxRotEnum;

typedef enum McAcp6DLevitationLevelEnum
{	mcACP6D_LEVEL_LAND = 0,
	mcACP6D_LEVEL_LEVITATE = 1
} McAcp6DLevitationLevelEnum;

typedef enum McAcp6DBufferStateEnum
{	mcACP6D_BUFFER_STATE_BLOCKED = 0,
	mcACP6D_BUFFER_STATE_OPEN = 1
} McAcp6DBufferStateEnum;

typedef enum McAcp6DHaltOptionEnum
{	mcACP6D_CONTINUE = 0,
	mcACP6D_HALT = 1
} McAcp6DHaltOptionEnum;

typedef enum McAcp6DAsmBufferOptionEnum
{	mcACP6D_BUFFER_ASM_BLOCK = 0,
	mcACP6D_BUFFER_ASM_RELEASE = 1,
	mcACP6D_BUFFER_ASM_CLEAR = 2
} McAcp6DAsmBufferOptionEnum;

typedef enum McAcp6DShGroupBufferOptionEnum
{	mcACP6D_BUFFER_SHGROUP_BLOCK = 0,
	mcACP6D_BUFFER_SHGROUP_RELEASE = 1
} McAcp6DShGroupBufferOptionEnum;

typedef enum McAcp6DBufferOptionEnum
{	mcACP6D_BUFFER_BLOCK = 0,
	mcACP6D_BUFFER_RELEASE = 1,
	mcACP6D_BUFFER_CLEAR = 2,
	mcACP6D_BUFFER_GET_STATUS = 3
} McAcp6DBufferOptionEnum;

typedef enum McAcp6DBarrierCmdEnum
{	mcACP6D_BARRIER_OPEN = 0,
	mcACP6D_BARRIER_CLOSE = 1
} McAcp6DBarrierCmdEnum;

typedef enum McAcp6DValueSrcEnum
{	mcACP6D_VALUE_ACTUAL = 0
} McAcp6DValueSrcEnum;

typedef enum McAcp6DShTypesEnum
{	mcACP6D_SH_TYPE_120_120 = 0,
	mcACP6D_SH_TYPE_180_120 = 2,
	mcACP6D_SH_TYPE_120_180 = 3,
	mcACP6D_SH_TYPE_180_180 = 6,
	mcACP6D_SH_TYPE_210_180 = 8,
	mcACP6D_SH_TYPE_180_210 = 9,
	mcACP6D_SH_TYPE_210_210 = 12,
	mcACP6D_SH_TYPE_240_240 = 14,
	mcACP6D_SH_TYPE_300_300 = 16,
	mcACP6D_SH_TYPE_330_330 = 18,
	mcACP6D_SH_TYPE_450_450 = 20
} McAcp6DShTypesEnum;

typedef enum McAcp6DShPerformanceLevelEnum
{	mcACP6D_SH_PERF_STABILITY = 0,
	mcACP6D_SH_PERF_SEMI_STABILITY = 1,
	mcACP6D_SH_PERF_SEMI_AGGRESSIVE = 2,
	mcACP6D_SH_PERF_AGGRESSIVE = 3
} McAcp6DShPerformanceLevelEnum;

typedef enum McAcp6DRotaryMotionModeEnum
{	mcACP6D_ROTATE_ABSOLUTE_POS = 0,
	mcACP6D_ROTATE_COUNTER_CLOCKWISE = 1,
	mcACP6D_ROTATE_CLOCKWISE = 2
} McAcp6DRotaryMotionModeEnum;

typedef struct Mc6DInternalAssemblyIfType
{	plcdword vtable;
} Mc6DInternalAssemblyIfType;

typedef struct Mc6DAssemblyType
{	struct Mc6DInternalAssemblyIfType* controlif;
} Mc6DAssemblyType;

typedef struct Mc6DInternalShuttleIfType
{	plcdword vtable;
} Mc6DInternalShuttleIfType;

typedef struct Mc6DShuttleType
{	struct Mc6DInternalShuttleIfType* controlif;
} Mc6DShuttleType;

typedef struct Mc6DInternalShuttleGroupIfType
{	plcdword vtable;
} Mc6DInternalShuttleGroupIfType;

typedef struct Mc6DShuttleGroupType
{	struct Mc6DInternalShuttleGroupIfType* controlif;
} Mc6DShuttleGroupType;

typedef struct Mc6DInternalSegmentIfType
{	plcdword vtable;
} Mc6DInternalSegmentIfType;

typedef struct Mc6DSegmentType
{	struct Mc6DInternalSegmentIfType* controlif;
} Mc6DSegmentType;

typedef struct Mc6DInternalZoneIfType
{	plcdword vtable;
} Mc6DInternalZoneIfType;

typedef struct Mc6DZoneType
{	struct Mc6DInternalZoneIfType* controlif;
} Mc6DZoneType;

typedef struct Mc6DControllerFBIOType
{	unsigned short Array[200];
} Mc6DControllerFBIOType;

typedef struct McAcp6DJogVelocityParType
{	plcbit Jog;
	float Direction;
	float Velocity;
} McAcp6DJogVelocityParType;

typedef struct McAcp6DAsmInfoType
{	enum McAcp6dPLCopenStateEnum AssemblyState;
	enum McAcp6DControllerStateEnum Controller6DState;
} McAcp6DAsmInfoType;

typedef struct McAcp6DConfigDiagType
{	plcbit ConfigWrite;
	plcbit ConfigReboot;
} McAcp6DConfigDiagType;

typedef struct McAcp6DTicketDiagType
{	unsigned short ExecutingTicket;
	unsigned short LastFinishedTicket;
	unsigned short ExecutingTicketHistory[100];
	unsigned short LastFinishedTicketHistoryy[100];
	unsigned short FreeTickets;
	unsigned short LastExecutedCommand;
	unsigned short LastFinishedCommand;
	unsigned short CommandHistory[100];
} McAcp6DTicketDiagType;

typedef struct McAcp6DAsmDiagType
{	struct McAcp6DConfigDiagType Config;
	struct McAcp6DTicketDiagType Ticket;
} McAcp6DAsmDiagType;

typedef struct McAcp6DAsmGetInfoType
{	enum McAcp6DControllerStateEnum State;
	unsigned short NumberOfShuttles;
	float Power;
	float MaxCPUTemp;
	float MaxAmplifierTemp;
	float MaxMotorTemp;
} McAcp6DAsmGetInfoType;

typedef struct McAcp6DSegInfoType
{	float Power;
	float CPUTemp;
	float AmplifierTemp;
	float MotorTemp;
} McAcp6DSegInfoType;

typedef struct McAcp6DAsyncPosType
{	float X;
	float Y;
	struct Mc6DShuttleType* Shuttle;
} McAcp6DAsyncPosType;

typedef struct McAcp6DMoveInPlaneAsyncParType
{	float Velocity;
	float Acceleration;
	struct McAcp6DAsyncPosType AsyncPar[78];
	plcbit MoveOnlySelectedShuttles;
} McAcp6DMoveInPlaneAsyncParType;

typedef struct McAcp6DShGroupShListParType
{	struct Mc6DShuttleType* Shuttle;
} McAcp6DShGroupShListParType;

typedef struct McAcp6DShGroupAddShParType
{	struct McAcp6DShGroupShListParType ShuttleList[32];
} McAcp6DShGroupAddShParType;

typedef struct McAcp6DPlanetParType
{	enum McAcp6DPlanetCtrlOptionEnum Option;
	struct McAcp6DShGroupShListParType ShuttleList[32];
} McAcp6DPlanetParType;

typedef struct McAcp6DShGroupCoupleCtrlParType
{	enum McAcp6DShGroupCoupleModeEnum Mode;
	enum McAcp6DShGroupCoupleOptionEnum Option;
} McAcp6DShGroupCoupleCtrlParType;

typedef struct McAcp6DShGroupInfoType
{	enum McAcp6DShGroupCoupleStateEnum CoupleState;
	unsigned short NumberOfShuttles;
} McAcp6DShGroupInfoType;

typedef struct McAcp6DSegBarrierInfoType
{	enum McAcp6DZoneStateEnum State;
	unsigned short NumberOfShuttles;
} McAcp6DSegBarrierInfoType;

typedef struct McAcp6DZoneBarrierInfoType
{	enum McAcp6DZoneStateEnum State;
	unsigned short NumberOfShuttles;
} McAcp6DZoneBarrierInfoType;

typedef struct McAcp6DInPlaneAxesType
{	float X;
	float Y;
} McAcp6DInPlaneAxesType;

typedef struct McAcp6DCreateZoneParType
{	plcstring Name[34];
	enum McAcp6DZoneTypeEnum ZoneType;
	struct McAcp6DInPlaneAxesType BottomLeft;
	struct McAcp6DInPlaneAxesType TopRight;
} McAcp6DCreateZoneParType;

typedef struct McAcp6DGetShAddInfoType
{	unsigned short ShuttleID;
} McAcp6DGetShAddInfoType;

typedef struct McAcp6DGetSegAddInfoType
{	unsigned short SegmentID;
} McAcp6DGetSegAddInfoType;

typedef struct McAcp6DGetZoneAddInfoType
{	unsigned short ZoneID;
} McAcp6DGetZoneAddInfoType;

typedef struct McAcp6DGetShGroupAddInfoType
{	unsigned short GroupID;
} McAcp6DGetShGroupAddInfoType;

typedef struct McAcp6DBarrierCmdParType
{	enum McAcp6DBarrierCmdEnum Command;
} McAcp6DBarrierCmdParType;

typedef struct McAcp6DShortAxAxesType
{	float Z;
	float Rx;
	float Ry;
	float Rz;
} McAcp6DShortAxAxesType;

typedef struct McAcp6DInPlaneParType
{	struct McAcp6DInPlaneAxesType Position;
	float Velocity;
	float EndVelocity;
	float Acceleration;
	enum McAcp6DMoveModeEnum Mode;
	enum McAcp6DInPlanePathEnum Path;
} McAcp6DInPlaneParType;

typedef struct McAcp6DAxisBoolType
{	plcbit X;
	plcbit Y;
	plcbit Z;
	plcbit RX;
	plcbit RY;
	plcbit RZ;
} McAcp6DAxisBoolType;

typedef struct McAcp6DMoveCyclicParType
{	struct McAcp6DAxisBoolType DisableAxis;
} McAcp6DMoveCyclicParType;

typedef struct McAcp6DReadCyclicParType
{	enum McAcp6DValueSrcEnum ValueSource;
} McAcp6DReadCyclicParType;

typedef struct McAcp6DShortAxRotType
{	enum McAcp6DShortAxRotEnum Type;
	struct McAcp6DInPlaneAxesType Center;
} McAcp6DShortAxRotType;

typedef struct McAcp6DShortAxParType
{	struct McAcp6DShortAxAxesType Position;
	struct McAcp6DShortAxAxesType Velocity;
	enum McAcp6DMoveModeEnum Mode;
	struct McAcp6DShortAxRotType Rotation;
} McAcp6DShortAxParType;

typedef struct McAcp6DArcAngularType
{	struct McAcp6DInPlaneAxesType Center;
	float Angle;
} McAcp6DArcAngularType;

typedef struct McAcp6DArcRadiusType
{	struct McAcp6DInPlaneAxesType Position;
	float Radius;
	enum McAcp6DArcTypeEnum ArcType;
} McAcp6DArcRadiusType;

typedef struct McAcp6DArcParType
{	enum McAcp6DArcDirectionEnum Direction;
	float Velocity;
	float EndVelocity;
	float Acceleration;
	enum McAcp6DMoveModeEnum Mode;
	enum McAcp6DArcOptionEnum Option;
	struct McAcp6DArcAngularType Angular;
	struct McAcp6DArcRadiusType Radius;
} McAcp6DArcParType;

typedef struct McAcp6DLevitationParType
{	enum McAcp6DLevitationLevelEnum Level;
	unsigned char Speed;
} McAcp6DLevitationParType;

typedef struct McAcp6DShortAx6DParType
{	struct McAcp6DShortAxAxesType Position;
	struct McAcp6DShortAxAxesType Velocity;
} McAcp6DShortAx6DParType;

typedef struct McAcp6DInPlane6DParType
{	struct McAcp6DInPlaneAxesType Position;
	float Velocity;
	float Acceleration;
} McAcp6DInPlane6DParType;

typedef struct McAcp6DMove6DParType
{	struct McAcp6DInPlane6DParType InPlane;
	struct McAcp6DShortAx6DParType ShortAxis;
} McAcp6DMove6DParType;

typedef struct McAcp6DShPositionType
{	float X;
	float Y;
	float Z;
	float Rx;
	float Ry;
	float Rz;
} McAcp6DShPositionType;

typedef struct McAcp6DShForceType
{	float Fx;
	float Fy;
	float Fz;
	float Tx;
	float Ty;
	float Tz;
} McAcp6DShForceType;

typedef struct McAcp6DForceModeParType
{	enum McAcp6DForceModeOptionEnum Option;
	struct McAcp6DShForceType Force;
} McAcp6DForceModeParType;

typedef struct McAcp6DShInfoMotionBufferType
{	unsigned short NumberOfCommands;
	plcbit IsBlocked;
	unsigned short CommandLabel;
} McAcp6DShInfoMotionBufferType;

typedef struct McAcp6DShInfoType
{	unsigned short ShuttleID;
	enum McAcp6DShStateEnum State;
	struct McAcp6DShPositionType Position;
} McAcp6DShInfoType;

typedef struct McAcp6DShGetInfoType
{	unsigned short ShuttleID;
	enum McAcp6DShStateEnum State;
	struct McAcp6DShPositionType Position;
	struct McAcp6DShForceType Force;
	plcbit IsHalt;
	struct McAcp6DShInfoMotionBufferType MotionBuffer;
	struct McAcp6DAxisBoolType ForceMode;
	struct Mc6DShuttleType StarShuttle;
} McAcp6DShGetInfoType;

typedef struct McAcp6DShGetPropertyType
{	enum McAcp6DShTypesEnum ShuttleType;
} McAcp6DShGetPropertyType;

typedef struct McAcp6DBufferInfoType
{	unsigned short NumberOfCommands;
	enum McAcp6DBufferStateEnum State;
	unsigned short NextCmdLabel;
	unsigned short LatestCmdLabel;
} McAcp6DBufferInfoType;

typedef struct McAcp6DErrInfoType
{	unsigned char NumberOfErrors;
	signed long ErrorCode[9];
} McAcp6DErrInfoType;

typedef struct McAcp6DPayloadSizeType
{	float XOffsetPos;
	float XOffsetNeg;
	float YOffsetPos;
	float YOffsetNeg;
} McAcp6DPayloadSizeType;

typedef struct McAcp6DCoGType
{	float X;
	float Y;
	float Z;
} McAcp6DCoGType;

typedef struct McAcp6DShStereotypeParType
{	plcstring Name[34];
	enum McAcp6DShTypesEnum ShuttleType;
	enum McAcp6DShPerformanceLevelEnum PerformanceLevel;
	float Payload;
	struct McAcp6DPayloadSizeType PayloadSize;
	struct McAcp6DCoGType CenterOfGravity;
} McAcp6DShStereotypeParType;

typedef struct McAcp6DMacroCreateParType
{	plcstring Name[34];
} McAcp6DMacroCreateParType;

typedef struct McAcp6DFuncInfoType
{	unsigned char CmdSta;
	unsigned char TicketNumber;
	unsigned short EventID;
	plcbit SendToPMC;
	plcbit ReadFromPMC;
	signed long MsgPartNStatus;
} McAcp6DFuncInfoType;

typedef struct McAcp6DRotaryMotionParType
{	enum McAcp6DRotaryMotionModeEnum Mode;
	float Angle;
	float Velocity;
	float Acceleration;
} McAcp6DRotaryMotionParType;

typedef struct McAcp6DRotaryMotionSpinParType
{	float Duration;
	float Angle;
	float Velocity;
	float Acceleration;
} McAcp6DRotaryMotionSpinParType;

typedef struct MC_BR_AsmPowerOn_Acp6D
{
	/* VAR_INPUT (analog) */
	struct Mc6DAssemblyType* Assembly;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Acknowledge;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
} MC_BR_AsmPowerOn_Acp6D_typ;

typedef struct MC_BR_AsmPowerOff_Acp6D
{
	/* VAR_INPUT (analog) */
	struct Mc6DAssemblyType* Assembly;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Acknowledge;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
} MC_BR_AsmPowerOff_Acp6D_typ;

typedef struct MC_BR_AsmStop_Acp6D
{
	/* VAR_INPUT (analog) */
	struct Mc6DAssemblyType* Assembly;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Acknowledge;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
} MC_BR_AsmStop_Acp6D_typ;

typedef struct MC_BR_AsmReboot_Acp6D
{
	/* VAR_INPUT (analog) */
	struct Mc6DAssemblyType* Assembly;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Acknowledge;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
} MC_BR_AsmReboot_Acp6D_typ;

typedef struct MC_BR_AsmHalt_Acp6D
{
	/* VAR_INPUT (analog) */
	struct Mc6DAssemblyType* Assembly;
	enum McAcp6DHaltOptionEnum Option;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Acknowledge;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
} MC_BR_AsmHalt_Acp6D_typ;

typedef struct MC_BR_AsmBuffer_Acp6D
{
	/* VAR_INPUT (analog) */
	struct Mc6DAssemblyType* Assembly;
	enum McAcp6DAsmBufferOptionEnum Option;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
} MC_BR_AsmBuffer_Acp6D_typ;

typedef struct MC_BR_ShForceMode_Acp6D
{
	/* VAR_INPUT (analog) */
	struct Mc6DShuttleType* Shuttle;
	struct McAcp6DForceModeParType Parameters;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
} MC_BR_ShForceMode_Acp6D_typ;

typedef struct MC_BR_ShStereotypeDefine_Acp6D
{
	/* VAR_INPUT (analog) */
	struct Mc6DAssemblyType* Assembly;
	struct McAcp6DShStereotypeParType Parameters;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
} MC_BR_ShStereotypeDefine_Acp6D_typ;

typedef struct MC_BR_ShStereotypeAssign_Acp6D
{
	/* VAR_INPUT (analog) */
	struct Mc6DShuttleType* Shuttle;
	plcstring Name[33];
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
} MC_BR_ShStereotypeAssign_Acp6D_typ;

typedef struct MC_BR_ShStereotypeDelete_Acp6D
{
	/* VAR_INPUT (analog) */
	struct Mc6DAssemblyType* Assembly;
	plcstring Name[33];
	enum McAcp6DShStereotypeDeleteCmdEnum Command;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
} MC_BR_ShStereotypeDelete_Acp6D_typ;

typedef struct MC_BR_MacroDelete_Acp6D
{
	/* VAR_INPUT (analog) */
	struct Mc6DAssemblyType* Assembly;
	plcstring Name[33];
	enum McAcp6DMacroDeleteCmdEnum Command;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
} MC_BR_MacroDelete_Acp6D_typ;

typedef struct MC_BR_MacroCreate_Acp6D
{
	/* VAR_INPUT (analog) */
	struct Mc6DAssemblyType* Assembly;
	struct McAcp6DMacroCreateParType Parameters;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	struct Mc6DShuttleType MacroShuttle;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
} MC_BR_MacroCreate_Acp6D_typ;

typedef struct MC_BR_VirtualShCreate_Acp6D
{
	/* VAR_INPUT (analog) */
	struct Mc6DAssemblyType* Assembly;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	struct Mc6DShuttleType VirtualShuttle;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
} MC_BR_VirtualShCreate_Acp6D_typ;

typedef struct MC_BR_ShGroupCreate_Acp6D
{
	/* VAR_INPUT (analog) */
	struct Mc6DAssemblyType* Assembly;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	struct Mc6DShuttleGroupType ShuttleGroup;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
} MC_BR_ShGroupCreate_Acp6D_typ;

typedef struct MC_BR_MacroSave_Acp6D
{
	/* VAR_INPUT (analog) */
	struct Mc6DShuttleType* Shuttle;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
} MC_BR_MacroSave_Acp6D_typ;

typedef struct MC_BR_MacroClear_Acp6D
{
	/* VAR_INPUT (analog) */
	struct Mc6DShuttleType* Shuttle;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
} MC_BR_MacroClear_Acp6D_typ;

typedef struct MC_BR_MacroRun_Acp6D
{
	/* VAR_INPUT (analog) */
	struct Mc6DShuttleType* Shuttle;
	plcstring Name[33];
	unsigned short CommandLabel;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Acknowledge;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
} MC_BR_MacroRun_Acp6D_typ;

typedef struct MC_BR_ZoneCreate_Acp6D
{
	/* VAR_INPUT (analog) */
	struct Mc6DAssemblyType* Assembly;
	struct McAcp6DCreateZoneParType Parameters;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
} MC_BR_ZoneCreate_Acp6D_typ;

typedef struct MC_BR_AsmLevitation_Acp6D
{
	/* VAR_INPUT (analog) */
	struct Mc6DAssemblyType* Assembly;
	struct McAcp6DLevitationParType Parameters;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Acknowledge;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
} MC_BR_AsmLevitation_Acp6D_typ;

typedef struct MC_BR_AsmGetShuttle_Acp6D
{
	/* VAR_INPUT (analog) */
	struct Mc6DAssemblyType* Assembly;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	unsigned short TotalCount;
	unsigned short RemainingCount;
	struct Mc6DShuttleType Shuttle;
	struct McAcp6DGetShAddInfoType AdditionalInfo;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit Next;
	/* VAR_OUTPUT (digital) */
	plcbit Valid;
	plcbit Busy;
	plcbit Error;
} MC_BR_AsmGetShuttle_Acp6D_typ;

typedef struct MC_BR_AsmGetVirtualSh_Acp6D
{
	/* VAR_INPUT (analog) */
	struct Mc6DAssemblyType* Assembly;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	unsigned short TotalCount;
	unsigned short RemainingCount;
	struct Mc6DShuttleType VirtualShuttle;
	struct McAcp6DGetShAddInfoType AdditionalInfo;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit Next;
	/* VAR_OUTPUT (digital) */
	plcbit Valid;
	plcbit Busy;
	plcbit Error;
} MC_BR_AsmGetVirtualSh_Acp6D_typ;

typedef struct MC_BR_AsmGetSegment_Acp6D
{
	/* VAR_INPUT (analog) */
	struct Mc6DAssemblyType* Assembly;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	unsigned short TotalCount;
	unsigned short RemainingCount;
	struct Mc6DSegmentType Segment;
	struct McAcp6DGetSegAddInfoType AdditionalInfo;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit Next;
	/* VAR_OUTPUT (digital) */
	plcbit Valid;
	plcbit Busy;
	plcbit Error;
} MC_BR_AsmGetSegment_Acp6D_typ;

typedef struct MC_BR_AsmGetZone_Acp6D
{
	/* VAR_INPUT (analog) */
	struct Mc6DAssemblyType* Assembly;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	unsigned short TotalCount;
	unsigned short RemainingCount;
	struct Mc6DZoneType Zone;
	struct McAcp6DGetZoneAddInfoType AdditionalInfo;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit Next;
	/* VAR_OUTPUT (digital) */
	plcbit Valid;
	plcbit Busy;
	plcbit Error;
} MC_BR_AsmGetZone_Acp6D_typ;

typedef struct MC_BR_AsmGetShGroup_Acp6D
{
	/* VAR_INPUT (analog) */
	struct Mc6DAssemblyType* Assembly;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	unsigned short TotalCount;
	unsigned short RemainingCount;
	struct Mc6DShuttleGroupType ShuttleGroup;
	struct McAcp6DGetShGroupAddInfoType AdditionalInfo;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	plcbit Next;
	/* VAR_OUTPUT (digital) */
	plcbit Valid;
	plcbit Busy;
	plcbit Error;
} MC_BR_AsmGetShGroup_Acp6D_typ;

typedef struct MC_BR_AsmGetInfo_Acp6D
{
	/* VAR_INPUT (analog) */
	struct Mc6DAssemblyType* Assembly;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	struct McAcp6DAsmGetInfoType AssemblyInfo;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
} MC_BR_AsmGetInfo_Acp6D_typ;

typedef struct MC_BR_AsmGetErrCode_Acp6D
{
	/* VAR_INPUT (analog) */
	struct Mc6DAssemblyType* Assembly;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	struct McAcp6DErrInfoType ErrInfo;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
} MC_BR_AsmGetErrCode_Acp6D_typ;

typedef struct MC_BR_AsmReadStatus_Acp6D
{
	/* VAR_INPUT (analog) */
	struct Mc6DAssemblyType* Assembly;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	/* VAR_OUTPUT (digital) */
	plcbit Valid;
	plcbit Busy;
	plcbit Error;
	plcbit AssemblyDisabled;
	plcbit AssemblyReady;
	plcbit AssemblyHoming;
	plcbit AssemblyStopping;
	plcbit AssemblyStartUp;
	plcbit AssemblyErrorStop;
} MC_BR_AsmReadStatus_Acp6D_typ;

typedef struct MC_BR_AsmReadInfo_Acp6D
{
	/* VAR_INPUT (analog) */
	struct Mc6DAssemblyType* Assembly;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	struct McAcp6DAsmInfoType AssemblyInfo;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	/* VAR_OUTPUT (digital) */
	plcbit Valid;
	plcbit Busy;
	plcbit Error;
} MC_BR_AsmReadInfo_Acp6D_typ;

typedef struct MC_BR_ShReadInfo_Acp6D
{
	/* VAR_INPUT (analog) */
	struct Mc6DShuttleType* Shuttle;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	struct McAcp6DShInfoType ShuttleInfo;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	/* VAR_OUTPUT (digital) */
	plcbit Valid;
	plcbit Busy;
	plcbit Error;
} MC_BR_ShReadInfo_Acp6D_typ;

typedef struct MC_BR_ShGetInfo_Acp6D
{
	/* VAR_INPUT (analog) */
	struct Mc6DShuttleType* Shuttle;
	enum McAcp6DShGetInfoOptionEnum Option;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	struct McAcp6DShGetInfoType ShuttleInfo;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
} MC_BR_ShGetInfo_Acp6D_typ;

typedef struct MC_BR_ShGetProperty_Acp6D
{
	/* VAR_INPUT (analog) */
	struct Mc6DShuttleType* Shuttle;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	struct McAcp6DShGetPropertyType ShuttleProperty;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
} MC_BR_ShGetProperty_Acp6D_typ;

typedef struct MC_BR_JogVelocity_Acp6D
{
	/* VAR_INPUT (analog) */
	struct Mc6DShuttleType* Shuttle;
	struct McAcp6DJogVelocityParType Parameters;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	/* VAR_OUTPUT (digital) */
	plcbit Ready;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
	plcbit Jogging;
} MC_BR_JogVelocity_Acp6D_typ;

typedef struct MC_BR_MoveCyclicPosition_Acp6D
{
	/* VAR_INPUT (analog) */
	struct Mc6DShuttleType* Shuttle;
	struct McAcp6DMoveCyclicParType Parameters;
	struct McAcp6DShPositionType CyclicPosition;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	/* VAR_OUTPUT (digital) */
	plcbit Valid;
	plcbit Busy;
	plcbit Error;
} MC_BR_MoveCyclicPosition_Acp6D_typ;

typedef struct MC_BR_ReadCyclicPosition_Acp6D
{
	/* VAR_INPUT (analog) */
	struct Mc6DShuttleType* Shuttle;
	struct McAcp6DReadCyclicParType Parameters;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	struct McAcp6DShPositionType CyclicPosition;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	/* VAR_OUTPUT (digital) */
	plcbit Valid;
	plcbit Busy;
	plcbit Error;
} MC_BR_ReadCyclicPosition_Acp6D_typ;

typedef struct MC_BR_ReadCyclicForce_Acp6D
{
	/* VAR_INPUT (analog) */
	struct Mc6DShuttleType* Shuttle;
	struct McAcp6DReadCyclicParType Parameters;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	struct McAcp6DShForceType CyclicForce;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Enable;
	/* VAR_OUTPUT (digital) */
	plcbit Valid;
	plcbit Busy;
	plcbit Error;
} MC_BR_ReadCyclicForce_Acp6D_typ;

typedef struct MC_BR_MoveInPlaneAsync_Acp6D
{
	/* VAR_INPUT (analog) */
	struct Mc6DAssemblyType* Assembly;
	struct McAcp6DMoveInPlaneAsyncParType Parameters;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Acknowledge;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
} MC_BR_MoveInPlaneAsync_Acp6D_typ;

typedef struct MC_BR_MoveInPlane_Acp6D
{
	/* VAR_INPUT (analog) */
	struct Mc6DShuttleType* Shuttle;
	struct McAcp6DInPlaneParType Parameters;
	unsigned short CommandLabel;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Acknowledge;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
} MC_BR_MoveInPlane_Acp6D_typ;

typedef struct MC_BR_MoveShortAxis_Acp6D
{
	/* VAR_INPUT (analog) */
	struct Mc6DShuttleType* Shuttle;
	struct McAcp6DShortAxParType Parameters;
	unsigned short CommandLabel;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Acknowledge;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
} MC_BR_MoveShortAxis_Acp6D_typ;

typedef struct MC_BR_MoveArc_Acp6D
{
	/* VAR_INPUT (analog) */
	struct Mc6DShuttleType* Shuttle;
	struct McAcp6DArcParType Parameters;
	unsigned short CommandLabel;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Acknowledge;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
} MC_BR_MoveArc_Acp6D_typ;

typedef struct MC_BR_ShLevitation_Acp6D
{
	/* VAR_INPUT (analog) */
	struct Mc6DShuttleType* Shuttle;
	struct McAcp6DLevitationParType Parameters;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Acknowledge;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
} MC_BR_ShLevitation_Acp6D_typ;

typedef struct MC_BR_Move6D_Acp6D
{
	/* VAR_INPUT (analog) */
	struct Mc6DShuttleType* Shuttle;
	struct McAcp6DMove6DParType Parameters;
	unsigned short CommandLabel;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Acknowledge;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
} MC_BR_Move6D_Acp6D_typ;

typedef struct MC_BR_ShBuffer_Acp6D
{
	/* VAR_INPUT (analog) */
	struct Mc6DShuttleType* Shuttle;
	enum McAcp6DBufferOptionEnum Option;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	struct McAcp6DBufferInfoType BufferInfo;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
} MC_BR_ShBuffer_Acp6D_typ;

typedef struct MC_BR_ShStop_Acp6D
{
	/* VAR_INPUT (analog) */
	struct Mc6DShuttleType* Shuttle;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Acknowledge;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
} MC_BR_ShStop_Acp6D_typ;

typedef struct MC_BR_ShGetPayload_Acp6D
{
	/* VAR_INPUT (analog) */
	struct Mc6DShuttleType* Shuttle;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	float Payload;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Acknowledge;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
} MC_BR_ShGetPayload_Acp6D_typ;

typedef struct MC_BR_ShHalt_Acp6D
{
	/* VAR_INPUT (analog) */
	struct Mc6DShuttleType* Shuttle;
	enum McAcp6DHaltOptionEnum Option;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Acknowledge;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
} MC_BR_ShHalt_Acp6D_typ;

typedef struct MC_BR_ShRecover_Acp6D
{
	/* VAR_INPUT (analog) */
	struct Mc6DShuttleType* Shuttle;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
} MC_BR_ShRecover_Acp6D_typ;

typedef struct MC_BR_SegGetInfo_Acp6D
{
	/* VAR_INPUT (analog) */
	struct Mc6DSegmentType* Segment;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	struct McAcp6DSegInfoType SegInfo;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
} MC_BR_SegGetInfo_Acp6D_typ;

typedef struct MC_BR_SegGetBarrierInfo_Acp6D
{
	/* VAR_INPUT (analog) */
	struct Mc6DSegmentType* Segment;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	struct McAcp6DSegBarrierInfoType BarrierInfo;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
} MC_BR_SegGetBarrierInfo_Acp6D_typ;

typedef struct MC_BR_SegBarrierCommand_Acp6D
{
	/* VAR_INPUT (analog) */
	struct Mc6DSegmentType* Segment;
	struct McAcp6DBarrierCmdParType Parameters;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
} MC_BR_SegBarrierCommand_Acp6D_typ;

typedef struct MC_BR_SegPowerOff_Acp6D
{
	/* VAR_INPUT (analog) */
	struct Mc6DSegmentType* Segment;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Acknowledge;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
} MC_BR_SegPowerOff_Acp6D_typ;

typedef struct MC_BR_SegPowerOn_Acp6D
{
	/* VAR_INPUT (analog) */
	struct Mc6DSegmentType* Segment;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Acknowledge;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
} MC_BR_SegPowerOn_Acp6D_typ;

typedef struct MC_BR_ZonePowerOff_Acp6D
{
	/* VAR_INPUT (analog) */
	struct Mc6DZoneType* Zone;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Acknowledge;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
} MC_BR_ZonePowerOff_Acp6D_typ;

typedef struct MC_BR_ZonePowerOn_Acp6D
{
	/* VAR_INPUT (analog) */
	struct Mc6DZoneType* Zone;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Acknowledge;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
} MC_BR_ZonePowerOn_Acp6D_typ;

typedef struct MC_BR_ZoneBarrierCommand_Acp6D
{
	/* VAR_INPUT (analog) */
	struct Mc6DZoneType* Zone;
	struct McAcp6DBarrierCmdParType Parameters;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
} MC_BR_ZoneBarrierCommand_Acp6D_typ;

typedef struct MC_BR_ZoneGetBarrierInfo_Acp6D
{
	/* VAR_INPUT (analog) */
	struct Mc6DZoneType* Zone;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	struct McAcp6DZoneBarrierInfoType BarrierInfo;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
} MC_BR_ZoneGetBarrierInfo_Acp6D_typ;

typedef struct MC_BR_AsmReset_Acp6D
{
	/* VAR_INPUT (analog) */
	struct Mc6DAssemblyType* Assembly;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Acknowledge;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
} MC_BR_AsmReset_Acp6D_typ;

typedef struct MC_BR_ShPlanet_Acp6D
{
	/* VAR_INPUT (analog) */
	struct Mc6DShuttleType* Shuttle;
	struct McAcp6DPlanetParType Parameters;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
} MC_BR_ShPlanet_Acp6D_typ;

typedef struct MC_BR_ShGroupAddShuttle_Acp6D
{
	/* VAR_INPUT (analog) */
	struct Mc6DShuttleGroupType* ShuttleGroup;
	struct McAcp6DShGroupAddShParType Parameters;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
} MC_BR_ShGroupAddShuttle_Acp6D_typ;

typedef struct MC_BR_ShGroupClear_Acp6D
{
	/* VAR_INPUT (analog) */
	struct Mc6DShuttleGroupType* ShuttleGroup;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
} MC_BR_ShGroupClear_Acp6D_typ;

typedef struct MC_BR_ShGroupGetInfo_Acp6D
{
	/* VAR_INPUT (analog) */
	struct Mc6DShuttleGroupType* ShuttleGroup;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	struct McAcp6DShGroupInfoType Info;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
} MC_BR_ShGroupGetInfo_Acp6D_typ;

typedef struct MC_BR_ShGroupCoupleCtrl_Acp6D
{
	/* VAR_INPUT (analog) */
	struct Mc6DShuttleGroupType* ShuttleGroup;
	struct McAcp6DShGroupCoupleCtrlParType Parameters;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
} MC_BR_ShGroupCoupleCtrl_Acp6D_typ;

typedef struct MC_BR_ShGroupBuffer_Acp6D
{
	/* VAR_INPUT (analog) */
	struct Mc6DShuttleGroupType* ShuttleGroup;
	enum McAcp6DShGroupBufferOptionEnum Option;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
} MC_BR_ShGroupBuffer_Acp6D_typ;

typedef struct MC_BR_ShGroupDelete_Acp6D
{
	/* VAR_INPUT (analog) */
	struct Mc6DShuttleGroupType* ShuttleGroup;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
} MC_BR_ShGroupDelete_Acp6D_typ;

typedef struct MC_BR_RotaryMotion_Acp6D
{
	/* VAR_INPUT (analog) */
	struct Mc6DShuttleType* Shuttle;
	struct McAcp6DRotaryMotionParType Parameters;
	unsigned short CommandLabel;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Acknowledge;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
} MC_BR_RotaryMotion_Acp6D_typ;

typedef struct MC_BR_RotaryMotionSpin_Acp6D
{
	/* VAR_INPUT (analog) */
	struct Mc6DShuttleType* Shuttle;
	struct McAcp6DRotaryMotionSpinParType Parameters;
	unsigned short CommandLabel;
	/* VAR_OUTPUT (analog) */
	signed long ErrorID;
	/* VAR (analog) */
	struct McInternalType Internal;
	/* VAR_INPUT (digital) */
	plcbit Execute;
	/* VAR_OUTPUT (digital) */
	plcbit Done;
	plcbit Acknowledge;
	plcbit Busy;
	plcbit CommandAborted;
	plcbit Error;
} MC_BR_RotaryMotionSpin_Acp6D_typ;



/* Prototyping of functions and function blocks */
_BUR_PUBLIC void MC_BR_AsmPowerOn_Acp6D(struct MC_BR_AsmPowerOn_Acp6D* inst);
_BUR_PUBLIC void MC_BR_AsmPowerOff_Acp6D(struct MC_BR_AsmPowerOff_Acp6D* inst);
_BUR_PUBLIC void MC_BR_AsmStop_Acp6D(struct MC_BR_AsmStop_Acp6D* inst);
_BUR_PUBLIC void MC_BR_AsmReboot_Acp6D(struct MC_BR_AsmReboot_Acp6D* inst);
_BUR_PUBLIC void MC_BR_AsmHalt_Acp6D(struct MC_BR_AsmHalt_Acp6D* inst);
_BUR_PUBLIC void MC_BR_AsmBuffer_Acp6D(struct MC_BR_AsmBuffer_Acp6D* inst);
_BUR_PUBLIC void MC_BR_ShForceMode_Acp6D(struct MC_BR_ShForceMode_Acp6D* inst);
_BUR_PUBLIC void MC_BR_ShStereotypeDefine_Acp6D(struct MC_BR_ShStereotypeDefine_Acp6D* inst);
_BUR_PUBLIC void MC_BR_ShStereotypeAssign_Acp6D(struct MC_BR_ShStereotypeAssign_Acp6D* inst);
_BUR_PUBLIC void MC_BR_ShStereotypeDelete_Acp6D(struct MC_BR_ShStereotypeDelete_Acp6D* inst);
_BUR_PUBLIC void MC_BR_MacroDelete_Acp6D(struct MC_BR_MacroDelete_Acp6D* inst);
_BUR_PUBLIC void MC_BR_MacroCreate_Acp6D(struct MC_BR_MacroCreate_Acp6D* inst);
_BUR_PUBLIC void MC_BR_VirtualShCreate_Acp6D(struct MC_BR_VirtualShCreate_Acp6D* inst);
_BUR_PUBLIC void MC_BR_ShGroupCreate_Acp6D(struct MC_BR_ShGroupCreate_Acp6D* inst);
_BUR_PUBLIC void MC_BR_MacroSave_Acp6D(struct MC_BR_MacroSave_Acp6D* inst);
_BUR_PUBLIC void MC_BR_MacroClear_Acp6D(struct MC_BR_MacroClear_Acp6D* inst);
_BUR_PUBLIC void MC_BR_MacroRun_Acp6D(struct MC_BR_MacroRun_Acp6D* inst);
_BUR_PUBLIC void MC_BR_ZoneCreate_Acp6D(struct MC_BR_ZoneCreate_Acp6D* inst);
_BUR_PUBLIC void MC_BR_AsmLevitation_Acp6D(struct MC_BR_AsmLevitation_Acp6D* inst);
_BUR_PUBLIC void MC_BR_AsmGetShuttle_Acp6D(struct MC_BR_AsmGetShuttle_Acp6D* inst);
_BUR_PUBLIC void MC_BR_AsmGetVirtualSh_Acp6D(struct MC_BR_AsmGetVirtualSh_Acp6D* inst);
_BUR_PUBLIC void MC_BR_AsmGetSegment_Acp6D(struct MC_BR_AsmGetSegment_Acp6D* inst);
_BUR_PUBLIC void MC_BR_AsmGetZone_Acp6D(struct MC_BR_AsmGetZone_Acp6D* inst);
_BUR_PUBLIC void MC_BR_AsmGetShGroup_Acp6D(struct MC_BR_AsmGetShGroup_Acp6D* inst);
_BUR_PUBLIC void MC_BR_AsmGetInfo_Acp6D(struct MC_BR_AsmGetInfo_Acp6D* inst);
_BUR_PUBLIC void MC_BR_AsmGetErrCode_Acp6D(struct MC_BR_AsmGetErrCode_Acp6D* inst);
_BUR_PUBLIC void MC_BR_AsmReadStatus_Acp6D(struct MC_BR_AsmReadStatus_Acp6D* inst);
_BUR_PUBLIC void MC_BR_AsmReadInfo_Acp6D(struct MC_BR_AsmReadInfo_Acp6D* inst);
_BUR_PUBLIC void MC_BR_ShReadInfo_Acp6D(struct MC_BR_ShReadInfo_Acp6D* inst);
_BUR_PUBLIC void MC_BR_ShGetInfo_Acp6D(struct MC_BR_ShGetInfo_Acp6D* inst);
_BUR_PUBLIC void MC_BR_ShGetProperty_Acp6D(struct MC_BR_ShGetProperty_Acp6D* inst);
_BUR_PUBLIC void MC_BR_JogVelocity_Acp6D(struct MC_BR_JogVelocity_Acp6D* inst);
_BUR_PUBLIC void MC_BR_MoveCyclicPosition_Acp6D(struct MC_BR_MoveCyclicPosition_Acp6D* inst);
_BUR_PUBLIC void MC_BR_ReadCyclicPosition_Acp6D(struct MC_BR_ReadCyclicPosition_Acp6D* inst);
_BUR_PUBLIC void MC_BR_ReadCyclicForce_Acp6D(struct MC_BR_ReadCyclicForce_Acp6D* inst);
_BUR_PUBLIC void MC_BR_MoveInPlaneAsync_Acp6D(struct MC_BR_MoveInPlaneAsync_Acp6D* inst);
_BUR_PUBLIC void MC_BR_MoveInPlane_Acp6D(struct MC_BR_MoveInPlane_Acp6D* inst);
_BUR_PUBLIC void MC_BR_MoveShortAxis_Acp6D(struct MC_BR_MoveShortAxis_Acp6D* inst);
_BUR_PUBLIC void MC_BR_MoveArc_Acp6D(struct MC_BR_MoveArc_Acp6D* inst);
_BUR_PUBLIC void MC_BR_ShLevitation_Acp6D(struct MC_BR_ShLevitation_Acp6D* inst);
_BUR_PUBLIC void MC_BR_Move6D_Acp6D(struct MC_BR_Move6D_Acp6D* inst);
_BUR_PUBLIC void MC_BR_ShBuffer_Acp6D(struct MC_BR_ShBuffer_Acp6D* inst);
_BUR_PUBLIC void MC_BR_ShStop_Acp6D(struct MC_BR_ShStop_Acp6D* inst);
_BUR_PUBLIC void MC_BR_ShGetPayload_Acp6D(struct MC_BR_ShGetPayload_Acp6D* inst);
_BUR_PUBLIC void MC_BR_ShHalt_Acp6D(struct MC_BR_ShHalt_Acp6D* inst);
_BUR_PUBLIC void MC_BR_ShRecover_Acp6D(struct MC_BR_ShRecover_Acp6D* inst);
_BUR_PUBLIC void MC_BR_SegGetInfo_Acp6D(struct MC_BR_SegGetInfo_Acp6D* inst);
_BUR_PUBLIC void MC_BR_SegGetBarrierInfo_Acp6D(struct MC_BR_SegGetBarrierInfo_Acp6D* inst);
_BUR_PUBLIC void MC_BR_SegBarrierCommand_Acp6D(struct MC_BR_SegBarrierCommand_Acp6D* inst);
_BUR_PUBLIC void MC_BR_SegPowerOff_Acp6D(struct MC_BR_SegPowerOff_Acp6D* inst);
_BUR_PUBLIC void MC_BR_SegPowerOn_Acp6D(struct MC_BR_SegPowerOn_Acp6D* inst);
_BUR_PUBLIC void MC_BR_ZonePowerOff_Acp6D(struct MC_BR_ZonePowerOff_Acp6D* inst);
_BUR_PUBLIC void MC_BR_ZonePowerOn_Acp6D(struct MC_BR_ZonePowerOn_Acp6D* inst);
_BUR_PUBLIC void MC_BR_ZoneBarrierCommand_Acp6D(struct MC_BR_ZoneBarrierCommand_Acp6D* inst);
_BUR_PUBLIC void MC_BR_ZoneGetBarrierInfo_Acp6D(struct MC_BR_ZoneGetBarrierInfo_Acp6D* inst);
_BUR_PUBLIC void MC_BR_AsmReset_Acp6D(struct MC_BR_AsmReset_Acp6D* inst);
_BUR_PUBLIC void MC_BR_ShPlanet_Acp6D(struct MC_BR_ShPlanet_Acp6D* inst);
_BUR_PUBLIC void MC_BR_ShGroupAddShuttle_Acp6D(struct MC_BR_ShGroupAddShuttle_Acp6D* inst);
_BUR_PUBLIC void MC_BR_ShGroupClear_Acp6D(struct MC_BR_ShGroupClear_Acp6D* inst);
_BUR_PUBLIC void MC_BR_ShGroupGetInfo_Acp6D(struct MC_BR_ShGroupGetInfo_Acp6D* inst);
_BUR_PUBLIC void MC_BR_ShGroupCoupleCtrl_Acp6D(struct MC_BR_ShGroupCoupleCtrl_Acp6D* inst);
_BUR_PUBLIC void MC_BR_ShGroupBuffer_Acp6D(struct MC_BR_ShGroupBuffer_Acp6D* inst);
_BUR_PUBLIC void MC_BR_ShGroupDelete_Acp6D(struct MC_BR_ShGroupDelete_Acp6D* inst);
_BUR_PUBLIC void MC_BR_RotaryMotion_Acp6D(struct MC_BR_RotaryMotion_Acp6D* inst);
_BUR_PUBLIC void MC_BR_RotaryMotionSpin_Acp6D(struct MC_BR_RotaryMotionSpin_Acp6D* inst);


#ifdef __cplusplus
};
#endif
#endif /* _MCACP6D_ */

