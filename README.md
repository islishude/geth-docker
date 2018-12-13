# Geth Docker

## Start
`docker-compose up -d`

## Proxy
See `proxy/docker-compose.yml`

## Proxy Auth

```
# ubuntu
# Install htpasswd
apt install apache2-utils -y
# Add to auth.txt
htpasswd -c auth.txt YOUR-USERNAME
# And input twice password
```
