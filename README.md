# Windows �STM32��Դ��������    

## ��ͼ   
MDK�쵽���˰�(��)����Դ���ϲŶԹ����һ�������ܵ���ʦ������ѿ�������(��)��     

## ����    
* [arm-none-eabi-gcc](https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-rm/downloads "����")<->gcc������     
* [make](https://nchc.dl.sourceforge.net/project/gnuwin32/make/3.81/make-3.81.exe)     <->Ϊ�˸������ִ�б���Ʋ�����ÿ�ζ���ָ����벻ʵ�ڣ�����д��makefileֱ��makeһ�����롣 ���Eclipse Build����ʵ��build,clean,program�Ȳ�����ֻҪ��ᣬ�����ֱ���þͶ��ˣ���    
* Eclipse--�༭���ߣ�����C/C++�汾��������������༭������(��ѡ���Ƽ���stm32cubeIDEʵ�ʻ���Eclipse,���ڸ���ʹ��stmcubeIDE���ֻ�ɾ���û��ļ�bug���Ĵ�������Ҳ���õ�hal�⣬��������stm32cubeIDE)��      
* [stlink-utility](https://www.st.com/en/development-tools/stsw-link004.html "���ص�ַ")<->st�ٷ�stlink���ع��ߣ���Ҫ�õ���ST-LINK_CLI.exe�����������������س���

* ��װ������������뽫��װ·����ӵ�ϵͳ���������С�   ��    
arm-none-eabi-gcc��ַ[C:\Program Files (x86)\GNU Tools Arm Embedded\9 2019-q4-major\bin]()
make ��ַ [C:\Program Files (x86)\GnuWin32\bin]()   
stlink��ַ[C:\Program Files (x86)\STMicroelectronics\STM32 ST-LINK Utility\ST-LINK Utility]()

## ���makefile ����    
��������ֲ��һ��stm32  + stlib3.5 + Freertos 10.0.2 + makefile �Ĺ��̣�ֱ����ȥ�ðɣ���Ҫ�ĵ��Լ��ģ�������������⡣ 


## ʹ��Eclipse
* Eclipseʹ��ǰ��Ҫ����һ��workspace�Ĺ���Ŀ¼�����Ŀ¼���ڹ����������ˡ���֮����ͬ�Ĺ��̷�ͬһ��workspaceͳһ����    
* ��ӹ��̵�Eclipse.���File->import...�����Լ���makefile����Ŀ¼��ӽ�ȥ���ɡ�   
* ���ñ���ѡ�����˵ִ���ĸ�ָ���ѡ��Ĺ����£��Ҽ�->Build Targets -> Create������������ѡ�������һ���õ�3�����õı���ѡ�   
	1.���̱���   make.exe all    
	2.�������   make.exe clean     
	3.���ع��̵�Ŀ��Ӳ�� make.exe flash  
![avatar](./image/1.png)
![avatar](./image/1.png)
![avatar](./image/1.png)
![avatar](./image/1.png)	
* �����к���ĳЩ����Ҫ���ļ���Eclipse�Ὣ���������ļ���ʾ�������������������һ�������ļ�����������˵�ǲ���Ҫ�����ģ����԰������˵��������̾͸ɾ����ˡ�[�ο�����](https://www.cnblogs.com/jhj117/p/7195893.html)

![avatar](./image/1.gif)

