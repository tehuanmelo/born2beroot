# born2beroot

## Step 1

### Installing Sudo

```bash
#Login as root
$ su -
# Update apt
$ apt update
# Install sudo
$ apt install sudo
```

### Adding user to sudo group
```bash
$ sudo usermod -aG [groupname] [username]
# or
$ sudo adduser [username] [groupname]
# -a stands for (append) -G (groups)
```

### Creating the new group
```bash
# Now user has superpowers you can run sudo direct from the user and create the user42 group
$ sudo groupadd [groupname]
# Than add the user to user42 group using the previous command
```
### Creating new user
```bash
$ adduser [username]
```

```bash
# To list all the users run this command
$ getent passwd
```
## Step 2
### SSH
```bash
# Install openssh-server
$ sudo apt install openssh-server
```
```bash
# Verify if openssh-server was installed
$ ssh -V
#or
$ ssh -v localhost
#or
$ dpkg -l | grep ssh
```
## Step 3

### Adding Password complexity

### Password age
```bash
# Edit this file
$ sudo vim /etc/login.defs
# Change these lines
# PASS_MAX_DAYS     30  - Expire date
# PASS_MIN_DAYS     2   - Min days for changing
# PASS_WARN_AGE     7   - Warning the user 7 days before expire
```

### Password complexity

```bash
# Install password quality cheking library
$ sudo apt install libpam-pwquality
```

```bash
# Open the file
sudo vim /etc/pam.d/common-password
```


```bash
# Add the following commands to the end of this line
password        requisite                       pam_pwquality.so retry=3 minlen=10 ucredit=-1 lcredit=-1 ocredit=-1 difok=7 reject_username enforce_for_root
#
# minlen=10  - Defines the minimum password length
# lcredit=-1 - Define the minimun number of lower letters
# ucredit=-1 - Define the minimun number of upper letters
# dcredit=-1 - Define the minimun number of special characters
# difok=7 - Prevent the user to use 7 characters from the former password
# reject_username - Prevent for using the username into the password
# enforce_for_root  - Apply the rules for the rootpa
```



