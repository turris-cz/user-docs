---
board: mox, omnia, 1.x
competency: intermediate
---
# RIPE Atlas Probes

RIPE Atlas is a global network of probes that measures connectivity and
reachability across the Internet in real-time. These probes are mostly run by
volunteers. If you host probe you will receive credits (see more about
[credit system](https://atlas.ripe.net/docs/credits/)) which can be later used
for running your own measurements on the RIPE Atlas network.

This document describes steps that you have to follow to connect your router as
a probe to the RIPE Atlas network.

## Installation

To install the probe, go to the _reForis_ menu _Package Management → Packages_
and select _RIPE Atlas SW Probe_.

After that, you have to connect to your router via SSH and start the `atlas`
service.

Enable and run the daemon by these commands:
```
/etc/init.d/atlas enable
/etc/init.d/atlas start
```

Probe communicates with Atlas servers via an SSH tunnel. The SSH key is
generated after the first run of probe daemon.

After starting daemon, run `get_key` command to get the generated SSH public
key. You'll need this key to register your probe under your account on RIPE website.

```
/etc/init.d/atlas get_key
```

It takes a few seconds to generate the key.

## Probe Registration

To register your probe you have to have account on [RIPE website](https://access.ripe.net/registration).

Once you are logged to your account on [RIPE website](https://access.ripe.net/registration),
fill the form on this [link](https://atlas.ripe.net/apply/swprobe/).
Into form's field _Public Key_ copy the key obtained by `get_key` command.

See [RIPE Atlas Service Terms and Conditions](https://www-static.ripe.net/static/rnd-ui/atlas/media/legal/RIPEAtlasServiceTermsandConditionsV2.0.pdf),
if you agree with this, check it and click to the _Submit your application_
button.

## Configuration

The configuration is located in `/etc/config/atlas`. It contains only one
boolean option `rxtxrpt` that defines whether we want to send interface traffic
statistics as probe measurement result.

## Probe ID and Measurement

After probe registration you should receive an e-mail with
Subject __Your new RIPE Atlas software probe is created__, where you can find
your Probe ID and link for managing your probe.

You can also use this command to get the probe ID:

```
/etc/init.d/atlas probeid
```

Measurement of your probe is accessible via the web
(where __<ID>__ is your probe ID).

```
https://atlas.ripe.net/measurements/<ID>/
```
