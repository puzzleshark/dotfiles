#!/bin/bash

LOCALPORT=$1
REMOTEUSER=$2
REMOTEHOST=$3
REMOTEPORT=$4


cleanup () {
    echo "cleaning up background processes..."
    kill $portforward $terminal # kill 0
    exit 1
}

# set trap for script exit due to an error
trap 'cleanup' ERR SIGINT SIGTERM

if [ -f ~/.ssl/keys/socat-server.key ] && [ -f ~/.ssl/certs/socat-server.crt ]; then
    echo "cert already exists..."
else
    # generate a certificate file if it does not already exist
    echo "generating cert file..."
    mkdir -p ~/.ssl/certs
    mkdir -p ~/.ssl/keys
    openssl req -newkey rsa:2048 -nodes -keyout ~/.ssl/keys/socat-server.key -x509 -days 365 -out ~/.ssl/certs/socat-server.crt
fi


ssh -f -N -R $LOCALPORT:localhost:$REMOTEPORT $REMOTEUSER@$REMOTEHOST &> /dev/null
portforward=$!

echo "run command: sh <(curl -fsSL https://raw.githubusercontent.com/puzzleshark/dotfiles/main/connect/client.sh) $REMOTEHOST $REMOTEPORT"

# start ssl socat server
socat -d -d OPENSSL-LISTEN:$LOCALPORT,cert=${HOME}/.ssl/certs/socat-server.crt,key=${HOME}/.ssl/keys/socat-server.key,verify=0,fork -

cleanup
