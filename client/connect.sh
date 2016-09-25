#!/bin/sh

TUNHOST=root@my-docker-host.com

echo Your public RSA key:
cat /my_rsa_key.pub

echo
echo Store Host key on first run
ssh -p 8443 $TUNHOST -i /my_rsa_key -o StrictHostKeyChecking=no date

echo
echo Check Remote Host:
cat /root/.ssh/known_hosts
echo

while :
do
	echo -n "Connecting at: "
	date
	ssh -p 8443 $TUNHOST -L *:5432:some-postgres:5432 -i /my_rsa_key -N
	sleep 60
done
