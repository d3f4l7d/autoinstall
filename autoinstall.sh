echo 
echo "    _   _   _ _____ ___ ___ _   _ ____ _____  _    _     _     "
echo "   / \ | | | |_   _/ _ \_ _| \ | / ___|_   _|/ \  | |   | |    "
echo "  / _ \| | | | | || | | | ||  \| \___ \ | | / _ \ | |   | |    "
echo " / ___ \ |_| | | || |_| | || |\  |___) || |/ ___ \| |___| |___ "
echo "/_/   \_\___/  |_| \___/___|_| \_|____/ |_/_/   \_\_____|_____|"
echo

echo 
echo " _________  _   _ "
echo "|__  / ___|| | | |"
echo "  / /\___ \| |_| |"
echo " / /_ ___) |  _  |"
echo "/____|____/|_| |_|"
echo

sudo pacman -Syu
sudo pacman -S kitty zsh ttf-firacode wget
sudo chsh -s /bin/zsh d3f4l7d
sudo cat /etc/passwd | grep d3f4l7d
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
wget -O ~/.oh-my-zsh/themes/kali-like.zsh-theme https://raw.githubusercontent.com/clamy54/kali-like-zsh-theme/master/kali-like.zsh-theme

echo "Replace val of ZSH_THEME from robbyrussell to kali-like."
echo "Also, do not forget exec kitty +list-fonts"
echo "autoinstall of zsh -- DONE"

echo
echo " ____   ___  __  __ _____ ____ _   _  ___  ____  ____  ____  "
echo "/ ___| / _ \|  \/  | ____/ ___| | | |/ _ \|  _ \|  _ \/ ___| "
echo "\___ \| | | | |\/| |  _|| |   | |_| | | | | |_) | | | \___ \ "
echo " ___) | |_| | |  | | |__| |___|  _  | |_| |  _ <| |_| |___) |"
echo "|____/ \___/|_|  |_|_____\____|_| |_|\___/|_| \_\____/|____/ "
echo

sudo pacman -S gvfs gvfs-mtp gvfs-smb evince neovim ttf-jetbrains-mono-nerd unzip
git clone https://github.com/NvChad/starter ~/.config/nvim

echo
echo " _   _    _    ____  "
echo "| | | |  / \  / ___| "
echo "| |_| | / _ \ \___ \ "
echo "|  _  |/ ___ \ ___) |"
echo "|_| |_/_/   \_\____/ "
echo

curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
exec "$SHELL"
source .zshrc
echo '\n' >> ~/.zshrc
ghc --version
which haskell-language-server-wrapper

