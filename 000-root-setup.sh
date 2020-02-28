################################################################################
#
# My Install Script for Vanilla Arch 
#
################################################################################

# Setup Time Zone
ln -sf /usr/share/zoneinfo/Europe/London /etc/localtime
hwclock --systohc
echo "en_GB.UTF-8 UTF-8" >> /etc/locale.gen
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
touch /etc/locale.conf

# Setup Localization
echo "LANG=en_GB.UTF-8" >> /etc/locale.conf
touch /etc/vconsole.conf
echo "KEYMAP=uk" >> /etc/vconsole.conf

# Setup Networking
read -p "Please enter a Hostname: " host
touch /etc/hostname
echo $host >> /etc/hostname
touch /etc/hosts
echo "127.0.0.1	localhost" >> /etc/hosts
echo "::1	localhost" >> /etc/hosts
echo 127.0.1.1	$host.localdomain	$host >> /etc/hosts
systemctl enable dhcpcd

echo Please create a new root password:
passwd

echo "Please Create a admin account"
read -p "Username: " user_name
read -p "Full name: " full_name
useradd -m -s /bin/zsh -c $full_name -G wheel $user_name
passwd $user_name

