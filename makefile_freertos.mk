


FREERTOS_DIR = .\freertos


#�������漰����ͷ�ļ�λ�üӽ�ȥ
FREERTOS_INC =
#�������漰����Դ�ļ���ӽ�ȥ
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

# ��������Ҫ����ı�������ļ���ӽ�ȥ���ⲿ�ֻ����ϲ���Ҫ�޸ģ���˻�������Ҫclean
FREERTOS_CLEAN =

FREERTOS_CLEAN += $(FREERTPS_SRC:.c=.lst) 
FREERTOS_CLEAN += $(FREERTPS_SRC:.c=.o) 



