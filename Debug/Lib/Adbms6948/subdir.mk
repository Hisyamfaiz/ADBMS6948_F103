################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../Lib/Adbms6948/Adbms6948.cpp \
../Lib/Adbms6948/Adbms6948_Cfg.cpp \
../Lib/Adbms6948/adi_bms_platform.cpp 

OBJS += \
./Lib/Adbms6948/Adbms6948.o \
./Lib/Adbms6948/Adbms6948_Cfg.o \
./Lib/Adbms6948/adi_bms_platform.o 

CPP_DEPS += \
./Lib/Adbms6948/Adbms6948.d \
./Lib/Adbms6948/Adbms6948_Cfg.d \
./Lib/Adbms6948/adi_bms_platform.d 


# Each subdirectory must supply rules for building sources it contributes
Lib/Adbms6948/%.o: ../Lib/Adbms6948/%.cpp Lib/Adbms6948/subdir.mk
	arm-none-eabi-g++ "$<" -mcpu=cortex-m3 -std=gnu++14 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F103xG -c -I../Core/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/faiz_/STM32CubeIDE/workspace_1.7.0/ADBMS6948_F103/Lib/Adbms6948/inc" -O0 -ffunction-sections -fdata-sections -fno-exceptions -fno-rtti -fno-use-cxa-atexit -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-Lib-2f-Adbms6948

clean-Lib-2f-Adbms6948:
	-$(RM) ./Lib/Adbms6948/Adbms6948.d ./Lib/Adbms6948/Adbms6948.o ./Lib/Adbms6948/Adbms6948_Cfg.d ./Lib/Adbms6948/Adbms6948_Cfg.o ./Lib/Adbms6948/adi_bms_platform.d ./Lib/Adbms6948/adi_bms_platform.o

.PHONY: clean-Lib-2f-Adbms6948

