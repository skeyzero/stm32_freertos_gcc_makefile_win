
# source director
FREERTOS_SRC_DIR     = $(FREERTOS_DIR)
FREERTOS_INC_DIR     = $(FREERTOS_DIR)\include
FREERTOS_ARM_CM3_DIR = $(FREERTOS_DIR)\portable\GCC\ARM_CM3
FREERTOS_MemMang_DIR = $(FREERTOS_DIR)\portable\MemMang

FREERTOS_INC =
FREERTPS_SRC = 

# add freertos source
FREERTPS_SRC  += $(FREERTOS_SRC_DIR)\list.c
FREERTPS_SRC  += $(FREERTOS_SRC_DIR)\queue.c
FREERTPS_SRC  += $(FREERTOS_SRC_DIR)\croutine.c
FREERTPS_SRC  += $(FREERTOS_SRC_DIR)\tasks.c
FREERTPS_SRC  += $(FREERTOS_SRC_DIR)\timers.c
FREERTPS_SRC  += $(FREERTOS_ARM_CM3_DIR)\port.c
FREERTPS_SRC  += $(FREERTOS_MemMang_DIR)\heap_4.c

# include directories
FREERTOS_INC += $(FREERTOS_INC_DIR)
FREERTOS_INC += $(FREERTOS_ARM_CM3_DIR)


