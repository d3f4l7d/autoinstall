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


if ! command -v jekyll &> /dev/null
then
    echo
    echo "     _ _   _ "
    echo "    | | | | |"
    echo " _  | | |_| |"
    echo "| |_| |  _  |"
    echo " \___/|_| |_|"
    echo

    sudo pacman -S --noconfirm ruby ruby-erb
    ruby -v
    echo 'export GEM_HOME="$HOME/.config/gems"' >> ~/.zshrc
    echo 'export PATH="$HOME/.local/share/gem/ruby/3.4.0/bin:$PATH"' >> ~/.zshrc
    echo "source ~/.zshrc manually, and then..."
    echo "sudo gem update --system 4.0.12"
    echo "gem install --install-dir=~/.config/hyde jekyll bundler"
    echo "autoinstall of Jekyll -- DONE"
else
    echo "Jekyll is already installed. Skip JH process..."
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


