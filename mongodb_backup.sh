#!/bin/bash
 
######################################################################
##
##   MongoDB Database Backup Script 
##   Updated By: Filip Simonovikj
##   Update on: December 12, 2022
##
######################################################################
 
DIR=`date +%m-%d-%Y` 
DB_BACKUP_PATH=~/mongodb_backups/$DIR
MONGO_HOST='localhost'
MONGO_PORT='27017'
 
# If MongoDB is protected with a username password.
# Set AUTH_ENABLED to 1 
# and add MONGO_USER and MONGO_PASSWD values correctly
 
AUTH_ENABLED=0
MONGO_USER=''
MONGO_PASSWD=''
 
 
# Set DATABASE_NAMES to "ALL" to backup all databases.
# or specify databases names separated with space to backup 
# specific databases only.
 
DATABASE_NAME='mozok_site_db'
#DATABASE_NAME='ALL'
  
######################################################################
######################################################################
 
mkdir $DB_BACKUP_PATH

if [ $DATABASE_NAME === "ALL" ]
then
 echo "You have choose to backup all databases"
 mongodump
else 
 echo "Running backup for selected databases"
 mongodump -h $MONGO_HOST:$MONGO_PORT -d $DATABASE_NAME -o $DB_BACKUP_PATH
 echo "Backup database is created successfully"
fi
 
######################### End of script ##############################
