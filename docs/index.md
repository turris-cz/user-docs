# What is Turris project?

Turris project encompasses both software and hardware development efforts aiming
to provide open and secure routers. Devices that can be truly yours and you can
trust in.

!!! important
    This documentation applies primarily to Turris OS version 4.0 and newer. You
    might still be running Turris OS 3 and in that case you can find old official
    documentation [on community wiki](https://wiki.turris.cz/doc/en/howto/start).
    More info about Turris OS versions can also be found
    [here](basics/tos-versions.md).

## Openness

Our devices come with open source firmware. You can check what is running on
your router line-by-line, see what we changed or you can even contribute
yourself. All sources are available on our
[GitLab](https://gitlab.nic.cz/turris). You get full root account on your device
and you can do whatever you want with it. We are not locking you out.

Apart from software, you'll get full schematics for your device so you can check
out how we put it together.

## Security

We consider security as one of our main focus areas.

### Safe defaults

The first step in security is setting up your unique password. Therefore we don't
enable internet connection unless a user sets a password. We don't provide any
defaults and you have to come with your own. We also encourage protecting your
Wi-Fi with a password and we provide you with an easy way to create separate
network for devices you don't trust. Last but not least, our devices come with
DNSSEC validation enabled by default.

### Updates

No software is ever perfect. To keep up with a new security standards and to fix
existing bugs and vulnerabilities, you need your router up to date all the time.
We provide updates for all our devices to fix discovered issues but also to
provide new features. Those updates can be even installed automatically.

### Data collection

To take things further, we provide an easy way to participate in our security
research by collecting firewall logs and also information about other attack
attempts. This data is analyzed, outputs are shared with security community and
firewall on your router is updated with blacklist based on our findings to keep
even your open services more secure.
