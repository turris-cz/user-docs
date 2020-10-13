# Sentinel

## What is Sentinel?
Sentinel is our [data collection](../collect/collect.md) system providing dynamic
firewall. Router side of the system consists of data collect subsystem,
subsystem for dynamic firewall and mechanism providing secure channel for data
exchange.

## Installation & first run

To use Sentinel on Turris device just have to follow the instructions in [_How
to set up data collection?_](../collect/collect.md#how-to-set-up-data-collection) chapter
in the [data collection](../collect/collect.md) documentation.

During the installation, the system tries to obtain Sentinel client
certificate and starts to collect the data. New firewall rules
will be downloaded (and collected data sent to the server) as soon as secure
connection to the Sentinel server is established.
