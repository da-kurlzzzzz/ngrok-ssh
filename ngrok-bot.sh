#!/bin/bash

URL="https://api.telegram.org/bot"
source $(dirname $(realpath $0))/keys.sh
if [ $# != 0 ]
then
    METHOD="editMessageText"
    NEW_TEXT="$1"
    ARGUMENTS='{"chat_id":"'"${CHAT_ID}"'","message_id":"'"${MESSAGE_ID}"'","text":"'"${NEW_TEXT}"'"}'
    FULL_REQUEST="${URL}${API_KEY}/${METHOD}"
    curl -s -H "Content-Type: application/json" -d "${ARGUMENTS}" "${FULL_REQUEST}" > /dev/null
else
    METHOD="forwardMessage"
    ARGUMENTS='{"chat_id":"'"${CHAT_ID}"'","from_chat_id":"'"${CHAT_ID}"'","message_id":"'"${MESSAGE_ID}"'"}'
    FULL_REQUEST="${URL}${API_KEY}/${METHOD}"
    RESULT=$(curl -s -H "Content-Type: application/json" -d "${ARGUMENTS}" "${FULL_REQUEST}" | jq -r '.result | (.message_id, .text)')
    ARRAY=($RESULT)
    MESSAGE_ID=${ARRAY[0]}
    TEXT="${ARRAY[@]:1}"

    METHOD="deleteMessage"
    ARGUMENTS='{"chat_id":"'"${CHAT_ID}"'","message_id":"'"${MESSAGE_ID}"'"}'
    FULL_REQUEST="${URL}${API_KEY}/${METHOD}"
    curl -s -H "Content-Type: application/json" -d "${ARGUMENTS}" "${FULL_REQUEST}" > /dev/null
    echo "$TEXT"
fi
