# Geth Docker

- security by default, No root, No shell
- minimal and static binary
- multi-arch

## Use the docker image

```
docker pull ghcr.io/islishude/geth:latest
docker pull ghcr.io/islishude/geth:1.13.7
```

**NOTE**: the default user id of the image is **65532**

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
# an example for aws and ebs csi
apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  name: my-ebs
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

the statefulsets are using official image(ethereum/client-go).

if you want to use my image, then you need to add securityContext to the statefulset due to the default user is not root.

```yaml
spec:
  template:
    spec:
      securityContext:
        runAsUser: 65532
        runAsGroup: 65532
        fsGroup: 65532
        fsGroupChangePolicy: OnRootMismatch
```

Start the statefulset in default namespace, you can add `-n` parameter to change it.

```
kubectl apply -n namespace -k k8s
```

## For Development

- [Private Networks](https://geth.ethereum.org/docs/interface/private-network)
- [Dev mode](https://geth.ethereum.org/getting-started/dev-mode)

## Command line help page

- [geth](./flags/geth)
- [prysm](./flags/prysm-beacon-chain)
