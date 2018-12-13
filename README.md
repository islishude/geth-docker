# Geth Docker

## Start

```bash
# Chain data path
mkdir .ethereum
sudo chmod -R 777 .ethereum
docker-compose up -d
```

## Proxy
See `proxy/docker-compose.yml` and `proxy/nginx.conf`,and default proxy port is `10240`

## Proxy Auth

```bash
# Install htpasswd
sudo apt install apache2-utils -y
# Add to auth.txt
htpasswd -c proxy/auth.txt YOUR-USERNAME
```
