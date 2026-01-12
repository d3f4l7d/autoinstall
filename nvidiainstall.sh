echo
echo " _   ___     _____ ____ ___    _    ___ _   _ ____ _____  _    _     _     "
echo "| \ | \ \   / /_ _|  _ \_ _|  / \  |_ _| \ | / ___|_   _|/ \  | |   | |    "
echo "|  \| |\ \ / / | || | | | |  / _ \  | ||  \| \___ \ | | / _ \ | |   | |    "
echo "| |\  | \ V /  | || |_| | | / ___ \ | || |\  |___) || |/ ___ \| |___| |___ "
echo "|_| \_|  \_/  |___|____/___/_/   \_\___|_| \_|____/ |_/_/   \_\_____|_____|"
echo

echo "This script is tested && worked w/ Nvidia GeForce RTX4090 (AD102) on MSI motherboard (bootloader: systemd)"

sudo pacman -Syu --noconfirm

sudo pacman -S linux-firmware-nvidia nvidia-open-dkms nvidia-settings nvidia-utils opencl-nvidia nvtop nvhpc dkms xorg-server xorg-xinit
mkdir ~/.config/gcc12
mkdir ~/.config/cuda
mkdir ~/.config/cudnn
wget -O ~/.config/gcc12/gcc12-12.3.0-6-x86_64.pkg.tar.zst https://archive.archlinux.org/packages/g/gcc12/gcc12-12.3.0-6-x86_64.pkg.tar.zst
wget -O ~/.config/gcc12/gcc12-libs-12.3.0-6-x86_64.pkg.tar.zst https://archive.archlinux.org/packages/g/gcc12-libs/gcc12-libs-12.3.0-6-x86_64.pkg.tar.zst
wget -O ~/.config/cuda/cuda-12.3.2-1-x86_64.pkg.tar.zst https://archive.archlinux.org/packages/c/cuda/cuda-12.3.2-1-x86_64.pkg.tar.zst
wget -O ~/.config/cudnn/cudnn-8.9.7.29-1-x86_64.pkg.tar.zst https://archive.archlinux.org/packages/c/cudnn/cudnn-8.9.7.29-1-x86_64.pkg.tar.zst
cd ~/.config/gcc12
sudo pacman -U gcc12-12.3.0-6-x86_64.pkg.tar.zst  gcc12-libs-12.3.0-6-x86_64.pkg.tar.zst
cd ~/.config/cuda
sudo pacman -U cuda-12.3.2-1-x86_64.pkg.tar.zst
cd ~/.config/cudnn
sudo pacman -U cudnn-8.9.7.29-1-x86_64.pkg.tar.zst
cd
echo 'export PATH="/opt/cuda/bin:$PATH"' >> ~/.zshrc
echo 'export CUDA_HOME="/opt/cuda"' >> ~/.zshrc

echo "sudo vim /etc/pacman.conf"
echo "Edit below line:"
echo "IgnorePkg = cuda cudnn"
echo "sudo vim /etc/mkinitcpio.conf"
echo "Edit below lines:"
echo "MODULES=(nvidia nvidia_modeset nvidia_uvm nvidia_drm)"
echo "HOOKS=(base udev autodetect microcode modconf keyboard keymap consolefont block filesystems fsck)"
echo "sudo mkinitcpio -P"
echo "sudo reboot"
echo "lspci -k -d ::03xx && nvidia-smi"

echo "autoinstall of Nvidia -- DONE"
