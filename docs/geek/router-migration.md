---
board: mox, omnia, omnia-ng, 1.x
competency: advanced
---

# Migrating to a new router

There is no automatic tool to migrate everything to your new router. But
there are several things that can be easily migrated via
[SSH](ssh-access/ssh-access.md) to get you up and running in no time.

!!! warning
    Before migrating your settings, make sure that both of your routers are
    running the same version of Turris OS.

!!! tip
    To copy files over, you can use the `scp` command directly on the router if they
    are interconnected. Or you can copy files from the router to your computer
    and from there later on to your new router.

## Packages

The set of packages is easy to migrate over. You just need to copy
`/etc/config/pkglists` from your old router to the new one, as well as
`/etc/updater/conf.d/opkg-auto.lua`. Next time the updater is run, it will
make sure you have the same set of packages installed. Unfortunately, the
configuration of most of the packages has to be migrated manually.

## Networks

Networks are defined in `/etc/config/network`. You can migrate this file
over from your old router to the new one, but you have to modify the names
of the interfaces.

For example, if you are migrating from Turris Omnia to Turris Omnia NG, the WAN
was named `eth2` on the old Omnia. Now, the port is either `eth0` or `eth4` (for
SFP0). You can easily replace all the names of the interfaces using `sed`.

For example, if the Internet used to be connected to the `eth2` interface and now
is connected to `eth4`, the following command run on the new router (after
copying `/etc/config/network` file over) will fix it:

```
sed -i 's/eth2/eth4/g' /etc/config/network
```

You can make all the necessary adjustments one by one. It will take effect only
after you restart either the whole router or at least the network.

## Static leases

If you have migrated your networks and you have the same IP subnets as you
had on your old router, static leases are the simplest ones to migrate over.
You just need to copy `/etc/config/dhcp` from your old router to the new one
and restart `dnsmasq` service via `/etc/init.d/dnsmasq restart`.

## Firewall

Unless you manually defined special rules in LuCI depending on specific
names of your network interfaces, default settings leverage network names as
specified in network settings. That means that copying over
`/etc/config/firewall` from your old router to the new one should be simple and
doesn't require any additional modifications.

## Wi-Fi networks

Wi-Fi networks probably don't make sense to migrate directly. You can read
all the information about your existing Wi-Fi networks in
`/etc/config/wireless`, but as your new router probably has a different set
of radios with different capabilities, it makes sense to recreate the Wi-Fi
networks using up-to-date parameters and connect them to the respective
networks.
