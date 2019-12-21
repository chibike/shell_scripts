#!/bin/bash

if [ "$EUID" -ne 0 ]
    then echo "Please run as root"
    exit
fi

while getopts u:p: option
do
case "${option}"
in
    u) USER=${OPTARG};;
    p) PASSWORD=${OPTARG};;
esac
done

BLACK='\033[0;30m'
RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
WHITE='\033[1;37m'
NC='\033[0m'

if [ -z "$USER" ]
then
    printf "\n${GREEN} USER = ${USER} ${NC}\n"
else
    printf "\n${RED} Username must be specified ${NC}\n"
    exit -1
fi

if [ -z "$USER" ]
then
    printf "\n${GREEN} password OK ${NC}\n"
else
    printf "\n${RED} Password must be specified ${NC}\n"
    exit -1
fi

# install postgres
printf "\n${GREEN} Installing postgres ${NC}\n"
sudo apt update
sudo apt install -y postgresql postgresql-contrib libpq-dev postgresql-client postgresql-client-common

# start service
printf "\n${GREEN} Starting the postgres service ${NC}\n"
update-rc.d postgresql enable
sudo service postgresql start

# create user
printf "\n${GREEN} Create your postgres user ${NC}\n"
#sudo -u postgres createuser --interactive
sudo -u postgres psql -c "CREATE USER ${USER} WITH PASSWORD ${PASSWORD};"
sudo adduser $USER

# install for python
printf "\n${GREEN} Run the line below in your virtual env to add support of postgres to python ${NC}\n"
printf "\n${PURPLE} 'pip install psycopg2' ${NC}\n"
