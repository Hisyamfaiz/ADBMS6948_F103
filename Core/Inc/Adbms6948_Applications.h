/*!
******************************************************************************
Copyright (c) 2022 Analog Devices, Inc. All Rights Reserved.
This software is proprietary & confidential to Analog Devices, Inc. and its
licensors. By using this software you agree to the terms of the associated
Analog Devices License Agreement.
******************************************************************************
 * @file    Adbms6948_Applications.h
 * @brief   This file Application level implementations of BMS library APIs
 * @version $Revision$
 * @date    $Date$
 *
 * Developed by: ADI BMS Applications Team, Bangalore, India
*****************************************************************************/

/*! \addtogroup Adbms6948_AppsExample
*  @{
*/

#ifndef __ADBMS6948_APPLICATIONS_H
#define __ADBMS6948_APPLICATIONS_H

#include "Adbms6948.h"

// Set up Environments
void Adbms_Init(void *argument);
void Adbms_Run(void *argument);

void Adbms6948_read_config(const uint8_t knChainId, int nRet);
void Adbms6948_measure_cells(const uint8_t knChainId, int nRet);
void Adbms6948_measure_current(const uint8_t knChainId, int nRet);
void Adbms6948_measure_schannel(const uint8_t knChainId, int nRet);
void Adbms6948_measure_average_cell(const uint8_t knChainId, int nRet);
void Adbms6948_trig_cont_measurement(const uint8_t knChainId, int nRet);
void Adbms6948_read_cont_measurement(const uint8_t knChainId, int nRet, uint8_t loop);
void Adbms6948_measure_aux_voltage(const uint8_t knChainId, int nRet);
void Adbms6948_measure_status_voltage(const uint8_t knChainId, int nRet);
void Adbms6948_read_config(const uint8_t knChainId, int nRet);
void Adbms6948_Discharge_Cell (uint16 Unbalanced_Cell);

#endif /* __ADBMS6948_APPLICATIONS_H */

/*! @}*/




