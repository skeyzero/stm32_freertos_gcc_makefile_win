# �û��漰���Ĵ���ֻ��Ҫ�޸�����Ϳ�����


# STD Defines
DDEFS += -DSTM32F10X_HD -DUSE_STDPERIPH_DRIVER -DHSE_VALUE=8000000
# link file
LINK_SCRIPT  = .\stlib\stm32_flash.ld

# �������֣�����ļ��Թ�����Ϊ���
PROJECT_NAME = stm32f10x_makefile_freertos

USR_DIR = .


#�������漰����ͷ�ļ�λ�üӽ�ȥ
USR_INC =
#�������漰����Դ�ļ���ӽ�ȥ
USR_SRC = 

#Ҫ���������ļ�
USR_CLEAN = 

#�������û��漰���Ĵ�����ӵ�����
USR_SRC	+= $(USR_DIR)\usr_src\main.c
USR_SRC += $(USR_DIR)\task_src\task_debug.c

#�������漰����ͷ�ļ�·����ӵ�����
USR_INC += $(USR_DIR)\usr_inc
USR_INC += $(USR_DIR)\task_inc

USR_CLEAN += $(USR_SRC:.c=.lst)
USR_CLEAN += $(USR_SRC:.c=.o)