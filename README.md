# Geth Docker

## For Production

```shell
docker pull islishude/geth
mkdir -p -m 777 /chaindata/geth

docker run -d -p 8545:8545 -p 30330:30330 \
  -v /chaindata/geth:/chaindata/geth \
  --name geth --user geth \
  islishude/geth --datadir /chaindata/geth \
  --rpc --rpcapi="eth,txpool,net,web3" \
  --rpcaddr=0.0.0.0 --rpcvhosts=* --rpccorsdomain=* 
```

## For Development

- [Private Networks](https://geth.ethereum.org/docs/interface/private-network)
- [Dev mode](https://geth.ethereum.org/getting-started/dev-mode)