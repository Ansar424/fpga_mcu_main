/*
 * imu_sensors.h
 *
 *  Created on: Feb 26, 2015
 *      Author: kjell
 */

#ifndef IMU_SENSORS_H_
#define IMU_SENSORS_H_


// I2C Addresses
#define LSM_G_ADDR		0x6A
#define LSM_XM_ADR		0x1E
#define BAR_ADR			0x77


// Pins connnected to the I2C GPO module
#define LSM_G_CS		0x1
#define LSM_G_SDO		0x2
#define LSM_XM_CS		0x4
#define LSM_XM_SDO		0x8
#define BAR_CS			0x10
#define BAR_PS			0x20

#define GPO_SETTING		LSM_G_CS|LSM_XM_CS|BAR_PS


int imu_sensors_init(void);

#endif /* IMU_SENSORS_H_ */
