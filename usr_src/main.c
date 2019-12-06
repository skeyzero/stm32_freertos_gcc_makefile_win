/*
Freertos 10.2.0 锟斤拷植锟芥本.
注锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷藿锟斤拷锟斤拷锟斤拷锟斤拷亩锟絧roject锟侥诧拷锟斤拷锟斤拷锟角得查看startup锟侥硷拷锟角凤拷锟睫改伙拷锟斤拷锟叫断★拷锟斤拷锟斤拷爻锟斤拷植锟街拷锟斤拷锟斤拷螅。锟斤拷锟斤拷锟斤拷锟斤拷锟�
*/


#include "FreeRTOS.h"
#include "task.h"
#include "queue.h"
#include "list.h"
#include "portable.h"
#include "FreeRTOSConfig.h"
#include "timers.h"


#include "stm32f10x.h"


#include "task_debug.h"

int main(void)
{

	Create_Task_Debug(1);
	
	vTaskStartScheduler(); 		//锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟绞贾达拷锟�
	
	return 0;
}






