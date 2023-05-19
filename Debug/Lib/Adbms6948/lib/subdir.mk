################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../Lib/Adbms6948/lib/Adbms6948_Common.cpp \
../Lib/Adbms6948/lib/Adbms6948_Config.cpp \
../Lib/Adbms6948/lib/Adbms6948_Diagnostic.cpp \
../Lib/Adbms6948/lib/Adbms6948_ExecCmd.cpp \
../Lib/Adbms6948/lib/Adbms6948_Generic.cpp \
../Lib/Adbms6948/lib/Adbms6948_Measure.cpp \
../Lib/Adbms6948/lib/Adbms6948_OtherMonitor.cpp \
../Lib/Adbms6948/lib/Adbms6948_Pec.cpp 

OBJS += \
./Lib/Adbms6948/lib/Adbms6948_Common.o \
./Lib/Adbms6948/lib/Adbms6948_Config.o \
./Lib/Adbms6948/lib/Adbms6948_Diagnostic.o \
./Lib/Adbms6948/lib/Adbms6948_ExecCmd.o \
./Lib/Adbms6948/lib/Adbms6948_Generic.o \
./Lib/Adbms6948/lib/Adbms6948_Measure.o \
./Lib/Adbms6948/lib/Adbms6948_OtherMonitor.o \
./Lib/Adbms6948/lib/Adbms6948_Pec.o 

CPP_DEPS += \
./Lib/Adbms6948/lib/Adbms6948_Common.d \
./Lib/Adbms6948/lib/Adbms6948_Config.d \
./Lib/Adbms6948/lib/Adbms6948_Diagnostic.d \
./Lib/Adbms6948/lib/Adbms6948_ExecCmd.d \
./Lib/Adbms6948/lib/Adbms6948_Generic.d \
./Lib/Adbms6948/lib/Adbms6948_Measure.d \
./Lib/Adbms6948/lib/Adbms6948_OtherMonitor.d \
./Lib/Adbms6948/lib/Adbms6948_Pec.d 


# Each subdirectory must supply rules for building sources it contributes
Lib/Adbms6948/lib/%.o: ../Lib/Adbms6948/lib/%.cpp Lib/Adbms6948/lib/subdir.mk
	arm-none-eabi-g++ "$<" -mcpu=cortex-m3 -std=gnu++14 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32F103xG -c -I../Core/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc -I../Drivers/STM32F1xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32F1xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/faiz_/STM32CubeIDE/workspace_1.7.0/ADBMS6948_F103/Lib/Adbms6948/inc" -O0 -ffunction-sections -fdata-sections -fno-exceptions -fno-rtti -fno-use-cxa-atexit -Wall -fstack-usage -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-Lib-2f-Adbms6948-2f-lib

clean-Lib-2f-Adbms6948-2f-lib:
	-$(RM) ./Lib/Adbms6948/lib/Adbms6948_Common.d ./Lib/Adbms6948/lib/Adbms6948_Common.o ./Lib/Adbms6948/lib/Adbms6948_Config.d ./Lib/Adbms6948/lib/Adbms6948_Config.o ./Lib/Adbms6948/lib/Adbms6948_Diagnostic.d ./Lib/Adbms6948/lib/Adbms6948_Diagnostic.o ./Lib/Adbms6948/lib/Adbms6948_ExecCmd.d ./Lib/Adbms6948/lib/Adbms6948_ExecCmd.o ./Lib/Adbms6948/lib/Adbms6948_Generic.d ./Lib/Adbms6948/lib/Adbms6948_Generic.o ./Lib/Adbms6948/lib/Adbms6948_Measure.d ./Lib/Adbms6948/lib/Adbms6948_Measure.o ./Lib/Adbms6948/lib/Adbms6948_OtherMonitor.d ./Lib/Adbms6948/lib/Adbms6948_OtherMonitor.o ./Lib/Adbms6948/lib/Adbms6948_Pec.d ./Lib/Adbms6948/lib/Adbms6948_Pec.o

.PHONY: clean-Lib-2f-Adbms6948-2f-lib

