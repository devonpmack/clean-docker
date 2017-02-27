####################################################################################
# Written by Devon Mack 2017-02-24                                                 #
#                                                                                  #
# This program will delete all docker dangling volumes and dangling images.        #
# In addition it will delete all stopped containers and data only containers       #
#                                                                                  #
# The user must have permissions to run docker commands without sudo               #
# Set up a cron process for every friday at 3 PM:                                  #
#    $ crontab -e                                                                  #
# Add this line to the bottom of the file (must have return character after)       #
#    0 15 * * 5 <PATH TO "cleanDocker.sh">                                         #
#    - -  - - -            |                                                       #
#    | |  | | |     File to be executed (eg. /home/devon/Documents/cleanDocker.sh) #
#    | |  | | ----- Day of week (0 - 7) (Sunday=0 or 7)                            #
#    | |  | ------- Month (1 - 12)                                                 #
#    | | --------- Day of month (1 - 31)                                           #
#    | ----------- Hour (0 - 23)                                                   #
#    ------------- Minute (0 - 59)                                                 #
####################################################################################
#Save current time/date
TODAY=$(date +"%y-%m-%d_%T")
#Output directory
FILE="/mnt/nas/bio_requests/8393/cleanDocker/$TODAY"
echo "Running script..." >> $FILE
#Clean containers
stoppedContainers="$(docker ps -aqf status=exited)"
if [ ! "$stoppedContainers" ]; then
	echo "No containers to clean!" >> $FILE
else
#WARNING: WILL REMOVE DATA-ONLY CONTAINERS, COMMENT THIS PART OUT IF YOU DO NOT WANT THAT.
#         CONTAINERS WILL STILL BE DELETED BY SYSTEM PRUNE
	echo "Cleaning containers..." >> $FILE
	echo "Deleting $stoppedContainers">> $FILE
	docker rm $stoppedContainers
fi
#Clean images
images="$(docker images -aqf dangling=true)"
if [ ! "$images" ]; then
	echo "No dangling images to clean!" >> $FILE
else
	echo "Cleaning images..." >> $FILE
	echo "Deleting $images">> $FILE
	docker rmi $images
fi
#Clean volumes
volumes="$(docker volume ls -qf dangling=true)"
if [ ! "$volumes" ]; then
	echo "No dangling volumes to clean!" >> $FILE
else
	echo "Cleaning volumes..." >> $FILE
	echo "Deleting $volumes">> $FILE
	docker volume rm $volumes
fi
#This line will ensure everything is deleted
docker system prune --force
#finished
echo "Completed running at $TODAY" >> $FILE
