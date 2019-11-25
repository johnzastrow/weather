#!/bin/bash
# cd /home/jcz/Documents/github/weather
HOST=ftp.northredoubt.com
USER=weather@northredoubt.com
PASSWORD="seGaJuk84wR29" # | base64 --decode`
pwd

ftp -ipnv $HOST <<EOF
user $USER $PASSWORD
mput *.html
mput *.png
bye
EOF
