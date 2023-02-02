#!bin/bash

READY=1

if [ $READY -eq 1 ]
        then
                echo "sleeping process"
                sleep infinity
        else
                echo "Starting whatever you need...";
                ping 8.8.8.8
fi

