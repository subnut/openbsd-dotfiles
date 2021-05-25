Check the available drives using `hw.disknames`

eg- (here, `sd0`, `sd1`, `sd2` are the available disks)
<samp>
openpad$ sysctl hw.disknames
hw.disknames=sd0:,sd1:bb709196652dc406,sd2:
</samp>

Now, to check which drive you are finding, use `fdisk` to see the partition
table of that drive -

<samp>
openpad# fdisk sd0
Disk: sd0       Usable LBA: 34 to 2000409230 [2000409264 Sectors]
   #: type                                 [       start:         size ]
------------------------------------------------------------------------
   0: Win Recovery                         [        2048:      1083392 ]
   1: EFI Sys                              [     1085440:       204800 ]
   2: e3c9e316-0b5c-4db8-817d-f92df00215ae [     1290240:        32768 ]
   3: FAT12                                [     1323008:    587100160 ]
   4: FAT12                                [   588423168:    844367872 ]
</samp>

When you are convinced that you have selected the correct drive, check the
partition letter using the `disklabel -h` command -

<samp>
openpad# disklabel -h sd0
# /dev/rsd0c:
type: SCSI
disk: SCSI disk
label: Sabrent         
duid: 0000000000000000
flags:
bytes/sector: 512
sectors/track: 63
tracks/cylinder: 255
sectors/cylinder: 16065
cylinders: 124519
total sectors: 2000409264 # total bytes: 976762.3M
boundstart: 0
boundend: 2000409264
drivedata: 0 

16 partitions:
#                size           offset  fstype [fsize bsize   cpg]
  c:        976762.3M                0  unused                    
  i:           529.0M             2048 unknown                    
  j:           100.0M          1085440   MSDOS                    
  k:            16.0M          1290240 unknown                    
  l:        286670.0M          1323008   MSDOS                    
  m:        412289.0M        588423168   MSDOS                    
</samp>

Say, you want to mount the last partion. The partion you shall use while
mounting shall be `sd0m`
