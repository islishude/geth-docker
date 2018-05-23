## GethDocker
Add nginx proxy to protect Ethereum JSON-RPC API with password.

start it by `docker-compose up -d`.

## Set Auth
```
# ubuntu
# install htpasswd
apt install apache2-util -y
#  auth to auth.txt
htpasswd -b auth.txt YOUR-USERNAME YOUR-PASSWORD
```