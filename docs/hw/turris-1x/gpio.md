---
board: 1.x
competency: expert
---
# GPIO (general purpose input-output ports)

GPIO ports are ports that can be controlled by a user program. Their location
and numbering on the board can be found [here](turris_pinout-v1_2.pdf).

Maximum electrical characteristics of GPIO ports:

|         |      |
|---------|------|
| Voltage | 3.3V |
| Current | ±1mA |

{!
  include-markdown "../omnia/gpio.md"
  start="<!--gpio1-start-->"
  end="<!--gpio1-end-->"
!}

The first step to use this library is to import and initialize it. The library
is initialized in the _BCM_ mode where port numbers correspond to their
designations on the chip. This is the same as on the [pinout picture](turris_pinout-v1_2.pdf).

{!
  include-markdown "../omnia/gpio.md"
  start="<!--gpio2-start-->"
  end="<!--gpio2-end-->"
!}
