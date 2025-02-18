---
board: omnia, 1.x, mox
competency: advanced
---
# Access to the router via SSH

There are three main ways how you can access your router. Two of them
(reForis and LuCI) are web-based, whereas the third one is
terminal-based and utilizes the [Secure Shell Protocol](https://en.wikipedia.org/wiki/Secure_Shell)
(SSH).

## Setting a root password

To access the terminal interface you need to have the root password set
first. This password can be set in the _Advanced Administration Password_
section, on the _Administration_ → [_Password_](../../../basics/reforis/password/password/)
tab (or on the first screen during the [first setup guide](../../../basics/reforis/guide/)).

!!! important
    Always use strong passwords! Consult the
    [Password strength](https://en.wikipedia.org/wiki/Password_strength) article
    on Wikipedia.

## How to access your router via SSH

The SSH service runs on the standard port number (22), if not configured
differently.

### Linux, Unix-like systems, Mac OS

The `ssh` command should be available in all the mentioned systems. If it
is not available, please try to install it via a package manager. The `ssh`
package usually contains some package for `sftp` as well.

!!! tip
    Older guides show how to use `scp` for file transfers. However, this
    tool has been [recognized as outdated](https://www.openssh.com/txt/release-8.0)
    since 2019; newer versions of
    the [OpenSSH suite (9.0+)](https://www.openssh.com/txt/release-9.0) use
    the `sftp` protocol as an underlying layer for `scp` instead of the original
    implementation. The `sftp` tool itself offers a much larger scale
    of features.

#### How to connect and log in

1. Open a terminal application on your computer and enter the following command:
  `ssh root@192.168.1.1` (if you have changed the local IP address of your
  router, please update the command accordingly).
2. If you are trying to access the terminal via SSH for the first time,
  the program will ask you whether the identity of the router is correct.
  It is acceptable to answer yes if you are sure that nobody is intercepting
  your connection to the router (for example connected directly to the router
  via cable or there is no other device in the network).
3. The program will ask you for the root password. Put there a password, which
  you set in the Foris web interface.

The whole process should look like this:

```
user@localmachine:~$ ssh root@192.168.1.1
The authenticity of host '192.168.1.1 (192.168.1.1)' can't be established.
ECDSA key fingerprint is ed:d2:9d:e6:60:42:16:80:c0:fd:64:e6:a5:f6:c3:cf.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added '192.168.1.1' (ECDSA) to the list of known hosts.
root@192.168.1.1's password:

 Warning: Changes performed using anything other than
 official web interface reForis are not covered by
 Turris support team unless instructed!


BusyBox v1.35.0 (2024-09-25 06:29:10 UTC) built-in shell (ash)

      ______                _         ____  _____
     /_  __/_  ____________(_)____   / __ \/ ___/
      / / / / / / ___/ ___/ / ___/  / / / /\__
     / / / /_/ / /  / /  / (__  )  / /_/ /___/ /
    /_/  \__,_/_/  /_/  /_/____/   \____//____/

 -----------------------------------------------------
 TurrisOS 7.1.3, Turris Omnia
 -----------------------------------------------------
root@turris:~#
```

#### Transferring a file between a computer and the router

The usage of the `sftp` command is very similar to the `ftp` command.
The first step is to log in:

```
user@localmachine:~$ sftp root@192.168.1.1
Connected to 192.168.1.1.
```

Then you can, for example, upload a file to your router (this specific
command will upload a file `yourfile` into the `/root` directory):

```
sftp> put yourfile /root/
```

Similarly, you can download a file (it will download it into the
current directory in your computer):

```
sftp> get /var/log/messages
```

When done, log out from there:

```
sftp> exit
```

See `man sftp` for more information.

!!! tip
    Instead of the command-line `sftp` tool, you can use for example
    `sshfs` to mount the remote filesystem. Or GUI applications like
    Midnight Commander, FileZilla Client, or any other SFTP client
    like file managers pertaining to desktop environments.

### Windows

#### Recommended software

The best way how to access a terminal via SSH from Windows is to use
[Putty](https://www.putty.org/). For file transfer we recommend
[WinSCP](https://winscp.net/).

#### Terminal access via SSH

1. Open the Putty application and put this line `root@192.168.1.1` to the _Host
  Name_ (or _IP address_) text field on the _Session_ tab.
2. Move to the _Window_ → _Translation_ tab and set the _Remote character set_
  field to the UTF-8 value.
3. Optionally you can save the session settings on the _Session_ tab.
4. Click on the _OK_ button to log in.
5. If you are trying to access the terminal via SSH for the first time
  the program will ask you whether the identity of the router is correct.
  It is acceptable to answer _yes_ if you are sure that nobody is intercepting
  your connection to the router (for example connected directly to the router
  via cable or there is no other device in the network).

#### Transferring a file between a computer and the router

1. Open the WinSCP application and put the local IP address of your router
  (by default it is set to `192.168.1.1`).
2. Use `root` as a username.
3. Check that the port is set to `22` and the protocol to
  _SFTP (allow SCP fallback)_.
