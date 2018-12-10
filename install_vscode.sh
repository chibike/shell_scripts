
#!/bin/bash

if [ "$EUID" -ne 0 ]
    then echo "Please run as root"
    exit
fi

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

printf "\n${ORANGE}Installing VSCODE${NC}"
printf "\nby ${GREEN}Chibuike Okpaluba${NC}"
printf "\nusing the blog post @ ${RED}https://linuxize.com/post/how-to-install-visual-studio-code-on-ubuntu-18-04/${NC}"

printf "\n"

printf "\n${GREEN}Updating your computer${NC}\n\n"
sudo apt-get update
sudo apt-get install software-properties-common apt-transport-https wget

printf "\n${GREEN}Downloading vscode${NC}\n\n"
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"

printf "\n${GREEN}Updating your computer${NC}\n\n"
sudo apt-get update

printf "\n${GREEN}Installing vscode${NC}\n\n"
sudo apt-get install code

printf "\n\nDone!\n"
exit
