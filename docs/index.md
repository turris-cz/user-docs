---
hide:
  - navigation
  - toc
---

# What is Turris project?

Turris project aims to provide open and secure routers through a combination of
software and hardware development. These devices are designed to be truly yours
and provide a high level of trust.

!!! important
    Turris OS version 4.0 and above is the primary target of this documentation.
    If you are still using version 3 of Turris OS, you can access the old official
    documentation on the [community wiki](https://wiki.turris.cz/doc/en/howto/start).
    For more information on Turris OS versions, please visit the designated
    [webpage](https://docs.turris.cz/basics/tos-versions/).

## Openness

Our devices feature open-source firmware that provides full accessibility to users.
You have the option to review the code line-by-line, view the changes that we made,
or even contribute your own modifications. Each device's source code is freely
available on our [GitLab](https://gitlab.nic.cz/turris). In addition, you will
receive a full root account, giving you the freedom to customize your device as you
wish. Rest assured that we will not restrict your access in any way.

Along with the software, you get full schematics for your device to see how we
built it.

## Security

We consider security as one of our main focus areas.

### Safe defaults

Setting up a unique password is the initial step in ensuring security. Thus, we do
not allow internet connection without a user-defined password. We do not offer any
defaults and require users to create their passwords. We also recommend that you
password-protect your Wi-Fi, and we make it easy to create a separate network for
untrusted devices. Lastly, our devices come with DNSSEC validation enabled by
default for added security.

### Updates

To maintain optimal security and functionality, it is important to keep your router
up-to-date. We offer updates for all of our devices, which not only address
discovered issues but also add new features. These updates can even be installed
automatically for your convenience.

We are committed to providing long-term support for our devices for as long as the
Linux kernel continues to support them. For instance, our initial router, Turris 1.X,
which was a part of the Turris security research program launched in 2013, is still
supported after a decade.

### Turris Sentinel

Our [Sentinel](https://docs.turris.cz/basics/sentinel/intro/) security project,
which monitors firewalls and detects attempted attacks, is an easy way to improve
your security. We analyze information about potential attackers and share the
results of our analysis with the security community. We update your router's
firewall with a greylist based on our findings.
