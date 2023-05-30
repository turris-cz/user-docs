---
board: mox, omnia, 1.x
competency: intermediate
---
# Schnapps

## What is Schnapps?

Schnapps is a command-line tool for manipulation with Btrfs
[snapshots](https://en.wikipedia.org/wiki/Snapshot_(computer_storage)). It is useful especially when you want to
make some experiments with your Turris.

!!! warning
    Schnapps is not available on Turris Shield.

## What is Btrfs?

[Btrfs](https://en.wikipedia.org/wiki/Btrfs) is a modern file system based on the
[copy-on-write](https://en.wikipedia.org/wiki/Copy-on-write#In_computer_storage) principle. It has many important
features such as snapshots, subvolumes, self-healing, file cloning, block discard, pooling, checksums, transparent
compression, and many others. Btrfs is used as the main file system in Turris (on the internal eMMC device) although
it also supports more file systems supported by the Linux kernel (e.g. ext3, ext4, squashfs, NFS...).

The most important feature of Btrfs is to work with snapshots. These snapshots can be created, deleted, compared,
rolled back to, backed up and so on. Thanks to the nature of Btrfs all of these operations are fast and effective.

## What you can do with schnapps?

Although you can use standard Btrfs tools to deal with snapshots schnapps is a high-level tool and provides more
features. Filesystem snapshots can be not only manipulated locally but easily exported/imported and even uploaded
to a server as well.

Some uses of schnapps on Turris are automatic. For example, before and after each software update a snapshot is created.
So if anything was wrong (and Turris could boot at least) after an update or subsequent modifications there has been
a possibility to roll back to the last working snapshot. Furthermore, one snapshot per week is created by the cron
daemon.

The general format for running schnapps is the following:
```
schnapps [-d root] command [options]
```
The list of all supported commands with their options and short descriptions can be obtained by this command:
```
schnapps help
```
You also get the same if you run schnapps without any arguments.

### Listing snapshots

The currently available snapshots can be listed simply by running:
```
schnapps list
```
You get something like this:

```
    # | Type      | Size        | Date                        | Description
------+-----------+-------------+-----------------------------+------------------------------------
    1 | pre       |    36.82MiB | 2019-07-10 16:37:56 +0200   | Automatic pre-update snapshot
    2 | post      |   820.00KiB | 2019-07-10 16:40:23 +0200   | Automatic post-update snapshot
    3 | time      |     1.32KiB | 2019-07-15 01:05:06 +0200   | Snapshot created by cron
    4 | single    |     8.00KiB | 2019-07-17 09:02:42 +0200   | User created snapshot
```
There are four snapshots. The first one was created automatically before updating system packages, the second one after
the packages were updated. The third snapshot was created by the cron and the last one by a user manually. For each
the snapshot you can see its number, type (see below), timestamp of creation and description.

The list above is suitable for a human user. If you want to use a snapshot list as an input for any other tools you can use
[JSON](https://en.wikipedia.org/wiki/JSON) export:
```
schnapps list -j
```
### Creating, modifying and deleting snapshots

The simplest command for creating snapshots is the following:
```
schnapps create
```
It creates a snapshot of the "single" type and described as "User created snapshot". If you want to annotate your
snapshot (and it is recommended to do so) simply add your description:
```
schnapps create "Before breaking it down"
```
Enclose the description into the quotation marks to prevent potential unwanted effects. You can also specify the type of
the snapshot to distinguish between more types especially for later automatic processing. There are five types:

* `single` – standard manually created snapshots
* `time` – snapshots created on time base (by cron)
* `pre` – snapshots created before updates
* `post` – snapshots created after updates
* `rollback` – snapshots created when rolling back (can't be created manually)

The full form of the command will be like:
```
schnapps create -t time "Midnight snapshot"
```
Both the type and description can be modified later. This command changes the parameters of one of the previously
created snapshots:
```
schnapps modify 4 -t time -d "My morning snapshot"
```
You can delete the created snapshot by running:
```
schnapps delete 6
schnapps delete 1 2 3
```
The first command deletes only one snapshot (numbered 6). The second one deletes three snapshots. You can specify
as many snapshots as you want. The remaining snapshots retain their original numbers so if you delete some snapshots
there will be "holes" in the order.

If you want to delete snapshot a "smarter" way you can use the `cleanup` command:
```
schnapps cleanup
schnapps cleanup --compare
```
The first command deletes all snapshots which are older than the numbers specified in `/etc/config/schnapps`
(see below). The second one also deletes the snapshots which contain no changes to the previous ones.

### Rolling back

This is the most important feature of snapshots. You can roll back to a snapshot at any time. The current file system
state is not lost. It creates a "rollback" type snapshot automatically and you will be able to roll back to this
snapshot later.
```
schnapps rollback
schnapps rollback 3
```
The first command rolls back to the last snapshot. The second one rolls back to the specified snapshot (if it exists).

!!! tip
	Always reboot your Turris after rolling back. Many files are processed only at boot thus unbooted Turris is in
	inconsistent state and some things may not work as you expected.

### Snapshot comparison

You can compare one snapshot to another one. There are two commands to do it. The first is `cmp` and displays only
what files are different:
```
schnapps cmp
schnapps cmp 8
schnapps cmp 1 2
```
The first command compares the current state of the file system to the last snapshot. The second one compares the
current state of the file system to the specified snapshot (8) and the last one compares two specified snapshots.
The comparison can take some time, especially it the compared snapshots are far between. The result contains a list
of files marked by a character that tells what type of difference it is (the legend is also included in the result).

```
~ /etc/fstab
+ /etc/lxc-net
- /root/README
```
This listing means that the first file has changed its content, the second one has been added and the third one
has been deleted in the newer snapshot (or in the current state if no later snapshot was specified).

If you need more detailed comparison you can use another command:
```
schnapps diff 1 2
```
It does the same as the `cmp` command above but furthermore, it displays [diffs](https://en.wikipedia.org/wiki/Diff)
for individual files.

### Working with data in snapshots

Each Btrfs snapshot appears as a complete file system and as such can be mounted and worked with its files.
```
schnapps mount 2
schnapps mount 2 3
```
The first command mounts one snapshot to `/mnt/snapshot-@N`, where "N" is the number of the snapshot. The second one
mounts two snapshots (you can mount as many snapshots as you want). The mounted snapshot may be modified and such
changes don't apply to any other snapshots. You can, for example, mount a snapshot, modify its files and then roll back
to that snapshot to apply your changes.

### Preparing for risky configuration

From time to time you may want to try some potentially risky reconfiguration
that could cut you out of the router. And sometimes, you need to do it even
remotely. For this use-case, we have a special workflow in Schnapps that will
help you to recover if things go sideways.

Before starting the risky operation, call

```
schnapps savepoint 15
```

This will commit the current state of the router as a snapshot and it will
start a fifteen minutes timer (changing the number will change the number of
minutes, if you leave it out, the default is ten minutes). If everything goes
well and the new configuration works, you can subsequently call

```
schnapps commit
```

This will cancel the timer and remove the original snapshot. If you don't
manage to `commit` in time, the state of your router will be rolled back to the
snapshot created at the start of your endeavour and the rebooted. You will have
a _rollback_ snapshot to inspect, but your router should be back in the state
that you can connect to it and give it another try.

### Updating factory image

As we constantly release new versions, it makes sense to update even the
factory image from time to time. That way, if you need to rollback all the way
to the factory image, you don't have to start with something really old.
Schnapps can help you keep your factory image up to date. All you need to do is
to run the following command and it will download and update your factory image.

```
schnapps update-factory
```

!!! tip
    It is a good idea to update your factory snapshot after each major update.
    The configuration might change quite a lot between major versions and while we
    try to migrate everything, it is better to avoid the need to migrate
    anything altogether.

### Export and import

You can export your snapshot to create a media kit (*medkit*) which can be simply backed up or copied to another
Turris of the same type (e.g. from your Omnia to another Omnia).
```
mkdir /mnt/usb
mount /dev/sda1 /mnt/usb
schnapps export 9 /mnt/usb
umount /mnt/usb
rmdir /mnt/usb
```
This set of commands does the following:

	1. Creates a directory to be the mount point for the USB drive.
	2. Mounts the /dev/sda1 device (the first partition on the USB drive) to the mount point.
	3. Exports the given snapshot to the mounted file system.
	4. Unmounts the target file system.
	5. Removes the mount point.

The export command itself creates two files. One of them (`*.tar.gz`) contains the exported snapshot as a
[tarred ](https://en.wikipedia.org/wiki/Tar_(computing)) and [gzipped](https://en.wikipedia.org/wiki/Gzip)
directory tree. The other one (`*.info`) contains information about the snapshot.

The names of these files are created this way:
```
<turris-series>-medkit-<snapshot-number>.<file-extensions>
```
The "turris-series" value is "omnia" or "mox" for these devices or "schnapps" otherwise. You can export the current
file system state as well (but it is not recommended because it may be inconsistent):
```
schnapps export /mnt/usb
```
While exporting snapshots you can symmetrically encrypt the resulting tarball. It works only if you have the "gnupg" package installed and the encryption password is set in the configuration file (see below).

The resulting tarball will have a name such as `omnia-medkit-9.tar.gz.gpg`. To be able to import an encrypted tarball, it is necessary to decrypt it first using [GPG](https://en.wikipedia.org/wiki/GNU_Privacy_Guard):
```
gpg1 --decrypt omnia-medkit-9.tar.gz.gpg > omnia-medkit-9.tar.gz
```

If you want to import a previously exported snapshot you can simply run something like:
```
mkdir /mnt/usb
mount /dev/sda1 /mnt/usb
schnapps import /mnt/usb/omnia-medkit-9.info
umount /mnt/usb
rmdir /mnt/usb
```
Most of the commands are described above. Only the third one is different. It's the import itself. Notice that
it takes the path to the information file (and not to the tarball). After importing, a rollback snapshot is
automatically created.

!!! warning
	For an imported snapshot, no data deduplication is done and therefore it takes a lot of space.

### Remote manipulation with snapshots

One of the high-level features of schnapps is remote manipulation with snapshots. You can not only work with local
snapshots but also upload them to a server and even keep in sync.

The simplest operation is the upload of one snapshot. Currently, these remote resources are supported:

* **[WebDAV](https://en.wikipedia.org/wiki/WebDAV)** – use if you have a WebDAV server
* **[Nextcloud](https://en.wikipedia.org/wiki/Nextcloud)** – basically the same as WebDAV but with simpler
specification for Nextcloud servers; use if you have a Nextcloud server
* **[SSHFS](https://en.wikipedia.org/wiki/SSHFS)** – use for any SSH-capable server (e.g. almost any Linux machine)

Look at some examples:
```
schnapps upload 8 webdav://user:password@my.webdav.server/ /snapshots
schnapps upload nextcloud:/user:password@my.nextcloud.server/snapshots/
schnapps upload 8 ssh://my.webdav.server/ /snapshots
```
The first command uploads the snapshot numbered 8 to the specified WebDAV server to the specified directory.
The user credentials are incorporated into the URL. The second example is similar but it uploads the current file
system state and the target directory is a part of the URL. The third command uses SSHFS and the user credentials
are omitted (it logs in as the current user and authenticates he/she by the key which must be preconfigured in
`/etc/config/schnapps` or `~/.ssh/config` or added to the running `ssh-agent`).

!!! important
	SSH URLs can be specified with relative or absolute paths (e.g. `ssh://my.webdav.server:/upload` is absolute
	and `ssh://my.webdav.server:upload` is relative; absolute paths always start with a slash). For absolute
	paths, the remote root directory is mounted while for relative paths, the remote login-default directory
	(usually the user's home) is mounted. The separating colon (`:`) may be omitted for absolute paths. If no
	path is specified (with or without the colon), the login-default directory is mounted. The path specified
	as a separate command line argument or a configuration value is always used relatively to the mount point
	(it does not matter whether it is defined as absolute or relative).

Synchronization of snapshots is an even higher level of operation. You can synchronize your local snapshots to
a remote server using these commands:
```
schnapps sync
schnapps sync -t pre,post
```
The first command synchronizes all local snapshots to the remote server. The other command synchronizes only
the snapshots having the given types (here pre and post).

Synchronizing snapshots requires explicitly calling one of these commands. In other words, snapshots are not
automatically synchronized when being created, modified or deleted.

!!! warning
	The remote server must be properly configured in `/etc/config/schnapps` before running synchronization commands.

The last schnapps command is `rlist` which displays remotely saved (uploaded or synchronized) snapshots:
```
schnapps rlist
schnapps rlist -j
```
The second command outputs the list as JSON for use in automation tools.

### Schnapps configuration

As meant in the above paragraphs, schnapps is configurable and some commands require the configuration to be
prepared before using them. There are those parameters:

* `keep.max_single` – maximum number of snapshots of the "single" type to be kept after cleaning
* `keep.max_time` – maximum number of snapshots of the "time" type to be kept after cleaning
* `keep.max_updater` – maximum number of snapshots of the "pre" and "post" types to be kept after cleaning
* `keep.max_rollback` – maximum number of snapshots of the "rollback" type to be kept after cleaning
* `remote.url` – URL for accessing the remote server
* `remote.path` – the directory path to be used for uploading and synchronizing snapshots
* `remote.user` – the user name to log in to the remote server
* `remote.password` – the password to log in to the remote server
* `encrypt.pass` – the password to be used for encryption

A real configuration file would look like this:

```
config keep 'keep'
        option max_single '-1'
        option max_time '5'
        option max_updater '5'
        option max_rollback '3'

config remote 'remote'
        option url 'nextcloud://my.nextcloud.server'
        option path '/turris/backups'
        option user 'myuser'
        option password 'mypassword'
        option sync_types 'single,time'

config encrypt 'encrypt'
        option pass 'mypassword'
```

This configuration means that "single" type snapshots are retained infinitely, last five "time" type snapshots are
kept, last five updater snapshots ("pre" and "post") and last three "rollback" snapshots. Remote synchronization
uses the given Nextcloud URL, path, user name and password; "single" and "time" snapshots are included in the
synchronization. Encrypted snapshots are encrypted using the given password.

### Another filesystem root

All the above paragraph assumed that schnapps work on the root file system (mounted to the VFS root or `/`). But
schnapps can work on other Btrfs file systems too. For example, you can connect your portable USB disk with Btrfs
to your Turris and use schnapps to work with snapshots on it the same way you managed the root file system ones.

If your file system is mounted on `/mnt/disk` you can create a snapshot by this command:
```
schnapps -d /mnt/disk create
```
Other commands can be used similarly.
