#!/bin/bash

LOGFILE="$HOME/logs/ngrok-start.log"
ngrok tcp --log stdout 22 > $LOGFILE &
while ! grep "started tunnel" $LOGFILE
do
    :
done | sed -E 's#.*url=tcp://(.*)#://kevin@\1#' | xargs ngrok-bot.sh
