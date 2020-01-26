Image download
----

1. `wget http://ftp.freebsd.org/pub/FreeBSD/snapshots/ISO-IMAGES/13.0/FreeBSD-13.0-CURRENT-arm64-aarch64-PINE64-20200116-r356767.img.xz`
2. Run `unxz` on it


Setup
-----

1. Ethernet connection setup

* On target (board):
        
        // Only fot tests - permanent setup preferred (below)
        // ifconfig awg0 192.168.79.2 netmask 255.255.255.0 up
        // route add default 192.168.79.1

    - Set in /etc/rc.conf
        ```
        hostname="pine64"
        ifconfig_awg0="192.168.79.2 netmask 255.255.255.0 up"
        defaultrouter="192.168.79.1"
        ```
    - Then
        ```
        $ echo 'nameserver 8.8.8.8' >> /etc/resolv.conf
        ```
    - For test
        ```
        $ service netif restart
        $ service routing restart
        ```

    - Allow ssh login with password

        ```
        $ vi /etc/ssh/sshd_config
        // add PermitRootLogin yes
        $ service sshd restart
        ```

* On the host(laptop):
    ```
    ./connection_setup.sh
    ```

2. Time synchronisation setup
    $ echo 'ntpd_enable="YES" >> /etc/rc.conf'
    $ echo 'ntpd_sync_on_start="YES" >> /etc/rc.conf'


