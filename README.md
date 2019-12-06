# STM32 Makefile FreeRTOS 10.2.1


## 项目参考 
(转自：将Freertos9.0版本更新到最新版本.源作者makefile写的清晰明了，值得学习！)   
https://github.com/freelamb/stm32f10x_makefile_freertos   


## 环境
开发平台:windows平台	
编译器：arm-none-eab-gcc	
make: make.exe
项目管理:makefile	

## 使用
### 编译工程
```
$ make.exe
```

### 清除编译输出

```
$ make.exe clean
```

```

## st-link Debug

start debug
```
$ st-util
```

Clion configure debug reference

http://www.jianshu.com/p/4635a2380698

## Example

mcu: STM32F103C8T6

GPIOB11--Led

