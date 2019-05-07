Reset modes of Turris MOX
=========================

This article is about using the only button of Turris MOX.

Simple reset
------------

It could happen that MOX is not working as expected. In this occasion, you can restart your MOX. If you just press the reset button, it will reset the MOX gracefully. If you hold the button for a while (more than 4 seconds) it will reset the MOX immediately with no respect to running services. Button handling is implemented in software so its function depends on working system. If it seems that MOX is not restarting unplug it from the power supply for a while.

Various rescue modes of MOX
---------------------------

During the boot, the button can be used to select one of the rescue modes of Turris MOX. To do so, hold the button when you plug in the power supply.

The workflow of rescue system is that MOX will be signaling with LED what it is going to do. If you DON'T like, it press the button and MOX will offer you the next mode. If you are satisfied with what is MOX going to do, do nothing, just wait. MOX will be announcing the selected mode twice before it really does it (just in case you miss the fist announcement due to being occupied by pressing the button).

### List of modes:

1. Reset
2. Btrfs rollback
3. Factory reset
4. USB flashing (This option is also for booting from microSD card.)
5. Unsecure SSH on 192.168.1.1
6. Flash from the internet
7. Serial console

### Setting the right mode

Let's pretend we would like to set mode 4 – USB flashing. Here is the example of MOX communication.


| MOX LED     | Meaning                                                 | Button |
|------|----------------------------------------------------------------|--------|
| off         | MOX is off. Hold the button and plug the power adapter. | Hold   |
| blink       |I know you are holding a button. You can release it now. | Hold   |
|off |I'm starting kernel. |Released |
|on |Kernel started, I'm starting rescue image. Prepare for announcements. |Released|
|blink |I'm going to do mode one (reset). Do you like it?|Released|
|on (about 3 seconds)|I'm waiting for your opinion. _We said that we want the mode 4. We don't like the mode 1 so we will press the button._|Pressed|
|Blink blink|Ok, if you don't like the mode one, what about the mode two (btrfs rollback)?|Released|
|on|_We don't like the mode two so we will press the button. We want the mode four._|Pressed|
|Blink blink blink|If you don't like the mode two, what about the mode three. I'm going to do it if you like it.|Released|
|on|_Let say we miss the announcement and we are not sure in which mode we are now. We can wait a little bit, there will be the second announcement._|Released|
|Blink blink blink|I'm saying that if you do nothing I'm going to mode three (factory reset).|Released|
|on|MOX is going to run mode three. It's something we don't like. We need to press the button.|Pressed|
|Blink blink blink blink| I'm going to mode 4 (USB flashing). Do you like it?|Released|
|on (about 3 seconds)|I'm waiting for your opinion.We said that we want mode four. We like that MOX is going to do mode four. We do nothing to interrupt it.|Do nothing|
|Blink blink blink blink|I'm saying that I'm going to mode 4 (second announcement).|Do nothing|
|on (about 3 seconds)|I'm waiting for your opinion. _Everything is fine. Do nothing._ |Do nothing|
|Slow blinking |Time's up. I'm going to mode 4. |Do nothing|

