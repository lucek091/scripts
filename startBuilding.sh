#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)
redtext=$(tput setaf 1)

if [[ ! $1 ]]; then
	echo "No parameters" >&2
	bash ./addIpAdressToHosts.sh
	bash ./rsyncChanged.sh
	exit 1

elif [[ $* == -skipxml ]]; then
	echo "One parameter -skipxml" >&2
	bash ./addIpAdressToHosts.sh
	exit 1

elif [[ $* == -skipIP ]]; then
	echo "One parameter -skipIP" >&2
	bash ./rsyncChanged.sh
	exit 1

elif [[ $* == "-skipIP -skipxml" ]] || [[ $* == "-skipxml -skipIP" ]]; then
	echo "two parameters"
	echo "bede tylko budowac"

else
	echo "It seems like u used wrong parameters. Avaliable parameters: "
	echo "${bold}${redtext}-skipxml${normal} to skip synchronizing xml files"
	echo "${bold}${redtext}-skipIP${normal} to skip adding IP to /etc/hosts"	
fi

