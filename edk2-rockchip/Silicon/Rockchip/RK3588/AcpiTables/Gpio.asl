/** @file
 *
 *  Copyright (c) 2022, Rockchip Electronics Co. Ltd.
 *
 *  SPDX-License-Identifier: BSD-2-Clause-Patent
 *
 **/
#include "AcpiTables.h"

//
// Description: GPIO
//
Device (GPU1)
{
  Name (_HID, "ARMH5655") //TODO: Placeholder
  Name (_CID, 0)
  Name (_UID, 0)

  Method (_STA)
  {
    Return (0xF)
  }

  Name (_CRS, ResourceTemplate () {
    MEMORY32FIXED( ReadWrite, 0xfb000000, 0x20000, ) // regs
  })
}
