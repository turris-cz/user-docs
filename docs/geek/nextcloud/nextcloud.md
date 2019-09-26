# Nextcloud on Turris

## What is Nextcloud?

[Nextcloud](https://nextcloud.com) is an application that provides nice web
frontend to enable you to store data on your own server. This data can be
files, calendar, contacts, news feed, to-do lists and much more. Files and PIM
data are accessible using standard protocols such as _webdav_ or _carddav_
and _caldav_. This makes it easy to setup your computers or phones to
synchronize with your own server so that you don't have to trust an external
cloud provider with your personal data.

!!! tip "Benefits of using Nextcloud"
    * An open source solution, fully under your own control.
    * Synchronization and sharing of data made easy.
    * Mobile, desktop and web client. 
    * Monitors changes and allows document workflow management.
    * A space for your calendar and contacts.
    * Safe private voice and video calls, shared screens.
    * Many additional third-party extensions

## Requirements

It doesn't make much sense to use Nextcloud with just the small flash memory
already included in your router. In fact, **excessive writing to the internal
memory will lead to it getting worn out and damaged soon**. Also faster the
storage is, the snappier responses from the Nextcloud are. To get the most out
of Nextcloud, it’s best to get either external drive or even internal SSD.

To setup this external drive easily, use [Storage
plugin](../../basics/foris/storage-plugin/storage-plugin.md).

### Installation via Foris

Nextcloud can be setup quite easily using Foris.

First step is to setup the storage you want to use for the Nextcloud. Plug it
either into USB 3.0 port or in case of Omnia, you can use internal mSATA port.
Then use
[Storage plugin](../../basics/foris/storage-plugin/storage-plugin.md) to set
it up. You will be asked to reboot your router, so do so.

The next step is to enable Nextcloud in _Updater_ tab. After doing so, your
router will install all necessary packages.

![Nextcloud option in updater tab](nextcloud_updater.png)

The last step is to go back to the _Storage_ tab and after installation
finishes, you will be presented with a dialog to set your admin username and
password. If you install Nextcloud first - without setting up your external
drive - Foris wouldn't allow you to setup Nextcloud till you do so.

![Setting up a disk with Nextcloud installed](storage_plugin_nextcloud.png)

If you get the setup dialog, you can enter your desired credentials and you
are done. Foris will finish your Nextcloud setup. This can take a while
depending on speed of your drive.

![Nextcloud configuration](nextcloud_setup.png)

Once done, you get a link directly to your ready to use Nextcloud instance.

![Nextcloud installed](nextcloud_installed.png)

### Manual installation from CLI

Nextcloud is already included in our repositories, so you can get it simply by
installing the package `nextcloud-install`  by issuing the following
commands:

```
echo 'Install("nextcloud-install")' > /etc/updater/conf.d/nextcloud.lua
pkgupdate
```

This will install all the required dependencies, the Nextcloud itself and a
simple script to help you with the basic setup. Alternatively, you can install
only the package `nextcloud` and set up everything by yourself. If you decide
to use the setup-script for simplicity, just call the following command after
installation is complete:

```
nextcloud_install
```

This script will create the Nextcloud database and add a user on the MariaDB
server running on your router, enable it and enable php support in Lighttpd as
well. It will also create an admin account on your new Nextcloud server.

## Using Nextcloud

Once installed, you can access your Nextcloud instance by using an URL like
`http://your_router_lan_ip/nextcloud`. If your computer supports _zero-conf_,
you could simplify the access by using url <http://turris.local/nextcloud>.

You can also enable access to your Nextcloud from anywhere on the Internet. You
can either use VPN, which can be set up [really easily from
Foris](../../basics/apps/openvpn/openvpn.md) or you need to open up some ports in
your firewall. Second option would allow anybody (including attackers) to try to
log in to your Nextcloud instance and - if you don't change the Lighttpd
configuration - to LuCI and Foris. Please don’t do that unless you are sure what
you are doing. 

Also bear in mind that if you are using Nextcloud from our repositories, **you
shouldn't update the Nextcloud core manually** as that would get overwritten by
next update. So update just your extra apps and leave the core to us.
