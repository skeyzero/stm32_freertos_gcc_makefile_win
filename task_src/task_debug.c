/*
˵����task_pc_cmd.c Դ�ļ�����������PC��ָ����������ز�����

�鿴�������д�ӡ��Ϣ������ӡ

*/

#include "task_debug.h"



/* �ڲ����� */
static TaskHandle_t Task_Debug_Handle;



void Task_Debug(void* param)
{
	for(;;)
	{
		vTaskDelay(10/portTICK_RATE_MS);
	}
}

void Create_Task_Debug(u8 priority)
{
	if(xTaskCreate(	Task_Debug,		//����ʵ�ֺ���
				"Debug",			//��������
				512,				//ջ�ռ�
				NULL,				//���ݵ������е�ֵ
				priority,					//���ȼ�0��ͣ����configMAX_PRIORITIES-1
				&Task_Debug_Handle) != pdTRUE)		//�����������������ʹ���������
	{
	}
}











