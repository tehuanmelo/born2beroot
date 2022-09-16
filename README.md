    # born2beroot
This project aims to introduce you to the wonderful world of virtualization.
You will create your first machine in VirtualBox (or UTM if you can’t use VirtualBox)
under specific instructions. Then, at the end of this project, you will be able to set up
your own operating system while implementing strict rules.

# Installing Sudo
Login as root
```bash
$ su -
```
Update apt
```bash
$ apt update
```
Install sudo
```bash
$ apt install sudo
```

## Adding user to sudo group
```bash
$ sudo usermod -aG [groupname] [username]
```
or
```bash
$ sudo adduser [username] [groupname]
```
>-a stands for (append) -G (groups)

listing the user groups
```bash
$ groups [username]
```


## Creating new group

Now user has superpowers you can run sudo direct from the user and create the user42 group
```
$ sudo groupadd [groupname]
```
>Than add the user to user42 group using the previous command

list all groups run this command
```bash
$ getent group
```

## Creating new user

```bash
$ adduser [username]
```

To list all the users run this command
```bash
$ getent passwd
```

chad

# SSH

## Install openssh-server
```bash
$ sudo apt install openssh-server
```

Verify if openssh-server was installed
```bash
$ ssh -V
#or
$ ssh -v localhost
#or
$ dpkg -l | grep ssh
```

Verify the status of ssh
```bash
$ sudo systemctl status ssh
``` 

Getting the ip address
```bash
$ ip addr
```

## Changing the Port 22, and Disabling root ssh

Edit this file **/etc/ssh/sshd_config**
```bash
$ sudo vi /etc/ssh/sshd_config
```
Search the entry Port 22 and change it
```bash
#Port22
Port 4242
```
Search the entry #PermitRootLogin and change it
```bash
#PermitRootLogin prohibit-password
PermitRootLogin no
```

## Conecting to the server

```bash
$ ssh [username]@[ip_address_of_the_server] -p 4242
```

# UFW
Install ufw
```bash
$ sudo apt install ufw
```
Verifying UFW status
```bash
$ sudo ufw status
```
Allowing ssh conections
```bash
$ sudo ufw allow 4242
```
Enabling UFW
```bash
$ sudo ufw enable
```

# Adding Password complexity

## Password age

Edit this file
```bash
$ sudo vim /etc/login.defs
```
Change these lines
```
PASS_MAX_DAYS     30  - Expire date
PASS_MIN_DAYS     2   - Min days for changing
PASS_WARN_AGE     7   - Warning the user 7 days before expire
```

### Password complexity

Install password quality cheking library
```bash
$ sudo apt install libpam-pwquality
```

Open the file
```bash
sudo vim /etc/pam.d/common-password
```

Add the following commands to the end of this line
```bash
password        requisite                       pam_pwquality.so retry=3 minlen=10 ucredit=-1 lcredit=-1 ocredit=-1 difok=7 maxrepeat=3 reject_username enforce_for_root
```
```bash
minlen=10  - Defines the minimum password length
lcredit=-1 - Define the minimun number of lower letters
ucredit=-1 - Define the minimun number of upper letters
dcredit=-1 - Define the minimun number of special characters
difok=7 - Prevent the user to use 7 characters from the former password
maxrepeat=3 - the maximum number of times a single character may be repeated
reject_username - Prevent for using the username into the password
enforce_for_root  - Apply the rules for the rootpa
```




