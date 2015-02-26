################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
LD_SRCS += \
../src/lscript.ld 

C_SRCS += \
../src/imu_sensors.c \
../src/platform.c \
../src/xk_i2c.c 

OBJS += \
./src/imu_sensors.o \
./src/platform.o \
./src/xk_i2c.o 

C_DEPS += \
./src/imu_sensors.d \
./src/platform.d \
./src/xk_i2c.d 


# Each subdirectory must supply rules for building sources it contributes
src/%.o: ../src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MicroBlaze gcc compiler'
	mb-gcc -DVERBOSE -Wall -O0 -g3 -c -fmessage-length=0 -MT"$@" -D __XMK__ -I../../xk_i2c_bsp/mcu_core_system_microblaze_0/include -mlittle-endian -mcpu=v9.4 -mxl-soft-mul -Wl,--no-relax -ffunction-sections -fdata-sections -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@:%.o=%.d)" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


