#!/bin/bash
ps -ef | grep java
java -jar /home/ubuntu/scripts/configservice-0.0.1-SNAPSHOT.jar >> /tmp/myprogram.out 2>&1 &
echo "#####Process Running#######"
ps -ef | grep java