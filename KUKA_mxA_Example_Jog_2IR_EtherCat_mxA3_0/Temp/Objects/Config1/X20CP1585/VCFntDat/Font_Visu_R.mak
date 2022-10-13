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
TTFFLAGS_Visu_R= -P '$(AS_PROJECT_PATH)' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo'

#
# Font arialbd
#
ifneq ($(VC_FONT_arialbd),1)
VC_FONT_arialbd=1
$(AS_CPU_PATH)/VcFntDat/arialbd.vco:$(AS_CPU_PATH)/VcFntDat/arialbd.vci
	 $(VCC) -f '$<' -o '$@' $(TTFFLAGS_Visu_R) $(VCCFLAGS_Visu_R) -sfas

$(AS_CPU_PATH)/VcFntDat/arialbd.ccf:$(AS_CPU_PATH)/VcFntDat/arialbd.vco
	 $(LINK) '$^' -o '$@' -warningLevel2 -m arialbd.ttf -name Visu_R -profile 'False' -vcr 4720 -sfas

$(AS_CPU_PATH)/arialbd.br:$(AS_CPU_PATH)/VcFntDat/arialbd.ccf
	 $(MODGEN) -so $(VC_STATIC_OPTIONS_Shared) -fw '$(VCFIRMWAREPATH)' -m $(VCLOD) -f '$<' -o '$@' -d vcgclass -v V1.00.0 -profile False -vc '$(VCOBJECT_Visu_R)' -b
endif

#
# Font arial
#
ifneq ($(VC_FONT_arial),1)
VC_FONT_arial=1
$(AS_CPU_PATH)/VcFntDat/arial.vco:$(AS_CPU_PATH)/VcFntDat/arial.vci
	 $(VCC) -f '$<' -o '$@' $(TTFFLAGS_Visu_R) $(VCCFLAGS_Visu_R) -sfas

$(AS_CPU_PATH)/VcFntDat/arial.ccf:$(AS_CPU_PATH)/VcFntDat/arial.vco
	 $(LINK) '$^' -o '$@' -warningLevel2 -m arial.ttf -name Visu_R -profile 'False' -vcr 4720 -sfas

$(AS_CPU_PATH)/arial.br:$(AS_CPU_PATH)/VcFntDat/arial.ccf
	 $(MODGEN) -so $(VC_STATIC_OPTIONS_Shared) -fw '$(VCFIRMWAREPATH)' -m $(VCLOD) -f '$<' -o '$@' -d vcgclass -v V1.00.0 -profile False -vc '$(VCOBJECT_Visu_R)' -b
endif

FONT_MODULES_Visu_R=$(TEMP_PATH_ROOT_Visu_R)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/arialbd.br $(TEMP_PATH_ROOT_Visu_R)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/arial.br 
