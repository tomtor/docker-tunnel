#!/bin/sh

echo Your public RSA key:
cat /my_rsa_key.pub

while :
do
	date
	set -x
	ssh -p 8443 root@your-docker-host.com -L 5432:some-postgres:5432 -i /my_rsa_key -N
	sleep 60
done
