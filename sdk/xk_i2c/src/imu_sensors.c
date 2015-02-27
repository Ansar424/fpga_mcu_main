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
#include "xiic_l.h"
#include <sys/decls.h>

#include "imu_sensors.h"


XIic Iic;

void* imu_sensors_th(void *arg);
int imu_sensors_i2c(void);
int imu_sensor_wait(int timeout);


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

	imu_sensor_wait(0);
	XIic_DynSend(Iic.BaseAddress, Iic.AddrOfSlave, txbuf, 1, XIIC_STOP);
	XIic_DynRecv(Iic.BaseAddress, Iic.AddrOfSlave, rxbuf, 1);

	if (rxbuf[0] != 0x49) {
		print ("LSM9DS0 chip does not repsond to WhoAmI message on XM interface\n\r");
	}

	rxbuf[0] = 0;

	XIic_SetAddress(&Iic, XII_ADDR_TO_SEND_TYPE, LSM_G_ADR);

	imu_sensor_wait(0);
	XIic_DynSend(Iic.BaseAddress, Iic.AddrOfSlave, txbuf, 1, XIIC_STOP);
	XIic_DynRecv(Iic.BaseAddress, Iic.AddrOfSlave, rxbuf, 1);

	if (rxbuf[0] != 0xD4) {
		print ("LSM9DS0 chip does not repsond to WhoAmI message on G interface\n\r");
	}

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


	status = register_int_handler (XPAR_INTC_0_IIC_0_VEC_ID ,
								   (XInterruptHandler)XIic_InterruptHandler,
								   (void *)&Iic);
	if (status != XST_SUCCESS)  {
		print ("Int handler connect Failure");
	}

	enable_interrupt(XPAR_INTC_0_IIC_0_VEC_ID);

 	XIic_SetGpOutput(&Iic, GPO_SETTING);

	return 0;
}

int imu_sensor_wait(int timeout) {
	int time_start;
	int time_stop;

	time_start = xget_clock_ticks();

	sleep (1000);

	time_stop = xget_clock_ticks();


	while (XIic_IsIicBusy(&Iic));
}
