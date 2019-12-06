/*
说明：task_pc_cmd.c 源文件处理所有与PC端指令解析及返回操作。

查看队列中有打印信息立即打印

*/

#include "task_debug.h"



/* 内部变量 */
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
	if(xTaskCreate(	Task_Debug,		//任务实现函数
				"Debug",			//任务名称
				512,				//栈空间
				NULL,				//传递到任务中的值
				priority,					//优先级0最低，最高configMAX_PRIORITIES-1
				&Task_Debug_Handle) != pdTRUE)		//任务句柄，多任务操作使用这个参数
	{
	}
}











