cat << 'EOF' > $HOME/pavlov_daily_update_and_restart.sh
#!/bin/bash

USER="steam"
SERVICENAME="pavlovserver.service"
INSTALLDIRNAME="pavlovserver"
USERHOME="/home/$USER"

echo -e "Beginning Pavlov VR update run on $(date)\n\n"

systemctl stop "$SERVICENAME"

sleep 5
sudo -iu "$USER" "$USERHOME/Steam/steamcmd.sh" +login anonymous +force_install_dir "$USERHOME/$INSTALLDIRNAME" +app_update 622970 +exit
sudo -iu "$USER" "$USERHOME/Steam/steamcmd.sh" +login anonymous +app_update 1007 +quit
sudo -iu "$USER" cp "$USERHOME/Steam/steamapps/common/Steamworks SDK Redist/linux64/steamclient.so" "$USERHOME/.steam/sdk64/steamclient.so"
sudo -iu "$USER" cp "$USERHOME/Steam/steamapps/common/Steamworks SDK Redist/linux64/steamclient.so" "$USERHOME/pavlovserver/Pavlov/Binaries/Linux/steamclient.so"

systemctl start "$SERVICENAME"

echo -e "Ending Pavlov VR update run on $(date)\n\n"

EOF

chmod +x $HOME/pavlov_daily_update_and_restart.sh
mkdir $HOME/pavlov_update_logs && touch $HOME/pavlov_update_logs/pavlov_daily_update_and_restart.sh.log
CRONLINE="00 2 * * * $HOME/pavlov_daily_update_and_restart.sh >>$HOME/pavlov_update_logs/pavlov_daily_update_and_restart.sh.log 2>&1"
(sudo crontab -u root -l; echo "$CRONLINE" ) | sudo crontab -u root -
unset CRONLINE
