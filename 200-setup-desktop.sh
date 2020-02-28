#-------------------------------------------------------------------------------
#  Filename:    100-setup-desktop.sh
#
#  Description: Setup gnome how I like it. (Should be run as user with sudo
#		privilages)
#
#  Notes:    	Should only be run once yay is enabled by the previous
#               script.
#
#-------------------------------------------------------------------------------

# Setup Command line Utils -----------------------------------------------------
sudo pacman -S htop --needed --noconfirm
sudo pacman -S neofetch --needed --noconfirm

# Setup Gnome & Default Desktop ------------------------------------------------
sudo pacman -S gnome --needed --noconfirm
sudo pacman -S gnome-tweaks --needed --noconfirm
sudo pacman -R epiphany --noconfirm
sudo pacman -S evolution --needed --noconfirm
sudo pacman -S lollypop --needed --noconfirm
sudo pacman -S vlc --needed --noconfirm
sudo pacman -S gdm --needed --noconfirm
sudo pacman -S arc-gtk-theme --needed --noconfirm
sudo systemctl enable gdm
sudo systemctl set-default graphical.target

# Setup Cross Library Theming --------------------------------------------------
sudo pacman -S kvantum-qt5 --needed --noconfirm
sudo pacman -S qt5ct qt5-styleplugins --needed --noconfirm
echo "QT_QPA_PLATFORMTHEME=qt5ct" | sudo tee -a  /etc/environment

# Install Gnome tweaks and extensions ------------------------------------------
sudo pacman -R gnome-terminal --noconfirm
yay -S gnome-terminal-transparency --needed --noconfirm
yay -S folder-color-nautilus-bzr --needed --noconfirm
yay -S gnome-shell-extension-dash-to-panel --needed --noconfirm
yay -S gnome-shell-extension-arc-menu-git --needed --noconfirm
yay -S gnome-shell-extension-caffeine-git --needed --noconfirm
yay -S gnome-shell-extension-clipboard-indicator-git --needed --noconfirm
yay -S pamac --needed --nonconfirm

# Install Addiional Software --------------------------------------------------
yay -S brave-bin --needed --noconfirm
vay -S visual-studio-code-bin --needed --noconfirm
sudo pacman -S blender --needed --noconfirm
sudo pacman -S krita --needed --noconfirm
sudo pacman -S libreoffice-fresh --needed --noconfirm

# Setup the shell -------------------------------------------------------------
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
cd $ZPREZTODIR
git clone --recurse-submodules https://github.com/belak/prezto-contrib contrib
cd ~
echo "Please edit your .zpreztorc and restart the terminal."

