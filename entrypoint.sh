#!/bin/bash
## Generate server key if needed
SERVERKEY="/etc/openvpn/server.key"
if [ ! -f $SERVERKEY ]; then
    echo "# Generate server key"
    openvpn --genkey --secret $SERVERKEY
fi

echo "# Server key: " $SERVERKEY
cat $SERVERKEY

chmod 600 $SERVERKEY

## Generate config
SERVERCONFIG="/etc/openvpn/server.conf"
if [ ! -f $SERVERCONFIG ]; then
    echo "# Generate server config"
    echo "dev tun" >> $SERVERCONFIG
    echo "proto tcp-server" >> $SERVERCONFIG
    echo "port 1194" >> $SERVERCONFIG
    echo "ifconfig 192.168.255.1 192.168.255.2" >> $SERVERCONFIG
    echo "route 192.168.1.0 255.255.255.0" >> $SERVERCONFIG
    echo "comp-lzo" >> $SERVERCONFIG
    echo "keepalive 10 60" >> $SERVERCONFIG
    echo "ping-timer-rem" >> $SERVERCONFIG
    echo "persist-key" >> $SERVERCONFIG
    echo "persist-tun" >> $SERVERCONFIG
    echo "user nobody" >> $SERVERCONFIG
    echo "group nogroup" >> $SERVERCONFIG
    echo "secret filiale1.key " >> $SERVERCONFIG
fi

echo "# Server config: " $SERVERKEY
cat $SERVERCONFIG
