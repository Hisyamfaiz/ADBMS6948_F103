/*!
 ******************************************************************************
Copyright (c) 2022 Analog Devices, Inc. All Rights Reserved.
This software is proprietary & confidential to Analog Devices, Inc. and its
licensors. By using this software you agree to the terms of the associated
Analog Devices License Agreement.
 ******************************************************************************
 * @file    Adbms6948_Applications.cpp
 * @brief   This file Application level implementations of BMS library APIs
 * @version $Revision$
 * @date    $Date$
 *
 * Developed by: ADI BMS Applications Team, Bangalore, India
 *****************************************************************************/

/*! \addtogroup Adbms6948_AppsExample
 *  @{
 */


#include "Adbms6948.h"
#include "Adbms6948/utils/timer.h"
#include "Adbms6948/lib/Adbms6948_Common.h"
#include "print_result.h"
//#include "cmsis_os2.h"
#include "spi.h"
#include "gpio.h"
#include "iwdg.h"


const uint32_t LOOP_MEASUREMENT_COUNT = 10;      /*! Loop measurment count */

extern const uint8_t knChainId;
extern int nRet;
extern float CellVoltage[16], Current;
uint8_t nNumCells = 16u;
int16_t anCellVolt[16];
int32_t nCurrent;
uint8_t	 wr_config[1][ADBMS6948_MAX_FRAME_SIZE];
uint8_t	 rd_config[1][ADBMS6948_MAX_FRAME_SIZE];
uint8_t buff_config[6];
uint16_t cmdList[1];

Adbms6948_DaisyChainCfgType oDaisyChainConfig = {
		TRUE,       /* Enable reference ON */
		TRUE,       /* Init Enable */
		1,          /* No of devices */
		&nNumCells, /* Cells per device */
		0x07FFu,    /* GPIO Pin control Selection */
		0x4E2u,     /* Over voltage threshold (val * 16 * 100uV) */
		0x271u,     /* Under voltage threshold (val * 16 * 100uV) */
		ADBMS6948_FILTER_DISABLED,
		ADBMS6948_CTH_VOLT_22_5mv,
		ADBMS6948_GPIO11_GPIO_MODE, /*GPIO11 mode*/
};

Adbms6948_RunTimeErrorCfgType oRuntimeErrConfig = {
		/* Adbms6948_E_Invalid_PEC */
		{
				(uint8_t)STD_ON,
				(uint16_t)0x14U
		},

		/* Adbms6948_E_CommandCount */
		{
				(uint8_t)STD_ON,
				(uint16_t)0x15U
		},

		/* Adbms6948_E_Platform */
		{
				(uint8_t)STD_ON,
				(uint16_t)0x16U
		}
};

Adbms6948_CfgType koConfig = {
		&oDaisyChainConfig,
		&oRuntimeErrConfig
};

struct
{
	int16_t anCellVoltage[16];        /*!< Cell Voltage Codes for all the cells: 16 bit ADC measurement */
	int32_t nCurrent;                          /*!< Current channel 1 value*/
	uint16_t nVoltageCT;                        /*!< Value of CT bits for Voltage*/
	uint16_t nCurrentCT;                        /*!< Value of CT bits for Current*/
} oBmsBuffer[LOOP_MEASUREMENT_COUNT] = {0};


// Set up Environments
extern "C" void Adbms_Init(void *argument);
extern "C" void Adbms_Run(void *argument);
extern "C" void Adbms6948_read_config(const uint8_t knChainId, int nRet);
extern "C" void Adbms6948_measure_cells(const uint8_t knChainId, int nRet);
extern "C" void Adbms6948_measure_current(const uint8_t knChainId, int nRet);
extern "C" void Adbms6948_measure_schannel(const uint8_t knChainId, int nRet);
extern "C" void Adbms6948_measure_average_cell(const uint8_t knChainId, int nRet);
extern "C" void Adbms6948_trig_cont_measurement(const uint8_t knChainId, int nRet);
extern "C" void Adbms6948_read_cont_measurement(const uint8_t knChainId, int nRet, uint8_t loop);
extern "C" void Adbms6948_measure_aux_voltage(const uint8_t knChainId, int nRet);
extern "C" void Adbms6948_measure_status_voltage(const uint8_t knChainId, int nRet);
extern "C" void Adbms6948_Discharge_Cell (uint16 Unbalanced_Cell);

void Adbms_Delay(uint32_t ms)
{
	HAL_Delay(ms);
}

uint32_t Adbms_Timer_GetTick(void)
{
	return HAL_GetTick();
}

void Adbms6948_SPI_Lock(void){}
void Adbms6948_SPI_Unlock(void){}

void Adbms6948_SPI_Read(uint8_t *pRxData, uint16_t Size)
{

}

void Adbms6948_SPI_Write(uint8_t *pTxData, uint16_t Size)
{

}

void Adbms6948_SPI_WriteRead(uint8_t *pTxData, uint8_t *pRxData, uint16_t Size)
{
	HAL_StatusTypeDef status;

	HAL_GPIO_WritePin(SPI1_CS_GPIO_Port, SPI1_CS_Pin, GPIO_PIN_RESET);
	status = HAL_SPI_TransmitReceive(&hspi1, pTxData, pRxData, Size, 1000);
	if (status != HAL_OK) {
		printf("SPI transmit ERROR.\r\n");
	}
	HAL_GPIO_WritePin(SPI1_CS_GPIO_Port, SPI1_CS_Pin, GPIO_PIN_SET);
}

void Adbms_Init(void *argument)
{
	init:
	nRet = Adbms6948_Init(&koConfig);

	if (nRet != E_OK) {
		HAL_Delay(1000);
		goto init;
	}
}

// End Setup environment

/*!
    @brief  Thread of ADBMS

    @param[in]  argument pointer

    @return None
 */
void Adbms_Run(void *argument)
{

	for (;;) {
//		Adbms6948_Read_Group(ADBMS6948_CMD_RDCFGA);
//		Adbms6948_discharge_cell(1023);
		HAL_Delay(1);
		Adbms6948_measure_cells(knChainId, nRet);
		HAL_Delay(1);
		Adbms6948_measure_current(knChainId, nRet);
		HAL_Delay(1);
		HAL_GPIO_TogglePin(LED_GPIO_Port, LED_Pin);
		HAL_Delay(50);
		HAL_IWDG_Refresh(&hiwdg);
	}

//		Adbms6948_DeInit();
}

void Adbms6948_read_config(const uint8_t knChainId, int nRet)
{
	if(nRet == 0) {
		printf("Printing Configuration Values\n");
		PrintConfig(&oDaisyChainConfig);
	} else {
		printf("Write Failed\n");
	}
}

void Adbms6948_measure_cells(const uint8_t knChainId, int nRet)
{
	Adbms6948_Cmn_SendCommandOnly(0x0028, TRUE, 0);
	Adbms_Delay(1);
	Adbms6948_TrigCADCInputs oCADCInputs{
		0,
		1,
		0,
		0,
		ADBMS6948_CELL_OW_NONE};
	if(nRet == 0) {

		nRet = Adbms6948_TrigCADC(&oCADCInputs, knChainId);
		Adbms_Delay(1); //1.1ms

		nRet = Adbms6948_ReadCellVolt(ADBMS6948_CELL_MEAS_DATA,
				ADBMS6948_CELL_GRP_SEL_ALL,
				&anCellVolt[0],
				ADBMS6948_SEND_NONE,
				knChainId);
	}

	else {
		printf("Init Failed\n");
	}
	for(uint8_t J=0; J<10; J++){
		CellVoltage[J] = (float)(anCellVolt[J] * 0.000150f + 1.5f);
	}
	Adbms6948_Cmn_SendCommandOnly(0x0029, TRUE, 0);
}


void Adbms6948_measure_current(const uint8_t knChainId, int nRet)
{

	Adbms6948_TrigI1ADCInputs oI1ADCInputs{1, 1, ADBMS6948_CURRENT_OW_NONE};

	if(nRet == 0) {
		Adbms6948_TrigI1ADC(&oI1ADCInputs, knChainId);
		Adbms_Delay(1); //1.1ms
		Adbms6948_ReadCurrent(ADBMS6948_CURRENT_MEAS_DATA,
				ADBMS6948_CURRENT_I1,
				&nCurrent,
				ADBMS6948_SEND_NONE,
				knChainId);
		Current = (float) (nCurrent)*0.000415f - 0.0326;
	}

	else {
		printf("Init Failed\n");
	}
}

void Adbms6948_measure_schannel(const uint8_t knChainId, int nRet)
{
	int16_t anSPinVolt[16];

	if(nRet == 0) {

		Adbms6948_TrigSADC(
				0,
				0,
				ADBMS6948_CELL_OW_NONE,
				knChainId);
		Adbms_Delay(10); //8.8ms
		Adbms6948_ReadCellVolt(ADBMS6948_CELL_MEAS_DATA_REDUNDANT,
				ADBMS6948_CELL_GRP_SEL_ALL,
				&anSPinVolt[0],
				ADBMS6948_SEND_NONE,
				knChainId);

		PrintCellVoltages(&anSPinVolt[0]);
	}

	else {
		printf("Init Failed\n");
	}
}

void Adbms6948_measure_average_cell(const uint8_t knChainId, int nRet)
{
	int16_t anAvgCellVolt[16];

	Adbms6948_TrigCADCInputs oCADCInputs{
		1,
		0,
		0,
		ADBMS6948_CELL_OW_NONE};
	if(nRet == 0) {

		Adbms6948_TrigCADC(&oCADCInputs, knChainId);
		Adbms_Delay(10); //8.8ms
		Adbms6948_ReadCellVolt(ADBMS6948_CELL_MEAS_DATA_AVERAGED,
				ADBMS6948_CELL_GRP_SEL_ALL,
				&anAvgCellVolt[0],
				ADBMS6948_SEND_NONE,
				knChainId);
		printf("Printing Average Cell Voltages\n");
		//        PrintCellVoltages(&anAvgCellVolt[0]);
		Adbms6948_SendSoftReset(knChainId);
	}

	else {
		printf("Init Failed\n");
	}
	for(uint8_t J=0; J<10; J++){
		CellVoltage[J] = (float)(anAvgCellVolt[J] * 0.000150f + 1.5f);
	}
}

void Adbms6948_trig_cont_measurement(const uint8_t knChainId, int nRet)
{
	/*Trigger C-ADC and I1-ADC simultaneously in Continuous mode*/
	Adbms6948_TrigIVADCInputs oTrigIVADCInputs = {
			TRUE,                   /*Adbms6948_bContMode*/
			TRUE,                   /*Adbms6948_bEnRedun*/
			FALSE,                  /*Adbms6948_bEnSSDP*/
			FALSE,                  /*Adbms6948_bRstIIRFltr*/
			ADBMS6948_CELL_OW_NONE  /*Adbms6948_eOWSel*/
	};

	if(nRet==0) {
		nRet |= Adbms6948_TrigIVADC(&oTrigIVADCInputs,  knChainId);

	} else {
		printf("Init Failed\n");
	}
}

void Adbms6948_read_cont_measurement(const uint8_t knChainId, int nRet, uint8_t loop)
{
	if(nRet==0) {
		Adbms_Delay(1); //1.1ms
		nRet = Adbms6948_ReadCellVoltCurrentAverage(
				&oBmsBuffer[loop].anCellVoltage[0],
				&oBmsBuffer[loop].nCurrent,
				TRUE,
				&oBmsBuffer[loop].nVoltageCT,
				&oBmsBuffer[loop].nCurrentCT,
				knChainId);
	} else {
		printf("Init Failed\n");
	}
}

void Adbms6948_measure_aux_voltage(const uint8_t knChainId, int nRet)
{
	int16_t anGpioVoltage[11];

	Adbms6948_TrigAuxADC(
			0,
			0,
			ADBMS6948_AUX_CH_ALL,
			knChainId);
	Adbms_Delay(20); //20ms

	Adbms6948_ReadGPIOInputVolt(
			ADBMS6948_GPIO_MEAS_DATA,
			ADBMS6948_GPIO_GRP_ALL,
			&anGpioVoltage[0],
			knChainId);
	PrintGpioVoltage(&anGpioVoltage[0]);
}

void Adbms6948_measure_status_voltage(const uint8_t knChainId, int nRet)
{
	int16_t anStatVoltage[8];

	Adbms6948_TrigAuxADC(
			0,
			0,
			ADBMS6948_AUX_CH_ALL,
			knChainId);
	Adbms_Delay(20); //20ms

	Adbms6948_ReadDevParam(
			ADBMS6948_DEV_PARAMS_ALL,
			&anStatVoltage[0],
			knChainId);
	PrintStatusVoltage(&anStatVoltage[0]);
}

void Adbms6948_Discharge_Cell (uint16 Unbalanced_Cell)
{
	Adbms6948_discharge_cell(Unbalanced_Cell);
	Adbms_Delay(20); //20ms
}


/*! @}*/
