if pacman -Q nvidia-open-dkms &> /dev/null; then
    echo "nvidia-open-dkms is already installed. Skip NVD process..."
else
    echo
    echo " _   ___     ______  "
    echo "| \ | \ \   / /  _ \ "
    echo "|  \| |\ \ / /| | | |"
    echo "| |\  | \ V / | |_| |"
    echo "|_| \_|  \_/  |____/ "
    echo

    echo "[WARNING] systemd bootloader required!!!"

    sudo pacman -S --noconfirm nvidia-open-dkms nvidia-settings
    echo "lspci -k -d ::03xx && nvidia-smi"
    echo "switch Kernel driver in use: nouveau to nvidia"
    echo "also switch Kernel modules: nouveau to nouveau, nvidia_drm, nvidia"
    echo "In the end, if you could see nvidia-smi, it works!"
    mkdir ~/.config/d3f4l7d/nvidia
    wget -O ~/.config/d3f4l7d/nvidia/gcc12-12.3.0-6-x86_64.pkg.tar.zst https://archive.archlinux.org/packages/g/gcc12/gcc12-12.3.0-6-x86_64.pkg.tar.zst
    wget -O ~/.config/d3f4l7d/nvidia/gcc12-libs-12.3.0-6-x86_64.pkg.tar.zst https://archive.archlinux.org/packages/g/gcc12-libs/gcc12-libs-12.3.0-6-x86_64.pkg.tar.zst
    wget -O ~/.config/d3f4l7d/nvidia/cuda-12.3.2-1-x86_64.pkg.tar.zst https://archive.archlinux.org/packages/c/cuda/cuda-12.3.2-1-x86_64.pkg.tar.zst
    wget -O ~/.config/d3f4l7d/nvidia/cudnn-8.9.7.29-1-x86_64.pkg.tar.zst https://archive.archlinux.org/packages/c/cudnn/cudnn-8.9.7.29-1-x86_64.pkg.tar.zst
    sudo pacman -U ~/.config/d3f4l7d/nvidia/gcc12-12.3.0-6-x86_64.pkg.tar.zst ~/.config/d3f4l7d/nvidia/gcc12-libs-12.3.0-6-x86_64.pkg.tar.zst ~/.config/d3f4l7d/nvidia/cuda-12.3.2-1-x86_64.pkg.tar.zst ~/.config/d3f4l7d/nvidia/cudnn-8.9.7.29-1-x86_64.pkg.tar.zst
    echo 'export PATH="/opt/cuda/bin:$PATH"' >> ~/.zshrc
    echo 'export CUDA_HOME="/opt/cuda"' >> ~/.zshrc

    echo "sudo vim /etc/pacman.conf"
    echo "IgnorePkg = gcc12 gcc12-libs cuda cudnn"
    echo "sudo vim /etc/mkinitcpio.conf"
    echo "remove kms hook"
    echo "HOOKS=(base udev autodetect microcode modconf keyboard keymap consolefont block filesystems fsck)"
    echo "sudo mkinitcpio -P"
    echo "sudo vim /etc/mkinitcpio.conf"
    echo "MODULES=(nvidia nvidia_modeset nvidia_uvm nvidia_drm)"
    echo "sudo mkinitcpio -P"
    echo "sudo reboot"

    echo "autoinstall of Nvidia -- DONE"
fi
