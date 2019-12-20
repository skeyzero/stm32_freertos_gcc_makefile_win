


# ST库目录

STM32F10x_LIB_DIR      = .\stlib

STLIB_SRC = 
STLIB_INC = 
STLIB_ASM =
STLIB_CLEAN = 

# CMSIS
STLIB_SRC  += $(STM32F10x_LIB_DIR)\CMSIS\CM3\DeviceSupport\ST\STM32F10x\system_stm32f10x.c
STLIB_SRC  += $(STM32F10x_LIB_DIR)\CMSIS\CM3\CoreSupport\core_cm3.c

# 包含ST整个库,可以把不是用的注释掉，或者全部编译也可，全部编译会影响编译时间，不影响编译大小
STLIB_SRC  += $(STM32F10x_LIB_DIR)\STM32F10x_StdPeriph_Driver\src\misc.c
STLIB_SRC  += $(STM32F10x_LIB_DIR)\STM32F10x_StdPeriph_Driver\src\stm32f10x_adc.c
STLIB_SRC  += $(STM32F10x_LIB_DIR)\STM32F10x_StdPeriph_Driver\src\stm32f10x_bkp.c
STLIB_SRC  += $(STM32F10x_LIB_DIR)\STM32F10x_StdPeriph_Driver\src\stm32f10x_can.c
STLIB_SRC  += $(STM32F10x_LIB_DIR)\STM32F10x_StdPeriph_Driver\src\stm32f10x_cec.c
STLIB_SRC  += $(STM32F10x_LIB_DIR)\STM32F10x_StdPeriph_Driver\src\stm32f10x_dac.c
STLIB_SRC  += $(STM32F10x_LIB_DIR)\STM32F10x_StdPeriph_Driver\src\stm32f10x_dbgmcu.c
STLIB_SRC  += $(STM32F10x_LIB_DIR)\STM32F10x_StdPeriph_Driver\src\stm32f10x_dma.c
STLIB_SRC  += $(STM32F10x_LIB_DIR)\STM32F10x_StdPeriph_Driver\src\stm32f10x_exti.c
STLIB_SRC  += $(STM32F10x_LIB_DIR)\STM32F10x_StdPeriph_Driver\src\stm32f10x_flash.c
STLIB_SRC  += $(STM32F10x_LIB_DIR)\STM32F10x_StdPeriph_Driver\src\stm32f10x_fsmc.c
STLIB_SRC  += $(STM32F10x_LIB_DIR)\STM32F10x_StdPeriph_Driver\src\stm32f10x_gpio.c
STLIB_SRC  += $(STM32F10x_LIB_DIR)\STM32F10x_StdPeriph_Driver\src\stm32f10x_i2c.c
STLIB_SRC  += $(STM32F10x_LIB_DIR)\STM32F10x_StdPeriph_Driver\src\stm32f10x_iwdg.c
STLIB_SRC  += $(STM32F10x_LIB_DIR)\STM32F10x_StdPeriph_Driver\src\stm32f10x_pwr.c
STLIB_SRC  += $(STM32F10x_LIB_DIR)\STM32F10x_StdPeriph_Driver\src\stm32f10x_rcc.c
STLIB_SRC  += $(STM32F10x_LIB_DIR)\STM32F10x_StdPeriph_Driver\src\stm32f10x_rtc.c
STLIB_SRC  += $(STM32F10x_LIB_DIR)\STM32F10x_StdPeriph_Driver\src\stm32f10x_sdio.c
STLIB_SRC  += $(STM32F10x_LIB_DIR)\STM32F10x_StdPeriph_Driver\src\stm32f10x_spi.c
STLIB_SRC  += $(STM32F10x_LIB_DIR)\STM32F10x_StdPeriph_Driver\src\stm32f10x_tim.c
STLIB_SRC  += $(STM32F10x_LIB_DIR)\STM32F10x_StdPeriph_Driver\src\stm32f10x_usart.c
STLIB_SRC  += $(STM32F10x_LIB_DIR)\STM32F10x_StdPeriph_Driver\src\stm32f10x_wwdg.c

# 包含所有 .h文件路径
STLIB_INC += $(STM32F10x_LIB_DIR)\CMSIS\CM3\CoreSupport
STLIB_INC += $(STM32F10x_LIB_DIR)\CMSIS\CM3\DeviceSupport\ST\STM32F10x
STLIB_INC += $(STM32F10x_LIB_DIR)\STM32F10x_StdPeriph_Driver\inc
STLIB_INC += $(STM32F10x_LIB_DIR)\STM32F10x_StdPeriph_Driver


STLIB_ASM   += $(STM32F10x_LIB_DIR)\CMSIS\CM3\DeviceSupport\ST\STM32F10x\startup\gcc_ride7\startup_stm32f10x_hd.s




STLIB_CLEAN += $(STLIB_SRC:.c=.lst) 
STLIB_CLEAN += $(STLIB_SRC:.c=.o) 


