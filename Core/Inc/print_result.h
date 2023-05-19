/*!
******************************************************************************
Copyright (c) 2022 Analog Devices, Inc. All Rights Reserved.
This software is proprietary & confidential to Analog Devices, Inc. and its
licensors. By using this software you agree to the terms of the associated
Analog Devices License Agreement.
******************************************************************************
 * @file    print_result.h
 * @brief   This file has serial print exported functions
 * @version $Revision$
 * @date    $Date$
 *
 * Developed by: ADI BMS Applications Team, Bangalore, India
*****************************************************************************/

/*! @addtogroup Print_Results
*  @{
*/

#ifndef __PRINT_RESULT_H
#define __PRINT_RESULT_H

#include "Adbms6948.h"

void PrintMenu();
void PrintConfig(Adbms6948_DaisyChainCfgType *poConfig);
void PrintCellVoltages(int16_t *paCellVoltages);
void PrintCurrent(int32_t *raw_current);
void PrintAverageCurrent(int32_t *raw_current);
void PrintGpioVoltage(int16_t *paVoltages);
void PrintStatusVoltage(int16_t *praw_voltages);

#endif
/*! @}*/