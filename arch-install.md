# Minimal Installation of Arch Linux

This document outlines the steps for a minimal installation of Arch Linux or just use `archinstall` command.

## Live System

1. **Set Font Size**

   ```bash
   setfont ter-132n
   ```

2. **Check IP Addresses**

   ```bash
   ip -c q      # Lists all IP addresses
   ip -c a      # Lists all network interfaces
   ```

3. **Connect via WiFi**

   ```bash
   iwctl        # Enter IWD's tool (Internet Wireless Control Utility)
   device list  # List available network devices
   station <device_name> get-networks  # List networks
   station <device_name> connect <Wifi_name>  # Connect and prompt for password
   ```

4. **Check Internet Connectivity**

   ```bash
   ping google.com
   ```

5. **Verify EFI Boot**

   ```bash
   ls /sys/firmware/efi/efivars  # True if results are displayed
   ```

6. **Check Time Settings**

   ```bash
   timedatectl status              # Displays device time info
   timedatectl list-timezones      # Lists all timezones
   timedatectl set-timezone Asia/Kathmandu  # Set timezone
   ```

7. **List Drives**

   ```bash
   lsblk         # Lists all drives
   fdisk -l      # Detailed info about drives
   ```

8. **Partition the Disk**

   ```bash
   cfdisk /dev/nvme0n1  # Enter disk partitioning mode
   # Create partitions for home, root, and swap.
   ```

9. **Format the Drives**

   ```bash
   mkfs.ext4 /dev/nvme0n1p6  # Format home partition
   mkfs.ext4 /dev/nvme0n1p7  # Format root partition
   mkswap /dev/nvme0n1p8     # Format swap partition
   swapon /dev/nvme0n1p8     # Enable swap partition
   ```

10. **Mount the Drives**

    ```bash
    mount /dev/nvme0n1p7 /mnt  # Mount root drive
    mkdir /mnt/home             # Create home directory
    mount /dev/nvme0n1p6 /mnt/home  # Mount home drive
    ```

11. **Update Package Database**

    ```bash
    pacman -Sy
    pacman -S pacman-contrib  # Install rank mirror tool
    ```

12. **Backup Mirror List and Update**

    ```bash
    cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
    rankmirrors -n 10 /etc/pacman.d/mirrorlist.bak > /etc/pacman.d/mirrorlist
    ```

13. **Install Arch Linux Base System**

    ```bash
    pacstrap -i /mnt base base-devel linux linux-lts linux-headers linux-firmware intel-ucode sudo nano vim git networkmanager dhcpcd
    ```

14. **Generate File System Table**

    ```bash
    genfstab -U /mnt >> /mnt/etc/fstab
    cat /mnt/etc/fstab  # List file system table
    ```

15. **Change Root**

    ```bash
    arch-chroot /mnt
    ```

## Inside System Root

1. **Set Root Password**

   ```bash
   passwd
   ```

2. **Add a New User**

   ```bash
   useradd -m <username>  # Add user
   passwd <username>  # Set user password
   usermod -aG wheel,storage,power <username>  # Add user to groups
   ```

3. **Edit Sudoers File**

   ```bash
   visudo  # Uncomment %wheel ALL=(ALL) ALL
   ```

4. **Generate Locale**

   ```bash
   vim /etc/locale.gen  # Uncomment en_US.UTF-8 UTF-8
   locale-gen
   echo LANG=en_US.UTF-8 > /etc/locale.conf
   export LANG=en_US.UTF-8
   ```

5. **Set Hostname**

   ```bash
   echo arch > /etc/hostname
   vim /etc/hosts
   # Add the following lines:
   # 127.0.0.1 localhost
   # ::1 localhost
   # 127.0.1.1 arch.localdomain arch
   ```

6. **Set Timezone**

   ```bash
   ln -sf /usr/share/zoneinfo/Asia/Kathmandu /etc/localtime
   hwclock --systohc
   ```

7. **Create EFI Boot Directory and Mount**

   ```bash
   mkdir /boot/efi
   mount /dev/nvme0n1p1 /boot/efi/
   ```

8. **Install GRUB**

   ```bash
   pacman -S grub efibootmgr dosfstools mtools os-prober
   vim /etc/default/grub  # Uncomment GRUB_DISABLE_OS_PROBER=false and set GRUB_GFXMODE= 2256x1269
   grub-install --target=x86_64-efi --bootloader-id=grub_uefi --recheck
   grub-mkconfig -o /boot/grub/grub.cfg
   ```

9. **Enable Network Services**

   ```bash
   systemctl enable dhcpcd.service
   systemctl enable NetworkManager.service
   ```

10. **Exit Chroot**

    ```bash
    exit
    ```

## Back to Live System

1. **Unmount All Drives**

   ```bash
   umount -lR /mnt
   ```

2. **Reboot System**

   ```bash
   reboot
   ```

---

This guide provides a straightforward method to install Arch Linux. Make sure to adapt partitioning and configurations according to your specific requirements.
