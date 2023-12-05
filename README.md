# Geth Docker

## Use the docker image

```
docker pull ghcr.io/islishude/geth:latest --help
docker pull ghcr.io/islishude/geth:1.13.5 --help
```

## docker-compose

- [mainnet](./docker-compose/mainnet)
- [holesky](./docker-compose/holeksy)
- [sepolia](./docker-compose/sepolia)
- [goerli](./docker-compose/goerli)

**Create the storage directories**

```console
$ export GETH_DATADIR=/data/geth
$ sudo mkdir -p $GETH_DATADIR
$ export PRYSM_DATADIR=/data/prysm
$ sudo mkdir -p $PRYSM_DATADIR
```

**Start**

```
$ docker-compose up -d
```

## Kubernetes

- [mainnet](./k8s/mainnet)
- [holesky](./k8s/holeksy)
- [sepolia](./k8s/sepolia)
- [goerli](./k8s/goerli)

**Create a storage class like following**

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

then update pvc.yaml file to change the storage class name to the above.

Start the statefulset in default namespace, you can add `-n` parameter to change it.

```
kubectl apply -n namespace -k k8s
```

## For Development

- [Private Networks](https://geth.ethereum.org/docs/interface/private-network)
- [Dev mode](https://geth.ethereum.org/getting-started/dev-mode)
