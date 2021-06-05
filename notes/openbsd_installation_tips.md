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
<del>First boot after installation, `rc` runs **and then, deletes** the
`rc.firsttime` script. So, you can't find what that script contained. Sorry.</del>

To see the contents of `rc.firsttime`, reboot into the USB used to install
OpenBSD, and select **`(U)pgrade`**. Now -

- Select keyboard layout
- Select the disk where you installed OpenBSD

The screen should now show something like this -

<pre><samp>
Choose your keyboard layout ('?' or 'L' for list) [default] us
Which disk is the root disk? ('?' for details) [sd1] ?
Checking root filesystem (fsck -fp /dev/sd1a)... OK
Checking root filesystem (mount -o ro /dev/sd1a /mnt)... OK
</samp></pre>

Notice the last line? Yes, the drive has been mounted for us.  
Now, press `^C` (`ctrl`+`C`) to drop into a shell.

##### To see the contents of `rc.firsttime` -
```
less /mnt/etc/rc.firsttime
```


<br>

Don't worry if some of the firmware updates couldn't be installed while
rc.firsttime was running. Firmwares can be installed later.

## After installation

### First and foremost
`syspatch`, and then reboot if prompted to.

### Install firmwares
`fw_update` to install the neseccary firmware, then reboot to make the kernel
use the installed firmware.

### Enjoy!
Enjoy your freshly-minted OpenBSD installation.


# Re-installing OpenBSD
## Why
There can be many reasons to re-install OpenBSD. In my case, it was a
kernel-compiled driver that wasn't working properly. To be precise, the
`azalia(4)` driver wasn't detecting my headphone DAC, as a result of which, the
headphone jack wasn't working even after many reboots.

## How
To re-install OpenBSD base and kernel, boot into the installation medium of
your current OpenBSD release, choose **`(U)pgrade`** and follow the
instructions (ie. answer the questions). When prompted to install the sets,
install the sets corresponding to your current release.

## Done!
Enjoy!
