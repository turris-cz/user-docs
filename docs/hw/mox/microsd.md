# Preparation of microSD card for Turris MOX

If your Turris MOX A is connected to the Internet, you can insert the microSD card into it and choose
[rescue mode number 6](/hw-spec/mox/mox_rescue_modes/) when starting the router. Turris MOX will download the latest image from the Internet, create a partition if there is not, format your microSD card to the Btrfs filesystem to be able to use snapshots. They can be useful when you plan to make major changes to the system. See schnapps, which is a tool for managing snapshots.

If you don't like the previous option - flashing from the cloud, you can download the [image](https://repo.turris.cz/hbs/medkit/) and save it to your microSD card or any USB drive. There is no need to extract it and make sure that the external storage has partition and it should be formatted to Btrfs to enjoy its advantages - snapshots. You can also use any other file system like EXT4 and use [rescue mode number 4](/hw-spec/mox/mox_rescue_modes/), which boots from the microSD card or USB drive.
