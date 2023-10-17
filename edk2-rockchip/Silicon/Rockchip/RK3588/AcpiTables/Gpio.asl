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
  Name (_HID, "RKCP5650") //TODO: Placeholder
  Name (_CID, 0)
  Name (_UID, 0)

  Method (_STA)
  {
    Return (0xF)
  }

  Name (_CRS, ResourceTemplate () {
    MEMORY32FIXED( ReadWrite, 0xfdd90000, 0x4200, ) // regs
    MEMORY32FIXED( ReadWrite, 0xfdd95000, 0x1000, ) //gamma lut /
    MEMORY32FIXED( ReadWrite, 0xfde80000, 0x2000, ) // hdmi 0/
    MEMORY32FIXED( ReadWrite, 0xfdea0000, 0x2000, ) // hdmi 1/
    MEMORY32FIXED( ReadWrite, 0xfdec0000, 0x1000, ) // eDP/
  })
}
