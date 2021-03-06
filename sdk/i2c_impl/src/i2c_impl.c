#include "platform.h"
#include <stdio.h>
#include "xparameters.h"
#include "xil_cache.h"
#include "xgpio.h"
#include "xintc.h"
#include "xgpio.h"
#include "xiic.h"
#include "xil_exception.h"

void print(char *str);
void XIic_SendHandler(void *CallBackRef, int ByteCount);
void XIic_RecvHandler(void *CallBackRef, int ByteCount);

#define LED_CHANNEL 1
#define LSM_XM_ADR		0x1E
#define LSM_G_ADR		0x6A
#define BAR_ADR			0x77

XIic Iic;
XGpio Gpio;
XIntc Intc;

int txbusy;
int rxbusy;

int main()
{
	int status;
	int i;

	u8 txbuf[10];
	u8 rxbuf[10];

	txbusy=0;
	rxbusy=0;


	init_platform();

	//Init GPIO
	status = XGpio_Initialize(&Gpio, XPAR_AXI_GPIO_0_DEVICE_ID);
	if (status != XST_SUCCESS)  {
		print ("GPIO Failure");
	}

 	// Init Interrupt controller
 	status = XIntc_Initialize(&Intc, XPAR_INTC_0_DEVICE_ID);
	if (status != XST_SUCCESS)  {
		print ("Intc Failure");
	}

 	// Init I2C controller
 	status = XIic_Initialize(&Iic, XPAR_IIC_0_DEVICE_ID);
	if (status != XST_SUCCESS)  {
		print ("I2C Failure");
	}


	// SET LED ports as outputs
 	XGpio_SetDataDirection(&Gpio, LED_CHANNEL, 0x0);

 	// Connect I2c to the Intc system
 	XIic_SetRecvHandler(&Iic, &Iic, &XIic_RecvHandler);
 	XIic_SetSendHandler(&Iic, &Iic, &XIic_SendHandler);

 	status = XIntc_Connect(&Intc,
 				XPAR_INTC_0_IIC_0_VEC_ID,
 				(XInterruptHandler)XIic_InterruptHandler,
 				(void *)&Iic);
	if (status != XST_SUCCESS)  {
		print ("Int handler connect Failure");
	}


 	status = XIntc_Start(&Intc, XIN_REAL_MODE);
	if (status != XST_SUCCESS)  {
		print ("Int start Failure");
	}
 	XIntc_Enable(&Intc, XPAR_INTC_0_IIC_0_VEC_ID);
 	Xil_ExceptionEnable();

 	XIic_SetGpOutput(&Iic, 0x25);
 	XIic_SetAddress(&Iic, XII_ADDR_TO_SEND_TYPE, LSM_XM_ADR);
 	XIic_Start(&Iic);


 	txbuf[0] = 0x0F;

 	txbusy=1;
 	XIic_MasterSend(&Iic, txbuf, 1);

 	while (txbusy!=0);


 	for (i=0; i<10000000;i++);

 	XIic_Start(&Iic);
 	rxbusy=1;
 	XIic_MasterRecv(&Iic, rxbuf, 1);

 	while (rxbusy!=0);

	cleanup_platform();
	return 0;
}




void XIic_SendHandler(void *CallBackRef, int ByteCount)
{
	(void) ByteCount;
	(void) CallBackRef;
	XIic_Stop(&Iic);
	txbusy=0;

}


void XIic_RecvHandler(void *CallBackRef, int ByteCount)
{
	(void) ByteCount;
	(void) CallBackRef;
	XIic_Stop(&Iic);
	rxbusy=0;

}
