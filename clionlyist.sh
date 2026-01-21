echo 
echo "  ____ _     ___ ___  _   _ _  __   _____ ____ _____ "
echo " / ___| |   |_ _/ _ \| \ | | | \ \ / /_ _/ ___|_   _|"
echo "| |   | |    | | | | |  \| | |  \ V / | |\___ \ | |  "
echo "| |___| |___ | | |_| | |\  | |___| |  | | ___) || |  "
echo " \____|_____|___\___/|_| \_|_____|_| |___|____/ |_|  "
echo

sudo pacman -Syu --noconfirm

if pacman -Q zsh &> /dev/null; then
    echo "zsh is already installed. Skip ZSH process..."
else
    echo 
    echo " _________  _   _ "
    echo "|__  / ___|| | | |"
    echo "  / /\___ \| |_| |"
    echo " / /_ ___) |  _  |"
    echo "/____|____/|_| |_|"
    echo

    sudo pacman -Syu
    sudo pacman -S --noconfirm kitty zsh wget ttf-fira-code
    sudo chsh -s /bin/zsh d3f4l7
    sudo cat /etc/passwd | grep d3f4l7
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    wget -O ~/.oh-my-zsh/themes/kali-like.zsh-theme https://raw.githubusercontent.com/clamy54/kali-like-zsh-theme/master/kali-like.zsh-theme

    echo "Replace val of ZSH_THEME from robbyrussell to kali-like."
    echo "Also, do not forget exec kitty +list-fonts locally && sudo reboot"
    echo "autoinstall of zsh -- DONE"

    echo
    echo " ____  _____ ____   ___   ___ _____   _   _  _____        __"
    echo "|  _ \| ____| __ ) / _ \ / _ \_   _| | \ | |/ _ \ \      / /"
    echo "| |_) |  _| |  _ \| | | | | | || |   |  \| | | | \ \ /\ / / "
    echo "|  _ <| |___| |_) | |_| | |_| || |   | |\  | |_| |\ V  V /  "
    echo "|_| \_\_____|____/ \___/ \___/ |_|   |_| \_|\___/  \_/\_/   "
    echo
    exit
    
fi

if pacman -Q neovim &> /dev/null; then
    echo "neovim is already installed. Skip NvChad process..."
else
    echo
    echo " _   ___     ______ "
    echo "| \ | \ \   / / ___|"
    echo "|  \| |\ \ / / |    "
    echo "| |\  | \ V /| |___ "
    echo "|_| \_|  \_/  \____|"
    echo

    sudo pacman -S --noconfirm neovim ttf-jetbrains-mono-nerd unzip
    git clone https://github.com/NvChad/starter ~/.config/nvim
    nvim
    
    echo "autoinstall of NvChad -- DONE"
fi

if ! command -v ghc &> /dev/null
then
    echo
    echo " _   _    _    ____  "
    echo "| | | |  / \  / ___| "
    echo "| |_| | / _ \ \___ \ "
    echo "|  _  |/ ___ \ ___) |"
    echo "|_| |_/_/   \_\____/ "
    echo

    echo "DYYAYY"
    curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh

else
    echo "exec "$SHELL" manually"
    echo "source ~/.zshrc"
    echo "Haskell is already installed. Skip HAS process..."
    ghc --version
    which haskell-language-server-wrapper
fi

if pacman -Q python-pip &> /dev/null; then
    echo "python-pip is already installed. Skip PY process..."
    echo "pyenv install 3.10 (3.10.19)"
    echo "pyenv local 3.10.19"
    echo "pyenv global 3.10.19"
    echo "pyenv virtualenv 3.10.19 venv10"
    echo "pyenv local venv10"
else
    echo
    echo " ______   __"
    echo "|  _ \ \ / /"
    echo "| |_) \ V / "
    echo "|  __/ | |  "
    echo "|_|    |_|  "
    echo  

    sudo pacman -S --noconfirm python python-pip tk
    rm -rf  ~/.pyenv
    curl -fsSL https://pyenv.run | zsh
    echo >> ~/.zshrc
    echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
    echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin: $PATH"' >> ~/.zshrc
    echo 'eval "$(pyenv init - zsh)"' >> ~/.zshrc
    echo "exec "$SHELL" manually"
    rm -rf  ~/.pyenv/plugins/pyenv-virtualenv
    git clone https://github.com/pyenv/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv
    echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.zshrc
    echo "exec "$SHELL" manually"

    echo "autoinstall of Python -- DONE"
fi

if pacman -Q cups &> /dev/null; then
    echo "cups is already installed. Skip CUPS process..."
else
    echo
    echo "   ____ _   _ ____  ____  "
    echo "  / ___| | | |  _ \/ ___| "
    echo " | |   | | | | |_) \___ \ "
    echo " | |___| |_| |  __/ ___) |"
    echo "  \____|\___/|_|   |____/ "
    echo

    sudo pacman -S --noconfirm cups libxml2-legacy
    sudo systemctl start cups
    sudo systemctl enable cups

    echo "autoinstall of cups -- DONE"
fi

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
    sudo pacman -U --noconfirm ~/.config/d3f4l7d/nvidia/gcc12-12.3.0-6-x86_64.pkg.tar.zst ~/.config/d3f4l7d/nvidia/gcc12-libs-12.3.0-6-x86_64.pkg.tar.zst ~/.config/d3f4l7d/nvidia/cuda-12.3.2-1-x86_64.pkg.tar.zst ~/.config/d3f4l7d/nvidia/cudnn-8.9.7.29-1-x86_64.pkg.tar.zst
    echo 'export PATH="/opt/cuda/bin:$PATH"' >> ~/.zshrc
    echo 'export CUDA_HOME="/opt/cuda"' >> ~/.zshrc

    echo "sudo vim /etc/pacman.conf"
    echo "IgnorePkg = nvidia-open-dkms dkms cuda cudnn gcc12 gcc12-libs"
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
