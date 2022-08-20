# Your server's IP address is a.b.c.d
HOSTNAME=$(hostname -I)
GUESSED_IP=$(echo $HOSTNAME | gawk -F' ' '{print $1}')
echo -e "$HOSTNAME"
read -p "Select your public IP (It's probably $GUESSED_IP): " IP
SUBNET=$(echo $IP | gawk -F'.' '{print $1"."$2"."$3".0"}')
INTERFACE=$(ip -4 -o a | cut -d ' ' -f 2,7 | cut -d '/' -f 1 | grep $IP | gawk -F' ' '{print $1}')
DEFAULT_GATEWAY=$(ip route | grep 'default via' | gawk -F' ' '{print $3}')
echo -e "\n\t\tip rule add table 128 from $IP"
echo -e "\t\tip route add table 128 to $SUBNET/24 dev $INTERFACE"
echo -e "\t\tip route add table 128 default via $DEFAULT_GATEWAY\n"
read -p "I'm about to issue these commands, are you sure you want to continue? (y/n): " SURE
if [[ $SURE -eq 'y' ]]; then
	ip rule add table 128 from $IP
	ip route add table 128 to $SUBNET/24 dev $INTERFACE
	ip route add table 128 default via $DEFAULT_GATEWAY
fi
