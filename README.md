# Geth Docker

## For Production

### docker-compose

```console
$ export GETH_DATADIR=/data/geth
$ docker-compose up -d
```

Get logs

```
gethnode  | INFO [06-29|23:46:05.878] Starting Geth on Ethereum mainnet... 
gethnode  | INFO [06-29|23:46:05.878] Bumping default cache on mainnet         provided=1024 updated=4096
gethnode  | INFO [06-29|23:46:05.880] Maximum peer count                       ETH=50 LES=0 total=50
gethnode  | INFO [06-29|23:46:05.881] Smartcard socket not found, disabling    err="stat /run/pcscd/pcscd.comm: no such file or directory"
gethnode  | INFO [06-29|23:46:05.892] Set global gas cap                       cap=50,000,000
gethnode  | INFO [06-29|23:46:05.893] Allocated trie memory caches             clean=614.00MiB dirty=1024.00MiB
gethnode  | INFO [06-29|23:46:05.894] Allocated cache and file handles         database=/root/.ethereum/geth/chaindata cache=2.00GiB handles=524,288
gethnode  | INFO [06-29|23:46:05.952] Opened ancient database                  database=/root/.ethereum/geth/chaindata/ancient readonly=false
gethnode  | INFO [06-29|23:46:05.952] Writing default main-net genesis block 
gethnode  | INFO [06-29|23:46:06.501] Persisted trie from memory database      nodes=12356 size=1.78MiB time=82.688233ms gcnodes=0 gcsize=0.00B gctime=0s livenodes=1 livesize=0.00B
```

### Kubernetes

Change [storage class](k8s/storageclass.yaml) and [pvc](k8s/pvc.yaml) first.

Start geth node

```
kubectl apply -f k8s
```

## For Development

- [Private Networks](https://geth.ethereum.org/docs/interface/private-network)
- [Dev mode](https://geth.ethereum.org/getting-started/dev-mode)
