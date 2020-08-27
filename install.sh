#adding third party repository
repo()
{
apt install -y apt-transport-https curl software-properties-common
curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list

#add-apt-repository ppa:philip.scott/elementary-tweaks

apt update
}
#installing basic apps
basic()
{
apt install -y git vlc node-typescript gimp steam brave-browser firefox deluge piper timeshift
#apt install -y chrome-gnome-shell
#apt install -y lightdm
#apt install -y gnome-tweaks
#apt install -y elementary-tweaks gdebi
}

#installing virtual manager
qemu()
{
apt install qemu-kvm libvirt-clients libvirt-daemon-system bridge-utils libguestfs-tools genisoimage virtinst libosinfo-bin virt-manager
adduser $USER libvirt
adduser $USER libvirt-qemu
}

#adding flatpak support
flatpak()
{
apt install flatpak
#apt install gnome-software-plugin-flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
}

#installing flatpak apps
flatpak_apps()
{
flatpak install flathub org.kde.elisa
flatpak install flathub io.github.celluloid_player.Celluloid
flatpak install flathub com.wps.Office
}

#updating amd gpu drivers and 32 bit support for 18.04
amd1804()
{
add-apt-repository ppa:kisak/kisak-mesa
dpkg --add-architecture i386
apt -y update
apt -y upgrade
apt install -y libgl1-mesa-glx:i386 libgl1-mesa-dri:i386
apt install -y mesa-vulkan-drivers mesa-vulkan-drivers:i386
}

#adding amd gpu drivers and 32 bit support for 19.10 and above.
amd1910()
{
dpkg --add-architecture i386 
apt -y update
apt install -y libgl1-mesa-dri:i386
apt install -y mesa-vulkan-drivers mesa-vulkan-drivers:i386
}
#installing pcloud
pcloud()
{
wget -P /home/$USER/Downloads/ "https://p-def4.pcloud.com/cBZxtfsXBZ3FFf0sZZZA5dW37Z2ZZ0SJZkZ9G8FVZbZi7ZIFZz5ZXVZa0ZxJZlFZzXZppZB0ZP7ZAJZV7ZM0dakZMop8645UuVHs8nCMDv3sNH8LgVFX/pcloud"
cd Downloads
chmod +x pcloud
./pcloud
}


#repo
#basic
#qemu
#flatpak
#flatpak_apps
#amd1804
#amd1910
#pcloud


apt -y dist-upgrade
reboot





