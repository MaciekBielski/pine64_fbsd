sudo firewall-cmd --direct --add-rule ipv4 nat POSTROUTING 0 \
	-o wlp3s0 -j MASQUERADE
sudo firewall-cmd --direct --add-rule ipv4 filter FORWARD 0 \
	-i enp9s0 -o wlp3s0 -j ACCEPT
sudo firewall-cmd --direct --add-rule ipv4 filter FORWARD 0 \
	-i wlp3s0 -o enp9s0 -m state --state RELATED,ESTABLISHED -j ACCEPT
sudo firewall-cmd --add-port=22/tcp
echo [!] The setup is not super secure. Do not open SSH on your laptop
