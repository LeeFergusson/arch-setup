sudo pacman -S gnome --needed --noconfirm
sudo pacman -R gnome-terminal
sudo pacman -R epiphany
sudo pacman -S evolution
sudo pacman -S gdm --needed --noconfirm
sudo pacman -S arc-gtk-theme --needed --noconfirm
sudo pacman -S kvantum-qt5 --needed --noconfirm
sudo pacman -S qt5ct qt5-styleplugins --needed --noconfirm
echo "QT_QPA_PLATFORMTHEME=qt5ct" >> sudo /etc/environment
yay -S gnome-terminal-transparency --needed --noconfirm
yay -S brave-bin --needed --noconfirm
yay -S folder-color-nautilus-bzr --needed --noconfirm
yay -S gnome-shell-extension-dash-to-panel --needed --noconfirm
yay -S gnome-shell-extension-arc-menu-git --needed --noconfirm
yay -S gnome-shell-extension-caffeine-git --needed --noconfirm
yay -S gnome-shell-extension-clipboard-indicator-git --needed --noconfirm
sudo systemctl enable gdm --needed --noconfirm
sudo systemctl set-default graphical.target

