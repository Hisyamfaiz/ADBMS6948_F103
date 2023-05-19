################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../Lib/Adbms6948/utils/timer.cpp 

OBJS += \
./Lib/Adbms6948/utils/timer.o 

CPP_DEPS += \
./Lib/Adbms6948/utils/timer.d 


# Each subdirectory must supply rules for building sources it contributes
Lib/Adbms6948/utils/%.o: ../Lib/Adbms6948/utils/%.cpp Lib/Adbms6948/utils/subdir.mk
	arm-none-eabi-g++ "$<" -mcpu=cortex-m3 -std=gnu++14 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F103xG -c -I../Core/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/faiz_/STM32CubeIDE/workspace_1.7.0/ADBMS6948_F103/Lib/Adbms6948/inc" -O0 -ffunction-sections -fdata-sections -fno-exceptions -fno-rtti -fno-use-cxa-atexit -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-Lib-2f-Adbms6948-2f-utils

clean-Lib-2f-Adbms6948-2f-utils:
	-$(RM) ./Lib/Adbms6948/utils/timer.d ./Lib/Adbms6948/utils/timer.o

.PHONY: clean-Lib-2f-Adbms6948-2f-utils

