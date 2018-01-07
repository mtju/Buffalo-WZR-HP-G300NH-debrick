# Debricking Buffalo WZR-HP-G300NH

This is a Vagrant configuration made for flashing a bricked Buffalo WZR-HP-G300NH router using TFTP. Tested on Windows 10 environment but should work on other operating systems too.

## Prerequisites

* Bricked Buffalo WZR-HP-G300NH
* A spare working router/switch
* Two Ethernet cables
* PC
* Vagrant and VirtualBox installed

## Usage

* Checkout this repository
* Connect PC to the working switch using Ethernet cable (did not work over WiFi for me)
* Connect bricked Buffalo router's LAN 4 port (closest to the WAN port) to any port of the working switch
* Download `V24-SP2 build 14998b` version of firmware from [here](http://www.buffalotech.com/support/downloads/airstation-high-power-n300-wireless-router-ap).
* Extract downloaded archive to `files\wzrhpg300nh-pro-v24sp2-14998b`
* `vagrant up`
* `vagrant ssh`
* Plug in router power cord and run `/vagrant/flash.sh`. After around half a minute you should see a similar output:
```
[vagrant@localhost vagrant]$ /vagrant/flash.sh
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 11.8M    0     0  100 11.8M      0   478k  0:00:25  0:00:25 --:--:-- 1092k
100 11.8M    0     0  100 11.8M      0   478k  0:00:25  0:00:25 --:--:--  478k
```
* Wait while router reboots (DIAG LED stops flashing)
* Go to http://192.168.11.1 to confirm that firmware installation was successful

NB: If you're changing `flash.sh` from host, use `vagrant rsync` to synchronize your changes to guest OS.

## References

https://wiki.openwrt.org/toh/buffalo/wzr-hp-g300h
https://networkwiki.blogspot.com/2013/06/how-to-de-brick-buffalo-wzr-600dhp.html

---

# Upgrade from DD-WRT to LEDE

* Enable SSH from [web interface](http://192.168.11.1/). Default credentials user is `root` and password is blank.
* Download [this LEDE image](https://downloads.lede-project.org/releases/17.01.4/targets/ar71xx/generic/lede-17.01.4-ar71xx-generic-wzr-hp-g300nh-squashfs-sysupgrade.bin) or search for a newer one.
* Transfer `lede-17.01.4-ar71xx-generic-wzr-hp-g300nh-squashf
s-sysupgrade.bin` file to the `/tmp` using WinSCP or some other SFTP client
* SSH into DD-WRT
* `cd /tmp`
* `mtd -r write lede-17.01.4-ar71xx-generic-wzr-hp-g300nh-squashf
s-sysupgrade.bin linux`
* Wait for restart
* Go to http://192.168.1.1 to confirm that firmware installation was successful. Credentials user is `root` and password is blank.

## References

https://forum.lede-project.org/t/how-to-upgrade-from-dd-wrt-to-lede-buffallo-whr-hp-g300n/2889/11
