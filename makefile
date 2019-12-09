# windows 下Eclipse STM32 使用
# arm-none-eabi-gcc.exe下载https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-rm/downloads
# make.exe下载 http://gnuwin32.sourceforge.net/packages/make.htm
# 以上两个软件直接默认地址安装即刻。
# 将以上两个软件在系统环境变量中添加。


# windows 和 Linux 工具链有差别，在windows中，应当添加。exe后缀
# windows 路径使用'\'  linux路径使用 '/'
# toolchain
TOOLCHAIN    = arm-none-eabi-
CC           = $(TOOLCHAIN)gcc.exe
CP           = $(TOOLCHAIN)objcopy.exe
AS           = $(TOOLCHAIN)gcc.exe -x assembler-with-cpp
HEX          = $(CP) -O ihex
BIN          = $(CP) -O binary -S

# define mcu, specify the target processor
MCU          = cortex-m3

# all the files will be generated with this name (main.elf, main.bin, main.hex, etc)
PROJECT_NAME=stm32f10x_makefile_freertos

# specify define
DDEFS       =


# 用于包含所有头文件
INCLUDE_DIRS =

# define stm32f10x lib dir
STM32F10x_LIB_DIR      = .\stlib

# define freertos dir
FREERTOS_DIR = .\freertos

USR_INC_DIR = .\usr_inc
USR_SRC_DIR = .\usr_src

TASK_INC_DIR = .\task_inc
TASK_SRC_DIR = .\task_src


# link file
LINK_SCRIPT  = .\stlib\stm32_flash.ld

# user specific
# SRC用于包含所有。c文件，其他makefile
SRC       =
ASM_SRC   =


# include sub makefiles
include makefile_std_lib.mk   # STM32 Standard Peripheral Library
include makefile_freertos.mk  # freertos source

# 外部头文件路径
# user include 
INCLUDE_DIRS  	+= $(USR_INC_DIR)
INCLUDE_DIRS  	+= $(TASK_INC_DIR)
INCLUDE_DIRS 	+= $(STLIB_INC)
INCLUDE_DIRS 	+= $(FREERTOS_INC)


SRC      += $(USR_SRC_DIR)\main.c

SRC      += $(TASK_SRC_DIR)\task_debug.c



SRC += $(STLIB_SRC)
SRC += $(FREERTPS_SRC)


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

#
# makefile rules
#
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
	ST-LINK_CLI.exe -c SWD -P $(PROJECT_NAME).bin 0x08000000
erase:
#	ST-LINK_CLI.exe -c SWD -P ./*.bin 
	st-flash erase

clean:
#  以下部分为linux下指令
#	-rm -rf $(OBJECTS)
#	-rm -rf $(PROJECT_NAME).elf
#	-rm -rf $(PROJECT_NAME).map
#	-rm -rf $(PROJECT_NAME).hex
#	-rm -rf $(PROJECT_NAME).bin
#	-rm -rf $(SRC:.c=.lst)
#	-rm -rf $(ASM_SRC:.s=.lst)

#	del  $(OBJECTS)
	del  $(PROJECT_NAME).elf
	del  $(PROJECT_NAME).map
	del  $(PROJECT_NAME).hex
	del  $(PROJECT_NAME).bin
	del  $(SRC:.c=.lst)
	del  $(ASM_SRC:.s=.lst)
	del  $(SRC:.c=.o)
	del  $(ASM_SRC:.s=.o)
