
# STD Defines
DDEFS += -DSTM32F10X_HD -DUSE_STDPERIPH_DRIVER -DHSE_VALUE=8000000

# source director
STM32F1_STD_LIB     = $(STM32F10x_LIB_DIR)\STM32F10x_StdPeriph_Driver
STM32F1_CORE_DIR    = $(STM32F10x_LIB_DIR)\CMSIS\CM3\CoreSupport
STM32F1_DEVICE_DIR  = $(STM32F10x_LIB_DIR)\CMSIS\CM3\DeviceSupport\ST\STM32F10x
STM32F1_SRC_DIR     = $(STM32F1_STD_LIB)\src
STM32F1_INC_DIR     = $(STM32F1_STD_LIB)\inc

# startup
ASM_SRC  += $(STM32F1_DEVICE_DIR)\startup\gcc_ride7\startup_stm32f10x_hd.s

# 包含所有。c文件
STLIB_SRC = 
STLIB_INC = 


# CMSIS
STLIB_SRC  += $(STM32F1_DEVICE_DIR)\system_stm32f10x.c
STLIB_SRC  += $(STM32F1_CORE_DIR)\core_cm3.c

# use libraries, please add or remove when you use or remove it.
STLIB_SRC  += $(STM32F1_SRC_DIR)\stm32f10x_rcc.c
STLIB_SRC  += $(STM32F1_SRC_DIR)\stm32f10x_gpio.c
STLIB_SRC  += $(STM32F1_SRC_DIR)\stm32f10x_exti.c
STLIB_SRC  += $(STM32F1_SRC_DIR)\stm32f10x_usart.c
STLIB_SRC  += $(STM32F1_SRC_DIR)\stm32f10x_rtc.c
STLIB_SRC  += $(STM32F1_SRC_DIR)\stm32f10x_pwr.c
STLIB_SRC  += $(STM32F1_SRC_DIR)\stm32f10x_bkp.c
STLIB_SRC  += $(STM32F1_SRC_DIR)\misc.c

# 包含所有 .h文件路径
STLIB_INC += $(STM32F1_CORE_DIR)
STLIB_INC += $(STM32F1_DEVICE_DIR)
STLIB_INC += $(STM32F1_INC_DIR)
STLIB_INC += $(STM32F1_STD_LIB)

