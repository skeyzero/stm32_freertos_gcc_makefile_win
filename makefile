# 用户个人代码请写在makefile.mk文件里面，其他makefile基本不需要修改

# user specific
SRC       		=			#包含所有涉及的.c文件
ASM_SRC  	 	=			#包含所有涉及的.s文件
INCLUDE_DIRS 	=			#包含所有涉及的头文件路径
CLEAN_ALL		=  			#包含所有需要clean的文件

# toolchain
CC           = arm-none-eabi-gcc.exe
CP           = arm-none-eabi-objcopy.exe
AS           = arm-none-eabi-gcc.exe -x assembler-with-cpp
HEX          = arm-none-eabi-objcopy.exe -O ihex
BIN          = arm-none-eabi-objcopy.exe -O binary -S

# specify define
DDEFS       =

#  添加外部makefile
include makefile_std_lib.mk  	# STM32 Standard Peripheral Library
include makefile_freertos.mk  	# freertos source
include makefile_usr.mk			# USER Code
 
#  外部头文件路径
# user include 
INCLUDE_DIRS  	+= $(USR_INC)
INCLUDE_DIRS 	+= $(STLIB_INC)
INCLUDE_DIRS 	+= $(FREERTOS_INC)

# 添加所有源文件
SRC += $(STLIB_SRC)
SRC += $(FREERTPS_SRC)
SRC += $(USR_SRC)


#添加所有.s文件
ASM_SRC += $(STLIB_ASM)

CLEAN_ALL += $(FREERTOS_CLEAN)
CLEAN_ALL += $(STLIB_CLEAN)
CLEAN_ALL += $(USR_CLEAN)

CLEAN_ALL += $(PROJECT_NAME).elf
CLEAN_ALL += $(PROJECT_NAME).map
CLEAN_ALL += $(PROJECT_NAME).hex
CLEAN_ALL += $(PROJECT_NAME).bin


##################################################以下为编译选项，一般不需要修改
# define mcu, specify the target processor
MCU          = cortex-m3

# 路径编译选项 
INC_DIR  = $(patsubst %, -I%, $(INCLUDE_DIRS))

# run from Flash
DEFS	 = $(DDEFS) -DRUN_FROM_FLASH=1
OBJECTS  = $(ASM_SRC:.s=.o) $(SRC:.c=.o)

# Define optimisation level here
OPT = -Os
MC_FLAGS = -mcpu=$(MCU)
AS_FLAGS = $(MC_FLAGS) -g -gdwarf-2 -mthumb  -Wa,-amhls=$(<:.s=.lst)
CP_FLAGS = $(MC_FLAGS) $(OPT) -g -gdwarf-2 -mthumb -fomit-frame-pointer -Wall -fverbose-asm -Wa,-ahlms=$(<:.c=.lst) $(DEFS)
LD_FLAGS = $(MC_FLAGS) -g -gdwarf-2 -mthumb -nostartfiles -Xlinker --gc-sections -T$(LINK_SCRIPT) -Wl,-Map=$(PROJECT_NAME).map,--cref,--no-warn-mismatch

# makefile rules
all: $(OBJECTS) $(PROJECT_NAME).elf  $(PROJECT_NAME).hex $(PROJECT_NAME).bin
	$(TOOLCHAIN)size $(PROJECT_NAME).elf

%.o: %.c
	$(CC) -c $(CP_FLAGS) -I . $(INC_DIR) $< -o $@

%.o: %.s
	$(AS) -c $(AS_FLAGS) $< -o $@

%.elf: $(OBJECTS)
	$(CC) $(OBJECTS) $(LD_FLAGS) -o $@

%.hex: %.elf
	$(HEX) $< $@

%.bin: %.elf
	$(BIN)  $< $@

flash: $(PROJECT_NAME).bin
#	st-flash write $(PROJECT_NAME).bin 0x8000000
	ST-LINK_CLI.exe -c SWD -P $(PROJECT_NAME).bin 0x08000000 -Run
erase:
#	ST-LINK_CLI.exe -c SWD -P ./*.bin 
	st-flash erase

clean_all:
#  以下部分为linux下指令
#	-rm -rf $(OBJECTS)
#	-rm -rf $(PROJECT_NAME).elf
#	-rm -rf $(PROJECT_NAME).map
#	-rm -rf $(PROJECT_NAME).hex
#	-rm -rf $(PROJECT_NAME).bin
#	-rm -rf $(SRC:.c=.lst)
#	-rm -rf $(ASM_SRC:.s=.lst)

	del  $(CLEAN_ALL)
	
clean_usr:
	del $(USR_CLEAN)

