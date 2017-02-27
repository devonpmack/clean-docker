# clean-docker
Written by Devon Mack 2017-02-24                                                 

This program will delete all docker dangling volumes and dangling images.
In addition it will delete all stopped containers and data only containers 

## Prerequisites:
- Up to date version of docker
- Cron, installed and running (should be automatic)
- The user must have permissions to run docker commands without sudo
      
## Installation:                                                                                                
Edit the cron config file:                                                               
`$ crontab -e`                                                                  
Add this line to the bottom of the file (must have return character after):                                                 
`0 15 * * 5 <PATH TO "cleanDocker.sh">`
##### Parameters (* = any):
1. Day of week (0 - 7) (Sunday=0 or 7)                            
2. Month (1 - 12)                                                 
3. Day of month (1 - 31)                                           
4. Hour (0 - 23)                                                   
5. Minute (0 - 59)
6. File to be executed (eg. /home/devon/Documents/cleanDocker.sh) 

This setup will make it run every Friday at 3:00 PM.
