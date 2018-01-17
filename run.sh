#!/usr/bin/env bash 

#Shell Colour constants for use in 'echo -e'
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
NC='\033[0m' # No Color

echo -e "Stroom ${RED}N${GREEN}G${YELLOW}I${BLUE}N${RED}X${NC}"
echo -e "${GREEN}------------${NC}"

if [ "$(uname)" == "Darwin" ]; then
    # Code required to find IP address is different in MacOS
    ip=$(ifconfig | grep "inet " | grep -Fv 127.0.0.1 | awk '{print $2}')
else
    ip=$(ip route get 1 |awk 'match($0,"src [0-9\\.]+") {print substr($0,RSTART+4,RLENGTH-4)}')
fi
export NGINX_ADVERTISED_HOST=$ip
echo -e " - Using IP ${GREEN}${ip}${NC} as the advertised host, as determined from the operating system"

echo -e " - Updating the config using the template"
envsubst '${NGINX_ADVERTISED_HOST}' < nginx.template.conf > nginx.conf

echo -e " - Reloading the ${RED}N${GREEN}G${YELLOW}I${BLUE}N${RED}X${NC} config"
sudo nginx -s reload

echo -e "${GREEN}All done!${NC}"