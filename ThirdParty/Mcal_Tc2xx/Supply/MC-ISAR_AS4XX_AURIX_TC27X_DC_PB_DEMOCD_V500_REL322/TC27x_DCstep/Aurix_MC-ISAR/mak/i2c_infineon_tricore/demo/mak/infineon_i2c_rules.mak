#*******************************************************************************
#                                                                             **
#* Copyright (C) Infineon Technologies (2013)                                 **
#*                                                                            **
#* All rights reserved.                                                       **
#*                                                                            **
#* This document contains proprietary information belonging to Infineon       **
#* Technologies. Passing on and copying of this document, and communication   **
#* of its contents is not permitted without prior written authorization.      **
#*                                                                            **
#*******************************************************************************
#*                                                                            **
#*  FILENAME  : infineon_i2c_rules.mak                                        **
#*                                                                            **
#*  VERSION   : 0.0.1                                                         **
#*                                                                            **
#*  DATE      : 2013.10.10                                                    **
#*                                                                            **
#*  AUTHOR    : DL-AUTOSAR-Engineering                                        **
#*                                                                            **
#*  VENDOR    : Infineon Technologies                                         **
#*                                                                            **
#*  DESCRIPTION  : This make file is used to build the I2C driver             **
#*                    demo objects only                                       **
#*                                                                            **
#*                                                                            **
#*  MAY BE CHANGED BY USER [yes/no]: no                                       **
#*                                                                            **
#******************************************************************************/

#*******************************************************************************
#*                      Author(s) Identity                                    **
#*******************************************************************************
#*                                                                            **
#* Initials     Name                                                          **
#* ---------------------------------------------------------------------------**
#* JN           Jayaprakash Narayana                                          **
#*                                                                            **
#******************************************************************************/


#*******************************************************************************
#*                      Revision Control History                              **
#******************************************************************************/
#*
#*  V0.0.1 : 2013.10.10, JN  : Initial Version.
#*
#******************************************************************************/

#***************************** REQUIRE ****************************************/

include $(SSC_ROOT)/mak/autosar.mak
include $(SSC_ROOT)/mak/base_make.mak
include $(COMPILER_MAKE_PATH)/compiler.mak
include $(SSC_ROOT)/mak/i2c_infineon_tricore/ssc/mak/infineon_i2c_defs.mak
include $(SSC_ROOT)/mak/mcu_infineon_tricore/ssc/mak/infineon_mcu_defs.mak
include $(SSC_ROOT)/mak/port_infineon_tricore/ssc/mak/infineon_port_defs.mak
#***************************** SPECIFIC ***************************************/
headers = $(STANDARD_DEPENDANCY) $(I2C_DEP_HEADERS)
I2C_INC_PATHS_FILE = i2c_include_paths.ifx

build_i2c_driver : info incpaths $(I2C_DEMO_OBJECTS)


$(I2C_BASE_PATH)/demo/obj/I2c_Demo.$(OBJ_FILE_SUFFIX) : $(I2C_BASE_PATH)/demo/src/I2c_Demo.c $(headers)
	@$(COMPILE_I2C) $(OUTPUT) $(I2C_BASE_PATH)/demo/obj/I2c_Demo.$(OBJ_FILE_SUFFIX) $(STD_OPT_CC) $(FF_READ)$(I2C_INC_PATHS_FILE)  $(OBJ_CREATION)  $(I2C_BASE_PATH)/demo/src/I2c_Demo.c  $(ERROR_REPORT)
	@-rm -f $(I2C_BASE_PATH)/demo/obj/I2c_Demo.ers


.PHONY: clean
clean:
	@-rm -f $(I2C_OBJECTS)

.PHONY: wipe
wipe:
	@-rm -f *.src
	@-rm -f *.err

print:
	@echo $(I2C_OBJECTS)

incpaths:
	@echo $(STANDARD_INCLUDE) > $(I2C_INC_PATHS_FILE)
	@echo $(I2C_INCLUDE_PATH) >> $(I2C_INC_PATHS_FILE)
	@echo $(I2C_DEMO_INCLUDE_PATH) >> $(I2C_INC_PATHS_FILE)
	@echo $(MCU_INCLUDE_PATH) >> $(I2C_INC_PATHS_FILE)
	@echo $(PORT_INCLUDE_PATH) >> $(I2C_INC_PATHS_FILE)


info:
	@echo -------------Compiling I2C Demo--------------
