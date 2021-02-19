token=`cat ${HOME}/.config/github/github.token`
count=`curl -s -u Takachii15:${token} https://api.github.com/notifications | jq '. | length'`

if [[ "$count" != "0" ]]; then 
    echo "$count"
fi

