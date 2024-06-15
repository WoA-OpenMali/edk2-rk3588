Device (GPU1)
{
  Name (_HID, "ARMH5655") // Mali G610
  Name (_CID, 0)
  Name (_UID, 0)
  Method (_STA)
  {
    Return (0xF)
  }

  Method (_CRS, 0x0, Serialized) {
    Name (RBUF, ResourceTemplate() {
      MEMORY32FIXED( ReadWrite, 0xfb000000, 0x200000 )
      Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive) { 124, 125, 126 }
    })
    Return (RBUF)
  }

  Name (_DSD, Package () {
    ToUUID("daffd814-6eba-4d8c-8a91-bc9bbf4aa301"),
    Package () {
      Package () { "compatible", Package () { "rockchip,rk3588-mali", "arm,mali-valhall-csf" } },
      Package () { "interrupt-names", Package () { "job", "mmu", "gpu" } },
      Package () { "assigned-clocks", 200000000 },
      Package () { "assigned-clock-rates", 200000000 },
    }
  })
}