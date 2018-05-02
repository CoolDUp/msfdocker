#!/bin/sh
docker exec -it $(docker ps -qf name=msf) /bin/bash
