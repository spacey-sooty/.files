wget --show-progress https://github.com/zen-browser/desktop/releases/latest/download/zen.linux-specific.tar.bz2
wget --show-progress https://raw.githubusercontent.com/zen-browser/branding/main/Main%20icons/PNG/zen-indigo.png
sudo mv zen-indigo.png /opt/zen.png
sudo tar xjf zen.linux-*.tar.bz2 -C /opt
sudo ln -s /opt/zen/zen /usr/local/bin/zen
sudo mkdir -p /usr/local/share/applications
sudo touch /usr/local/share/applications/zen.desktop
sudo echo "[Desktop Entry]
Name=Zen Browser
Comment=Experience tranquillity while browsing the web without people tracking you!
Exec=zen %u
Icon=/opt/zen.png
Type=Application
MimeType=text/html;text/xml;application/xhtml+xml;x-scheme-handler/http;x-scheme-handler/https;application/x-xpinstall;application/pdf;application/json;
StartupWMClass=zen-alpha
Categories=Network;WebBrowser;
StartupNotify=true
Terminal=false
X-MultipleArgs=false
Keywords=Internet;WWW;Browser;Web;Explorer;
Actions=new-window;new-private-window;profilemanager;

[Desktop Action new-window]
Name=Open a New Window
Exec=zen %u

[Desktop Action new-private-window]
Name=Open a New Private Window
Exec=zen --private-window %u

[Desktop Action profilemanager]
Name=Open the Profile Manager
Exec=zen --ProfileManager %u" | sudo cat > /usr/local/share/applications/zen.desktop
rm zen.linux-specific.tar.bz2
