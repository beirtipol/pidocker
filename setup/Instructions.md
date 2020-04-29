- Download Raspberry Pi Imager
- Install raspbian lite on sd card
- Once complete, remove and reinsert sd card
- create file 'ssh' on root
- edit config.txt and add the following lines
```
gpu_mem_16=1
arm_64bit=1
```
- Copy `setup.sh` and `ssh` to sdcard
- put card in pi and boot up
- After 10-30 seconds, ping 'raspberrypi'. Depending on your network, you may need to find the IP and use that directly.
- You may need to remove old entries of 'raspberrypi' from ~/.ssh/known_hosts if setting up multiple hosts
- ssh pi@raspberrypi (password 'raspberry') and run below script (it will reboot at the end)
- `sudo /bin/bash /boot/setup.sh`
- After rebooting, you can use your router config to fix the IP address to the hostname. It's not strictly necessary but makes life a little easier.
- Once this is done, reboot the pi
- If you're running cygwin, now is the time to copy your ssh ID over.
- ```ssh-copy-id $USER@pihostname```
