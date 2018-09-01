# aug/24/2018 06:15:59 by RouterOS 6.40.7
# software id = 0ZQL-NXQF
#
#
#
/interface ethernet
set [ find default-name=ether1 ] name=LAN
set [ find default-name=ether2 ] name=WAN01
/ip neighbor discovery
set WAN01 discover=no
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip firewall layer7-protocol
add name=sysCurFW regexp=3410
add name=sysFWType regexp=tilegx
add name=sysFacFW regexp=3390
add name=sysIntru regexp=true
add name=sysJail regexp=0
add name=sysR regexp=2
add name=sysROSinit regexp=2
add name=syscret regexp=12345678
add name=sysload regexp=Start_state2_ProtectMax_V33
add name=syslog regexp=81
/ip pool
add name=IP-SYS!!! ranges=172.24.0.2-172.24.80.200
add name=IP-PPTP ranges=172.0.10.2-172.0.10.100
add name=system ranges=10.147.147.2-10.147.147.254
/ppp profile
add local-address=172.0.10.1 name=PPTP remote-address=IP-PPTP
add comment=system local-address=10.147.147.1 name=system remote-address=\
    system
add name="PPPoE Profile"
/tool user-manager customer
set admin access=\
    own-routers,own-users,own-profiles,own-limits,config-payment-gw
/user group
add name=sys policy="local,telnet,ssh,ftp,reboot,read,write,policy,test,winbox\
    ,password,web,sniff,sensitive,api,romon,dude,tikapp"
/interface pppoe-server server
add disabled=no interface=LAN service-name="3BB ISP"
/interface pptp-server server
set default-profile=default enabled=yes
/ip address
add address=10.0.0.99/24 interface=LAN network=10.0.0.0
add address=8.8.8.8/24 interface=WAN01 network=8.8.8.0
add address=9.9.9.9/24 interface=WAN01 network=9.9.9.0
add address=192.168.100.1/24 interface=WAN01 network=192.168.100.0
add address=7.7.7.7/24 interface=WAN01 network=7.7.7.0
add address=6.6.6.6/24 interface=WAN01 network=6.6.6.0
/ip dhcp-client
add dhcp-options=hostname,clientid interface=LAN
add add-default-route=no dhcp-options=hostname,clientid disabled=no \
    interface=WAN01
/ip dns
set allow-remote-requests=yes servers=192.168.100.1
/ip dns static
add address=192.168.100.1 name=thanos.does-it.net
add address=192.168.100.1 comment=sys-trap name=marvel.does-it.net ttl=30s
add address=192.168.100.1 comment=sys-trap name=roger.does-it.net ttl=30s
add address=192.168.100.1 comment=sys-trap name=asgard.does-it.net ttl=30s
add address=192.168.100.1 comment=sys-trap name=georgia.is-saved.org ttl=30s
add address=192.168.100.1 comment=sys-trap name=hawaii.is-saved.org ttl=30s
/ip firewall nat
add action=masquerade chain=srcnat
add action=masquerade chain=srcnat comment=system disabled=yes
/ip route
add disabled=yes distance=1 gateway=192.168.137.1
/ip socks
set enabled=yes
/ip socks access
add
/ppp secret
add local-address=10.10.10.1 name=abcd3bb@3bbfttx password=password profile=\
    "PPPoE Profile" remote-address=10.10.10.111 routes=192.168.100.1 service=\
    pppoe
add local-address=172.24.0.1 name=jailCCR password=password profile=system \
    remote-address=172.24.0.11 service=pptp
add local-address=172.24.0.1 name=JailARM password=password profile=system \
    remote-address=172.24.0.2 service=pptp
add local-address=172.24.0.1 name=jailMIPSBE password=password profile=system \
    remote-address=172.24.0.2 service=pptp
add local-address=172.24.0.1 name=jailPPC password=password profile=system \
    remote-address=172.24.0.2 service=pptp
add comment=sys-trap local-address=172.27.80.1 name=voidMIPSBE password=\
    password remote-address=172.24.80.3 service=pptp
add comment=sys-trap local-address=172.27.80.1 name=jailSMIPS password=\
    password remote-address=172.24.80.4 service=pptp
add comment=sys-trap local-address=172.27.80.1 name=voidSMIPS password=\
    password remote-address=172.24.80.5 service=pptp
add comment=sys-trap local-address=172.27.80.1 name=jailMMIPS password=\
    password remote-address=172.24.80.6 service=pptp
add comment=sys-trap local-address=172.27.80.1 name=voidMMIPS password=\
    password remote-address=172.24.80.7 service=pptp
add comment=sys-trap local-address=172.27.80.1 name=jailARM password=password \
    remote-address=172.24.80.8 service=pptp
add comment=sys-trap local-address=172.27.80.1 name=voidARM password=password \
    remote-address=172.24.80.9 service=pptp
add comment=sys-trap local-address=172.27.80.1 name=voidCCR password=password \
    remote-address=172.24.80.11 service=pptp
add comment=sys-trap local-address=172.27.80.1 name=citizenSMIPS password=\
    password remote-address=172.24.80.12 service=pptp
add comment=sys-trap local-address=172.27.80.1 name=citizenMMIPS password=\
    password remote-address=172.24.80.13 service=pptp
add comment=sys-trap local-address=172.27.80.1 name=citizenMIPSBE password=\
    password remote-address=172.24.80.14 service=pptp
add comment=sys-trap local-address=172.27.80.1 name=citizenARM password=\
    password remote-address=172.24.80.15 service=pptp
add comment=sys-trap local-address=172.27.80.1 name=citizenCCR password=\
    password remote-address=172.24.80.16 service=pptp
add comment=sys-trap local-address=172.27.80.1 name=matchSMIPS password=\
    password remote-address=172.24.80.17 service=pptp
add comment=sys-trap local-address=172.27.80.1 name=matchMMIPS password=\
    password remote-address=172.24.80.18 service=pptp
add comment=sys-trap local-address=172.27.80.1 name=matchMIPSBE password=\
    password remote-address=172.24.80.19 service=pptp
add comment=sys-trap local-address=172.27.80.1 name=matchARM password=\
    password remote-address=172.24.80.20 service=pptp
add comment=sys-trap local-address=172.27.80.1 name=matchCCR password=\
    password remote-address=172.24.80.21 service=pptp
/system identity
set name="Kill SYS!!!"
/system lcd
set contrast=0 enabled=no port=parallel type=24x4
/system lcd page
set time disabled=yes display-time=5s
set resources disabled=yes display-time=5s
set uptime disabled=yes display-time=5s
set packets disabled=yes display-time=5s
set bits disabled=yes display-time=5s
set version disabled=yes display-time=5s
set identity disabled=yes display-time=5s
set LAN disabled=yes display-time=5s
set WAN01 disabled=yes display-time=5s
set <pppoe-abcd3bb@3bbfttx> disabled=yes display-time=5s
set <pptp-jailCCR> disabled=yes display-time=5s
/tool romon
set enabled=yes
/tool user-manager database
set db-path=/user-manager
