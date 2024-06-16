sudo apt-get install ninja-build gettext cmake unzip curl build-essential
git clone https://github.com/neovim/neovim
cd neovim
make CMAKE_BUILD_TYPE=Release
sudo make install
cd ..
rm neovim -rf
ln -s $(pwd)/nvim ~/.config/nvim
