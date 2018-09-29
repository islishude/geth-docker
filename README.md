## Geth Full Mode

Add nginx proxy to protect Ethereum JSON-RPC API with password.

start it by `docker-compose up -d`.

## Set Auth

```
# ubuntu
# Install htpasswd
apt install apache2-utils -y
# Add to auth.txt
htpasswd -c auth.txt YOUR-USERNAME
# And input twice password
```
