#!/bin/bash

LOGIN=${LOGIN}
TOKEN=${TOKEN}
DOMAIN_ID=${DOMAIN_ID}
RECORD_ID=${RECORD_ID}

if [ ! -f /config/ddns.sh ]; then

echo "
-----------------------------------
DNSimple
-----------------------------------
Login:    $LOGIN
Token:    $TOKEN
Domain:   $DOMAIN_ID
Record:   $RECORD_ID
-----------------------------------
"

    echo "No config found, installing default script"
    cp /defaults/dnsimple.sh /config/ddns.sh
    echo "Setting script defaults"
    sed -i -e 's/{{LOGIN}}/'"$LOGIN"'/g' /config/ddns.sh
    sed -i -e 's/{{TOKEN}}/'"$TOKEN"'/g' /config/ddns.sh
    sed -i -e 's/{{DOMAIN_ID}}/'"$DOMAIN_ID"'/g' /config/ddns.sh
    sed -i -e 's/{{RECORD_ID}}/'"$RECORD_ID"'/g' /config/ddns.sh
fi

chown abc:abc -R /config
