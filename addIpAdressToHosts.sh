#!/bin/bash

sshConnectionString="ssh kplus@kenvng"
ipnumber=$(/sbin/ifconfig eth0 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}')
hosts="/etc/hosts"
#hosts="${HOME}/Apps/bash_scrypts/asd/hosts"

addIp(){
$sshConnectionString << EOF

echo "---------------adding Ip STARTED ---------------"

sudo chmod 777 $hosts

if [[ ! "$ipnumber" ]]; then
	echo "Need IP number. Cannot get IP number." >&2
	exit 1
fi

if [[ ! -e "$hosts" ]]; then
	echo "We cannot find /etc/hosts file." >&2
	exit 1
fi

if grep ""$ipnumber"" "$hosts" > /dev/null ;
then 
	echo "---------------Your IP adress is already added---------------"
else
	echo "---------------We are going to add your IP Adress to hosts---------------"
		if echo "$ipnumber kworksation">> "$hosts" >&2; then	
			echo "$ipnumber kworksation">> "$hosts"		
			echo "---------------Your IP adress is added to /etc/hosts---------------"
		else
			echo "---------------Failure. Your IP adress is not added to /etc/hosts---------------"
fi
fi
echo "---------------FINISHED ---------------"

sudo chmod 775 $hosts

exit 0

EOF
}

addIp
