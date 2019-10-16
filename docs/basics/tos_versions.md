# Turris OS versions
Turris OS software is being released as a exact set of packages for given version.

## History of major Turris OS versions

| Major Turris OS version | OpenWrt version             | Released  | Support terminated | Compatible routers                                                        |
|-------------------------|-----------------------------|-----------|--------------------|---------------------------------------------------------------------------|
| 1.x.x                   | 12.09 (Attitude Adjustment) | ~1.2.2014 | 17.2.2015          | [Turris 1.x](models.md#turris-1x)                                         |
| 2.x.x                   | 14.07 (Barrier Breaker)     | 17.2.2015 | 24.5.2016          | [Turris 1.x](models.md#turris-1x)                                         |
| 3.x.x                   | 15.05 (Chaos Calmer)        | 24.5.2016 | -                  | [Turris 1.x](models.md#turris-1x), [Omnia](models.md#turris-omnia)        |
| 4.x.x                   | 18.06                       | 5.10.2019 | -                  | [Turris 1.x](models.md#turris-1x), [Omnia](models.md#turris-omnia), [Mox](models.md#turris-mox) |

For more detailed list of changes and versions history please see
[changelog](changelog.md).


## How to found out version of Turris OS on your router
There are multiple ways how you can found out version of Turris OS running in your
router. Few well advised ways are described here.

### In Foris web interface
Navigate to router's web interface (in default
[http://192.168.1.1](http://192.168.1.1)).

### Using SSH
You can connect to router using SSH and view file `/etc/os-release`. The easies
option is to just simply print it to console with `cat /etc/os-release`.

Alternatively for script usage you can source `/etc/os-release` and use variable
`$(VERSION_ID}`. Example follows:
```sh
. /etc/os-release
echo "${VERSION_ID}"
```
