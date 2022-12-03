###### Note: Text in block format means that you run them together
## When you first launch the pannel
sudo apt update && sudo apt install -y gdb curl lib32gcc-s1 libc++-dev unzip
sudo useradd -m steam

sudo su -l steam

## Logged into user steam

mkdir ~/Steam && cd ~/Steam && curl -sqL "https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz" | tar zxvf -

###### To host PC Server (non-beta):

~/Steam/steamcmd.sh +force_install_dir /home/steam/pavlovserver +login anonymous +app_update 622970 +exit

###### To host PC BETA:

~/Steam/steamcmd.sh +force_install_dir /home/steam/pavlovserver +login anonymous +app_update 622970 -beta beta_server +exit

###### To host Shack Live (Quest):

~/Steam/steamcmd.sh +force_install_dir /home/steam/pavlovserver +login anonymous +app_update 622970 -beta shack +exit

###### To host Shack RC (Quest):
~/Steam/steamcmd.sh +force_install_dir /home/steam/pavlovserver +login anonymous +app_update 622970 -beta shack_beta +exit

## Once you complete the above process continue with this
~/Steam/steamcmd.sh +login anonymous +app_update 1007 +quit
mkdir -p ~/.steam/sdk64
cp ~/Steam/steamapps/common/Steamworks\ SDK\ Redist/linux64/steamclient.so ~/.steam/sdk64/steamclient.so
cp ~/Steam/steamapps/common/Steamworks\ SDK\ Redist/linux64/steamclient.so ~/pavlovserver/Pavlov/Binaries/Linux/steamclient.so

chmod +x ~/pavlovserver/PavlovServer.sh

mkdir -p /home/steam/pavlovserver/Pavlov/Saved/Logs
mkdir -p /home/steam/pavlovserver/Pavlov/Saved/Config/LinuxServer
mkdir -p /home/steam/pavlovserver/Pavlov/Saved/maps

touch /home/steam/pavlovserver/Pavlov/Saved/Config/mods.txt
touch /home/steam/pavlovserver/Pavlov/Saved/Config/blacklist.txt
touch /home/steam/pavlovserver/Pavlov/Saved/Config/whitelist.txt



nano /home/steam/pavlovserver/Pavlov/Saved/Config/LinuxServer/Game.ini
> See https://github.com/Josephfallen/Pavlov_server_hosting/blob/main/Game.ini.txt for the file's contents

## Logged Out of steam
sudo ufw status
sudo ufw allow 7777
sudo ufw allow 8177
sudo ufw allow 9100
sudo ufw status

## Logged into steam

nano /home/steam/pavlovserver/Pavlov/Saved/Config/RconSettings.txt

## Logged Out of steam


sudo nano /etc/systemd/system/pavlovserver.service
## Basic commands
 
sudo systemctl start pavlovserver

sudo systemctl restart pavlovserver

sudo systemctl stop pavlovserver

sudo systemctl status pavlovserver
