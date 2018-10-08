# Geth Docker

## High-Performance Node
Run with `docker-compose up -d` to start high performance ethereum service.

Recommend 500G SSD and 32G RAM

## Geth Proxy
Add nginx proxy to protect Ethereum JSON-RPC API with password.

start it by `cd proxy/full && docker-compose up -d`.

**Set Auth Helper**

```
# ubuntu
# Install htpasswd
apt install apache2-utils -y
# Add to auth.txt
htpasswd -c auth.txt YOUR-USERNAME
# And input twice password
```
