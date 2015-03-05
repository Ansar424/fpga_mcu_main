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


void* imu_sensors_th(void *arg);
int imu_sensors_i2c(void);
int imu_lsm_init(void);
int imu_sensor_wait(u32 timeout);

static void imu_tx_handler(void *CallBackRef, int ByteCount);
static void imu_rx_handler(void *CallBackRef, int ByteCount);
static void imu_status_handler(void *CallBackRef, int ByteCount);

int imu_sensors_init(void) {

	// Grab I2C MUTEX

	// Init the I2C sub system
	imu_sensors_i2c();

	//Start the thread
	xmk_add_static_thread(imu_sensors_th, 0);

	return 0;
}

void* imu_sensors_th(void *arg) {
	u8 rxbuf[10];
	u8 txbuf[10];
	s16 temperature;


	DBG_PRINT ("IMU sensor thread running\n\r");

	// Init the sensor chip
	imu_lsm_init();


	while (1==1) {
		// Read temp sensor
		XIic_SetAddress(&Iic, XII_ADDR_TO_SEND_TYPE, LSM_XM_ADR);
		txbuf[0] = C_LSM_OUT_TEMP_L_XM;
		imu_sensor_wait(0);
		XIic_DynMasterSend(&Iic, txbuf, 1);
		imu_sensor_wait(0);
		XIic_DynMasterRecv(&Iic, rxbuf, 2);
		imu_sensor_wait(0);

		temperature = rxbuf[1]<<8 | rxbuf[0];

		xil_printf ("Temp:  %d \n\r", temperature);

		sys_sleep (1000);


	}

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

	status = XIic_SetGpOutput(&Iic, GPO_SETTING);

	enable_interrupt(XPAR_INTC_0_IIC_0_VEC_ID);



	return XST_SUCCESS;
}


int imu_lsm_init(void) {
	int Status;
	u8 rxbuf[2];
	u8 txbuf[2];

	txbuf[0] = C_LSM_WHO_AM_I_XM;
	rxbuf[0] = 0;
	XIic_SetAddress(&Iic, XII_ADDR_TO_SEND_TYPE, LSM_XM_ADR);

	imu_sensor_wait(0);

	//XIic_DynSend(Iic.BaseAddress, Iic.AddrOfSlave, &txbuf[0], 1, XIIC_STOP);
	//XIic_DynRecv(Iic.BaseAddress, Iic.AddrOfSlave, &rxbuf[0], 1);


	imu_sensor_wait(0);
	XIic_DynMasterSend(&Iic, &txbuf[0], 1);
	imu_sensor_wait(0);
	XIic_DynMasterRecv(&Iic, &rxbuf[0], 1);
	imu_sensor_wait(0);

	if (rxbuf[0] != 0x49) {
		DBG_PRINT ("LSM9DS0 chip does not respond to WhoAmI message on XM interface\n\r");
		//return 0;
	}

	XIic_SetAddress(&Iic, XII_ADDR_TO_SEND_TYPE, LSM_G_ADR);

	XIic_DynMasterSend(&Iic, &txbuf[0], 1);
	imu_sensor_wait(0);
	XIic_DynMasterRecv(&Iic, &rxbuf[0], 1);
	imu_sensor_wait(0);

	if (rxbuf[0] != 0xD4) {
		DBG_PRINT ("LSM9DS0 chip does not repsond to WhoAmI message on G interface\n\r");
		//return 0;
	}


	// Setup magnetic and temp sensor
	XIic_SetAddress(&Iic, XII_ADDR_TO_SEND_TYPE, LSM_XM_ADR);

	// Program CTRL_REG1_XM
	txbuf[0] = C_LSM_CTRL_REG_1_XM;
	txbuf[1] =	0x6<<CR1_AODR;				// Acc data rate
	XIic_DynMasterSend(&Iic, txbuf, 2);
	imu_sensor_wait(0);

	// Program CTRL_REG2_XM
	txbuf[0] = C_LSM_CTRL_REG_2_XM;
	txbuf[1] =	0x3<<CR2_AFS;				// Acc full scale
	XIic_DynMasterSend(&Iic, txbuf, 2);
	imu_sensor_wait(0);

	// Program CTRL_REG5_XM
	txbuf[0] = C_LSM_CTRL_REG_5_XM;
	txbuf[1] =	1<<CR5_TEMP_EN |			// Enable temp reading
				5<<CR5_M_ODR;					// Mag Output data rate
	XIic_DynMasterSend(&Iic, txbuf, 2);
	imu_sensor_wait(0);


	DBG_PRINT ("LSM9DS0 init is complete\n\r");

	return XST_SUCCESS;
}

int imu_sensor_wait(u32 timeout) {
	u32 time_start;
	u32 time_elapsed;

	time_start = xget_clock_ticks();

	while (XIic_IsIicBusy(&Iic)) {
		yield();

		if (timeout > 0) {
			time_elapsed = (xget_clock_ticks()-time_start)*TICK2MS;
			if (time_elapsed > timeout) {
				return XST_IIC_BUS_BUSY;
			}
		}

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


