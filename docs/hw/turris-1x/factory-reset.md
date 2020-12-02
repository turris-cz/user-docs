---
board: 1.x
---
# Factory reset on Turris 1.0 and 1.1

Turris 1.0 and 1.1 routers don't support rescue modes which you can see
on MOX and Omnia routers. But there is a possibility to perform a factory
reset and bring the router to the same software state as it was after
manufacturing.

It should resolve all problems related to software and configuration,
it also allows to set a new password. Generally, it is the last resort
if less radical methods fail.

!!! warning
    The factory reset removes all your configuration and other data!

!!! notice
    If the factory reset fails it probably means that there is
    a hardware problem. In such case you can contact our
    [technical support](../../basics/support.md).

## Performing a factory reset

Your Turris has a red button at the back. Press and hold it for at least
six seconds (until the power LED shines continuously). The progress of
the reset is indicated by the LEDs. If they shine green the reset can
be interrupted by unplugging the power plug. But if they shine red the reset
is in progress and the router should not be unplugged.

!!! info
    If you accidentally unplug the router when LEDs shine red you will
    need to perform the reset again.

When the reset is finished your router restarts automatically and should
boot to the factory state. It is indicated by LEDs. They shine blue
and then green. If you can see this green light your router is ready.

Then it is necessary to set the password and reconfigure your router.
Connect your computer to one of the LAN ports and open
[https://192.168.1.1](https://192.168.1.1) in a web browser.
See [the first setup guide](../../basics/first-setup/simple_setup.md)
for more information. If you have a configuration backup you can import
it instead of the manual reconfiguration.

!!! notice
    Although the first start guide asks for registration of your router
    even after the factory reset it is not necessary if already done
    before.
