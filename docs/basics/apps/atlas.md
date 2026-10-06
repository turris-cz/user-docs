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

Before you start to configure your probe, you need to have a user account.
If you don't have one, please go to the [RIPE Atlas website](https://atlas.ripe.net/)
and register there.

## Installation

To install the probe, go to the _reForis_ menu _Package Management → Packages_
and select _RIPE Atlas SW Probe_.

After that, you have to connect to your router via SSH and perform
all necessary steps.

## Generating keys

The first step is to generate a key pair. Open the `/etc/config/atlas` file
in an editor and enter your RIPE Atlas account username (usually your
e-mail address), for example:

```
config atlas 'common'
        option log_stderr '1'
        option log_stdout '0'
        option rxtxrpt '1'
        option username 'user@example.com'
```

Then run `/etc/init.d/atlas create_key`. It generates a new SSH key pair
and saves it into the `/etc/atlas` directory.

## Probe registration

Run the `/etc/init.d/atlas get_key` command to display your public key.
Go to the [RIPE Atlas website](https://atlas.ripe.net/register/swprobe)
and register your probe (you must be logged in, of course). All you need
is the public key and the locality of the probe.

## Final steps

After the registration, enable and run the daemon with these commands:

```
/etc/init.d/atlas enable
/etc/init.d/atlas start
```

You can ensure that your probe is running by the
`/etc/init.d/atlas status` command.

!!! note
    These instructions are also present in the `/etc/atlas/atlas.readme` file.

## Configuration

The configuration is located in `/etc/config/atlas`. It contains only a few
options:

- `log_stderr` – whether to log to the standard error output (boolean)
- `log_stdout` – whether to log to the standard output (boolean)
- `rxtxrpt` – whether to send interface traffic statistics as the probe measurement
  results (boolean)
- `username` – the RIPE Atlas username (see above, text)

## Probe ID and measurement

After probe registration, you should receive an e-mail with
__Important information about your new RIPE Atlas software probe__ as its
subject (it may change, of course). There you can find your Probe ID and
the link for managing your probe.

You can also use this command to get the probe ID:

```
/etc/init.d/atlas probeid
```

The measurement of your probe is accessible via the web (where __<ID>__ is
the ID of your probe).

```
https://atlas.ripe.net/measurements/<ID>/
```
