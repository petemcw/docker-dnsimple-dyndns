#!/bin/bash

DNS_LOGIN="{{LOGIN}}"
DNS_TOKEN="{{TOKEN}}"
DNS_DOMAIN_ID="{{DOMAIN_ID}}"
DNS_RECORD_ID="{{RECORD_ID}}"
IP=`curl -s https://api.ipify.org`

if [ ! -z "$DNS_LOGIN" ]; then

curl -H "Accept: application/json" \
     -H "Content-Type: application/json" \
     -H "X-DNSimple-Token: $DNS_LOGIN:$DNS_TOKEN" \
     -X "PUT" \
     -i "https://api.dnsimple.com/v1/domains/$DNS_DOMAIN_ID/records/$DNS_RECORD_ID" \
     -d "{\"record\":{\"content\":\"$IP\"}}"

fi
