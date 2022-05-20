#!/bin/bash

ssh "ssh$($(dirname $(realpath $0))/ngrok-bot.sh)"
