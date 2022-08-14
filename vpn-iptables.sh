# Your server's IP address is a.b.c.d
ip rule add table 128 from a.b.c.d
# Your subnet is a.b.c.0/24 and your interface is eth0
ip route add table 128 to a.b.c.0/24 dev eth0
# Your default gateway is x.x.x.x
ip route add table 128 default via x.x.x.x
