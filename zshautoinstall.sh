echo 
echo "    _   _   _ _____ ___ ___ _   _ ____ _____  _    _     _     "
echo "   / \ | | | |_   _/ _ \_ _| \ | / ___|_   _|/ \  | |   | |    "
echo "  / _ \| | | | | || | | | ||  \| \___ \ | | / _ \ | |   | |    "
echo " / ___ \ |_| | | || |_| | || |\  |___) || |/ ___ \| |___| |___ "
echo "/_/   \_\___/  |_| \___/___|_| \_|____/ |_/_/   \_\_____|_____|"
echo

sudo pacman -Syu
sudo pacman -S kitty zsh ttf-firacode wget
sudo chsh -s /bin/zsh d3f4l7d
sudo cat /etc/passwd | grep d3f4l7d
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
