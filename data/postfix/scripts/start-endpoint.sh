#!bin/bash

READY=1

if [ $READY -eq 0 ]
        then
                echo "sleeping process"
                sleep infinity
        else
                echo "Starting whatever you need...";
                postfix start-fg
fi

