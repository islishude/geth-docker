# Geth Docker

## Use the docker image

```
docker run --rm ghcr.io/islishude/geth:latest --help
```

## Mainnet

### Run mainnet node with docker-compose

Create storage directories

```console
$ export GETH_DATADIR=/data/geth
$ sudo mkdir -p $GETH_DATADIR
$ export PRYSM_DATADIR=/data/prysm
$ sudo mkdir -p $PRYSM_DATADIR
```

Start for mainnet

```
$ docker-compose up -d
```

### Run mainnet node with kubernetes

Create a storage class like following

```yaml
apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  name: ebs-gp3
parameters:
  csi.storage.k8s.io/fstype: xfs
  encrypted: "false"
  iops: "3000"
  type: gp3
provisioner: ebs.csi.aws.com
reclaimPolicy: Delete
volumeBindingMode: WaitForFirstConsumer
allowVolumeExpansion: true
```

then update [pvc](k8s/pvc.yaml) file with the storage class name.

Start the statefulset in default namespace, you can add `-n` parameter to change it.

```
kubectl apply -k k8s
```

## Testnet

- [holesky](./testnet/holeksy)
- [sepolia](./testnet/sepolia)

## For Development

- [Private Networks](https://geth.ethereum.org/docs/interface/private-network)
- [Dev mode](https://geth.ethereum.org/getting-started/dev-mode)
