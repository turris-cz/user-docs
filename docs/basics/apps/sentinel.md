---
board: shield, mox, omnia, 1.x
---
# Sentinel

## What is Sentinel?
Sentinel is Turris threat detection & attack prevention system. It is able
to detect attack attemps carried out by various attackers and protect the
router with dynamic firewall. If you seek more details check [Sentinel comprehensive guide](../sentinel/intro.md).

## Installation & first run

!!! tip
    Turris Sentinel is installed out of the box on [Turris
    Shield](../../hw/shield/shield.md). There is no need to configure it.

To use Sentinel on Turris device just have to follow the instructions in the
[setup guide](../sentinel/setup.md).

During the installation, the system tries to obtain Sentinel client
certificate and starts to collect the data. New firewall rules
will be downloaded (and collected data sent to the server) as soon as secure
connection to the Sentinel server is established.
