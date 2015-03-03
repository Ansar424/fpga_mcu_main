
/*******************************************************************
*
* CAUTION: This file is automatically generated by HSM.
* Version: 
* DO NOT EDIT.
*
* Copyright (C) 2010-2015 Xilinx, Inc. All Rights Reserved.*
*Permission is hereby granted, free of charge, to any person obtaining a copy
*of this software and associated documentation files (the Software), to deal
*in the Software without restriction, including without limitation the rights
*to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
*copies of the Software, and to permit persons to whom the Software is
*furnished to do so, subject to the following conditions:
*
*The above copyright notice and this permission notice shall be included in
*all copies or substantial portions of the Software.
* 
* Use of the Software is limited solely to applications:
*(a) running on a Xilinx device, or
*(b) that interact with a Xilinx device through a bus or interconnect.
*
*THE SOFTWARE IS PROVIDED AS IS, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
*IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
*FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
*XILINX CONSORTIUM BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
*WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT
*OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*
*Except as contained in this notice, the name of the Xilinx shall not be used
*in advertising or otherwise to promote the sale, use or other dealings in
*this Software without prior written authorization from Xilinx.
*

* 
* Description: XilKernel Configuration parameters
*
*******************************************************************/

#ifndef _OS_CONFIG_H
#define _OS_CONFIG_H


#define MB_XILKERNEL 

#define CONFIG_HARDWARE_EXCEPTIONS 

#define CONFIG_HARDWARE_EXCEPTIONS 

#define CONFIG_BASE_VECTORS 0x00000000

#define CONFIG_YIELD true

#define CONFIG_PTHREAD_SUPPORT true

#define MAX_PTHREADS 10

#define PTHREAD_STACK_SIZE 1000

#define CONFIG_STATIC_PTHREAD_SUPPORT true

#define N_INIT_SELF_PTHREADS 0

#define CONFIG_PTHREAD_MUTEX true

#define MAX_PTHREAD_MUTEX 10

#define MAX_PTHREAD_MUTEX_WAITQ 10

#define CONFIG_TIMER_PIT true

#define SYSTMR_BASEADDR 0x41C00000

#define SYSTMR_INTERVAL 2000000

#define SYSTMR_CLK_FREQ 100000000

#define SYSTMR_CLK_FREQ_KHZ 100000

#define CONFIG_INTC true

#define SYSINTC_BASEADDR XPAR_MCU_CORE_SYSTEM_MICROBLAZE_0_AXI_INTC_BASEADDR

#define SYSINTC_DEVICE_ID XPAR_MCU_CORE_SYSTEM_MICROBLAZE_0_AXI_INTC_DEVICE_ID

#define SYSTMR_INTR_ID 0

#define CONFIG_SCHED true

#define SCHED_TYPE SCHED_PRIO

#define N_PRIO 32

#define CONFIG_PRIOSCHED true

#define MAX_READYQ 10

#define CONFIG_TIME true

#define MAX_TMRS 10

#endif
