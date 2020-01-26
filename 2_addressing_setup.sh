sudo sysctl net.ipv4.ip_forward=1
sudo ip link set dev enp9s0 down
sudo ip add add 192.168.79.1/24 dev enp9s0
sudo ip link set dev enp9s0 promisc on
sudo ip link set dev enp9s0 up
