ln -s ~/.files/.config/nvim ~/.config/nvim
ln -s ~/.files/.config/sway ~/.config/sway
ln -s ~/.files/.config/tmux ~/.config/tmux
ln -s ~/.files/.config/alacritty ~/.config/alacritty
ln -s ~/.files/.gitconfig ~/.gitconfig

echo "set -o vi" >> ~/.bashrc

sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
mkdir -p -m 700 ~/.gnupg
gpg --no-default-keyring --keyring gnupg-ring:/tmp/onlyoffice.gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys CB2DE8E5
chmod 644 /tmp/onlyoffice.gpg
sudo chown root:root /tmp/onlyoffice.gpg
sudo mv /tmp/onlyoffice.gpg /usr/share/keyrings/onlyoffice.gpg
echo 'deb [signed-by=/usr/share/keyrings/onlyoffice.gpg] https://download.onlyoffice.com/repo/debian squeeze main' | sudo tee -a /etc/apt/sources.list.d/onlyoffice.list

sudo apt update -y && sudo apt upgrade -y
sudo apt install ripgrep tmux brave-browser onlyoffice-desktopeditors sway swaylock fonts-quicksand desktop-file-utils network-manager pulseaudio pipewire light fonts-noto-color-emoji fonts-recommended jq grim slurp wl-clipboard imagemagick libnotify4 -y

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
curl -fsSL https://get.pnpm.io/install.sh | sh -

# probably doesn't work
cp /media/jade/Backup/shh/* ~/.ssh
chmod 600 ~/.ssh/id_rsa
ssh-add
