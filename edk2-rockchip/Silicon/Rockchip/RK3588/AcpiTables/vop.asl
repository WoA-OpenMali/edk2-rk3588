/** @file
*  VOP2 GPU
*
*  Copyright (c) 2023, Justin Miller <justin.miller@reactos.org>
*
*  SPDX-License-Identifier: BSD-2-Clause-Patent
**/

#include "AcpiTables.h"

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
    MEMORY32FIXED( ReadWrite, 0xfdd90000, 0x4200, )
    MEMORY32FIXED( ReadWrite, 0xfdd95000, 0x1000, )
  })
}
