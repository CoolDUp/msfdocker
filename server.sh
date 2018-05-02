#!/bin/sh
docker run --name msf -d --rm -p 2200:22 -p 8090:1234 -v ~/.msf4:/root/.msf5 -v /tmp/msf:/tmp/data metasploit
