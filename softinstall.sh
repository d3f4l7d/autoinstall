echo
echo " ____   ___  _____ _____ ___ _   _ ____ _____  _    _     _     "
echo "/ ___| / _ \|  ___|_   _|_ _| \ | / ___|_   _|/ \  | |   | |    "
echo "\___ \| | | | |_    | |  | ||  \| \___ \ | | / _ \ | |   | |    "
echo " ___) | |_| |  _|   | |  | || |\  |___) || |/ ___ \| |___| |___ "
echo "|____/ \___/|_|     |_| |___|_| \_|____/ |_/_/   \_\_____|_____|"
echo

sudo pacman -Syu --noconfirm

if [ ! -f ~/.local/share/AppImage/arduino-ide_2.3.7_Linux_64bit.AppImage ]; then
    echo "Arduino AppImage (ver. 2.3.7) not found!"
    echo
    echo " ___ _   _  ___  "
    echo "|_ _| \ | |/ _ \ "
    echo " | ||  \| | | | |"
    echo " | || |\  | |_| |"
    echo "|___|_| \_|\___/ "
    echo

    sudo pacman -S --noconfirm fuse
    mkdir -p ~/.local/share/AppImage
    wget -O ~/.local/share/AppImage/arduino-ide_2.3.7_Linux_64bit.AppImage https://github.com/arduino/arduino-ide/releases/download/2.3.7/arduino-ide_2.3.7_Linux_64bit.AppImage 
    chmod +x ~/.local/share/AppImage/arduino-ide_2.3.7_Linux_64bit.AppImage
    echo "only applications & icons are acceptable"
    mkdir -p ~/.local/share/applications
    mkdir -p ~/.local/share/icons
    cp -r ~/.config/d3f4l7d/autoinstall/icon ~/.local/share
    sudo usermod -a -G uucp d3f4l7

    echo "Create App Interface (ArduinoProIDE) in ~/.local/share/application/arduino-ide_2.3.7_Linux_64bit.desktop"
    echo "[Desktop Entry]"
    echo "Name=Arduino2xx"
    echo "Exec=/home/d3f4l7/.local/share/AppImage/arduino-ide_2.3.7_Linux_64bit.AppImage %u"
    echo "Icon=/home/d3f4l7/.local/share/icons/ArduinoCommunityLogo-up.png"
    echo "Type=Application"
    echo "Categories=Development;"
    echo "StartupNotify=true"
    echo "Terminal=false"
    echo "Keywords=Editor;"
    echo "update-desktop-database /home/d3f4l7/.local/share/application"

    echo "Create /etc/xdg/autostart/inod.desktop for autostart."
    echo "[Desktop Entry]"
    echo "Name=inod"
    echo "Exec=/home/d3f4l7/.local/share/AppImage/arduino-ide_2.3.7_Linux_64bit.AppImage"
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

    sudo pacman -Sy --noconfirm ibus ibus-anthy noto-fonts-cjk
    echo 'export GTK_IM_MODULE=ibus' >> ~/.zshrc
    echo 'export GT_IM_MODULE=ibus' >> ~/.zshrc
    echo 'export XMODIFIERS=@im=ibus' >> ~/.zshrc

    echo "Create /etc/xdg/autostart/ibusd.desktop for autostart."
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

    sudo pacman -S --noconfirm bluez bluez-utils blueman pipewire-pulse pavucontrol
    sudo systemctl start bluetooth.service
    sudo systemctl enable bluetooth.service

    echo "Uncomment #AutoEnable=true in /etc/bluetooth/main.conf"
    echo "autoinstall of bluetooth -- DONE"
fi

if pacman -Q gvfs-mtp &> /dev/null; then
    echo "gvfs is already installed. Skip GVFS process..."
else
    echo
    echo "  ______     _______ ____  "
    echo " / ___\ \   / /  ___/ ___| "
    echo "| |  _ \ \ / /| |_  \___ \ "
    echo "| |_| | \ V / |  _|  ___) |"
    echo " \____|  \_/  |_|   |____/ "
    echo

    sudo pacman -S --noconfirm gvfs gvfs-mtp gnome-disk-utility gnome-keyring gvfs-smb samba evince

    echo "autoinstall of mgr -- DONE"
fi

if pacman -Q kicad &> /dev/null; then
    echo "kicad is already installed. Skip KI process..."
else
    echo
    echo " _  _____ "
    echo "| |/ /_ _|"
    echo "| ' / | | "
    echo "| . \ | | "
    echo "|_|\_\___|"
    echo

    sudo pacman -S --noconfirm kicad
    sudo pacman -S --asdeps --noconfirm kicad-library kicad-library-3d
    echo "If need Nightly, follow steps below"
    echo "sudo vim /etc/pacman.conf"
    echo "Add these:"
    echo "#Nightly builds for KiCad"
    echo "[kicad-nightly]"
    echo "SigLevel=Optional TrustAll"
    echo "Server=https://kicad.gitlab.io/packaging/kicad-arch/kicad-arch-builder/"
    echo "sudo pacman -Sy kicad-nightly"
    echo "autoinstall of KiCad -- DONE"
fi

if pacman -Q freecad &> /dev/null; then
    echo "freecad is already installed. Skip CAD process..."
else
    echo
    echo "  ____    _    ____  "
    echo " / ___|  / \  |  _ \ "
    echo "| |     / _ \ | | | |"
    echo "| |___ / ___ \| |_| |"
    echo " \____/_/   \_\____/ "
    echo

    sudo pacman -S --noconfirm freecad
    git clone https://aur.archlinux.org/flashprint.git ~/.config/flashprint
    cd ~/.config/flashprint
    makepkg -sirc
    cd

    echo "autoinstall of Freecad -- DONE"
fi

if pacman -Q inkscape &> /dev/null; then
    echo "inkscape is already installed. Skip IS process..."
else
    echo
    echo " ___ ____  "
    echo "|_ _/ ___| "
    echo " | |\___ \ "
    echo " | | ___) |"
    echo "|___|____/ "
    echo

    sudo pacman -S --noconfirm inkscape python-tinycss2 typst gtksourceview3 texlive-latex texlive-latexrecommended texlive-latexextra gtk3
    mkdir ~/.config/textext
    wget -O ~/.config/textext/TexText-Linux-1.13.0.tar.gz https://github.com/textext/textext/releases/download/1.13.0/TexText-Linux-1.13.0.tar.gz
    cd ~/.config/textext
    tar -xvzf TexText-Linux-1.13.0.tar.gz
    cd ~/.config/textext/textext-1.13.0
    python3 setup.py

    echo "autoinstall of inkscape -- DONE"
fi

if pacman -Q libreoffice-fresh &> /dev/null; then
    echo "libreoffice-fresh is already installed. Skip LO process..."
else
    echo
    echo " _     ___  "
    echo "| |   / _ \ "
    echo "| |  | | | |"
    echo "| |__| |_| |"
    echo "|_____\___/ "
    echo

    sudo pacman -S --needed --noconfirm ttf-caladea ttf-carlito ttf-dejavu ttf-liberation ttf-linux-libertine-g noto-fonts adobe-source-code-pro-fonts adobe-source-sans-pro-fonts adobe-source-serif-pro-fonts
    git clone https://aur.archlinux.org/paru.git ~/.config/paru
    cd ~/.config/paru
    makepkg -sirc
    cd
    paru ttf-gentium-basic
    echo "select jdk21-openjdk 4 hsqldb2"
    paru hsqldb2-java
    sudo pacman -S --noconfirm libreoffice-fresh

    echo "autoinstall of libreoffice -- DONE"
fi

if ! command -v firefox &> /dev/null
then
    echo
    echo "__  _____  _____ "
    echo "\ \/ / _ \|  ___|"
    echo " \  / | | | |_   "
    echo " /  \ |_| |  _|  "
    echo "/_/\_\___/|_|    "
    echo

    git clone https://aur.archlinux.org/yay-git.git ~/.config/yay-git
    cd ~/.config/yay-git
    makepkg -sirc
    cd
    echo "select pipewire-jack"
    yay -S firefox

    echo "Create /etc/xdg/autostart/xofd.desktop for autostart."
    echo "[Desktop Entry]"
    echo "Name=xofd"
    echo "Exec=/usr/bin/firefox"
    echo "Type=Application"
    echo "Terminal=false"

    echo "autoinstall of firefox -- DONE"
else
    echo "firefox is already installed. Skip FOX process..."
fi

if pacman -Q vlc &> /dev/null; then
    echo "vlc is already installed. Skip VLC process..."
else
    echo
    echo "__     ___     ____ "
    echo "\ \   / / |   / ___|"
    echo " \ \ / /| |  | |    "
    echo "  \ V / | |__| |___ "
    echo "   \_/  |_____\____|"
    echo

    sudo pacman -S --noconfirm vlc vlc-plugins-all

    echo "vlc-plugin will be applied after reboot"
    echo "autoinstall of vlc -- DONE"
fi

if pacman -Q xfce4 &> /dev/null; then
    echo "xfce4 is already installed. Skip XFCE4 process..."
else
    echo
    echo "__  _______ ____ _____ _  _   "
    echo "\ \/ /  ___/ ___| ____| || |  "
    echo " \  /| |_ | |   |  _| | || |_ "
    echo " /  \|  _|| |___| |___|__   _|"
    echo "/_/\_\_|   \____|_____|  |_|  "
    echo

    echo "select ALL"
    sudo pacman -S --noconfirm xfce4 xfce4-goodies lightdm lightdm-gtk-greeter
    sudo systemctl enable lightdm
    
    echo "Xfce4 will be applied after reboot"
    echo "autoinstall of Xfce4 -- DONE"
fi

echo
echo " ____  _____ ____   ___   ___ _____   _   _  _____        __"
echo "|  _ \| ____| __ ) / _ \ / _ \_   _| | \ | |/ _ \ \      / /"
echo "| |_) |  _| |  _ \| | | | | | || |   |  \| | | | \ \ /\ / / "
echo "|  _ <| |___| |_) | |_| | |_| || |   | |\  | |_| |\ V  V /  "
echo "|_| \_\_____|____/ \___/ \___/ |_|   |_| \_|\___/  \_/\_/   "
echo
