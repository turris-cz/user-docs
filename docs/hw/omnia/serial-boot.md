# Booting Turris Omnia over serial

!!! warning
    This howto is targeting really advanced users. Under normal circumstances
    you should never ever need this except if you reflashed your NOR (not
    easily accessible) with something that is not working. If your router
    works, **do not attempt to reflash it**.

Turris Omnia is using U-Boot to boot. That U-Boot is typically loaded from the
beginning of NOR memory and takes care of the rest of booting process. If you
try to flash it with different U-Boot and your new U-Boot is corrupted, you'll
end up with unbootable device. To fix that, there is an option to switch Omnia
into a mode in which it will download U-Boot over serial line and boot it.

## Requirements

You'll need a computer running Linux and working serial cable connected to your
Omnia. How to connect serial cable is documented in [other part](../serial.md#turris-omnia)
of this documentation.

### Tools

You will also need some tools. You can get their binaries from our repository.
They can be found in <https://repo.turris.cz/omnia/nor_fw/>.

* **x86-64/kwboot** - utility that will send the image
* **x86-64/sendbeacon** - utility that will switch Omnia into _boot over serial_ mode

You also need to make both `kwboot` and `sendbeacon` executable, for example
using
```
chmod u+x ./kwboot ./sendbeacon
```

### Images

#### U-Boot

You will also need a latest U-Boot image which you can find in
<https://repo.turris.cz/hbs/omnia/packages/turrispackages/> in package called
`u-boot-omnia_$VERSION.ipk`. To get the real image out, you need to unpack
it twice. The outer gziped tarball contains file `data.tar.gz` and inside it in
directory `./usr/share/omnia` you can find file uboot-devel which you can use
both for booting over the serial line and as an image to be flashed it into
NOR memory.

#### Rescue image

You might also need a rescue image - minimal system image that allows you to
repair whatever is broken. You can get it again from
<https://repo.turris.cz/hbs/omnia/packages/turrispackages/> in package called
`rescue-image_$VERSION.ipk`. To get the real image out, you need to unpack
it twice again. The outer gziped tarball contains file `data.tar.gz` and inside
it in directory `./usr/share/rescue-image` you can find `image.fit.lzma` which
you can use for booting over the serial line and as an image to be flashed into
NOR memory.

## Booting

For the purpose of this tutorial, it is assumed that you have all the binaries in
your current working directory and that your serial line is _ttyUSB0_.

1. Disconnect your Omnia from power supply
2. Run `./sendbeacon /dev/ttyUSB0` and connect the power supply
   * This will trigger the _boot over serial_ mode of your Omnia
3. Run the following command

```
./kwboot -t -b uboot-devel -B 115200 /dev/ttyUSB0
```

If everything works well, you should see U-Boot being transferred to your Omnia
and once done, you'll see U-Boot prompt and you can use that to recover your
device.

Sometimes the `kwboot` command fails on the first try, but you can just run it
again and again till it succeeds.

## NOR recovery

Once you have U-Boot running, you can get various images for example via tftp
and write it to nor.

To download image from TFTP server you need to get your network started,
decide where to load it and load it. Assuming you have TFTP server running on
computer with ip 192.168.1.1 on WAN network, following U-Boot commands will get
you file named `image` into RAM.

```
setenv autoload no
dhcp
setenv serverip 192.168.1.1
tftpboot ${kernel_addr_r} image
```

Now you have a file originally called `image` in RAM on your router. To write
to NOR you have to know where it belongs.

!!! warning
    Make sure you don't mix old U-Boot with new rescue system or new U-Boot with
    old Turris OS, it might not work, try to keep everything on the latest
    version if you are reflashing.

To reflash U-Boot, your image file on TFTP will be `uboot-devel` file from
_[Images](#u-boot)_ section and you need to write it from the beginning of the
NOR.

```
sf probe
sf update ${kernel_addr_r} 0 ${filesize}
```

To recover rescue system, your image file will be `image.fit.lzma` from
_[Images](#rescue-image)_ section and you need to start writing it after the first megabyte
that is reserved for U-Boot.

```
sf probe
sf update ${kernel_addr_r} 0x00100000 ${filesize}
```

After that, you can call `reset` command or hit a reset button and see your
router booting again.

