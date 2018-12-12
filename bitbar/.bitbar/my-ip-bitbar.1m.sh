#!/bin/bash

# <bitbar.title>external-ip</bitbar.title>
# <bitbar.author>Mat Ryer</bitbar.author>
# <bitbar.author.github>matryer</bitbar.author.github>
# <bitbar.desc>Gets the current external IP address.</bitbar.desc>

# EXTERNAL_IP=$(dig +short myip.opendns.com @resolver1.opendns.com)
EXTERNAL_IP=$(curl ipinfo.io/ip 2> /dev/null)

if [ "$1" = "copy" ]; then
  # Copy the IP to clipboard
  echo -n "$EXTERNAL_IP" | pbcopy
fi

echo "$EXTERNAL_IP"
echo "---"
echo "External IP address: $EXTERNAL_IP"
echo "Copy External IP | terminal=false bash='$0' param1=copy"
echo "---"
ETHER_ADDRESS=""
for i in $(ifconfig | grep "^en[1-9]" | cut -d: -f1); do
    ETHER_ADDRESS=$(ipconfig getifaddr $i)
    if [ "$ETHER_ADDRESS" ]; then
        echo "Wired IP address ($i): $ETHER_ADDRESS"
        break
    fi
done
echo "Wireless IP address: $(ipconfig getifaddr en0)"
# echo "---"
# ifconfig "$ACTIVE_ADAPTER";
