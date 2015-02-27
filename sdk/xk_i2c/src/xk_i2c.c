/******************************************************************************
*
* Copyright (C) 2009 - 2014 Xilinx, Inc.  All rights reserved.
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* Use of the Software is limited solely to applications:
* (a) running on a Xilinx device, or
* (b) that interact with a Xilinx device through a bus or interconnect.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
* XILINX CONSORTIUM BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF
* OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
* SOFTWARE.
*
* Except as contained in this notice, the name of the Xilinx shall not be used
* in advertising or otherwise to promote the sale, use or other dealings in
* this Software without prior written authorization from Xilinx.
*
******************************************************************************/

/* helloworld_xmk.c: launch a thread that prints out Hello World */

#include "xmk.h"
#include "sys/init.h"
#include <sys/decls.h>
#include "sys/timer.h"
#include "platform.h"

#include "xintc.h"
#include "xiic.h"
#include "xgpio.h"

#include "imu_sensors.h"
#include <stdio.h>

#define LED_CHANNEL 1

XGpio Gpio;

void *hello_world(void *arg)
{
	int status;

	u32 led_val;

	DBG_PRINT ("Debug\n\r");

    print("Hello World\r\n");

	//Init GPIO
	status = XGpio_Initialize(&Gpio, XPAR_AXI_GPIO_0_DEVICE_ID);
	if (status != XST_SUCCESS)  {
		print ("GPIO Failure");
	}
	XGpio_SetDataDirection(&Gpio, LED_CHANNEL, 0x0);

	led_val = 0x1;

    while (1==1) {
    	XGpio_DiscreteWrite(&Gpio, LED_CHANNEL, led_val);

    	if (led_val == 0x1<<3){
    		led_val = 0x1;
    	} else {
    		led_val = led_val << 1;
    	}

    	sleep(200);


    }

}

int main()
{
    init_platform();

    /* Initialize xilkernel */
    xilkernel_init();

    // Add static threads
    xmk_add_static_thread(hello_world, 0);
    imu_sensors_init();

    /* start xilkernel - does not return control */
    xilkernel_start();

    /* Never reached */
    cleanup_platform();

    return 0;
}
