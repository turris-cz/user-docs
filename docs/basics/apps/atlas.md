---
board: mox, omnia, 1.x
competency: intermediate
---
# RIPE Atlas probes

RIPE Atlas is a global network of probes that measures connectivity and
reachability across the Internet in real time. These probes are mostly run by
volunteers. If you host probe you will receive credits (see more about
[credit system](https://atlas.ripe.net/docs/getting-started/credits)) which
can be later used for running your own measurements on the RIPE Atlas network.

This document describes steps that you have to follow to connect your router as
a probe to the RIPE Atlas network.

## RIPE Atlas account

Before configuring your probe, you need a user account.
If you don't have one, go to the [RIPE Atlas website](https://atlas.ripe.net/)
and create an account.

## Installation

To install the probe, go to the _reForis_ menu _Package Management → Packages_
and select _RIPE Atlas SW Probe_.

After that, you have to connect to your router via SSH and follow the remaining
steps.

## Getting keys

The first step is to generate a key pair. In constrast to the older
versions, the current version 5130 doesn't need to do it explitly.
Simply start the probe daemon by the following command:

```
/etc/init.d/ripe-atlas start
```

This generates a new SSH key pair and saves it into the `/etc/ripe-atlas`
directory.

## Probe registration

Run the `/etc/init.d/ripe-atlas get_key` command to display your public key.
Go to the [RIPE Atlas website](https://atlas.ripe.net/apply/swprobe),
log in (if you haven't done it before) and register your probe. All you need
is the public key and the locality of the probe.

## Final steps

After the registration, enable the daemon with these commands:

```
/etc/init.d/ripe-atlas enable
```

You can ensure that your probe is running by the
`/etc/init.d/ripe-atlas status` command.

## Configuration

The configuration is located in `/etc/config/ripe-atlas`. It contains only a few
options:

- `enabled` - whether the probe is enabled (0/1)
- `mode` - operation mode (`prod` for production, `test` for testing, and `dev`
  for development)
- `log_stderr` – whether to log to the standard error output (0/1)
- `log_stdout` – whether to log to the standard output (0/1)
- `rxtxrpt` – whether to send interface traffic statistics as the probe
  measurement results (0/1)

## Probe ID and measurement

After probe registration, you should receive an e-mail with
__Important information about your new RIPE Atlas software probe__ as its
subject (it may change, of course). There you can find your Probe ID and
the link for managing your probe.

You can also use this command to get the probe ID:

```
/etc/init.d/ripe-atlas probeid
```

The measurement of your probe is accessible via the web (where __<ID>__ is
the ID of your probe).

```
https://atlas.ripe.net/measurements/<ID>/
```
