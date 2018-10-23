# Geth Docker

## High-Performance Node
Run with `docker-compose up -d` to start high performance ethereum service.

The max length of pending transaction in trx pool is 10,000 but depends your RAM, 32G RAM is recommend.

Prune non-executed trx period is 1m.

full node isn't recommend because of little bugs, and default sync mode here is fast mode.

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
