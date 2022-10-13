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
# include Shared and Font Makefile (only once)
	include $(AS_TEMP_PATH)/objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/VCFntDat/Font_Visu_R.mak
ifneq ($(VCINC),1)
	VCINC=1
	include $(AS_TEMP_PATH)/objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/VCShared/VCShared.mak
endif

DEPENDENCIES_Visu_R=-d vcgclass -profile 'False'
DEFAULT_STYLE_SHEET_Visu_R='Source[local].StyleSheet[Color]'
SHARED_MODULE=$(TEMP_PATH_ROOT_Visu_R)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/vcshared.br
LFNTFLAGS_Visu_R=-P '$(AS_PROJECT_PATH)' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)'
BDRFLAGS_Visu_R=-P '$(AS_PROJECT_PATH)' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)'

# Local Libs
LIB_LOCAL_OBJ_Visu_R=$(TEMP_PATH_Visu_R)/localobj.vca

# Hardware sources
PANEL_HW_OBJECT_Visu_R=$(TEMP_PATH_ROOT_Visu_R)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/Visu_R/dis.Hardware.vco
PANEL_HW_VCI_Visu_R=$(TEMP_PATH_ROOT_Visu_R)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/Visu_R/dis.Hardware.vci
PANEL_HW_SOURCE_Visu_R=C:/Users/Wuenschp/Desktop/KUKA_mxA_Example_Jog_2IR_EtherCat_mxA3_0/Physical/Config1/Hardware.hw 
DIS_OBJECTS_Visu_R=$(PANEL_HW_OBJECT_Visu_R) $(KEYMAP_OBJECTS_Visu_R)

# KeyMapping flags
$(TEMP_PATH_Visu_R)/dis.PS2-Keyboard.vco: $(AS_PROJECT_PATH)/Physical/Config1/X20CP1585/VC/PS2-Keyboard.dis $(PANEL_HW_SOURCE_Visu_R)
	$(VCHWPP) -f '$(PANEL_HW_SOURCE_Visu_R)' -o '$(subst .vco,.vci,$(TEMP_PATH_Visu_R)/dis.PS2-Keyboard.vco)' -n Visu_Resized -d Visu_R -pal '$(PALFILE_Visu_R)' -c '$(AS_CONFIGURATION)' -p '$(AS_PLC)' -ptemp '$(AS_TEMP_PLC)' -B 'C4.72' -L '' -hw '$(CPUHWC)' -warninglevel 2 -so $(VC_STATIC_OPTIONS_Visu_R) -sos $(VC_STATIC_OPTIONS_Shared) -keyboard '$(AS_PROJECT_PATH)/Physical/Config1/X20CP1585/VC/PS2-Keyboard.dis' -fp '$(AS_VC_PATH)/Firmware/V4.72.0/SG4' -prj '$(AS_PROJECT_PATH)' -apj 'KUKA_mxA_Example_Jog_2IR_EtherCat_mxA3_0' -sfas -vcob '$(VCOBJECT_Visu_R)'
	$(VCC) -f '$(subst .vco,.vci,$@)' -o '$@' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -k '$(VCVK_SOURCES_Visu_R)' $(VCCFLAGS_Visu_R) -p Visu_R -sfas

KEYMAP_SOURCES_Visu_R=$(AS_PROJECT_PATH)/Physical/Config1/X20CP1585/VC/PS2-Keyboard.dis 
KEYMAP_OBJECTS_Visu_R=$(TEMP_PATH_Visu_R)/dis.PS2-Keyboard.vco 

# All Source Objects
TXTGRP_SOURCES_Visu_R=$(AS_PROJECT_PATH)/Logical/Visu_Resized/TextGroups/UserInterface.txtgrp \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/TextGroups/Buttons.txtgrp \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/TextGroups/Texts.txtgrp \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/TextGroups/Navigation.txtgrp \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/TextGroups/IPO.txtgrp \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/TextGroups/Axis1.txtgrp \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/TextGroups/Axis2.txtgrp \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/TextGroups/Axis3.txtgrp \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/TextGroups/Axis4.txtgrp \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/TextGroups/Axis5.txtgrp \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/TextGroups/Axis6.txtgrp \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/TextGroups/Settings.txtgrp \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/TextGroups/Jog.txtgrp \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/TextGroups/Roboter.txtgrp \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/TextGroups/Base_act.txtgrp \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/TextGroups/Tool_act.txtgrp 

FNINFO_SOURCES_Visu_R=$(AS_PROJECT_PATH)/Logical/Visu_Resized/Fonts/DefaultFont.fninfo \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Fonts/Arial9px.fninfo \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Fonts/Arial9pxBold.fninfo \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Fonts/Arial10pxBold.fninfo \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Fonts/Arial12px.fninfo \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Fonts/Arial9pxValue.fninfo \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Fonts/Arial6px.fninfo \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Fonts/Arial16PxBold.fninfo \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Fonts/Arial14px.fninfo \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Fonts/Arial7px.fninfo \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Fonts/Arial12pxBold.fninfo \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Fonts/Arial6pxBold.fninfo 

BMINFO_SOURCES_Visu_R=$(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/AlphaPadQVGA1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/AlphaPadQVGA2.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/AlphaPadQVGA3.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/AlphaPadVGA_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/AlphaPadQVGA2_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/AlphaPadQVGA3_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/AlphaPadQVGA1_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/AlphaPadVGA.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/NumPad_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/NumPad.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/AcknowledgeReset.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/AlarmActive.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/AlarmBypassOFF.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/AlarmBypassON.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/AlarmInactive.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/AlarmLatched.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/AlarmNotQuit.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/AlarmQuit.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/Reset.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/ResetAcknowledge.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/Triggered.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/ListPadHor.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/ListPadHor_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/ListPadVer.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/ListPadVer_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/backward_active.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/backward_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/global_area_active.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/global_area_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/forward_active.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/forward_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/control_button_active.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/control_button_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/right_active.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/right_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/left_active.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/left_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/up_active.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/up_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/down_active.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/down_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/multi_up_active.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/multi_up_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/multi_down_active.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/multi_down_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/ProgressBorder.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/down_active_control.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/down_pressed_control.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/up_active_control.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/global_area_gradient_upside.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/global_area_gradient_downside.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/frame_header.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/up_pressed_control.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/EditPadVGA.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/EditPadVGA_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/zuneNumPad_released.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/zuneListPadVer_released.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/zuneAlphaPad_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/zuneAlphaPad_released.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/zuneAlphaPadQVGA1_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/zuneAlphaPadQVGA1_released.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/zuneAlphaPadQVGA2_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/zuneAlphaPadQVGA3_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/zuneEditpadQVGA2_released.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/zuneEditPadQVGA3_released.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/zuneEditPadVga_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/zuneEditPadVga_released.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/zuneListPadHor_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/zuneListPadHor_released.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/zuneListPadVer_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/zuneNumPad_pressed.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/navigate_minus24x24.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/navigate_plus24x24.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/navigate_minus16x16.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/navigate_plus16x16.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/kuka_logo_1.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/BuR_Logo.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/rounded54.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/minus75.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/Slider.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/BackgroundXGA_NoLogo.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/nav_plain_red.bminfo \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/nav_plain_red_pressed.bminfo 

BMGRP_SOURCES_Visu_R=$(AS_PROJECT_PATH)/Logical/Visu_Resized/BitmapGroups/AlphaPadQVGA.bmgrp \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/BitmapGroups/NumPad.bmgrp \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/BitmapGroups/AlphaPad.bmgrp \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/BitmapGroups/AlarmEvent.bmgrp \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/BitmapGroups/AlarmState.bmgrp \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/BitmapGroups/BypassState.bmgrp \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/BitmapGroups/AcknowledgeState.bmgrp \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/BitmapGroups/NavigationPad.bmgrp \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/BitmapGroups/Borders.bmgrp \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/BitmapGroups/E_Button.bmgrp 

PAGE_SOURCES_Visu_R=$(AS_PROJECT_PATH)/Logical/Visu_Resized/Pages/JogMode.page \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Pages/Messages.page 

LAYER_SOURCES_Visu_R=$(AS_PROJECT_PATH)/Logical/Visu_Resized/Layers/GlobalLayer.layer \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Layers/Header.layer 

VCS_SOURCES_Visu_R=$(AS_PROJECT_PATH)/Logical/Visu_Resized/StyleSheets/Gray.vcs \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/StyleSheets/Color.vcs 

BDR_SOURCES_Visu_R=$(AS_PROJECT_PATH)/Logical/Visu_Resized/Borders/Raised.bdr \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Borders/Sunken.bdr \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Borders/Etched.bdr \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Borders/Bump.bdr \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Borders/SunkenOuter.bdr \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Borders/RaisedInner.bdr \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Borders/Flat_black.bdr \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Borders/Flat_grey.bdr \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Borders/BackwardActive.bdr \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Borders/BackwardPressed.bdr \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Borders/ControlActive.bdr \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Borders/ControlPressed.bdr \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Borders/DownActiveControl.bdr \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Borders/DownPressedControl.bdr \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Borders/ForwardActive.bdr \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Borders/ForwardPressed.bdr \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Borders/GlobalAreaActive.bdr \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Borders/GlobalAreaPressed.bdr \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Borders/MultiScrollDownActive.bdr \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Borders/MultiScrollDownPressed.bdr \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Borders/MultiScrollUpActive.bdr \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Borders/MultiScrollUpPressed.bdr \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Borders/ProgressBarBorder.bdr \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Borders/ScrollDownActive.bdr \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Borders/ScrollDownPressed.bdr \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Borders/ScrollUpActive.bdr \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Borders/ScrollUpPressed.bdr \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Borders/ScrollLeftActive.bdr \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Borders/ScrollLeftPressed.bdr \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Borders/ScrollRightActive.bdr \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Borders/ScrollRightPressed.bdr \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Borders/UpActiveControl.bdr \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Borders/UpPressedControl.bdr \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Borders/FrameHeader.bdr \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/Borders/Border_Black.bdr 

TPR_SOURCES_Visu_R=$(AS_PROJECT_PATH)/Logical/Visu_Resized/TouchPads/NumPad.tpr \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/TouchPads/AlphaPadQVGA.tpr \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/TouchPads/AlphaPad.tpr \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/TouchPads/NavigationPad_ver.tpr \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/TouchPads/NavigationPad_hor.tpr \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/TouchPads/EditPad.tpr 

TDC_SOURCES_Visu_R=$(AS_PROJECT_PATH)/Logical/Visu_Resized/Trends/TrendData.tdc 

CLM_SOURCES_Visu_R=$(AS_PROJECT_PATH)/Logical/Visu_Resized/ColorMaps/Abort.clm \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/ColorMaps/Status.clm \
	$(AS_PROJECT_PATH)/Logical/Visu_Resized/ColorMaps/Status_I.clm 

VCVK_SOURCES_Visu_R=$(AS_PROJECT_PATH)/Logical/Visu_Resized/VirtualKeys.vcvk 

VCR_SOURCES_Visu_R=$(AS_PROJECT_PATH)/Logical/Visu_Resized/Palette.vcr 

# Runtime Object sources
VCR_OBJECT_Visu_R=$(TEMP_PATH_Visu_R)/vcrt.vco
VCR_SOURCE_Visu_R=$(SRC_PATH_Visu_R)/package.vcp
# All Source Objects END

#Panel Hardware
$(PANEL_HW_VCI_Visu_R): $(PANEL_HW_SOURCE_Visu_R) $(VC_LIBRARY_LIST_Visu_R) $(KEYMAP_SOURCES_Visu_R) $(PALFILE_Visu_R)
	$(VCHWPP) -f '$<' -o '$@' -n Visu_Resized -d Visu_R -pal '$(PALFILE_Visu_R)' -c '$(AS_CONFIGURATION)' -p '$(AS_PLC)' -ptemp '$(AS_TEMP_PLC)' -B 'C4.72' -L '' -verbose 'False' -profile 'False' -hw '$(CPUHWC)' -warninglevel 2 -so $(VC_STATIC_OPTIONS_Visu_R) -sos $(VC_STATIC_OPTIONS_Shared) -fp '$(AS_VC_PATH)/Firmware/V4.72.0/SG4' -sfas -prj '$(AS_PROJECT_PATH)' -apj 'KUKA_mxA_Example_Jog_2IR_EtherCat_mxA3_0' -vcob '$(VCOBJECT_Visu_R)'

$(PANEL_HW_OBJECT_Visu_R): $(PANEL_HW_VCI_Visu_R) $(VC_LIBRARY_LIST_Visu_R)
	$(VCC) -f '$(subst .vco,.vci,$@)' -o '$@' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -k '$(VCVK_SOURCES_Visu_R)' $(VCCFLAGS_Visu_R) -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


# Pages
PAGE_OBJECTS_Visu_R = $(addprefix $(TEMP_PATH_Visu_R)/page., $(notdir $(PAGE_SOURCES_Visu_R:.page=.vco)))

$(TEMP_PATH_Visu_R)/page.JogMode.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/Pages/JogMode.page $(VC_LANGUAGES_Visu_R)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu_R)/StyleSheets/Color.vcs' -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/page.Messages.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/Pages/Messages.page $(VC_LANGUAGES_Visu_R)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R) -P '$(AS_PROJECT_PATH)' -ds '$(SRC_PATH_Visu_R)/StyleSheets/Color.vcs' -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


#Pages END




# Stylesheets
VCS_OBJECTS_Visu_R = $(addprefix $(TEMP_PATH_Visu_R)/vcs., $(notdir $(VCS_SOURCES_Visu_R:.vcs=.vco)))

$(TEMP_PATH_Visu_R)/vcs.Gray.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/StyleSheets/Gray.vcs
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R) -P '$(AS_PROJECT_PATH)' -ds $(DEFAULT_STYLE_SHEET_Visu_R) -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/vcs.Color.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/StyleSheets/Color.vcs
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R) -P '$(AS_PROJECT_PATH)' -ds $(DEFAULT_STYLE_SHEET_Visu_R) -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


#Stylesheets END




# Layers
LAYER_OBJECTS_Visu_R = $(addprefix $(TEMP_PATH_Visu_R)/layer., $(notdir $(LAYER_SOURCES_Visu_R:.layer=.vco)))

$(TEMP_PATH_Visu_R)/layer.GlobalLayer.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/Layers/GlobalLayer.layer $(VC_LANGUAGES_Visu_R)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R) -ds $(DEFAULT_STYLE_SHEET_Visu_R) -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/layer.Header.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/Layers/Header.layer $(VC_LANGUAGES_Visu_R)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R) -ds $(DEFAULT_STYLE_SHEET_Visu_R) -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


#Layers END




# Virtual Keys
VCVK_OBJECTS_Visu_R = $(addprefix $(TEMP_PATH_Visu_R)/vcvk., $(notdir $(VCVK_SOURCES_Visu_R:.vcvk=.vco)))

$(TEMP_PATH_Visu_R)/vcvk.VirtualKeys.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/VirtualKeys.vcvk
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas

$(VCVK_OBJECTS_Visu_R): $(VC_LANGUAGES_Visu_R)

#Virtual Keys END




# Touch Pads
TPR_OBJECTS_Visu_R = $(addprefix $(TEMP_PATH_Visu_R)/tpr., $(notdir $(TPR_SOURCES_Visu_R:.tpr=.vco)))

$(TEMP_PATH_Visu_R)/tpr.NumPad.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/TouchPads/NumPad.tpr
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R) -prj 'C:/Users/Wuenschp/Desktop/KUKA_mxA_Example_Jog_2IR_EtherCat_mxA3_0/Logical/Visu_Resized' -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/tpr.AlphaPadQVGA.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/TouchPads/AlphaPadQVGA.tpr
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R) -prj 'C:/Users/Wuenschp/Desktop/KUKA_mxA_Example_Jog_2IR_EtherCat_mxA3_0/Logical/Visu_Resized' -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/tpr.AlphaPad.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/TouchPads/AlphaPad.tpr
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R) -prj 'C:/Users/Wuenschp/Desktop/KUKA_mxA_Example_Jog_2IR_EtherCat_mxA3_0/Logical/Visu_Resized' -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/tpr.NavigationPad_ver.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/TouchPads/NavigationPad_ver.tpr
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R) -prj 'C:/Users/Wuenschp/Desktop/KUKA_mxA_Example_Jog_2IR_EtherCat_mxA3_0/Logical/Visu_Resized' -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/tpr.NavigationPad_hor.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/TouchPads/NavigationPad_hor.tpr
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R) -prj 'C:/Users/Wuenschp/Desktop/KUKA_mxA_Example_Jog_2IR_EtherCat_mxA3_0/Logical/Visu_Resized' -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/tpr.EditPad.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/TouchPads/EditPad.tpr
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R) -prj 'C:/Users/Wuenschp/Desktop/KUKA_mxA_Example_Jog_2IR_EtherCat_mxA3_0/Logical/Visu_Resized' -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


#Touch Pads END




# Text Groups
TXTGRP_OBJECTS_Visu_R = $(addprefix $(TEMP_PATH_Visu_R)/txtgrp., $(notdir $(TXTGRP_SOURCES_Visu_R:.txtgrp=.vco)))

$(TEMP_PATH_Visu_R)/txtgrp.UserInterface.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/TextGroups/UserInterface.txtgrp $(VC_LANGUAGES_Visu_R)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/txtgrp.Buttons.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/TextGroups/Buttons.txtgrp $(VC_LANGUAGES_Visu_R)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/txtgrp.Texts.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/TextGroups/Texts.txtgrp $(VC_LANGUAGES_Visu_R)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/txtgrp.Navigation.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/TextGroups/Navigation.txtgrp $(VC_LANGUAGES_Visu_R)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/txtgrp.IPO.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/TextGroups/IPO.txtgrp $(VC_LANGUAGES_Visu_R)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/txtgrp.Axis1.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/TextGroups/Axis1.txtgrp $(VC_LANGUAGES_Visu_R)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/txtgrp.Axis2.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/TextGroups/Axis2.txtgrp $(VC_LANGUAGES_Visu_R)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/txtgrp.Axis3.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/TextGroups/Axis3.txtgrp $(VC_LANGUAGES_Visu_R)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/txtgrp.Axis4.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/TextGroups/Axis4.txtgrp $(VC_LANGUAGES_Visu_R)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/txtgrp.Axis5.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/TextGroups/Axis5.txtgrp $(VC_LANGUAGES_Visu_R)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/txtgrp.Axis6.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/TextGroups/Axis6.txtgrp $(VC_LANGUAGES_Visu_R)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/txtgrp.Settings.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/TextGroups/Settings.txtgrp $(VC_LANGUAGES_Visu_R)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/txtgrp.Jog.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/TextGroups/Jog.txtgrp $(VC_LANGUAGES_Visu_R)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/txtgrp.Roboter.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/TextGroups/Roboter.txtgrp $(VC_LANGUAGES_Visu_R)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/txtgrp.Base_act.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/TextGroups/Base_act.txtgrp $(VC_LANGUAGES_Visu_R)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/txtgrp.Tool_act.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/TextGroups/Tool_act.txtgrp $(VC_LANGUAGES_Visu_R)
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


#Text Groups END




# BitmapGroups
BMGRP_OBJECTS_Visu_R = $(addprefix $(TEMP_PATH_Visu_R)/bmgrp., $(notdir $(BMGRP_SOURCES_Visu_R:.bmgrp=.vco)))

$(TEMP_PATH_Visu_R)/bmgrp.AlphaPadQVGA.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/BitmapGroups/AlphaPadQVGA.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/bmgrp.NumPad.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/BitmapGroups/NumPad.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/bmgrp.AlphaPad.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/BitmapGroups/AlphaPad.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/bmgrp.AlarmEvent.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/BitmapGroups/AlarmEvent.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/bmgrp.AlarmState.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/BitmapGroups/AlarmState.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/bmgrp.BypassState.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/BitmapGroups/BypassState.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/bmgrp.AcknowledgeState.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/BitmapGroups/AcknowledgeState.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/bmgrp.NavigationPad.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/BitmapGroups/NavigationPad.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/bmgrp.Borders.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/BitmapGroups/Borders.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/bmgrp.E_Button.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/BitmapGroups/E_Button.bmgrp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


#BitmapGroups END




# Bitmaps
BMINFO_OBJECTS_Visu_R = $(addprefix $(TEMP_PATH_Visu_R)/bminfo., $(notdir $(BMINFO_SOURCES_Visu_R:.bminfo=.vco)))

$(TEMP_PATH_Visu_R)/bminfo.AlphaPadQVGA1.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/AlphaPadQVGA1.bminfo $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/AlphaPadQVGA1.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/bminfo.AlphaPadQVGA2.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/AlphaPadQVGA2.bminfo $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/AlphaPadQVGA2.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/bminfo.AlphaPadQVGA3.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/AlphaPadQVGA3.bminfo $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/AlphaPadQVGA3.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/bminfo.AlphaPadVGA_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/AlphaPadVGA_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/AlphaPadVGA_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/bminfo.AlphaPadQVGA2_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/AlphaPadQVGA2_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/AlphaPadQVGA2_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/bminfo.AlphaPadQVGA3_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/AlphaPadQVGA3_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/AlphaPadQVGA3_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/bminfo.AlphaPadQVGA1_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/AlphaPadQVGA1_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/AlphaPadQVGA1_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/bminfo.AlphaPadVGA.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/AlphaPadVGA.bminfo $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/AlphaPadVGA.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/bminfo.NumPad_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/NumPad_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/NumPad_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/bminfo.NumPad.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/NumPad.bminfo $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/NumPad.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/bminfo.AcknowledgeReset.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/AcknowledgeReset.bminfo $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/AcknowledgeReset.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/bminfo.AlarmActive.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/AlarmActive.bminfo $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/AlarmActive.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/bminfo.AlarmBypassOFF.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/AlarmBypassOFF.bminfo $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/AlarmBypassOFF.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/bminfo.AlarmBypassON.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/AlarmBypassON.bminfo $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/AlarmBypassON.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/bminfo.AlarmInactive.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/AlarmInactive.bminfo $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/AlarmInactive.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/bminfo.AlarmLatched.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/AlarmLatched.bminfo $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/AlarmLatched.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/bminfo.AlarmNotQuit.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/AlarmNotQuit.bminfo $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/AlarmNotQuit.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/bminfo.AlarmQuit.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/AlarmQuit.bminfo $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/AlarmQuit.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/bminfo.Reset.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/Reset.bminfo $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/Reset.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/bminfo.ResetAcknowledge.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/ResetAcknowledge.bminfo $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/ResetAcknowledge.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/bminfo.Triggered.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/Triggered.bminfo $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/Triggered.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/bminfo.ListPadHor.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/ListPadHor.bminfo $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/ListPadHor.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/bminfo.ListPadHor_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/ListPadHor_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/ListPadHor_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/bminfo.ListPadVer.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/ListPadVer.bminfo $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/ListPadVer.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/bminfo.ListPadVer_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/ListPadVer_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/ListPadVer_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/bminfo.backward_active.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/backward_active.bminfo $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/backward_active.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/bminfo.backward_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/backward_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/backward_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/bminfo.global_area_active.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/global_area_active.bminfo $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/global_area_active.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/bminfo.global_area_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/global_area_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/global_area_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/bminfo.forward_active.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/forward_active.bminfo $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/forward_active.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/bminfo.forward_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/forward_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/forward_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/bminfo.control_button_active.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/control_button_active.bminfo $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/control_button_active.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/bminfo.control_button_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/control_button_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/control_button_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/bminfo.right_active.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/right_active.bminfo $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/right_active.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/bminfo.right_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/right_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/right_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/bminfo.left_active.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/left_active.bminfo $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/left_active.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/bminfo.left_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/left_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/left_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/bminfo.up_active.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/up_active.bminfo $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/up_active.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/bminfo.up_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/up_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/up_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/bminfo.down_active.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/down_active.bminfo $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/down_active.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/bminfo.down_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/down_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/down_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/bminfo.multi_up_active.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/multi_up_active.bminfo $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/multi_up_active.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/bminfo.multi_up_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/multi_up_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/multi_up_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/bminfo.multi_down_active.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/multi_down_active.bminfo $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/multi_down_active.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/bminfo.multi_down_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/multi_down_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/multi_down_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/bminfo.ProgressBorder.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/ProgressBorder.bminfo $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/ProgressBorder.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/bminfo.down_active_control.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/down_active_control.bminfo $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/down_active_control.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/bminfo.down_pressed_control.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/down_pressed_control.bminfo $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/down_pressed_control.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/bminfo.up_active_control.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/up_active_control.bminfo $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/up_active_control.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/bminfo.global_area_gradient_upside.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/global_area_gradient_upside.bminfo $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/global_area_gradient_upside.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/bminfo.global_area_gradient_downside.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/global_area_gradient_downside.bminfo $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/global_area_gradient_downside.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/bminfo.frame_header.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/frame_header.bminfo $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/frame_header.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/bminfo.up_pressed_control.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/up_pressed_control.bminfo $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/up_pressed_control.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/bminfo.EditPadVGA.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/EditPadVGA.bminfo $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/EditPadVGA.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/bminfo.EditPadVGA_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/EditPadVGA_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/EditPadVGA_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/bminfo.zuneNumPad_released.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/zuneNumPad_released.bminfo $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/zuneNumPad_released.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/bminfo.zuneListPadVer_released.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/zuneListPadVer_released.bminfo $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/zuneListPadVer_released.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/bminfo.zuneAlphaPad_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/zuneAlphaPad_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/zuneAlphaPad_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/bminfo.zuneAlphaPad_released.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/zuneAlphaPad_released.bminfo $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/zuneAlphaPad_released.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/bminfo.zuneAlphaPadQVGA1_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/zuneAlphaPadQVGA1_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/zuneAlphaPadQVGA1_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/bminfo.zuneAlphaPadQVGA1_released.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/zuneAlphaPadQVGA1_released.bminfo $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/zuneAlphaPadQVGA1_released.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/bminfo.zuneAlphaPadQVGA2_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/zuneAlphaPadQVGA2_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/zuneAlphaPadQVGA2_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/bminfo.zuneAlphaPadQVGA3_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/zuneAlphaPadQVGA3_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/zuneAlphaPadQVGA3_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/bminfo.zuneEditpadQVGA2_released.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/zuneEditpadQVGA2_released.bminfo $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/zuneEditpadQVGA2_released.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/bminfo.zuneEditPadQVGA3_released.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/zuneEditPadQVGA3_released.bminfo $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/zuneEditPadQVGA3_released.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/bminfo.zuneEditPadVga_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/zuneEditPadVga_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/zuneEditPadVga_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/bminfo.zuneEditPadVga_released.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/zuneEditPadVga_released.bminfo $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/zuneEditPadVga_released.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/bminfo.zuneListPadHor_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/zuneListPadHor_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/zuneListPadHor_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/bminfo.zuneListPadHor_released.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/zuneListPadHor_released.bminfo $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/zuneListPadHor_released.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/bminfo.zuneListPadVer_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/zuneListPadVer_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/zuneListPadVer_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/bminfo.zuneNumPad_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/zuneNumPad_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/zuneNumPad_pressed.bmp
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/bminfo.navigate_minus24x24.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/navigate_minus24x24.bminfo $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/navigate_minus24x24.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/bminfo.navigate_plus24x24.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/navigate_plus24x24.bminfo $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/navigate_plus24x24.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/bminfo.navigate_minus16x16.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/navigate_minus16x16.bminfo $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/navigate_minus16x16.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/bminfo.navigate_plus16x16.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/navigate_plus16x16.bminfo $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/navigate_plus16x16.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/bminfo.kuka_logo_1.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/kuka_logo_1.bminfo $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/kuka_logo_1.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/bminfo.BuR_Logo.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/BuR_Logo.bminfo $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/BuR_Logo.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/bminfo.rounded54.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/rounded54.bminfo $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/rounded54.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/bminfo.minus75.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/minus75.bminfo $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/minus75.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/bminfo.Slider.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/Slider.bminfo $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/Slider.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/bminfo.BackgroundXGA_NoLogo.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/BackgroundXGA_NoLogo.bminfo $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/BackgroundXGA_NoLogo.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/bminfo.nav_plain_red.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/nav_plain_red.bminfo $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/nav_plain_red.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/bminfo.nav_plain_red_pressed.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/nav_plain_red_pressed.bminfo $(AS_PROJECT_PATH)/Logical/Visu_Resized/Bitmaps/nav_plain_red_pressed.png
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


#Bitmaps END




# Trend Data Configuration
TDC_OBJECTS_Visu_R = $(addprefix $(TEMP_PATH_Visu_R)/tdc., $(notdir $(TDC_SOURCES_Visu_R:.tdc=.vco)))

$(TEMP_PATH_Visu_R)/tdc.TrendData.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/Trends/TrendData.tdc
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


#Trend Data Configuration END




# ColorMap Table
CLM_OBJECTS_Visu_R = $(addprefix $(TEMP_PATH_Visu_R)/clm., $(notdir $(CLM_SOURCES_Visu_R:.clm=.vco)))

$(TEMP_PATH_Visu_R)/clm.Abort.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/ColorMaps/Abort.clm
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/clm.Status.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/ColorMaps/Status.clm
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


$(TEMP_PATH_Visu_R)/clm.Status_I.vco: $(AS_PROJECT_PATH)/Logical/Visu_Resized/ColorMaps/Status_I.clm
	 $(VCC) -f '$<' -o '$@' -l '$(AS_PROJECT_PATH)/Logical/VCShared/Languages.vcr' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -pal '$(PALFILE_Visu_R)' $(VCCFLAGS_Visu_R)  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas


#ColorMap Table END


#
# Borders
#
BDR_SOURCES_Visu_R=$(AS_PROJECT_PATH)/Logical/Visu_Resized/Borders/Raised.bdr $(AS_PROJECT_PATH)/Logical/Visu_Resized/Borders/Sunken.bdr $(AS_PROJECT_PATH)/Logical/Visu_Resized/Borders/Etched.bdr $(AS_PROJECT_PATH)/Logical/Visu_Resized/Borders/Bump.bdr $(AS_PROJECT_PATH)/Logical/Visu_Resized/Borders/SunkenOuter.bdr $(AS_PROJECT_PATH)/Logical/Visu_Resized/Borders/RaisedInner.bdr $(AS_PROJECT_PATH)/Logical/Visu_Resized/Borders/Flat_black.bdr $(AS_PROJECT_PATH)/Logical/Visu_Resized/Borders/Flat_grey.bdr $(AS_PROJECT_PATH)/Logical/Visu_Resized/Borders/BackwardActive.bdr $(AS_PROJECT_PATH)/Logical/Visu_Resized/Borders/BackwardPressed.bdr $(AS_PROJECT_PATH)/Logical/Visu_Resized/Borders/ControlActive.bdr $(AS_PROJECT_PATH)/Logical/Visu_Resized/Borders/ControlPressed.bdr $(AS_PROJECT_PATH)/Logical/Visu_Resized/Borders/DownActiveControl.bdr $(AS_PROJECT_PATH)/Logical/Visu_Resized/Borders/DownPressedControl.bdr $(AS_PROJECT_PATH)/Logical/Visu_Resized/Borders/ForwardActive.bdr $(AS_PROJECT_PATH)/Logical/Visu_Resized/Borders/ForwardPressed.bdr $(AS_PROJECT_PATH)/Logical/Visu_Resized/Borders/GlobalAreaActive.bdr $(AS_PROJECT_PATH)/Logical/Visu_Resized/Borders/GlobalAreaPressed.bdr $(AS_PROJECT_PATH)/Logical/Visu_Resized/Borders/MultiScrollDownActive.bdr $(AS_PROJECT_PATH)/Logical/Visu_Resized/Borders/MultiScrollDownPressed.bdr $(AS_PROJECT_PATH)/Logical/Visu_Resized/Borders/MultiScrollUpActive.bdr $(AS_PROJECT_PATH)/Logical/Visu_Resized/Borders/MultiScrollUpPressed.bdr $(AS_PROJECT_PATH)/Logical/Visu_Resized/Borders/ProgressBarBorder.bdr $(AS_PROJECT_PATH)/Logical/Visu_Resized/Borders/ScrollDownActive.bdr $(AS_PROJECT_PATH)/Logical/Visu_Resized/Borders/ScrollDownPressed.bdr $(AS_PROJECT_PATH)/Logical/Visu_Resized/Borders/ScrollUpActive.bdr $(AS_PROJECT_PATH)/Logical/Visu_Resized/Borders/ScrollUpPressed.bdr $(AS_PROJECT_PATH)/Logical/Visu_Resized/Borders/ScrollLeftActive.bdr $(AS_PROJECT_PATH)/Logical/Visu_Resized/Borders/ScrollLeftPressed.bdr $(AS_PROJECT_PATH)/Logical/Visu_Resized/Borders/ScrollRightActive.bdr $(AS_PROJECT_PATH)/Logical/Visu_Resized/Borders/ScrollRightPressed.bdr $(AS_PROJECT_PATH)/Logical/Visu_Resized/Borders/UpActiveControl.bdr $(AS_PROJECT_PATH)/Logical/Visu_Resized/Borders/UpPressedControl.bdr $(AS_PROJECT_PATH)/Logical/Visu_Resized/Borders/FrameHeader.bdr $(AS_PROJECT_PATH)/Logical/Visu_Resized/Borders/Border_Black.bdr 
BDR_OBJECTS_Visu_R=$(TEMP_PATH_Visu_R)/bdr.Bordermanager.vco
$(TEMP_PATH_Visu_R)/bdr.Bordermanager.vco: $(BDR_SOURCES_Visu_R)
	$(VCC) -f '$<' -o '$@' -pkg '$(SRC_PATH_Visu_R)' $(BDRFLAGS_Visu_R) $(VCCFLAGS_Visu_R) -p Visu_R$(SRC_PATH_Visu_R)
#
# Logical fonts
#
$(TEMP_PATH_Visu_R)/lfnt.en.vco: $(TEMP_PATH_Visu_R)/en.lfnt $(VC_LANGUAGES_Visu_R)
	 $(VCC) -f '$<' -o '$@' $(LFNTFLAGS_Visu_R) $(VCCFLAGS_Visu_R) -p Visu_R -sfas
$(TEMP_PATH_Visu_R)/lfnt.de.vco: $(TEMP_PATH_Visu_R)/de.lfnt $(VC_LANGUAGES_Visu_R)
	 $(VCC) -f '$<' -o '$@' $(LFNTFLAGS_Visu_R) $(VCCFLAGS_Visu_R) -p Visu_R -sfas
LFNT_OBJECTS_Visu_R=$(TEMP_PATH_Visu_R)/lfnt.en.vco $(TEMP_PATH_Visu_R)/lfnt.de.vco 

#Runtime Object
$(VCR_OBJECT_Visu_R) : $(VCR_SOURCE_Visu_R)
	$(VCC) -f '$<' -o '$@' -cv '$(AS_PROJECT_PATH)/Logical/VCShared/ControlVersion.cvinfo' -sl en $(VCCFLAGS_Visu_R) -rt  -p Visu_R -so $(VC_STATIC_OPTIONS_Visu_R) -vcr 4720 -sfas
# Local resources Library rules
LIB_LOCAL_RES_Visu_R=$(TEMP_PATH_Visu_R)/localres.vca
$(LIB_LOCAL_RES_Visu_R) : $(TEMP_PATH_Visu_R)/Visu_R02.ccf

# Bitmap Library rules
LIB_BMP_RES_Visu_R=$(TEMP_PATH_Visu_R)/bmpres.vca
$(LIB_BMP_RES_Visu_R) : $(TEMP_PATH_Visu_R)/Visu_R03.ccf
$(BMGRP_OBJECTS_Visu_R) : $(PALFILE_Visu_R) $(VC_LANGUAGES_Visu_R)
$(BMINFO_OBJECTS_Visu_R) : $(PALFILE_Visu_R)

BUILD_FILE_Visu_R=$(TEMP_PATH_Visu_R)/BuildFiles.arg
$(BUILD_FILE_Visu_R) : BUILD_FILE_CLEAN_Visu_R $(BUILD_SOURCES_Visu_R)
BUILD_FILE_CLEAN_Visu_R:
	$(RM) /F /Q '$(BUILD_FILE_Visu_R)' 2>nul
#All Modules depending to this project
PROJECT_MODULES_Visu_R=$(AS_CPU_PATH)/Visu_R01.br $(AS_CPU_PATH)/Visu_R02.br $(AS_CPU_PATH)/Visu_R03.br $(FONT_MODULES_Visu_R) $(SHARED_MODULE)

# General Build rules

$(TARGET_FILE_Visu_R): $(PROJECT_MODULES_Visu_R) $(TEMP_PATH_Visu_R)/Visu_R.prj
	$(MODGEN) -so $(VC_STATIC_OPTIONS_Visu_R) -fw '$(VCFIRMWAREPATH)' -m $(VCSTPOST) -v V1.00.0 -f '$(TEMP_PATH_Visu_R)/Visu_R.prj' -o '$@' -vc '$(VCOBJECT_Visu_R)' $(DEPENDENCIES_Visu_R) $(addprefix -d ,$(notdir $(PROJECT_MODULES_Visu_R:.br=)))

$(AS_CPU_PATH)/Visu_R01.br: $(TEMP_PATH_Visu_R)/Visu_R01.ccf
	$(MODGEN) -so $(VC_STATIC_OPTIONS_Visu_R) -fw '$(VCFIRMWAREPATH)' -m $(VCLOD) -v V1.00.0 -b -vc '$(VCOBJECT_Visu_R)' -f '$<' -o '$@' $(DEPENDENCIES_Visu_R)

$(AS_CPU_PATH)/Visu_R02.br: $(TEMP_PATH_Visu_R)/Visu_R02.ccf
	$(MODGEN) -so $(VC_STATIC_OPTIONS_Visu_R) -fw '$(VCFIRMWAREPATH)' -m $(VCLOD) -v V1.00.0 -b -vc '$(VCOBJECT_Visu_R)' -f '$<' -o '$@' $(DEPENDENCIES_Visu_R)

$(AS_CPU_PATH)/Visu_R03.br: $(TEMP_PATH_Visu_R)/Visu_R03.ccf
	$(MODGEN) -so $(VC_STATIC_OPTIONS_Visu_R) -fw '$(VCFIRMWAREPATH)' -m $(VCLOD) -v V1.00.0 -b -vc '$(VCOBJECT_Visu_R)' -f '$<' -o '$@' $(DEPENDENCIES_Visu_R)

# General Build rules END
$(LIB_LOCAL_OBJ_Visu_R) : $(TEMP_PATH_Visu_R)/Visu_R01.ccf

# Main Module
$(TEMP_PATH_ROOT_Visu_R)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/VCShared/Visu_R.vcm:
$(TEMP_PATH_Visu_R)/Visu_R.prj: $(TEMP_PATH_ROOT_Visu_R)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/VCShared/Visu_R.vcm
	$(VCDEP) -m '$(TEMP_PATH_ROOT_Visu_R)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/VCShared/Visu_R.vcm' -s '$(AS_CPU_PATH)/VCShared/Shared.vcm' -p '$(AS_PATH)/AS/VC/Firmware' -c '$(AS_CPU_PATH)' -fw '$(VCFIRMWAREPATH)' -hw '$(CPUHWC)' -so $(VC_STATIC_OPTIONS_Visu_R) -o Visu_R -proj Visu_R
	$(VCPL) $(notdir $(PROJECT_MODULES_Visu_R:.br=,4)) Visu_R,2 -o '$@' -p Visu_R -vc 'Visu_R' -verbose 'False' -fl '$(TEMP_PATH_ROOT_Visu_R)/Objects/$(AS_CONFIGURATION)/$(AS_TEMP_PLC)/VCShared/Visu_R.vcm' -vcr '$(VCR_SOURCE_Visu_R)' -prj '$(AS_PROJECT_PATH)' -warningLevel2 -sfas

# 01 Module

DEL_TARGET01_LFL_Visu_R=$(TEMP_PATH_Visu_R)\Visu_R01.ccf.lfl
$(TEMP_PATH_Visu_R)/Visu_R01.ccf: $(LIB_SHARED) $(SHARED_CCF) $(LIB_BMP_RES_Visu_R) $(TEMP_PATH_Visu_R)/Visu_R03.ccf $(LIB_LOCAL_RES_Visu_R) $(TEMP_PATH_Visu_R)/Visu_R02.ccf $(DIS_OBJECTS_Visu_R) $(PAGE_OBJECTS_Visu_R) $(VCS_OBJECTS_Visu_R) $(VCVK_OBJECTS_Visu_R) $(VCRT_OBJECTS_Visu_R) $(TPR_OBJECTS_Visu_R) $(TXTGRP_OBJECTS_Visu_R) $(LAYER_OBJECTS_Visu_R) $(VCR_OBJECT_Visu_R) $(TDC_OBJECTS_Visu_R) $(TRD_OBJECTS_Visu_R) $(TRE_OBJECTS_Visu_R) $(PRC_OBJECTS_Visu_R) $(SCR_OBJECTS_Visu_R)
	-@CMD /Q /C if exist "$(DEL_TARGET01_LFL_Visu_R)" DEL /F /Q "$(DEL_TARGET01_LFL_Visu_R)" 2>nul
	@$(VCFLGEN) '$@.lfl' '$(LIB_SHARED)' -temp '$(TEMP_PATH_Visu_R)' -prj '$(PRJ_PATH_Visu_R)' -sfas
	@$(VCFLGEN) '$@.lfl' '$(LIB_BMP_RES_Visu_R)' -temp '$(TEMP_PATH_Visu_R)' -prj '$(PRJ_PATH_Visu_R)' -sfas
	@$(VCFLGEN) '$@.lfl' '$(LIB_LOCAL_RES_Visu_R)' -temp '$(TEMP_PATH_Visu_R)' -prj '$(PRJ_PATH_Visu_R)' -sfas
	@$(VCFLGEN) '$@.lfl' '$(DIS_OBJECTS_Visu_R:.vco=.vco|)' -temp '$(TEMP_PATH_Visu_R)' -prj '$(PRJ_PATH_Visu_R)' -sfas
	@$(VCFLGEN) '$@.lfl' -mask .page -vcp '$(AS_PROJECT_PATH)/Logical/Visu_Resized/Package.vcp' -temp '$(TEMP_PATH_Visu_R)' -prj '$(PRJ_PATH_Visu_R)' -sfas
	@$(VCFLGEN) '$@.lfl' '$(VCS_OBJECTS_Visu_R:.vco=.vco|)' -temp '$(TEMP_PATH_Visu_R)' -prj '$(PRJ_PATH_Visu_R)' -sfas
	@$(VCFLGEN) '$@.lfl' -mask .vcvk -vcp '$(AS_PROJECT_PATH)/Logical/Visu_Resized/Package.vcp' -temp '$(TEMP_PATH_Visu_R)' -prj '$(PRJ_PATH_Visu_R)' -sfas
	@$(VCFLGEN) '$@.lfl' '$(VCRT_OBJECTS_Visu_R:.vco=.vco|)' -temp '$(TEMP_PATH_Visu_R)' -prj '$(PRJ_PATH_Visu_R)' -sfas
	@$(VCFLGEN) '$@.lfl' '$(TPR_OBJECTS_Visu_R:.vco=.vco|)' -temp '$(TEMP_PATH_Visu_R)' -prj '$(PRJ_PATH_Visu_R)' -sfas
	@$(VCFLGEN) '$@.lfl' -mask .txtgrp -vcp '$(AS_PROJECT_PATH)/Logical/Visu_Resized/Package.vcp' -temp '$(TEMP_PATH_Visu_R)' -prj '$(PRJ_PATH_Visu_R)' -sfas
	@$(VCFLGEN) '$@.lfl' -mask .layer -vcp '$(AS_PROJECT_PATH)/Logical/Visu_Resized/Package.vcp' -temp '$(TEMP_PATH_Visu_R)' -prj '$(PRJ_PATH_Visu_R)' -sfas
	@$(VCFLGEN) '$@.lfl' '$(VCR_OBJECT_Visu_R:.vco=.vco|)' -temp '$(TEMP_PATH_Visu_R)' -prj '$(PRJ_PATH_Visu_R)' -sfas
	@$(VCFLGEN) '$@.lfl' -mask .tdc -vcp '$(AS_PROJECT_PATH)/Logical/Visu_Resized/Package.vcp' -temp '$(TEMP_PATH_Visu_R)' -prj '$(PRJ_PATH_Visu_R)' -sfas
	@$(VCFLGEN) '$@.lfl' -mask .trd -vcp '$(AS_PROJECT_PATH)/Logical/Visu_Resized/Package.vcp' -temp '$(TEMP_PATH_Visu_R)' -prj '$(PRJ_PATH_Visu_R)' -sfas
	@$(VCFLGEN) '$@.lfl' '$(SCR_OBJECTS_Visu_R:.vco=.vco|)' -temp '$(TEMP_PATH_Visu_R)' -prj '$(PRJ_PATH_Visu_R)' -sfas
	$(LINK) '$@.lfl' -o '$@' -p Visu_R -lib '$(LIB_LOCAL_OBJ_Visu_R)' -P '$(AS_PROJECT_PATH)' -m 'local objects' -profile 'False' -warningLevel2 -vcr 4720 -sfas
# 01 Module END

# 02 Module

DEL_TARGET02_LFL_Visu_R=$(TEMP_PATH_Visu_R)\Visu_R02.ccf.lfl
$(TEMP_PATH_Visu_R)/Visu_R02.ccf: $(LIB_SHARED) $(SHARED_CCF) $(LIB_BMP_RES_Visu_R) $(TEMP_PATH_Visu_R)/Visu_R03.ccf $(BDR_OBJECTS_Visu_R) $(LFNT_OBJECTS_Visu_R) $(CLM_OBJECTS_Visu_R)
	-@CMD /Q /C if exist "$(DEL_TARGET02_LFL_Visu_R)" DEL /F /Q "$(DEL_TARGET02_LFL_Visu_R)" 2>nul
	@$(VCFLGEN) '$@.lfl' '$(LIB_SHARED)' -temp '$(TEMP_PATH_Visu_R)' -prj '$(PRJ_PATH_Visu_R)' -sfas
	@$(VCFLGEN) '$@.lfl' '$(LIB_BMP_RES_Visu_R)' -temp '$(TEMP_PATH_Visu_R)' -prj '$(PRJ_PATH_Visu_R)' -sfas
	@$(VCFLGEN) '$@.lfl' '$(BDR_OBJECTS_Visu_R:.vco=.vco|)' -temp '$(TEMP_PATH_Visu_R)' -prj '$(PRJ_PATH_Visu_R)' -sfas
	@$(VCFLGEN) '$@.lfl' '$(LFNT_OBJECTS_Visu_R:.vco=.vco|)' -temp '$(TEMP_PATH_Visu_R)' -prj '$(PRJ_PATH_Visu_R)' -sfas
	@$(VCFLGEN) '$@.lfl' '$(CLM_OBJECTS_Visu_R:.vco=.vco|)' -temp '$(TEMP_PATH_Visu_R)' -prj '$(PRJ_PATH_Visu_R)' -sfas
	$(LINK) '$@.lfl' -o '$@' -p Visu_R -lib '$(LIB_LOCAL_RES_Visu_R)' -P '$(AS_PROJECT_PATH)' -m 'local resources' -profile 'False' -warningLevel2 -vcr 4720 -sfas
# 02 Module END

# 03 Module

DEL_TARGET03_LFL_Visu_R=$(TEMP_PATH_Visu_R)\Visu_R03.ccf.lfl
$(TEMP_PATH_Visu_R)/Visu_R03.ccf: $(LIB_SHARED) $(SHARED_CCF) $(BMGRP_OBJECTS_Visu_R) $(BMINFO_OBJECTS_Visu_R) $(PALFILE_Visu_R)
	-@CMD /Q /C if exist "$(DEL_TARGET03_LFL_Visu_R)" DEL /F /Q "$(DEL_TARGET03_LFL_Visu_R)" 2>nul
	@$(VCFLGEN) '$@.lfl' '$(LIB_SHARED)' -temp '$(TEMP_PATH_Visu_R)' -prj '$(PRJ_PATH_Visu_R)' -sfas
	@$(VCFLGEN) '$@.lfl' -mask .bmgrp -vcp '$(AS_PROJECT_PATH)/Logical/Visu_Resized/Package.vcp' -temp '$(TEMP_PATH_Visu_R)' -prj '$(PRJ_PATH_Visu_R)' -sfas
	@$(VCFLGEN) '$@.lfl' -mask .bminfo -vcp '$(AS_PROJECT_PATH)/Logical/Visu_Resized/Package.vcp' -temp '$(TEMP_PATH_Visu_R)' -prj '$(PRJ_PATH_Visu_R)' -sfas
	$(LINK) '$@.lfl' -o '$@' -p Visu_R -lib '$(LIB_BMP_RES_Visu_R)' -P '$(AS_PROJECT_PATH)' -m 'bitmap resources' -profile 'False' -warningLevel2 -vcr 4720 -sfas
# 03 Module END

