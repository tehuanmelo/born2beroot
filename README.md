# born2beroot
This project aims to introduce you to the wonderful world of virtualization.
You will create your first machine in VirtualBox (or UTM if you can’t use VirtualBox)
under specific instructions. Then, at the end of this project, you will be able to set up
your own operating system while implementing strict rules.

## Installing Sudo
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


## Creating new group

Now user has superpowers you can run sudo direct from the user and create the user42 group
```
$ sudo groupadd [groupname]
```
>Than add the user to user42 group using the previous command

## Creating new user

```bash
$ adduser [username]
```

To list all the users run this command
```bash
$ getent passwd
```

## SSH

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

## Adding Password complexity

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
password        requisite                       pam_pwquality.so retry=3 minlen=10 ucredit=-1 lcredit=-1 ocredit=-1 difok=7 reject_username enforce_for_root
```
```bash
minlen=10  - Defines the minimum password length
lcredit=-1 - Define the minimun number of lower letters
ucredit=-1 - Define the minimun number of upper letters
dcredit=-1 - Define the minimun number of special characters
difok=7 - Prevent the user to use 7 characters from the former password
reject_username - Prevent for using the username into the password
enforce_for_root  - Apply the rules for the rootpa
```



