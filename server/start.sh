#!/bin/bash

dir="pharo"
port="6561"

if [ "$#" -gt 0 ]; then
    port=$1
fi

RED='\033[0;31m'
BLUE='\033[0;34m' 
NC='\033[0m' # No Color

cd $dir

if pgrep "pharo" > /dev/null
then
    echo "Already running"
else
    echo -e "${BLUE}Starting server on port ${port}...${NC}"
    ./pharo -vm-display-null shared/Pharo4.0.image eval --no-quit "PaaSBackend startOn: $port" &>/dev/null &disown
fi
