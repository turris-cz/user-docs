# MOX Hardware details

MOX is an unique network device. It contains usual set of
[pins](#gpio-pin-header) (I2C, GPIO, ...) but also unique [MOXTET](#moxtet)
bus. MOXTET bus allows us to extend MOX with various modules. The MOXTET bus
provides access to faster buses like PCIe or SGMII.

It is based on _Marvell Armada 3720_ dual core _armv8_ CPU clocked at 1GHz. It can contain either 512M or 1G of RAM. Storage-wise it features one micro SD slot and 8MB SPI NOR flash that contains U-Boot and rescue system.

## Network interfaces

CPU in Turris MOX has two network interfaces. First one - _eth0_ - is connected
directly to the gigabit Ethernet port on CPU module. Second one - _eth1_ - is
2,5 GBit and passed thought the MOXTET. If you have [MOX D](modules/d.md), then
your SFP is _eth1_ directly and is able to do up to 2,5 Gbit.

### Multiple switches

[MOX C](modules/c.md) and [MOX D](modules/d.md) are simple examples of which network configurations can be created
and it is probably quite obvious how do they work. Things get a little bit more complicated with [MOX E](modules/e.md).
In that case, 2,5 Gbit link goes from CPU to the first switch which exposes 8
Gigabit ports for generic use, but internally has 10 ports. One of the two
non-exposed ports is connected to your CPU and the other one is connected to
MOXTET for future use by other modules. Both of them are 2,5 Gbit.

That other module on MOXTET can easily be another MOX E that would do the same
thing. On both MOX Es you have 8x 1GBit ports, but the switches are connected to
each other via 2,5 GBit links and only one of them is connected directly to CPU
via 2,5 GBit link. That is something to consider when designing your network.
Devices that exchange a lot of data quite often between each other should be
connected to the same MOX E, while devices that hardly ever talk to each other
can easily be on different switches. You want to minimize the amount of data
that has to pass trough the switch as that could be a bottleneck.

For example, if you connect MOX D and use it as a WAN, then your traffic has to
go through the switch(es) to the CPU, get natted/filtered/routed there and go
through the switch(es) back to the final destination.

<style>
.md-typeset table:not([class]) {
    font-size: 0.55rem;
    vertical-align: center;
}
.md-typeset table:not([class]) th {
    min-width: 2rem;
    padding: 0.4rem 0.6rem;
}
</style>

## GPIO Pin Header

!!! warning
    Turris MOX uses **1.8V** logic! Connecting to it to common devices with
    higher voltage logic will most likelly destroy your MOX.

You can find 34-pin GPIO connector On [MOX A](modules/a.md). Signals are as
follows:

| Description                 | Signal     | Pin   | Pin   | Signal       | Description                 |
| :--------------------       | :--------: | :---: | :---: | :----------: | :-------------------------- |
| System Ground               | GND        |  1    |  2    | +1V8         | GPIO Power Supply           |
| Boot Configuration Option   | SetBoot.B0 |  3    |  4    | SetBoot.B1   | Boot Configuration Option   |
| System Ground               | GND        |  5    |  6    | +1V8         | GPIO Power Supply           |
| JTAG (GPIO1_21)             | JTAG.TDI   |  7    |  8    | JTAG.TDO     | JTAG (GPIO1_20)             |
| JTAG (GPIO1_23)             | JTAG.TMS   |  9    | 10    | JTAG.CLK     | JTAG (GPIO1_22)             |
| System and System Bus Reset | nRES       | 11    | 12    | JTAG.RSTn    | JTAG (GPIO1_24)             |
| UART1 (GPIO1_26)            | UART1.TXD  | 13    | 14    | UART1.RXD    | UART1 (GPIO1_25)            |
| System Ground               | GND        | 15    | 16    | ONE_WIRE     | One Wire (GPIO1_4)          |
| GPIO 2 (PWM_3, LED_3)       | GPIO1_14   | 17    | 18    | GPIO1_13     | GPIO 2 (PWM_2, LED_2)       |
| GPIO 2 (PWM_1, LED_1)       | GPIO1_12   | 19    | 20    | +1V8         | GPIO 2 (PWM_0, LED_0)       |
| System Ground               | GND        | 21    | 22    | +1V8         | GPIO Power Supply           |
| I2C 2 Bus (GPIO1_3)         | I2C2.SDA   | 23    | 24    | I2C2.SCL     | I2C 2 Bus (GPIO1_2)         |
| System Ground               | GND        | 25    | 26    | +1V8         | GPIO Power Supply           |
| U-Boot SPI NOR Flash Access | SPI.nSS0   | 27    | 28    | SPI.MISO     | U-Boot SPI NOR Flash Access |
| U-Boot SPI NOR Flash Access | SPI.SCK    | 29    | 30    | SPI.MOSI     | U-Boot SPI NOR Flash Access |
| System and System Bus Reset | nRES       | 31    | 32    | GND          | System Ground               |
| System Ground               | GND        | 33    | 34    | +12V0        | System Power Supply         |

## PoE Pin header

If you have [PoE add-on](addons.md#poe) attached, you have full GPIO connector
inaccessible, but you can use small one on PoE add-on.

| Description                 | Signal     | Pin   | Pin   | Signal       | Description               |
| :--------------------       | :--------: | :---: | :---: | :----------: | :------------------       |
| System Ground               | GND        | 1     | 2     | +1V8         | GPIO Power Supply         |
| Boot Configuration Option   | SetBoot.B0 | 3     | 4     | SetBoot.B1   | Boot Configuration Option |
| System and System Bus Reset | nRES       | 5     | 6     | JTAG.RSTn    | JTAG (GPIO1_24)           |
| UART1 (GPIO1_26)            | UART1.TXD  | 7     | 8     | UART1.RXD    | UART1 (GPIO1_25)          |

## MOXTET

The Moxtet system bus is used to connect single boards of the MOX modular
router. Bus connections can be used freely, but when using non-original MOX
modules, make sure they maintain signal compatibility and do not damage other
connected boards.

The Moxtet system uses a standard PCIe connector, but with different signals.

| Description                    | Signal     | Pin   | Pin   | Signal       | Description                     |
| :----------------------------- | :--------: | :---: | :---: | :----------: | :------------------------------ |
| System Ground                  | GND        |  A1   |  B1   | GND          | System Ground                   |
| System Power Supply            | +12V0      |  A2   |  B2   | +12V0        | System Power Supply             |
| System Power Supply            | +12V0      |  A3   |  B3   | +12V0        | System Power Supply             |
| System Bus Configuration (SPI) | MISO       |  A4   |  B4   | +5V0_PG      | Power Supplies Start-Up Control |
| System Bus Configuration (SPI) | MOSI       |  A5   |  B5   | +3V3_PG      | Power Supplies Start-Up Control |
| System Bus Configuration (SPI) | SCK        |  A6   |  B6   | +1V8_PG      | Power Supplies Start-Up Control |
| System Bus Configuration (SPI) | SSn        |  A7   |  B7   | +1V5_PG      | Power Supplies Start-Up Control |
| System and System Bus Reset    | SYSRSTn    |  A8   |  B8   | +1V35_PG     | Power Supplies Start-Up Control |
| System Bus Device Reset        | DEVRSTn    |  A9   |  B9   | +1V2_PG      | Power Supplies Start-Up Control |
| System Bus Interrupt           | INTn       |  A10  |  B10  | +1V15_PG     | Power Supplies Start-Up Control |
| System Bus Power Supply        | +1V8       |  A11  |  B11  | GND          | System Ground                   |
| System Ground                  | GND        |  A12  |  B12  | GND          | System Ground                   |
| SerDes Support Signals Reserve | SD_RSVD.A13|  A13  |  B13  | SD.RX._P     | SerDes Reserve (for future use) |
| SerDes Support Signals Reserve | SD_RSVD.A14|  A14  |  B14  | SD.RX._N     | SerDes Reserve (for future use) |
| SerDes Support Signals Reserve | SD_RSVD.A15|  A15  |  B15  | SD.TX._P     | SerDes Reserve (for future use) |
| SerDes Support Signals Reserve | SD_RSVD.A16|  A16  |  B16  | SD.TX._n     | SerDes Reserve (for future use) |
| System Ground                  | GND        |  A17  |  B17   | GND          | System Ground                   |
| Serial Management Interface Bus| SMI.MDC    |  A18  |  B18   | SGMII.TX._N  | SGMII (up to 2.5 Gbps)          |
| Serial Management Interface Bus| SMI.MDIO   |  A19  |  B19   | SGMII.TX._P  | SGMII (up to 2.5 Gbps)          |
| Not Used                       | NU         |  A20  |  B20   | SGMII.RX._N  | SGMII (up to 2.5 Gbps)          |
| Not Used                       | NU         |  A21  |  B21   | SGMII.RX._P  | SGMII (up to 2.5 Gbps)          |
| System Ground                  | GND        |  A22  |  B22   | GND          | System Ground                   |
| System and System Bus I2C      | I2C.SCL    |  A23  |  B23   | USB2._P      | SUSB 2.0 (for miniPCIe)         |
| System and System Bus I2C      | I2C.SDA    |  A24  |  B24   | USB2._N      | SUSB 2.0 (for miniPCIe)         |
| Not Used                       | NU         |  A25  |  B25   | PCIE.RX._N   | PCIe 2.0                        |
| Not Used                       | NU         |  A26  |  B26   | PCIE.RX._P   | PCIe 2.0                        |
| System Ground                  | GND        |  A27  |  B27   | GND          | System Ground                   |
| PCIe 2.0 Reset                 | PCIE_RESETn|  A28  |  B28   | PCIE.TX._N   | PCIe 2.0                        |
| PCIe 2.0 Clock Request         | PCIE_CLKREQ|  A29  |  B29   | PCIE.TX._P   | PCIe 2.0                        |
| Not Used                       | NU         |  A30  |  B30   | PCIE_CLK._P  | PCIe 2.0 Reference Clock        |
| Not Used                       | NU         |  A31  |  B31   | PCIE_CLK._N  | PCIe 2.0 Reference Clock        |
| System Ground                  | GND        |  A32  |  B32   | GND          | System Ground                   |

## HW Schematics

For all MOX modules we also provide schematics

 * [MOX A](Turris_Mox_A.pdf)
 * [MOX B](Turris_Mox_B.pdf)
 * [MOX C](Turris_Mox_C.pdf)
 * [MOX D](Turris_Mox_D.pdf)
 * [MOX E](Turris_Mox_E.pdf)
 * [MOX F](Turris_Mox_F.pdf)
 * [MOX G](Turris_Mox_G.pdf)
