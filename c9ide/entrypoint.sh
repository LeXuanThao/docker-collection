#!/bin/bash
nginx -g 'daemon off;' &> /dev/null &
su - ubuntu -c "cd /home/ubuntu/c9sdk && ./server.js -p 8080 -w /home/ubuntu/workspace"