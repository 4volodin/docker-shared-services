#!/usr/bin/env bash

#
# | sed 's/\$/\$\$/g' is using because Before insert in docker-compose.yaml - You MUST to escape each $ character inside the hashed password(after htpasswd) with another $
#

if [ -z "$1" ]; then
    echo -e "\nPlease call '$0 <password>' to run this command!\n"
    exit 1
fi

htpasswd -nb -B admin $1 | cut -d ":" -f 2 | sed 's/\$/\$\$/g'
