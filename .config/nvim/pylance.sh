#!/bin/bash
curl -s -c cookies.txt 'https://marketplace.visualstudio.com/items?itemName=ms-python.vscode-pylance' > /dev/null &&
curl -s "https://marketplace.visualstudio.com/_apis/public/gallery/publishers/ms-python/vsextensions/vscode-pylance/latest/vspackage" -j -b cookies.txt --compressed --output "pylance.vsix"
unzip pylance.vsix 

sed -i "0,/\(if(\!process\[[^] ]*\]\[[^] ]*\])return\!0x\)1/ s//\10/" ./extension/dist/server.bundle.js
node ./extension/dist/server.bundle.js "$1" "$2"
