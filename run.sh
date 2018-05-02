#!/bin/sh
docker run --name msf -d --rm -p 2200:22 -p 8090:1234 -v ~/.msf4:/root/.msf4 -v /tmp/msf:/tmp/data metasploit
echo "###PASSWD###"
docker exec $(docker ps -qf name=msf) cat /root/passwd
echo "############"
docker exec -it $(docker ps -qf name=msf) bash -c "source /usr/local/rvm/scripts/rvm && bash"
