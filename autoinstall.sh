echo 
echo "    _   _   _ _____ ___ ___ _   _ ____ _____  _    _     _     "
echo "   / \ | | | |_   _/ _ \_ _| \ | / ___|_   _|/ \  | |   | |    "
echo "  / _ \| | | | | || | | | ||  \| \___ \ | | / _ \ | |   | |    "
echo " / ___ \ |_| | | || |_| | || |\  |___) || |/ ___ \| |___| |___ "
echo "/_/   \_\___/  |_| \___/___|_| \_|____/ |_/_/   \_\_____|_____|"
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
    sudo pacman -S kitty zsh ttf-fira-code wget
    sudo chsh -s /bin/zsh d3f4l7d
    sudo cat /etc/passwd | grep d3f4l7d
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
    break
fi

if pacman -Q neovim &> /dev/null; then
    echo "neovim is already installed. Skip NvChad process..."
else
    echo
    echo " _   _        ____ _               _ "
    echo "| \ | |_   __/ ___| |__   __ _  __| |"
    echo "|  \| \ \ / / |   | '_ \ / _` |/ _` |"
    echo "| |\  |\ V /| |___| | | | (_| | (_| |"
    echo "|_| \_| \_/  \____|_| |_|\__,_|\__,_|"
    echo

    sudo pacman -S neovim ttf-jetbrains-mono-nerd unzip
    git clone https://github.com/NvChad/starter ~/.config/nvim

    echo "Do not forget install the lua files manually"
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
    echo "pyenv virtualenv 3.10.19 venv10"
else
    echo
    echo " ______   __"
    echo "|  _ \ \ / /"
    echo "| |_) \ V / "
    echo "|  __/ | |  "
    echo "|_|    |_|  "
    echo  

    sudo pacman -S python python-pip tk
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

if [ ! -f ~/.local/share/AppImage/arduino-ide_2.3.7_Linux_64bit.AppImage ]; then
    echo "Arduino AppImage (ver. 2.3.7) not found!"
    echo
    echo " ___ _   _  ___  "
    echo "|_ _| \ | |/ _ \ "
    echo " | ||  \| | | | |"
    echo " | || |\  | |_| |"
    echo "|___|_| \_|\___/ "
    echo

    sudo pacman -S fuse
    mkdir -p ~/.local/share/AppImage
    wget -O ~/.local/share/AppImage/arduino-ide_2.3.7_Linux_64bit.AppImage https://github.com/arduino/arduino-ide/releases/download/2.3.7/arduino-ide_2.3.7_Linux_64bit.AppImage 
    chmod +x ~/.local/share/AppImage/arduino-ide_2.3.7_Linux_64bit.AppImage
    mkdir -p ~/.local/share/application
    mkdir -p ~/.local/share/icon
    wget -O ~/.local/share/iconE/ArduinoCommunityLogo-up.png https://github.com/d3f4l7d/autoinstall/tree/main/icon/ArduinoCommunityLogo-up.png
    sudo usermod -a -G uucp d3f4l7d

    echo "Create App Interface (ArduinoProIDE) in ~/.local/share/application/arduino-ide_2.3.7_Linux_64bit.desktop"
    echo "[Desktop Entry]"
    echo "Name=ArduinoProIDE"
    echo "Exec=~/.local/share/AppImage/arduino-ide_2.3.7_Linux_64bit.AppImage %u"
    echo "Icon=~/.local/share/icon/ArduinoCommunityLogo-up.png"
    echo "Type=Application"
    echo "Categories=Development;"
    echo "StartupNotify=false"
    echo "Terminal=false"
    echo "Keywords=clang;ide;"
    echo "update-desktop-database ~/.local/share/application"

    echo "Create inod.desktop in /etc/xdg/autostart for autostart."
    echo "[Desktop Entry]"
    echo "Name=inod"
    echo "Exec=~/.local/share/AppImage/arduino-ide_2.3.7_Linux_64bit.AppImage"
    echo "Type=Application"
    echo "Terminal=false"
    echo "autoinstall of Arduino -- DONE"
else
    echo "Arduino is already installed. Skip INO process..."
fi

if pacman -Q ibus &> /dev/null; then
    echo "ibus is already installed. Skip IBUS process..."
else
    echo
    echo " ___ ____  _   _ ____  "
    echo "|_ _| __ )| | | / ___| "
    echo " | ||  _ \| | | \___ \ "
    echo " | || |_) | |_| |___) |"
    echo "|___|____/ \___/|____/ "
    echo

    sudo pacman -Sy ibus ibus-anthy noto-fonts-cjk
    echo 'export GTK_IM_MODULE=ibus' >> ~/.zshrc
    echo 'export GT_IM_MODULE=ibus' >> ~/.zshrc
    echo 'export XMODIFIERS=@im=ibus' >> ~/.zshrc

    echo "Create ibusd.desktop in /etc/xdg/autostart for autostart."
    echo "[Desktop Entry]"
    echo "Name=ibusd"
    echo "Exec=ibus-daemon -rxRd"
    echo "Type=Application"
    echo "Terminal=false"
    echo "Encoding=UTF-8"
    echo "autoinstall of ibus -- DONE"
fi

if pacman -Q bluez &> /dev/null; then
    echo "bluez is already installed. Skip BLUE process..."
else
    echo
    echo "  ____  _    _   _ _____ "
    echo " | __ )| |  | | | | ____|"
    echo " |  _ \| |  | | | |  _|  "
    echo " | |_) | |__| |_| | |___ "
    echo " |____/|_____\___/|_____|"
    echo

    sudo pacman -S bluez bluez-utils blueman pipewire-pulse pavucontrol
    sudo systemctl start bluetooth.service
    sudo systemctl enable bluetooth.service

    echo "Uncomment #AutoEnable=true in /etc/bluetooth/main.conf"
    echo "autoinstall of bluetooth -- DONE"
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

    sudo pacman -S cups libxml2-legacy
    sudo systemctl start cups
    sudo systemctl enable cups

    echo "autoinstall of cups -- DONE"
fi

if pacman -Q gvfs &> /dev/null; then
    echo "gvfs is already installed. Skip GVFS process..."
else
    echo
    echo "  ______     _______ ____  "
    echo " / ___\ \   / /  ___/ ___| "
    echo "| |  _ \ \ / /| |_  \___ \ "
    echo "| |_| | \ V / |  _|  ___) |"
    echo " \____|  \_/  |_|   |____/ "
    echo

    sudo pacman -S gvfs gvfs-mtp gnome-disk-utility gnome-keyring gvfs-smb samba evince

    echo "autoinstall of mgr -- DONE"
fi

echo
echo " _   _ _____ ____  _____  __        _______    ____  ___  "
echo "| | | | ____|  _ \| ____| \ \      / / ____|  / ___|/ _ \ "
echo "| |_| |  _| | |_) |  _|    \ \ /\ / /|  _|   | |  _| | | |"
echo "|  _  | |___|  _ <| |___    \ V  V / | |___  | |_| | |_| |"
echo "|_| |_|_____|_| \_\_____|    \_/\_/  |_____|  \____|\___/ "
echo
