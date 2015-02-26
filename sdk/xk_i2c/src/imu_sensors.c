/*
 * imu_sensors.c
 *
 *  Created on: Feb 26, 2015
 *      Author: kjell
 */

#include "xmk.h"
#include "sys/init.h"
#include <sys/intr.h>
#include "platform.h"
#include "xiic.h"
#include <sys/decls.h>

#include "imu_sensors.h"


XIic Iic;

void* imu_sensors_th(void *arg);
int imu_sensors_i2c(void);


int imu_sensors_init(void) {

	// Grab I2C MUTEX

	// Init the I2C sub system
	imu_sensors_i2c();

	//Start the thread
	xmk_add_static_thread(imu_sensors_th, 0);

	return 0;
}

void* imu_sensors_th(void *arg) {

	DBG_PRINT ("IMU sensor thread running");

	int status;
	int i;
	u8 rxbuf[10];
	u8 txbuf[10];


	txbuf[0] = 0x0f;
	XIic_SetAddress(&Iic, XII_ADDR_TO_SEND_TYPE, LSM_XM_ADR);

	status = XIic_DynMasterSend(&Iic, txbuf, 1);

	while (XIic_IsIicBusy(&Iic));

	status = XIic_DynMasterRecv(&Iic, rxbuf, 1);

	while (XIic_IsIicBusy(&Iic));

	for (i=0; i<1000000;i++);

	print ("Juba");

	return 0;
}



int imu_sensors_i2c(void) {
	int status;

	// Init I2C controller
	status = XIic_Initialize(&Iic, XPAR_IIC_0_DEVICE_ID);
	if (status != XST_SUCCESS)  {
		print ("I2C Failure");
	}

	status = XIic_DynamicInitialize(&Iic);

	// Connect I2c to the Intc system
	//XIic_SetRecvHandler(&Iic, &Iic, &XIic_RecvHandler);
	//XIic_SetSendHandler(&Iic, &Iic, &XIic_SendHandler);

	status = register_int_handler (XPAR_INTC_0_IIC_0_VEC_ID ,
								   (XInterruptHandler)XIic_InterruptHandler,
								   (void *)&Iic);
	if (status != XST_SUCCESS)  {
		print ("Int handler connect Failure");
	}



 	XIic_SetGpOutput(&Iic, GPO_SETTING);
 	XIic_Start(&Iic);

	return 0;
}
