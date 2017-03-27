# clean-docker
Written by Devon Mack 2017-02-24                                                 

This program will delete all docker dangling volumes and dangling images.
In addition it will delete all stopped containers and data only containers 

## Prerequisites:
- Up to date version of docker
- Cron, installed and running (should be automatic)
- The user must have permissions to run docker commands without sudo
      
## Installation:                                                                                                

Edit the cron config file through your terminal:                                                               
`$ crontab -e`                                                                  
Add this line to the bottom of the file (must have return character after):                                                 
`0 7 * * 1 python3 <PATH TO "cleanDocker.sh">`
##### Parameters (* = any):
1. Minute (0 - 59)
2. Hour (0 - 23)
3. Day of month (1 - 31) 
4. Month (1 - 12)
5. Day of week (0 - 7) (where both 0 and 7 mean Sun, 1 = Mon, 2 = Tue, etc)
6. Command line to be executed (eg. python3 /home/update-16Sdata/updateDatabase.py) 

This setup will make it run every Monday at 7:00 AM.
