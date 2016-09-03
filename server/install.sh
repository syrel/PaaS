#!/bin/bash

dir="pharo"

RED='\033[0;31m'
BLUE='\033[0;34m' 
NC='\033[0m' # No Color

rm -rf "$dir"
mkdir "$dir"
cd "$dir"

echo -e "${BLUE}Downloading Pharo 4.0...${NC}"
wget http://files.pharo.org/platform/Pharo4.0-linux-oldLibC.zip

echo -e	"${BLUE}Extracting...${NC}"
unzip Pharo4.0-linux-oldLibC.zip

mv pharo4.0/* ./
rm -rf pharo4.0

echo -e "${BLUE}Installing Pillar...${NC}"
./pharo -vm-display-null shared/Pharo4.0.image eval --save "Gofer it url: 'http://smalltalkhub.com/mc/Pier/Pillar/main/'; configurationOf: 'Pillar'; loadDevelopment"

echo -e "${BLUE}Installing PaaS (Pillar as a service)...${NC}"
./pharo -vm-display-null shared/Pharo4.0.image eval --save "Metacello new baseline: 'PaaS'; repository: 'github://syrel/paas/src'; load: #core"
