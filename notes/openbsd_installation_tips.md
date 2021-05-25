# NOTE
This guide assumes you are using the full image that **contains the sets**  
Also, this guide was written for OpenBSD 6.9

## Installing the sets
```
Let's install the sets!
Location of sets? (disk http nfs or 'done') [http] disk
Is the disk partition already mounter? [yes] no
Available disks are: sd0 sd1 sd2
Which disk contains the install media? (or 'done') [sd0] sd2
```

**NOTE:** I selected `sd2` because that's what my USB drive was recognized as.
Your mileage may vary.

I knew that my USB drive was `sd2` because, at the time when the installer asks
you to select the disk where OpenBSD shall be installed, you can enter `?` for
more information about the disks. I did that, and saw that `sd0` was my NVMe
drive (for Windows) and `sd1` was my SATA SSD (for OpenBSD), and that `sd2` was
my HP v232w (i.e. the USB drive)

Let's continue -

```
Which disk contains the install media? (or 'done') [sd0] sd2
  a:          1358848             1024  4.2BSD   2048 16384 16142
  b:              960               64   MSDOS
Available sd2 partitions are: a i.
Which sd2 partition contains the install sets? (or 'done') [a] a
Pathname to the sets? (or 'done') [6.9/amd64]
```

And, you should be good!


## About that `rc.firsttime` thing...
First boot after installation, `rc` runs **and then, deletes** the
`rc.firsttime` script. So, you can't find what that script contained. Sorry.

It is recommended that your ethernet connection is setup during the
installation, because `rc.firsttime` does a lot of internet-related tasks.

Don't worry if some of the firmware updates couldn't be installed while
rc.firsttime was running. Firmwares can be installed later.

## After installation

### First and foremost
`syspatch`, and then reboot if prompted to.

### Install firmwares
`fw_update` to install the neseccary firmware, then reboot to make the kernel
use the installed firmware.

### Enjoy!
your freshly-minted OpenBSD installation.
