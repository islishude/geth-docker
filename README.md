# Geth Docker

## For Production

```shell
docker pull islishude/geth
mkdir -p -m 777 /chaindata/geth

docker run -d -p 8545:8545 -p 30330:30330 -v /chaindata/geth:/chaindata
  islishude/geth --datadir=/chaindata \
  --http --http.api="eth" --http.addr=0.0.0.0 --http.vhosts=*
```

## For Development

- [Private Networks](https://geth.ethereum.org/docs/interface/private-network)
- [Dev mode](https://geth.ethereum.org/getting-started/dev-mode)
