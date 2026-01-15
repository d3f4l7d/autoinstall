echo
echo " ____   ___  _____ _____ ___ _   _ ____ _____  _    _     _     "
echo "/ ___| / _ \|  ___|_   _|_ _| \ | / ___|_   _|/ \  | |   | |    "
echo "\___ \| | | | |_    | |  | ||  \| \___ \ | | / _ \ | |   | |    "
echo " ___) | |_| |  _|   | |  | || |\  |___) || |/ ___ \| |___| |___ "
echo "|____/ \___/|_|     |_| |___|_| \_|____/ |_/_/   \_\_____|_____|"
echo

sudo pacman -Syu --noconfirm

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

    sudo pacman -S kicad
    sudo pacman -S --asdeps kicad-library kicad-library-3d
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

    sudo pacman -S freecad
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

    sudo pacman -S inkscape python-tinycss2 typst gtksourceview3 texlive-latex texlive-latexrecommended texlive-latexextra gtk3
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

    sudo pacman -S --needed ttf-caladea ttf-carlito ttf-dejavu ttf-liberation ttf-linux-libertine-g noto-fonts adobe-source-code-pro-fonts adobe-source-sans-pro-fonts adobe-source-serif-pro-fonts
    git clone https://aur.archlinux.org/paru.git ~/.config/paru
    cd ~/.config/paru
    makepkg -sirc
    cd
    paru ttf-gentium-basic
    echo "select jdk21-openjdk 4 hsqldb2"
    paru hsqldb2-java
    sudo pacman -S libreoffice-fresh

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

    sudo pacman -S vlc vlc-plugins-all

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
    sudo pacman -S xfce4 xfce4-goodies lightdm lightdm-gtk-greeter
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
