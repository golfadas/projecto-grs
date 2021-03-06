### Flush any Existing iptable Rules and start afresh ###
iptables -F INPUT
iptables -F OUTPUT
iptables -F FORWARD

iptables -A FORWARD -p udp --dport 67:68 -j ACCEPT #//DHCP
iptables -A FORWARD -p udp --dport 161 -j ACCEPT   #//SNMP
iptables -A FORWARD -p tcp --dport 80 -j ACCEPT    #//apache
iptables -A FORWARD -p tcp --dport 53 -j ACCEPT    #//dns - udp for large queries
iptables -A FORWARD -p udp --dport 53 -j ACCEPT    #//dns - udp for small queries
iptables -A FORWARD -p tcp --dport 953 -j ACCEPT   #//dns internal

iptables -A FORWARD -p tcp --dport 110 -j ACCEPT #POP3
iptables -A FORWARD -p tcp --dport 143 -j ACCEPT #IMAP
iptables -A FORWARD -p tcp --dport 25 -j ACCEPT #SMTP

iptables -A FORWARD -p icmp -j ACCEPT  #//Allow ICMP Ping packets.
iptables -A FORWARD -p tcp -m tcp --tcp-flags ACK ACK -j ACCEPT
iptables -A FORWARD -m state --state ESTABLISHED -j ACCEPT
iptables -A FORWARD -m state --state RELATED -j ACCEPT
iptables -A FORWARD -j REJECT   #//Close up firewall. All else blocked.

