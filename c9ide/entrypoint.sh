#!/bin/bash
nohup ./server.js -p 8080 &> /dev/null &
nginx -g 'daemon off;'