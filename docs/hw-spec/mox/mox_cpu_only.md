MOX A (CPU only)
================

This page is written for users which would like to configure MOX device with only one network port. It means you have no SFP module D and no ethernet module (modules C or E). You may or may not have other modules (B, F or G).

Why there is a special page for this?
Your device has only one network port and you have to decide if you would like to configure it like WAN or LAN and how to manage a connection to the internet.

Because we want to make the first setup more smooth, ethernet port will be set to LAN at the beginning of the first setup. You shouldn't connect MOX A in this configuration directly to the internet. Configure it somewhere where it is safe - in your local network or directly from your computer.
You can change these settings later and use your MOX A without this limitation.

Cable setup for configuration
-----------------------------

You shouldn't connect your MOX A directly to the internet.

![alt Mox without internet](/hw-spec/mox/mox_no_internet.png/)

You can connect you MOX A directly to your computer, but your MOX A wouldn't be able to connect to the internet during the first setup and download any updates, which is not recommended. Some steps in the configuration guide (like checking the internet connection) could fail because of that, but it should be usually OK.

![alt Mox connected directly to computer](/hw-spec/mox/mox_to_internet.png/)

If you have a working local network with dhcp behind a firewall and you can somehow list IP addresses of newly connected devices, it is recommended to use it for MOX A configuration. In this setup, your MOX A will be able to connect to your computer as well as connect to the internet.

![alt Ideal connection of MOX](/hw-spec/mox/mox_cpu_only.png/)

Installation steps:
-------------------
1. Shut down your device and unplug a power supply.
2. Connect all desired MOX modules in the correct order. We recommend to check a correct combination of modules and their connection in our [MOX configurator](https://mox-configurator.turris.cz/).
    If you would like to use Wi-Fi upgrade, plug it into the right module.

    **Attention:** Shut down your device and disconnect from the power supply before connecting or disconnecting modules and/or upgrades. The hardware configuration of the device can not be changed at runtime.

3. Connect your computer to a MOX A either directly via ethernet cable or indirectly by connecting both MOX A and computer to the same local network.
4. Insert microSD card with TurrisOS image into microSD slot in module A.
    If you want to prepare this card, follow [this page](/hw-spec/mox/mox_microsd/).

    Note: If you choose the recommend cable setup in which is MOX A connected to the internet, automatic download of an image from the internet described in card preparation documentation should work.
    If you have your MOX A connected directly to your computer there is no way how to get to the internet and download the image. You have to download and save TurrisOS image on your microSD card.

5. Connect the power supply to module MOX A. **Attention:** Use original power adapter 12 V, 2.5 A.

6. If you have your MOX A connected directly to the computer, your address for the next step will be [http://192.168.1.1](http://192.168.1.1). You can skip the rest of this step.

    Otherwise, you need to find out IP address of your MOX A to connect to it. Check DHCP leases on your DHCP server on your local network. You should be able to see them in the configuration interface of your local networks router. Consult manual for that device if you need to.

7. Open an internet browser and write the address obtained in the previous step. You should get to the configuration guide of Turris MOX. Follow the guide.

8. If you want to change the configuration of ethernet port of your MOX A from LAN to WAN you can do that in administration interface after finishing the guide.
