# born2beroot
## Installing Sudo
```bash
apt update
apt install sudo
```
## Installing Vim
```bash
apt install vim
```
## Adding user
```bash
sudo adduser [username]
```
The command will ask  few questions, only password is required.
## Creating new group
```bash
sudo group add [groupname]
```
## Adding users to a group
```bash
sudo usermod -aG [groupname] [username]
```
-a stands for (append) -G (groups)