#!/bin/bash
#########################################################
#                                                       #
#    Written by Ali Hariri <hariri.ali.93@gmail.com>    #
#                                                       #
#     Enable routing and NAT between 2 interfaces       #
#                                                       #
#########################################################

sudo sysctl -w net.ipv4.ip_forward=1
sudo ifconfig eth0 192.168.27.1 netmask 255.255.255.0
sudo iptables -t nat -A POSTROUTING -o wlan0 -j MASQUERADE
sudo iptables -A FORWARD -o wlan0 -s 192.168.27.0/24 -j ACCEPT
sudo iptables -I INPUT -s 192.168.27.0/24 -j ACCEPT
sudo service isc-dhcp-server restart

# sudo sysctl -w net.ipv4.ip_forward=0
# sudo ifconfig eth0 192.168.1.10 netmask 255.255.255.0
# sudo iptables -t nat -D POSTROUTING -o wlan0 -j MASQUERADE
# sudo iptables -D FORWARD -o wlan0 -s 192.168.1.0/24 -j ACCEPT
# sudo iptables -D INPUT -s 192.168.1.0/24 -j ACCEPT

