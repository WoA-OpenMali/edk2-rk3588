/** @file
 *
 *  Copyright (c) 2023, Justin Miller <justin.miller@reactos.org>
 *
 *  SPDX-License-Identifier: BSD-2-Clause-Patent
 *
 **/
#include "AcpiTables.h"

//
// Description: Mali G610 GPU
//
Device (GPU0)
{
  Name (_HID, "ARMH5655")
  Name (_CID, 0)
  Name (_UID, 0)

  Method (_STA)
  {
    Return (0xF)
  }

  Name (_CRS, ResourceTemplate () {
    MEMORY32FIXED( ReadWrite, 0xfb000000, 0x20000, ) // regs
  })
}//GPU0
