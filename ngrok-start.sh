#!/bin/bash

ngrok tcp --log stdout 22 | tee >(
while ! grep "started tunnel" -m 1
do
    :
done | sed -E 's#.*url=tcp://(.*)#://kevin@\1#' | xargs $(dirname $(realpath $0))/ngrok-bot.sh)
