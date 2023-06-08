# zfs set fot int cloud dell servers


### create partition table for rpool on disk
#### all make in root user

## **Create partition table on second disk**

```apt install dosfstools

fdisk -l /dev/sdi
Device       Start       End   Sectors   Size Type
/dev/sdi1     2048    249855    247808   121M EFI System
/dev/sdi2   249856   4155391   3905536   1,9G Linux filesystem
/dev/sdi3  4155392 585936895 581781504 277,4G Solaris /usr & Apple ZFS

mkdir -p /mnt/zpool
zpool create -o ashift=12 -o altroot=/mnt/zpool -O relatime=off -O atime=off -O canmount=off -O compression=lz4 -O xattr=sa -O normalization=formD -O acltype=posixacl -m none -f rpool /dev/sdi3

mkfs.vfat /dev/sdi1
mkfs.ext4 /dev/sdi2

zfs create -o mountpoint=/ rpool/debian
zfs create -o setuid=off -o mountpoint=/home rpool/debian/home
zfs create -V 8G -b $(getconf PAGESIZE) -o logbias=throughput -o sync=always -o primarycache=metadata -o secondarycache=none -o com.sun:auto-snapshot=false -o compression=zle rpool/debian/swap0
mkswap /dev/zvol/rpool/debian/swap0
```

## **Create mount points**

```
mkdir -p /mnt/zpool/boot
mount /dev/sdi2 /mnt/zpool/boot/
mkdir -p /mnt/zpool/boot/efi
mount /dev/sdi1 /mnt/zpool/boot/efi/
mkdir /mnt/root
lvcreate -s -n root_snap -L2500M /dev/vg0/root
mount /dev/vg0/root_snap /mnt/root/
mount /dev/sda2 /mnt/root/boot
mount /dev/sda1 /mnt/root/boot/efi/
```

## **Copy all file from root old disk to new disk**

```
rsync -ayPX /mnt/root/* /mnt/zpool/
```
## **Umount old partition**
```
umount  /mnt/root/boot/efi 
umount  /mnt/root/boot/
umount  /mnt/root
lvremove /dev/vg0/root_snap
```

## **Bind sys proc dev**

```
mkdir /mnt/zpool/run/udev
mount -t proc none /mnt/zpool/proc
mount --rbind /sys /mnt/zpool/sys
mount --rbind /dev /mnt/zpool/dev
mount --rbind /run/udev /mnt/zpool/run/udev
chroot /mnt/zpool /bin/bash
```

## **Edit fstab, add new uuid boot and efi partition**

```
vim /etc/fstab 
blkid /dev/sdh1
/dev/sdh1: SEC_TYPE="msdos" UUID="7C27-8376" BLOCK_SIZE="512" TYPE="vfat" PARTUUID="5d7017f1-a57a-d848-b799-ab1d213730f4"
vim /etc/fstab 
blkid /dev/sdh2
/dev/sdh2: UUID="aca87fa8-9993-4080-9e7e-8e7851b5bd5d" BLOCK_SIZE="4096" TYPE="ext4" PARTUUID="73919b8f-6973-4843-ac86-dbf335778118"
vim /etc/fstab 
cat > /etc/fstab <<EOT
# /etc/fstab: static file system information.
#
# Use 'blkid' to print the universally unique identifier for a
# device; this may be used with UUID= as a more robust way to name devices
# that works even if disks are added and removed. See fstab(5).
#
# systemd generates mount units based on this file, see systemd.mount(5).
# Please run 'systemctl daemon-reload' after making changes here.
#
# <file system> <mount point>   <type>  <options>       <dump>  <pass>
/dev/mapper/vg0-root /               ext4    errors=remount-ro 0       1
# /boot was on /dev/sdb2 during installation
UUID=aca87fa8-9993-4080-9e7e-8e7851b5bd5d /boot           ext4    defaults        0       2
# /boot/efi was on /dev/sdb1 during installation
UUID=7C27-8376 /boot/efi       vfat    umask=0077      0       1
/dev/sr0        /media/cdrom0   udf,iso9660 user,noauto     0       0
/dev/zvol/rpool/debian/swap0	none swap sw	0	0
EOT
```

## **Install grub on new disk and update grub, initrams**

```
update-initramfs -u -k all
grub-install
update-grub
exit
```

## **Reboot system**

```
reboot
```
#### **after reboot system you need delete lvm partition and add this partition on mirror zpool**

```
zpool attach test_pool /dev/sdX3 /dev/sdi3
```
