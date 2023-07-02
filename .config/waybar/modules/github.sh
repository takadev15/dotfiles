#!/bin/bash

token=`cat ${HOME}/.config/token/github.token`
count=`curl -s -u takadev15:${token} https://api.github.com/notifications | jq '. | length'`

if [[ "$count" != "0" ]]; then 
    jo text="$count  " tooltip="You have $count Github notification"
fi

