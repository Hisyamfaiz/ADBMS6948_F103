################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../Core/Lib/Adbms6948/lib/Adbms6948_Common.cpp \
../Core/Lib/Adbms6948/lib/Adbms6948_Config.cpp \
../Core/Lib/Adbms6948/lib/Adbms6948_Diagnostic.cpp \
../Core/Lib/Adbms6948/lib/Adbms6948_ExecCmd.cpp \
../Core/Lib/Adbms6948/lib/Adbms6948_Generic.cpp \
../Core/Lib/Adbms6948/lib/Adbms6948_Measure.cpp \
../Core/Lib/Adbms6948/lib/Adbms6948_OtherMonitor.cpp \
../Core/Lib/Adbms6948/lib/Adbms6948_Pec.cpp 

OBJS += \
./Core/Lib/Adbms6948/lib/Adbms6948_Common.o \
./Core/Lib/Adbms6948/lib/Adbms6948_Config.o \
./Core/Lib/Adbms6948/lib/Adbms6948_Diagnostic.o \
./Core/Lib/Adbms6948/lib/Adbms6948_ExecCmd.o \
./Core/Lib/Adbms6948/lib/Adbms6948_Generic.o \
./Core/Lib/Adbms6948/lib/Adbms6948_Measure.o \
./Core/Lib/Adbms6948/lib/Adbms6948_OtherMonitor.o \
./Core/Lib/Adbms6948/lib/Adbms6948_Pec.o 

CPP_DEPS += \
./Core/Lib/Adbms6948/lib/Adbms6948_Common.d \
./Core/Lib/Adbms6948/lib/Adbms6948_Config.d \
./Core/Lib/Adbms6948/lib/Adbms6948_Diagnostic.d \
./Core/Lib/Adbms6948/lib/Adbms6948_ExecCmd.d \
./Core/Lib/Adbms6948/lib/Adbms6948_Generic.d \
./Core/Lib/Adbms6948/lib/Adbms6948_Measure.d \
./Core/Lib/Adbms6948/lib/Adbms6948_OtherMonitor.d \
./Core/Lib/Adbms6948/lib/Adbms6948_Pec.d 


# Each subdirectory must supply rules for building sources it contributes
Core/Lib/Adbms6948/lib/%.o: ../Core/Lib/Adbms6948/lib/%.cpp Core/Lib/Adbms6948/lib/subdir.mk
	arm-none-eabi-g++ "$<" -mcpu=cortex-m3 -std=gnu++14 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F103xG -c -I../Core/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/faiz_/STM32CubeIDE/workspace_1.7.0/ADBMS6948_F103/Core/Lib/Adbms6948/inc" -O0 -ffunction-sections -fdata-sections -fno-exceptions -fno-rtti -fno-use-cxa-atexit -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-Core-2f-Lib-2f-Adbms6948-2f-lib

clean-Core-2f-Lib-2f-Adbms6948-2f-lib:
	-$(RM) ./Core/Lib/Adbms6948/lib/Adbms6948_Common.d ./Core/Lib/Adbms6948/lib/Adbms6948_Common.o ./Core/Lib/Adbms6948/lib/Adbms6948_Config.d ./Core/Lib/Adbms6948/lib/Adbms6948_Config.o ./Core/Lib/Adbms6948/lib/Adbms6948_Diagnostic.d ./Core/Lib/Adbms6948/lib/Adbms6948_Diagnostic.o ./Core/Lib/Adbms6948/lib/Adbms6948_ExecCmd.d ./Core/Lib/Adbms6948/lib/Adbms6948_ExecCmd.o ./Core/Lib/Adbms6948/lib/Adbms6948_Generic.d ./Core/Lib/Adbms6948/lib/Adbms6948_Generic.o ./Core/Lib/Adbms6948/lib/Adbms6948_Measure.d ./Core/Lib/Adbms6948/lib/Adbms6948_Measure.o ./Core/Lib/Adbms6948/lib/Adbms6948_OtherMonitor.d ./Core/Lib/Adbms6948/lib/Adbms6948_OtherMonitor.o ./Core/Lib/Adbms6948/lib/Adbms6948_Pec.d ./Core/Lib/Adbms6948/lib/Adbms6948_Pec.o

.PHONY: clean-Core-2f-Lib-2f-Adbms6948-2f-lib

