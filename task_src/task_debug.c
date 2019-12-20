/*
说明：task_pc_cmd.c 源文件处理所有与PC端指令解析及返回操作。

查看队列中有打印信息立即打印

*/

#include "task_debug.h"

#include "stm32f10x.h"


/* 内部变量 */
static TaskHandle_t Task_Debug_Handle;




/*
PB10		TX
PB11		RX
*/
void UART3_Init(u32 baud_rate)
{
	RCC->APB2ENR |= 1 << 3;//Enable PC clock
	GPIOB->CRH &= 0xffff00ff;//清除PC10,PC11设置位
	GPIOB->CRH |= 0x00004b00;//PC10 复用推皖输出，PC11浮空输入
	RCC->APB1ENR|=1<<18; //串口3使能

    RCC->APB1RSTR|=1<<18;	//复位串口
    RCC->APB1RSTR&=~(1<<18);//

    USART3->BRR=0x0138;//设置波特率
    USART3->CR1|=0x2008;//设置停止位,设置接受中断使能,只发送，不接受，不产生中断

	//NVIC_Set(2,1,0x27,2);//设置串口中断
}

void UART3_Send(u8 tx_data)
{
	while((USART3->SR & (0x40)) == 0);//等待发送完毕
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
	if(xTaskCreate(	Task_Debug,		//任务实现函数
				"Debug",			//任务名称
				512,				//栈空间
				NULL,				//传递到任务中的值
				priority,					//优先级0最低，最高configMAX_PRIORITIES-1
				&Task_Debug_Handle) != pdTRUE)		//任务句柄，多任务操作使用这个参数
	{
	}
}











