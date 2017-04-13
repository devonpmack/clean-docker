# clean-docker
Written by Devon Mack 2017-02-24                                                 

This program will delete all docker dangling volumes and dangling images.
In addition it will delete all stopped containers and data only containers 

## Prerequisites:
- Up to date version of [Docker](https://www.docker.com/)
- Cron, installed and running (should be automatic)
- The user must have permissions to run Docker commands [without sudo](https://coderwall.com/p/4zeaqq/run-docker-commands-without-sudo)
                                                                                           
## Installation

Clone the github repository:
```console
git clone https://github.com/devonpmack/clean-docker.git
```
Make the script executable with:
```console
chmod 755 cleanDocker.sh
```
Run the script:
```console
./cleanDocker.sh
```
A config.dat file will be created, edit the file and change it so it only includes the folder you want your
logs to be stored in.

eg. `/home/me/CleanDockerLogs/`

---

### Setting the program up as a cron job

Edit the cron config file through your terminal:

```console
sudo crontab -e
```

Add this line to the bottom of the file (must have return character after):                                                 

```ceylon
0 7 * * 1 PATH_TO_SCRIPT
```

This setup will make it run every Monday at 7:00 AM.

Parameter Number | Parameter (`*` means it doesn't matter when)
--- | ---
1 | Minute (0 - 59)
2 | Hour (0 - 23)
3 | Day of month (1 - 31) 
4 | Month (1 - 12)
5 | Day of week (0 - 7) (where both 0 and 7 mean Sun, 1 = Mon, 2 = Tue, etc)
6 | Command line to be executed (eg. /home/update-16Sdata/updateDatabase.py) 

