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
base()
{
apt install -y git vlc node-typescript gimp steam brave-browser firefox deluge piper
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
#pcloud
pcloud()
{
wget -P /home/$USER/Downloads/ "https://p-def1.pcloud.com/cBZLReAUjZLbsoWfZZZQ5FEa7Z2ZZ9WpZkZpOo5VZzFZtkZO0ZYXZ45Z37ZpVZY0Z3FZr5ZGFZh5ZVXZyVZtouTkZvvW0EDlH080uc9GPBMSznuNlk3V7/pcloud"
cd Downloads
chmod +x pcloud
./pcloud
}
#mega
mega()
{
wget -O /home/$USER/Downloads/mega.deb "https://mega.nz/linux/MEGAsync/xUbuntu_18.04/amd64/megasync-xUbuntu_18.04_amd64.deb"
cd Downloads
apt install ./mega.deb
}

#creating new directory for my stuff
create()
{
cd ~/Documents
mkdir pdf
mkdir Text
mkdir Spreadsheets
mkdir Presentation

cd ~/Videos
mkdir Music Videos
mkdir Movies
mkdir Others

cd ~/Pictures
mkdir Batwoman
mkdir Wallpapers
mkdir Others
}

#repo
#base
#qemu
#flatpak
#flatpak_apps
#amd1804
#amd1910
#pcloud
#mega
#create

#apt -y dist-upgrade
#reboot





