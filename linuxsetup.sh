sudo apt update
sudo apt upgrade -y

echo "downloading chrome deb package"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

echo "installing chrome deb package"
sudo apt install ./google-chrome-stable_current_amd64.deb

echo "adding vs code to the repository"
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'

echo "installing vs code"
sudo apt install apt-transport-https
sudo apt update
sudo apt install code

echo "installing node js lts"
curl -sL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt-get install -y nodejs

echo "making you member of input group"
sudo gpasswd -a $USER input

echo "install wmctrl and xdotool"
sudo apt-get install wmctrl xdotool

echo "install libinput tools"
sudo apt-get install libinput-tools

echo "install libinput gesture"
git clone https://github.com/bulletmark/libinput-gestures.git
cd libinput-gestures
sudo make install

echo "libinput configuration"
libinput-gestures-setup autostart
libinput-gestures-setup start

echo "copy gesture conf file"
cp /etc/libinput-gestures.conf ~/.config

echo "add gesture command to conf file"
echo "gesture swipe right 3	xdotool key Alt+Tab" >> ~/.config/libinput-gestures.conf
echo "gesture swipe left 3	xdotool key Alt+Shift+Tab" >> ~/.config/libinput-gestures.conf

echo "setup completed"