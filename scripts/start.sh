#!/bin/sh
#

IP="127.0.0.1"
PORT="9191"
PID="/tmp/compositus.pid"
APP="`pwd`/src/compositus"
CONFIG="`pwd`/config/compositus.cfg"

# Uncomment below if you don't have libctemplate-fcgi installed
#export LD_LIBRARY_PATH=`pwd`/../libctemplate

cd src
spawn-fcgi -a $IP -p $PORT -P $PID -- $APP $CONFIG
