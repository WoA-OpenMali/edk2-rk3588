/** @file
 *
 *  Copyright (c) 2023, Justin Miller <justin.miller@reactos.org>
 *
 *  SPDX-License-Identifier: BSD-2-Clause-Patent
 *
 **/
#include "AcpiTables.h"

//
// Stub Power Resource for GPU domain. This lets Windows transition the device
// between D0/D3 while firmware currently performs no actual gating.
// Replace _ON/_OFF bodies later with real clock/reset/power-domain control.
//
PowerResource (PGPU, 0, 0)
{
  Method (_ON, 0, NotSerialized)
  {
    // TODO: enable clocks/domains for GPU
    // No-op for now
  }

  Method (_OFF, 0, NotSerialized)
  {
    // TODO: disable clocks/domains for GPU
    // No-op for now
  }
}

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

  // Track and expose device power state to the OS
  Name (PSTS, Zero) // 0 => D0, 3 => D3

  // Power resources required for D0 and D3
  Name (_PR0, Package () { PGPU })
  Name (_PR3, Package () { })

  // Optional power state control hooks (no-ops for now)
  Method (_PS0, 0, NotSerialized)
  {
    Store (Zero, PSTS)
  }

  Method (_PS3, 0, NotSerialized)
  {
    Store (3, PSTS)
  }

  Method (_PSC, 0, NotSerialized)
  {
    Return (PSTS)
  }

  Name (_CRS, ResourceTemplate () {
    MEMORY32FIXED( ReadWrite, 0xfb000000, 0x200000, ) // regs (per DT: size 0x200000)
    // GPU interrupts from DTS: job=92, mmu=93, gpu=94 => GSIV 124,125,126
    Interrupt(ResourceConsumer, Level, ActiveHigh, Shared) { 124 }
    Interrupt(ResourceConsumer, Level, ActiveHigh, Shared) { 125 }
    Interrupt(ResourceConsumer, Level, ActiveHigh, Shared) { 126 }
  })
}//GPU0
