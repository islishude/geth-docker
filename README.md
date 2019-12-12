# Geth Docker

## Production node

**Don't run container by root!**

```shell
# make sure that YOUR uid is 1000 or create it
groupadd -g 1000 -r geth && useradd -g 1000 -D -r -u 1000 geth
chmod -aG docker geth
```

```shell
docker pull islishude/geth
mkdir chaindata
docker run -d -p 8545:8545 -p 30330:30330 \
  -v $(pwd)/chaindata:/home/geth/.ethereum \
  --name geth -u 1000 islishude/geth
```

## Private chain and test node

### Quick start

```shell
docker pull islishude/geth
# create chaindata and edit genesis.json
mkdir -p chaindata
# init genesis data for test environment
docker run --rm -v $(pwd)/chaindata:/home/geth/.ethereum \
  -v $(pwd)/genesis.json:/home/geth/genesis.json:ro \
  -w /home/geth -u 1000 \
  islishude/geth init genesis.json
# use flowing docker-compose config and start testrpc
docker-compose up -d
```

### docker-compose test for node

```yaml
version: "3"

services:
  geth:
    build: .
    restart: unless-stopped
    ports:
      - "8545:8545"
      - "8546:8546"
    user: geth
    volumes:
      - ${PWD}/chaindata:/home/geth/.ethereum/
    stop_signal: SIGINT
    stop_grace_period: 2m
    command:
      - --rpc
      - --rpcaddr=0.0.0.0
      - --rpcvhosts=*
      - --rpccorsdomain=*
      - --ws
      - --wsorigins=*
      - --nodiscover
    logging:
      driver: "json-file"
      options:
        max-size: "200k"
        max-file: "10"
```

### Import your raw private key

```shell
docker-compose exec geth sh
geth attach
person.importRawKey("RAW KEY WITHOUT 0x SEE BLOW", "YOUR-PASSWORD")
```

### Mining

run mining after imported your etherbase key

```shell
docker-compose exec geth sh
geth attach
> miner.start(1) // use 1 core cpu
true
> miner.stop()
true
```

## prvkeys within genesis.json

Each of the following accounts has 1024 ETH

### BIP39 Mnemonic for genesis.json

awful negative waste juice love truth nose coffee top legend method imitate
