/*
 * imu_sensors.h
 *
 *  Created on: Feb 26, 2015
 *      Author: kjell
 */

#ifndef IMU_SENSORS_H_
#define IMU_SENSORS_H_


// I2C Addresses
#define LSM_G_ADR		0x6A
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


// LSM9DS0 Gyro commands
#define C_LSM_WHO_AM_I_G				0x0F
#define C_LSM_CTRL_REG1_G				0x20
#define C_LSM_CTRL_REG2_G				0x21
#define C_LSM_CTRL_REG3_G				0x22
#define C_LSM_CTRL_REG4_G				0x23
#define C_LSM_CTRL_REG5_G				0x24
#define C_LSM_REFERENCE_G				0x25
#define C_LSM_STATUS_REG_G				0x27
#define C_LSM_OUT_X_L_G					0x28
#define C_LSM_OUT_X_H_G					0x29
#define C_LSM_OUT_Y_L_G					0x2A
#define C_LSM_OUT_Y_H_G					0x2B
#define C_LSM_OUT_Z_L_G					0x2C
#define C_LSM_OUT_Z_H_G					0x2D
#define C_LSM_FIFO_CTRL_REG_G			0x2E
#define C_LSM_FIFO_SRC_REG_G			0x2F
#define C_LSM_INT1_CFG_G				0x30
#define C_LSM_INT1_SRC_G				0x31
#define C_LSM_INT1_TSH_XH_G				0x32
#define C_LSM_INT1_TSH_XL_G				0x33
#define C_LSM_INT1_TSH_YH_G				0x34
#define C_LSM_INT1_TSH_YL_G				0x35
#define C_LSM_INT1_TSH_ZH_G				0x36
#define C_LSM_INT1_TSH_ZL_G				0x37
#define C_LSM_INT1_DURATION_G			0x38

// LSM9DS0 Acc and Mag commands
#define C_LSM_OUT_TEMP_L_XM				0x05
#define C_LSM_OUT_TEMP_H_XM				0x06

#define C_LSM_STATUS_REG_M				0x07

#define C_LSM_OUT_X_L_M					0x08
#define C_LSM_OUT_X_H_M					0x09
#define C_LSM_OUT_Y_L_M					0x0A
#define C_LSM_OUT_Y_H_M					0x0B
#define C_LSM_OUT_Z_L_M					0x0C
#define C_LSM_OUT_Z_H_M					0x0D

#define C_LSM_WHO_AM_I_XM				0x0F

#define C_LSM_INT_CTRL_REG_M			0x12
#define C_LSM_INT_SRC_REG_M				0x13
#define C_LSM_INT_THS_L_M				0x14
#define C_LSM_INT_THS_H_M				0x15

#define C_LSM_OFFSET_X_L_M				0x16
#define C_LSM_OFFSET_X_H_M				0x17
#define C_LSM_OFFSET_Y_L_M				0x18
#define C_LSM_OFFSET_Y_H_XM				0x19
#define C_LSM_OFFSET_Z_L_XM				0x1A
#define C_LSM_OFFSET_Z_H_XM				0x1B

#define C_LSM_REFERENCE_X				0x1C
#define C_LSM_REFERENCE_Y				0x1D
#define C_LSM_REFERENCE_Z				0x1E

#define C_LSM_CTRL_REG_0_XM				0x1F
#define		CR0_BOOT					7
#define		CR0_FIFO_EN					6
#define		CR0_WTM_EN					5
#define		CR0_HP_CLICK				2
#define		CR0_HPIS1					1
#define		CR0_HPIS2					0

#define C_LSM_CTRL_REG_1_XM				0x20
#define		CR1_AODR					4
#define		CR1_BDU						3
#define		CR1_AZEN					2
#define		CR1_AYEN					1
#define		CR1_AXEN					0

#define C_LSM_CTRL_REG_2_XM				0x21
#define 	CR2_ABW						6
#define		CR2_AFS						3
#define		CR2_AST						1
#define		CR2_SIM						0

#define C_LSM_CTRL_REG_3_XM				0x22
#define		CR3_P1_BOOT					7
#define		CR3_P1_TAP					6
#define		CR3_P1_INT1					5
#define		CR3_P1_INT2					4
#define		CR3_P1_INTM					3
#define		CR3_P1_DRDYA				2
#define		CR3_P1_DRDYM				1
#define		CR3_P1_EMPTY				0

#define C_LSM_CTRL_REG_4_XM				0x23
#define		CR4_P2_TAP					7
#define		CR4_P2_INT1					6
#define		CR4_P2_INT2					5
#define		CR4_P2_INTM					4
#define		CR4_P2_DRDYA				3
#define		CR4_P2_DRDYM				2
#define		CR4_P2_OVERRUN				1
#define		CR4_P2_WTM					0

#define C_LSM_CTRL_REG_5_XM				0x24
#define		CR5_TEMP_EN					7
#define		CR5_M_RES					5
#define		CR5_M_ODR					2
#define		CR5_LIR2					1
#define		CR5_LIR1					0

#define C_LSM_CTRL_REG_6_XM				0x25
#define		CR6_MFS						5

#define C_LSM_CTRL_REG_7_XM				0x26
#define		CR7_AHPM					6
#define		CR7_AFDS					5
#define		CR7_MLP						2
#define		CR7_MD						0

#define C_LSM_STATUS_REG_A				0x27
#define		SRA_ZYXAOR					7
#define		SRA_ZAOR					6
#define		SRA_YAOR					5
#define		SRA_XAOR					4
#define		SRA_ZYXADA					3
#define		SRA_ZADA					2
#define		SRA_YADA					1
#define		SRA_XADA					0

#define C_LSM_OUT_X_L_A					0x28
#define C_LSM_OUT_X_H_A					0x29
#define C_LSM_OUT_Y_L_A					0x2A
#define C_LSM_OUT_Y_H_A					0x2B
#define C_LSM_OUT_Z_L_A					0x2C
#define C_LSM_OUT_Z_H_A					0x2D

#define C_LSM_FIFO_CTRL_REG				0x2E
#define		FCR_FM						5
#define		FCR_FTH						0

#define C_LSM_FIFO_SRC_REG				0x2F
#define		FSR_WTM						7
#define		FSR_OVRN					6
#define		FSR_EMPTY					5
#define		FSR_FSS						0

#define C_LSM_INT_GEN1_REG				0x30
#define C_LSM_INT_GEN1_SRC				0x31
#define C_LSM_INT_GEN1_THS				0x32
#define C_LSM_INT_GEN1_DURATION			0x33
#define C_LSM_INT_GEN2_REG				0x34
#define C_LSM_INT_GEN2_SRC				0x35
#define C_LSM_INT_GEN2_THS				0x36
#define C_LSM_INT_GEN2_DURATION			0x37

#define C_LSM_CLICK_SCF					0x38
#define C_LSM_CLICK_SRC					0x39
#define C_LSM_CLICK_THS					0x3A

#define C_LSM_TIME_LIMIT				0x3B
#define C_LSM_TIME_LATENCY				0x3C
#define C_LSM_TIME_WINDOW				0x3D

#define C_LSM_ACT_THS					0x3E
#define C_LSM_ACT_DUR					0x3F


// Misc defines
#define TICK2MS			(SYSTMR_INTERVAL / SYSTMR_CLK_FREQ_KHZ)


int imu_sensors_init(void);

#endif /* IMU_SENSORS_H_ */
