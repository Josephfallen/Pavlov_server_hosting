# backUpLogs
automated tool to compress all logs and save every 24 hours

<hr>

<p>
<h3>STEP1</h3>

download files to server <br>
`git clone https://github.com/JTWP-org/backUpLogs.git `

</p>
  
<p>
<h3>STEP2</h3>

edit backup.sh to add webhook url , where the logs will be saved and file locations for the logs and the discord.sh/backup.sh <br>
all the settings u need to edit will be at the top of the file 
`nano backup.sh`
</p>

<p> 
<h3>STEP3</h3>
give backup.sh and discord.sh perms to run 

`sudo chmod +x backup.sh ; sudo chmod +x discord.sh `

</p>

<p>
<h3>STEP4</h3>

add cront tab to make it run on a schedule 

`sudo crontab -e -u root`

<i>it may ask you to select and editor pick what one you know the most i use nano 

add this line with updated location of backup.sh</i>

`0 0 * * * bash /ADD FULL FILE LOCATION HERE/backUpLogs/backup.sh`
</p>


this will run 1x a day at 12am more info on timer settings can be viewed inside 
sudo crontab


<p>
<h3>to disable webhook section comment out or remove this from the bottom of backup.sh</h3>
<hr>
discord.sh \<br>
  --webhook-url="WEBHOOKURL" \<br>
  --username "NotificationBot" \<br>
  --avatar "https://i.imgur.com/12jyR5Q.png" \<br>
  --text "Logs Logged !"<br>
<hr>
</p>


<h2>webhook section of code from https://github.com/ChaoticWeg/discord.sh</h2>
