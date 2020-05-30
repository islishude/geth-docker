# Geth Docker

## For Production

```shell
docker pull islishude/geth
mkdir -p -m 777 /chaindata/geth

docker run -v /chaindata:/chaindata islishude/geth --datadir=/chaindata
```

## For Development

- [Private Networks](https://geth.ethereum.org/docs/interface/private-network)
- [Dev mode](https://geth.ethereum.org/getting-started/dev-mode)
