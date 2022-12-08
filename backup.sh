#!/bin/bash

#config here with these variables

###############################################################
WEBHOOKURL='placeWebhookUrlHere'
#Webhooks urls can be got from discord server

FILELOC='whereIsBackUpLogs located at'
# I.E.  '/home/steam/backUpLogs'

PAVSERVER='/home/steam/pavlovserver/Pavlov/Saved/Logs'
# where the logs file is located '/home/steam/pavlovserver/Pavlov/Saved/Logs' if the default location if you used the wiki word for
#word also to add more than one just add a space then the next server logs location
# like this "/home/steam/pavlovserver/Pavlov/Saved/Logs /home/steam/pavlovserver0/Pavlov/Saved/Logs /home/steam/pavlovserver1/Pavlov/Saved/Logs"

LOGVLT='whereToSaveLogs'

##############################################################



backup_files="$PAVSERVER"
dest="$LOGVLT"

# Create archive filename.
day=$(date +"%m-%d-%y")
hostname=$(hostname -s)
archive_file="$hostname-1-$day.tgz"

# Backup the files using tar.
tar czf $dest/$archive_file $backup_files

#################
#webhook section below remove everything after this to not use webhook or comment out 

$FILELOC/discord.sh \
  --webhook-url="$WEBHOOKURL" \
  --username "NotificationBot" \
  --avatar "https://i.imgur.com/12jyR5Q.png" \
  --text "Logs Logged !"
