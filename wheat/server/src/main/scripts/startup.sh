#!/bin/sh -e
nohup java -Xmx12G -jar qtlnetminer-server.jar WheatKNET.oxl >> stdout.log 2>> stderr.log &
