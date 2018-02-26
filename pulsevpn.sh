#!/usr/bin/env bash

# This will grap server certificate fingerprint, which is neeede for authentication and login
SERVER_CERT="--servercert `echo 'no' | openconnect -q --disable-ipv6 --protocol=nc ${VPN_URL} 2>&1 | grep '\-\-servercert' | awk '{print $2}'`"

# openconnect will ask in a sequence following information:
# username: IBM security manager username
# password: IBM security manager password
# password: second password is an OTP 2FA SMS code
#
# First openconnect will perform authentication and will return cookie,
# second login to the Pulse VPN server and goes to the background (-b)
echo "Hit Enter if there is no prompt for long time"
echo "Please enter your IBM secirity manager username and passsword"
echo "Second password: OTP code (will be sent to your cellphone)"
openconnect -q --cookieonly ${VPN_OPTIONS} ${SERVER_CERT} ${VPN_URL} --passwd-on-stdin | \
openconnect -b ${VPN_OPTIONS} ${SERVER_CERT} ${VPN_URL} --cookie-on-stdin
