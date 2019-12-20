


FREERTOS_DIR = .\freertos


#把所有涉及到的头文件位置加进去
FREERTOS_INC =
#把所有涉及到的源文件添加进去
FREERTPS_SRC = 

# add freertos source
FREERTPS_SRC  += $(FREERTOS_DIR)\list.c
FREERTPS_SRC  += $(FREERTOS_DIR)\queue.c
FREERTPS_SRC  += $(FREERTOS_DIR)\croutine.c
FREERTPS_SRC  += $(FREERTOS_DIR)\tasks.c
FREERTPS_SRC  += $(FREERTOS_DIR)\timers.c
FREERTPS_SRC  += $(FREERTOS_DIR)\portable\GCC\ARM_CM3\port.c
FREERTPS_SRC  += $(FREERTOS_DIR)\portable\MemMang\heap_4.c

# include directories
FREERTOS_INC += $(FREERTOS_DIR)\include
FREERTOS_INC += $(FREERTOS_DIR)\portable\GCC\ARM_CM3

# 把所有需要清除的编译输出文件添加进去，这部分基本上不需要修改，因此基本不需要clean
FREERTOS_CLEAN =

FREERTOS_CLEAN += $(FREERTPS_SRC:.c=.lst) 
FREERTOS_CLEAN += $(FREERTPS_SRC:.c=.o) 



