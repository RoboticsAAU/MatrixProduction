######################################################
#                                                    #
# Automatic generated Makefile for Visual Components #
#                                                    #
#                  Do NOT edit!                      #
#                                                    #
######################################################

VCC:=@'$(AS_BIN_PATH)/br.vc.pc.exe'
LINK:=@'$(AS_BIN_PATH)/BR.VC.Link.exe'
MODGEN:=@'$(AS_BIN_PATH)/BR.VC.ModGen.exe'
VCPL:=@'$(AS_BIN_PATH)/BR.VC.PL.exe'
VCHWPP:=@'$(AS_BIN_PATH)/BR.VC.HWPP.exe'
VCDEP:=@'$(AS_BIN_PATH)/BR.VC.Depend.exe'
VCFLGEN:=@'$(AS_BIN_PATH)/BR.VC.lfgen.exe'
VCREFHANDLER:=@'$(AS_BIN_PATH)/BR.VC.CrossReferenceHandler.exe'
VCXREFEXTENDER:=@'$(AS_BIN_PATH)/BR.AS.CrossRefVCExtender.exe'
RM=CMD /C DEL
PALFILE_Visu_R=$(AS_PROJECT_PATH)/Logical/Visu_Resized/Palette.vcr
VCCFLAGS_Visu_R=-server -proj Visu_R -vc '$(AS_PROJECT_PATH)/Logical/Visu_Resized/VCObject.vc' -prj_path '$(AS_PROJECT_PATH)' -temp_path '$(AS_TEMP_PATH)' -cfg $(AS_CONFIGURATION) -plc $(AS_PLC) -plctemp $(AS_TEMP_PLC) -cpu_path '$(AS_CPU_PATH)'
VCFIRMWARE=4.72.0
VCFIRMWAREPATH=$(AS_VC_PATH)/Firmware/V4.72.0/SG4
VCOBJECT_Visu_R=$(AS_PROJECT_PATH)/Logical/Visu_Resized/VCObject.vc
VCSTARTUP='vcstart.br'
VCLOD='vclod.br'
VCSTPOST='vcstpost.br'
TARGET_FILE_Visu_R=$(AS_CPU_PATH)/Visu_R.br
OBJ_SCOPE_Visu_R=
PRJ_PATH_Visu_R=$(AS_PROJECT_PATH)
SRC_PATH_Visu_R=$(AS_PROJECT_PATH)/Logical/$(OBJ_SCOPE_Visu_R)/Visu_Resized
TEMP_PATH_Visu_R=$(AS_TEMP_PATH)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/Visu_R
TEMP_PATH_Shared=$(AS_TEMP_PATH)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/VCShared
TEMP_PATH_ROOT_Visu_R=$(AS_TEMP_PATH)
VC_LIBRARY_LIST_Visu_R=$(TEMP_PATH_Visu_R)/libraries.vci
VC_XREF_BUILDFILE_Visu_R=$(AS_TEMP_PATH)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/vcxref.build
VC_XREF_CLEANFILE=$(AS_TEMP_PATH)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/vcxref.clean
VC_LANGUAGES_Visu_R=$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr
CPUHWC='$(TEMP_PATH_Visu_R)/cpuhwc.vci'
VC_STATIC_OPTIONS_Visu_R='$(TEMP_PATH_Visu_R)/vcStaticOptions.xml'
VC_STATIC_OPTIONS_Shared='$(TEMP_PATH_Shared)/vcStaticOptions.xml'

DSOFLAGS=-P '$(AS_PROJECT_PATH)' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)'
LIB_SHARED=$(TEMP_PATH_ROOT_Visu_R)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/VCShared/vcshared.vca

#
# Shared Runtime Options
#
VCRS_OBJECT=$(TEMP_PATH_ROOT_Visu_R)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/VCShared/vcrt_s.vco
VCRS_SOURCE=$(AS_PROJECT_PATH)/Logical/VCShared/Package.vcp

# All Shared Source Objects
VCR_SOURCES_Visu_R=$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr 

TXTGRP_SHARED_SOURCES_Visu_R=$(AS_PROJECT_PATH)/Logical/VCShared/TextGroups/AlarmAcknowledgeState.txtgrp \
	$(AS_PROJECT_PATH)/Logical/VCShared/TextGroups/AlarmBypassState.txtgrp \
	$(AS_PROJECT_PATH)/Logical/VCShared/TextGroups/AlarmEvent.txtgrp \
	$(AS_PROJECT_PATH)/Logical/VCShared/TextGroups/AlarmState.txtgrp \
	$(AS_PROJECT_PATH)/Logical/VCShared/TextGroups/DateTimeFormats.txtgrp \
	$(AS_PROJECT_PATH)/Logical/VCShared/TextGroups/httpURL_SDM.txtgrp 

VCUG_SOURCES_Visu_R=$(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/Length.vcug \
	$(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/Mass.vcug \
	$(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/Volume.vcug \
	$(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/Power.vcug \
	$(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/Memory.vcug \
	$(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/Pressure.vcug \
	$(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/Temperatures.vcug \
	$(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/Percent.vcug \
	$(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/Milimeter.vcug \
	$(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/Degree.vcug 

ALCFG_SOURCES_Visu_R=$(AS_PROJECT_PATH)/Logical/VCShared/AlarmGroups/AlarmSystem.alcfg 

ALGRP_SOURCES_Visu_R=$(AS_PROJECT_PATH)/Logical/VCShared/AlarmGroups/SystemAlarms.algrp 

DSO_SOURCES_Visu_R=$(AS_PROJECT_PATH)/Logical/VCShared/DataSources/Internal.dso \
	$(AS_PROJECT_PATH)/Logical/VCShared/DataSources/DataSource.dso 

CVINFO_SOURCES_Visu_R=$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo 



# UnitGroups
VCUG_OBJECTS_Visu_R = $(addprefix $(AS_CPU_PATH)/VCShared/vcug., $(notdir $(VCUG_SOURCES_Visu_R:.vcug=.vco)))

$(AS_CPU_PATH)/VCShared/vcug.Length.vco: $(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/Length.vcug
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(AS_CPU_PATH)/VCShared/vcug.Mass.vco: $(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/Mass.vcug
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(AS_CPU_PATH)/VCShared/vcug.Volume.vco: $(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/Volume.vcug
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(AS_CPU_PATH)/VCShared/vcug.Power.vco: $(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/Power.vcug
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(AS_CPU_PATH)/VCShared/vcug.Memory.vco: $(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/Memory.vcug
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(AS_CPU_PATH)/VCShared/vcug.Pressure.vco: $(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/Pressure.vcug
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(AS_CPU_PATH)/VCShared/vcug.Temperatures.vco: $(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/Temperatures.vcug
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(AS_CPU_PATH)/VCShared/vcug.Percent.vco: $(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/Percent.vcug
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(AS_CPU_PATH)/VCShared/vcug.Milimeter.vco: $(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/Milimeter.vcug
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(AS_CPU_PATH)/VCShared/vcug.Degree.vco: $(AS_PROJECT_PATH)/Logical/VCShared/UnitGroups/Degree.vcug
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


#UnitGroups END




# AlarmGroups
ALGRP_OBJECTS_Visu_R = $(addprefix $(AS_CPU_PATH)/VCShared/algrp., $(notdir $(ALGRP_SOURCES_Visu_R:.algrp=.vco)))

$(AS_CPU_PATH)/VCShared/algrp.SystemAlarms.vco: $(AS_PROJECT_PATH)/Logical/VCShared/AlarmGroups/SystemAlarms.algrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


#AlarmGroups END




# AlarmSystem
ALCFG_OBJECTS_Visu_R = $(addprefix $(AS_CPU_PATH)/VCShared/alcfg., $(notdir $(ALCFG_SOURCES_Visu_R:.alcfg=.vco)))

$(AS_CPU_PATH)/VCShared/alcfg.AlarmSystem.vco: $(AS_PROJECT_PATH)/Logical/VCShared/AlarmGroups/AlarmSystem.alcfg
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


#AlarmSystem END




# Text Groups
TXTGRP_SHARED_OBJECTS_Visu_R = $(addprefix $(AS_CPU_PATH)/VCShared/txtgrp., $(notdir $(TXTGRP_SHARED_SOURCES_Visu_R:.txtgrp=.vco)))

$(AS_CPU_PATH)/VCShared/txtgrp.AlarmAcknowledgeState.vco: $(AS_PROJECT_PATH)/Logical/VCShared/TextGroups/AlarmAcknowledgeState.txtgrp $(VC_LANGUAGES_Visu_R)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(AS_CPU_PATH)/VCShared/txtgrp.AlarmBypassState.vco: $(AS_PROJECT_PATH)/Logical/VCShared/TextGroups/AlarmBypassState.txtgrp $(VC_LANGUAGES_Visu_R)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(AS_CPU_PATH)/VCShared/txtgrp.AlarmEvent.vco: $(AS_PROJECT_PATH)/Logical/VCShared/TextGroups/AlarmEvent.txtgrp $(VC_LANGUAGES_Visu_R)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(AS_CPU_PATH)/VCShared/txtgrp.AlarmState.vco: $(AS_PROJECT_PATH)/Logical/VCShared/TextGroups/AlarmState.txtgrp $(VC_LANGUAGES_Visu_R)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(AS_CPU_PATH)/VCShared/txtgrp.DateTimeFormats.vco: $(AS_PROJECT_PATH)/Logical/VCShared/TextGroups/DateTimeFormats.txtgrp $(VC_LANGUAGES_Visu_R)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(AS_CPU_PATH)/VCShared/txtgrp.httpURL_SDM.vco: $(AS_PROJECT_PATH)/Logical/VCShared/TextGroups/httpURL_SDM.txtgrp $(VC_LANGUAGES_Visu_R)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


#Text Groups END


#
# Datapoint Objects
#
$(TEMP_PATH_ROOT_Visu_R)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/VCShared/dso.Internal.vco: $(AS_PROJECT_PATH)/Logical/VCShared/DataSources/Internal.dso 
	 $(VCC) -f '$<' -o '$@' $(DSOFLAGS) $(VCCFLAGS_Visu_R) -p Visu_R -vcr 4720 -sfas

$(TEMP_PATH_ROOT_Visu_R)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/VCShared/dso.DataSource.vco: $(AS_PROJECT_PATH)/Logical/VCShared/DataSources/DataSource.dso 
	 $(VCC) -f '$<' -o '$@' $(DSOFLAGS) $(VCCFLAGS_Visu_R) -p Visu_R -vcr 4720 -sfas

DPT_OBJECTS = $(TEMP_PATH_ROOT_Visu_R)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/VCShared/dpt.DataPointList.vco
DSO_OBJECTS_Visu_R=$(TEMP_PATH_ROOT_Visu_R)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/VCShared/dso.Internal.vco $(TEMP_PATH_ROOT_Visu_R)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/VCShared/dso.DataSource.vco 
$(DSO_OBJECTS_Visu_R): $(DSO_SOURCES_Visu_R)


#
# Building the Shared Runtime Options
#
$(VCRS_OBJECT) : $(VCRS_SOURCE)
	$(VCC) -f '$<' -o '$@' -ct shared -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -sl  $(VCCFLAGS_Visu_R) -p Visu_R -vcr 4720 -sfas

#
# The Shared Module
#
SHARED_MODULE=$(TEMP_PATH_ROOT_Visu_R)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/vcshared.br
SHARED_CCF=$(TEMP_PATH_ROOT_Visu_R)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/VCShared/vcshared.ccf
DEL_SHARED_CCF=$(TEMP_PATH_ROOT_Visu_R)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/VCShared/vcshared.ccf.lfl

$(SHARED_MODULE) : $(SHARED_CCF)
	 $(MODGEN) -so $(VC_STATIC_OPTIONS_Shared) -fw '$(VCFIRMWAREPATH)' -m $(VCSTARTUP) -v V1.00.0 -vc '$(VCOBJECT_Visu_R)' -f '$<' -o '$@' -d vcgclass -profile 'False'

$(VCUG_OBJECTS_Visu_R): $(VC_LANGUAGES_Visu_R)
$(TXTGRP_SHARED_OBJECTS_Visu_R): $(VC_LANGUAGES_Visu_R)
$(ALGRP_OBJECTS_Visu_R): $(VC_LANGUAGES_Visu_R)
$(ALCFG_OBJECTS_Visu_R): $(VC_LANGUAGES_Visu_R)

$(SHARED_CCF): $(VCRS_OBJECT) $(VCR_OBJECTS_Visu_R) $(VCUG_OBJECTS_Visu_R) $(ALGRP_OBJECTS_Visu_R) $(ALCFG_OBJECTS_Visu_R) $(DSO_OBJECTS_Visu_R) $(TXTGRP_SHARED_OBJECTS_Visu_R) $(CVINFO_OBJECTS_Visu_R)
	-@CMD /Q /C if exist "$(DEL_SHARED_CCF)" DEL /F /Q "$(DEL_SHARED_CCF)" 2>nul
	 @$(VCFLGEN) '$@.lfl' '$(VCR_OBJECTS_Visu_R:.vco=.vco|)' -temp '$(TEMP_PATH_Visu_R)' -prj '$(PRJ_PATH_Visu_R)'
	 @$(VCFLGEN) '$@.lfl' -mask .vcug -vcp '$(AS_PROJECT_PATH)/Logical/VCShared/Package.vcp' -temp '$(TEMP_PATH_Shared)' -prj '$(PRJ_PATH_Visu_R)'
	 @$(VCFLGEN) '$@.lfl' -mask .algrp -vcp '$(AS_PROJECT_PATH)/Logical/VCShared/Package.vcp' -temp '$(TEMP_PATH_Shared)' -prj '$(PRJ_PATH_Visu_R)'
	 @$(VCFLGEN) '$@.lfl' '$(ALCFG_OBJECTS_Visu_R:.vco=.vco|)' -temp '$(TEMP_PATH_Visu_R)' -prj '$(PRJ_PATH_Visu_R)'
	 @$(VCFLGEN) '$@.lfl' -mask .txtgrp -vcp '$(AS_PROJECT_PATH)/Logical/VCShared/Package.vcp' -temp '$(TEMP_PATH_Shared)' -prj '$(PRJ_PATH_Visu_R)'
	 @$(VCFLGEN) '$@.lfl' '$(DSO_OBJECTS_Visu_R:.vco=.vco|)' -temp '$(TEMP_PATH_Visu_R)' -prj '$(PRJ_PATH_Visu_R)'
	 @$(VCFLGEN) '$@.lfl' '$(DPT_OBJECTS:.vco=.vco|)' -temp '$(TEMP_PATH_Visu_R)' -prj '$(PRJ_PATH_Visu_R)'
	 @$(VCFLGEN) '$@.lfl' '$(VCRS_OBJECT)' -temp '$(TEMP_PATH_Visu_R)' -prj '$(PRJ_PATH_Visu_R)'
	 $(LINK) '$@.lfl' -o '$@' -lib '$(LIB_SHARED)' -P '$(AS_PROJECT_PATH)' -m 'shared resources' -profile 'False' -warningLevel2 -name Visu_R -vcr 4720 -sfas


$(LIB_SHARED): $(SHARED_CCF)
