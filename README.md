# Simple bash scanners:

1. **bash port scanner** with % progress view 
2. **bash host discovery scanner** with % progress view

## 1. bash port scanner with % progress view instruction:
1. Copy `portscan.sh` file and make it executable: `chmod +x portscan.sh`
2. Run file: `./portscan.sh`
3. First insert your target IP
4. Then choose TCP or UDP scan type you want perform

![image](https://github.com/przemokam/port_scanner_bash/assets/124211669/6f8bc2b8-b90f-4e42-b039-9c8a9fc4331b)

Script scans all 65535 ports so it may take some time (about 10 minutes).

Feel free to use it in case you don't have access to nmap :)


## 2. bash host discovery scanner with % progress view instruction:
1. copy `hostscan.sh` file and make it executable: `chmod +x hostscan.sh`
2. Run file: `./hostscan.sh`
3. Insert your target network IP range eg. `192.168.1.0/24`

![image](https://github.com/przemokam/port_scanner_bash/assets/124211669/0f401223-1746-4c63-8f92-b5b1164903e3)

Script will scan all network and will look for alive hosts.

Feel free to use it in case you don't have access to nmap :)
