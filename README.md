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
$ sudo group add [groupname]
```
## Adding users to a group
```bash
sudo usermod -aG [groupname] [username]
```
-a stands for (append) -G (groups)
## Adding Password complexity
### Min password length
To set minimum password length, edit /etc/pam.d/common-password file:
>make a copy of the file for safety
```bash
sudo cp /etc/pam.d/common-password /etc/pam.d/common-password.bak
```
Open the file
```bash
sudo vim /etc/pam.d/common-password
```
Add minlen=10 to the following line
```bash
password [success=2 default=ignore] pam_unix.so obscure yescrypt minlen=10
```
### Password complexity
First install password quality cheking library using the command
```bash
$ sudo apt install libpan-pwquality
```
Open the file
```bash
sudo vim /etc/pam.d/common-password
```
Add the following commands to the end of the line
```bash
password        requisite                       pam_pwquality.so retry=3 ucredit=-1 lcredit=-1 ocredit=-1 difok=7 reject_username
```
>lcredit=-1 - Define the minimun number of lower letters <br>
ucredit=-1 - Define the minimun number of upper letters<br>
ocredit=-1 - Define the minimun number of special characters<br>
difok=7 - Prevent the user to use 7 characters from the former password<br>
reject_username - Prevent for using the username int the password


