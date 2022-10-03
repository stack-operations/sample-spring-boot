#!/bin/bash
echo "#####Stopping Application#######"
ps -ef | grep java
kill -9 $(lsof -t -i:8888)
echo "Killed process running on port 8888"
ps -ef | grep java