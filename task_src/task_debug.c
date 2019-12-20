/*
˵����task_pc_cmd.c Դ�ļ�����������PC��ָ����������ز�����

�鿴�������д�ӡ��Ϣ������ӡ

*/

#include "task_debug.h"

#include "stm32f10x.h"


/* �ڲ����� */
static TaskHandle_t Task_Debug_Handle;




/*
PB10		TX
PB11		RX
*/
void UART3_Init(u32 baud_rate)
{
	RCC->APB2ENR |= 1 << 3;//Enable PC clock
	GPIOB->CRH &= 0xffff00ff;//���PC10,PC11����λ
	GPIOB->CRH |= 0x00004b00;//PC10 �������������PC11��������
	RCC->APB1ENR|=1<<18; //����3ʹ��

    RCC->APB1RSTR|=1<<18;	//��λ����
    RCC->APB1RSTR&=~(1<<18);//

    USART3->BRR=0x0138;//���ò�����
    USART3->CR1|=0x2008;//����ֹͣλ,���ý����ж�ʹ��,ֻ���ͣ������ܣ��������ж�

	//NVIC_Set(2,1,0x27,2);//���ô����ж�
}

void UART3_Send(u8 tx_data)
{
	while((USART3->SR & (0x40)) == 0);//�ȴ��������
	USART3->DR = tx_data;
}


void Task_Debug(void* param)
{
	u8 i = 0;
	UART3_Init(1);
	for(;;)
	{
		vTaskDelay(100/portTICK_RATE_MS);
		UART3_Send(i);
		i++;
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











