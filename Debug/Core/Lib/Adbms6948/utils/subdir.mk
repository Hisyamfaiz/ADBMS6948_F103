################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../Core/Lib/Adbms6948/utils/timer.cpp 

OBJS += \
./Core/Lib/Adbms6948/utils/timer.o 

CPP_DEPS += \
./Core/Lib/Adbms6948/utils/timer.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Lib/Adbms6948/utils/%.o: ../Core/Lib/Adbms6948/utils/%.cpp Core/Lib/Adbms6948/utils/subdir.mk
	arm-none-eabi-g++ "$<" -mcpu=cortex-m3 -std=gnu++14 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F103xG -c -I../Core/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/faiz_/STM32CubeIDE/workspace_1.7.0/ADBMS6948_F103/Core/Lib/Adbms6948/inc" -O0 -ffunction-sections -fdata-sections -fno-exceptions -fno-rtti -fno-use-cxa-atexit -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-Core-2f-Lib-2f-Adbms6948-2f-utils

clean-Core-2f-Lib-2f-Adbms6948-2f-utils:
	-$(RM) ./Core/Lib/Adbms6948/utils/timer.d ./Core/Lib/Adbms6948/utils/timer.o

.PHONY: clean-Core-2f-Lib-2f-Adbms6948-2f-utils

