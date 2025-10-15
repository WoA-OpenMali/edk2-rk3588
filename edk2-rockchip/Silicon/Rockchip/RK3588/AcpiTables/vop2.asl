/** @file
 *
 *  Copyright (c) 2023, Justin Miller <justin.miller@reactos.org>
 *
 *  SPDX-License-Identifier: BSD-2-Clause-Patent
 *
 **/
#include "AcpiTables.h"

//
// Description: VOP2
//
Device (VOP2)
{
  Name (_HID, "RKCP5650")
  Name (_CID, 0)
  Name (_UID, 0)

  Method (_STA)
  {
    Return (0xF)
  }

  Name (_CRS, ResourceTemplate () {
    MEMORY32FIXED( ReadWrite, 0xfdd90000, 0x4200, ) // regs
    MEMORY32FIXED( ReadWrite, 0xfdd95000, 0x1000, ) // gamma lut
    MEMORY32FIXED( ReadWrite, 0xfde80000, 0x20000, ) // hdmi 0 (per DT: size 0x20000)
    MEMORY32FIXED( ReadWrite, 0xfdea0000, 0x20000, ) // hdmi 1 (per DT: size 0x20000)
    MEMORY32FIXED( ReadWrite, 0xfdec0000, 0x1000, ) // eDP
    MEMORY32FIXED( ReadWrite, 0xfded0000, 0x1000, ) // eDP1
    // VOP2 interrupt: DTS has GIC_SPI 156 (level high) => GSIV 32 + 156 = 188
    Interrupt(ResourceConsumer, Level, ActiveHigh, Shared) { 188 }
    // HDMI0 interrupts: avp=169, cec=170, earc=171, main=172, hpd=360
    Interrupt(ResourceConsumer, Level, ActiveHigh, Shared) { 201 }
    Interrupt(ResourceConsumer, Level, ActiveHigh, Shared) { 202 }
    Interrupt(ResourceConsumer, Level, ActiveHigh, Shared) { 203 }
    Interrupt(ResourceConsumer, Level, ActiveHigh, Shared) { 204 }
    Interrupt(ResourceConsumer, Level, ActiveHigh, Shared) { 392 }
    // HDMI1 interrupts: avp=173, cec=174, earc=175, main=176, hpd=361
    Interrupt(ResourceConsumer, Level, ActiveHigh, Shared) { 205 }
    Interrupt(ResourceConsumer, Level, ActiveHigh, Shared) { 206 }
    Interrupt(ResourceConsumer, Level, ActiveHigh, Shared) { 207 }
    Interrupt(ResourceConsumer, Level, ActiveHigh, Shared) { 208 }
    Interrupt(ResourceConsumer, Level, ActiveHigh, Shared) { 393 }
    // eDP0/1 interrupts: edp0=163, edp1=164
    Interrupt(ResourceConsumer, Level, ActiveHigh, Shared) { 195 }
    Interrupt(ResourceConsumer, Level, ActiveHigh, Shared) { 196 }
  })
}//VOP2
