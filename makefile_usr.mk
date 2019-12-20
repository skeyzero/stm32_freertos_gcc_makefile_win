# 用户涉及到的代码只需要修改这里就可以了


# STD Defines
DDEFS += -DSTM32F10X_HD -DUSE_STDPERIPH_DRIVER -DHSE_VALUE=8000000
# link file
LINK_SCRIPT  = .\stlib\stm32_flash.ld

# 工程名字，输出文件以工程命为输出
PROJECT_NAME = stm32f10x_makefile_freertos

USR_DIR = .


#把所有涉及到的头文件位置加进去
USR_INC =
#把所有涉及到的源文件添加进去
USR_SRC = 

#要清除的输出文件
USR_CLEAN = 

#把所有用户涉及到的代码添加到工程
USR_SRC	+= $(USR_DIR)\usr_src\main.c
USR_SRC += $(USR_DIR)\task_src\task_debug.c

#把所有涉及到的头文件路径添加到工程
USR_INC += $(USR_DIR)\usr_inc
USR_INC += $(USR_DIR)\task_inc

USR_CLEAN += $(USR_SRC:.c=.lst)
USR_CLEAN += $(USR_SRC:.c=.o)