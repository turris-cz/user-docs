First setup of Turris MOX 
=========================

1. Connect all desired MOX modules in a correct order. Commonly used setups are ABC, AB and AF. We recommend to check the correct combination of modules and their interoperability in our [MOX configurator](https://mox-configurator.turris.cz/).
    
	**Attention:** Shut down your device and disconnect from the power supply before connecting or disconnecting modules and/or upgrades. The hardware configuration of the device can not be changed at runtime.

	* If you would like to use Wi-Fi upgrade, plug it into the right module.	
         * Wi-Fi SDIO upgrade should be connected on SDIO pins on the main board of MOX A. SDIO Wi-Fi upgrade has 8 pin header socket on one side and 6 pin header socket on the other and you shouldn't swap it's sides.
         * Wi-Fi mPCIe upgrade should be connected in mPCIe slot on the main board og MOX B or G.

2. If you got microSD card with your device insert it to microSD slot on the main board of MOX A.
    If you want to use your own microSD card please follow [this page](/hw-spec/mox/mox_microsd/).
3. Plug a cable to WAN port
	* If you use module D (SFP) in your device, use it to connect to the internet.
	* If you don't use module D (SFP) but you have some ethernet module (C or E) in your setup connect a cable from your ISP (or cable from your other device) to ethernet port on MOX A.
	* If your setup has only one network port follow [this page](/hw-spec/mox/cpu_only/).
4. Plug a cable to LAN port
	* Connect your computer with another cable to other available ethernet port on the device.
	* If you used an SFP module for connection to the internet in the previous step, use ethernet port on module   A for connecting your computer.
	* If you already plugged a cable in ethernet port of module A in previuos step use another ethernet port on module C or E for connecting your computer.
5. Connect the power supply to module A.
	**Attention:** Use power adapter 12 V, 2.5 A.
6. Wait few minutes for starting the device (and IP address configuration). Open an internet browser on your computer and point it to the address [http://192.168.1.1](http://192.168.1.1). Follow the first setup guide on your screen.

