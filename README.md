# Geth Docker

## For Production

### docker-compose

```console
$ export GETH_DATADIR=/data/geth
$ sudo mkdir -p $GETH_DATADIR
$ openssl rand -hex 32 | tr -d "\n" > "$GETH_DATADIR/jwt.hex"
$ docker-compose up -d
```

Get logs

```console
$ docker-compose logs -f
geth  | INFO [06-29|23:46:05.878] Starting Geth on Ethereum mainnet... 
geth  | INFO [06-29|23:46:05.878] Bumping default cache on mainnet         provided=1024 updated=4096
geth  | INFO [06-29|23:46:05.880] Maximum peer count                       ETH=50 LES=0 total=50
geth  | INFO [06-29|23:46:05.881] Smartcard socket not found, disabling    err="stat /run/pcscd/pcscd.comm: no such file or directory"
geth  | INFO [06-29|23:46:05.892] Set global gas cap                       cap=50,000,000
geth  | INFO [06-29|23:46:05.893] Allocated trie memory caches             clean=614.00MiB dirty=1024.00MiB
geth  | INFO [06-29|23:46:05.894] Allocated cache and file handles         database=/root/.ethereum/geth/chaindata cache=2.00GiB handles=524,288
geth  | INFO [06-29|23:46:05.952] Opened ancient database                  database=/root/.ethereum/geth/chaindata/ancient readonly=false
geth  | INFO [06-29|23:46:05.952] Writing default main-net genesis block 
geth  | INFO [06-29|23:46:06.501] Persisted trie from memory database      nodes=12356 size=1.78MiB time=82.688233ms gcnodes=0 gcsize=0.00B gctime=0s livenodes=1 livesize=0.00B
```

### Kubernetes

First, change [storage class](k8s/storageclass.yaml) and [pvc](k8s/pvc.yaml) first.

And then genreate random JWT for geth's auth rpc

```
openssl rand -hex 32 | tr -d "\n" > "k8s/jwt.hex"
```

You can start geth node with

```
kubectl apply -k k8s
```

## For Development

- [Private Networks](https://geth.ethereum.org/docs/interface/private-network)
- [Dev mode](https://geth.ethereum.org/getting-started/dev-mode)
