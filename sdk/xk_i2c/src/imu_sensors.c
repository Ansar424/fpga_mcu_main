/*
 * imu_sensors.c
 *
 *  Created on: Feb 26, 2015
 *      Author: kjell
 */

#include "xmk.h"
#include "os_config.h"
#include "sys/process.h"
#include "sys/init.h"
#include "sys/timer.h"
#include <sys/intr.h>
#include "platform.h"
#include "xiic.h"
#include "xiic_l.h"
#include <sys/decls.h>


#include "imu_sensors.h"


XIic Iic;
u8 rxbuf[10];
u8 txbuf[10];

void* imu_sensors_th(void *arg);
int imu_sensors_i2c(void);
int imu_lsm_init(void);
int imu_sensor_wait(int timeout);

static void imu_tx_handler(void *CallBackRef, int ByteCount);
static void imu_rx_handler(void *CallBackRef, int ByteCount);
static void imu_status_handler(void *CallBackRef, int ByteCount);

int imu_sensors_init(void) {

	// Grab I2C MUTEX

	// Init the I2C sub system
	imu_sensors_i2c();

	// Init the sensor chip
	imu_lsm_init();

	//Start the thread
	xmk_add_static_thread(imu_sensors_th, 0);

	return 0;
}

void* imu_sensors_th(void *arg) {

	DBG_PRINT ("IMU sensor thread running\n\r");

	return 0;
}



int imu_sensors_i2c(void) {
	int status;

	// Init I2C controller
	status = XIic_Initialize(&Iic, XPAR_IIC_0_DEVICE_ID);
	if (status != XST_SUCCESS)  {
		DBG_PRINT ("I2C Failure");
		return status;
	}

	status = XIic_DynamicInitialize(&Iic);

	XIic_SetRecvHandler(&Iic, &Iic, &imu_rx_handler);
	XIic_SetSendHandler(&Iic, &Iic, &imu_tx_handler);
	XIic_SetStatusHandler(&Iic, &Iic, &imu_status_handler);

	status = register_int_handler (XPAR_INTC_0_IIC_0_VEC_ID ,
								   (XInterruptHandler)XIic_InterruptHandler,
								   (void *)&Iic);
	if (status != XST_SUCCESS)  {
		DBG_PRINT ("Int handler connect Failure");
		return status;
	}

	enable_interrupt(XPAR_INTC_0_IIC_0_VEC_ID);

 	XIic_SetGpOutput(&Iic, GPO_SETTING);

	return XST_SUCCESS;
}


int imu_lsm_init(void) {

	txbuf[0] = C_LSM_WHO_AM_I_XM;
	XIic_SetAddress(&Iic, XII_ADDR_TO_SEND_TYPE, LSM_XM_ADR);

	XIic_DynMasterSend(&Iic, txbuf, 1);
	XIic_DynMasterRecv(&Iic, &rxbuf[0], 1);

	XIic_SetAddress(&Iic, XII_ADDR_TO_SEND_TYPE, LSM_G_ADR);

	XIic_DynMasterSend(&Iic, txbuf, 1);
	XIic_DynMasterRecv(&Iic, &rxbuf[1], 1);
	imu_sensor_wait(0);

	if (rxbuf[0] != 0x49) {
		DBG_PRINT ("LSM9DS0 chip does not respond to WhoAmI message on XM interface\n\r");
		return 0;
	}

	if (rxbuf[1] != 0xD4) {
		DBG_PRINT ("LSM9DS0 chip does not repsond to WhoAmI message on G interface\n\r");
		return 0;
	}

	return XST_SUCCESS;
}

int imu_sensor_wait(int timeout) {
	int time_start;

	time_start = xget_clock_ticks();

	while (XIic_IsIicBusy(&Iic)) {
		if (timeout > 0) {
			if (((xget_clock_ticks()-time_start)*TICK2MS) > timeout) {
				return XST_IIC_BUS_BUSY;
			}
		}
		yield();
	}

	return XST_SUCCESS;
}


// Some empty handler functions
// The Dynamic IIC system will take over anyway
static void imu_tx_handler(void *CallBackRef, int ByteCount)
{
	(void) ByteCount;
	(void) CallBackRef;

}

static void imu_rx_handler(void *CallBackRef, int ByteCount)
{
	(void) ByteCount;
	(void) CallBackRef;

}

static void imu_status_handler(void *CallBackRef, int ByteCount)
{
	(void) ByteCount;
	(void) CallBackRef;

}


