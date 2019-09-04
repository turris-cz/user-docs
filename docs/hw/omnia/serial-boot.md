# Booting Turris Omnia over serial

!!! warning
    This howto is targeting really advanced users. Under normal circumstances
    you would never ever need this except if you
    reflashed your NOR (not easily accessible) with something that is not
    working.

Turris Omnia is using U-Boot to boot. That U-Boot is typically loaded from the
beginning of NOR memory and takes care of the rest of booting process. If you
try to flash it with different U-Boot and your new U-Boot is corrupted, you'll
end up with unbootable device. To fix that, there is an option to switch Omnia
into a mode in which it will download U-Boot over serial line and boot it.

## Requirements

You'll need a computer running Linux and working serial cable connected to your
Omnia. How to connect serial cable is documented in [other part](../serial.md#turris-omnia)
of this documentation.

You will also need some binaries from our repository. They can be all found in
<https://repo.turris.cz/omnia/nor_fw/>.

* **uboot-turris-omnia-uart-spl.kwb** - U-Boot to be send over serial line
* **x86-64/kwboot** - utility that will send the image
* **x86-64/sendbeacon** - utility that will switch Omnia into _boot over serial_ mode

After downloading those, you also need to make `kwboot` and `sendbeacon`
executable, for example using `chmod u+x ./kwboot ./sendbeacon`.

## Booting

For the purpose of this tutorial, it is assumed that you have all the binaries in
your current working directory and that your serial line is _ttyUSB0_.

1. Disconnect your Omnia from power supply
2. Run `./sendbeacon /dev/ttyUSB0` and connect the power supply
   * This will trigger the _boot over serial_ mode of your Omnia
3. Run the following command

```
./kwboot -t -b uboot-turris-omnia-uart-spl.kwb -B 115200 /dev/ttyUSB0
```

If everything works well, you should see U-Boot being transferred to your Omnia
and once done, you'll see U-Boot prompt and you can use that to recover your
device.

Sometimes the `kwboot` command fails on the first try, but you can just run it
again and again till it succeeds.

## NOR recovery

Once you have U-Boot running, you can get various images for example via tftp
and write it to nor.

To download image from _tftp_ server you need to get your network started,
decide where to load it and load it. Assuming you have _tftp_ server running on
computer with ip 192.168.1.1 on WAN network, following U-Boot commands will get
you image into RAM.

```
setenv autoload no
dhcp
setenv serverip 192.168.1.1
tftpboot ${kernel_addr_r} image
```

Now you have a file originally called `image` in RAM on your router. To write
to NOR you have to know where it belongs.

To reflash U-Boot, your image file on _tftp_ will be
[uboot-turris-omnia-spl.kwb](https://repo.turris.cz/omnia/nor_fw/uboot-turris-omnia-spl.kwb)
and you need to write it from the beginning of the NOR.

```
sf probe
sf update ${kernel_addr_r} 0 ${filesize}
```

To recover rescue system, your image file will be
[omnia-initramfs-zimage](https://repo.turris.cz/omnia/nor_fw/omnia-initramfs-zimage)
and you need to start writing it after first megabyte that is reserved for
U-Boot

```
sf probe
sf update ${kernel_addr_r} 0x00100000 ${filesize}
```

After that, you can call `reset` command or hit a reset button and see your
router booting again.
