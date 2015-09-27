#!/bin/bash

exec "./welcome.sh"

if [ "$1" == "master" ]; then
    zkServer.sh start-foreground
    echo ruok | nc lolcahost 2181
    echo 'starting storm master'
    storm nimbus
elif [ "$1" == "worker" ]; then
    zkServer.sh start-foreground
    echo 'starting storm worker'
    storm supervisor $2
    echo ruok | nc lolcahost 2181
else
    exec "$@"
fi

exec "bash"
