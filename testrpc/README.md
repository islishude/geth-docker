## genesis.json

`config` property of genesis.json can be found at `https://github.com/ethereum/go-ethereum/blob/master/params/config.go`

```json
{
  "config": {
    "chainId": 1, // chainId for ethereum mainnet
    "homesteadBlock": 0, // enable homestead fork
    "eip155Block": 0, // new signature supports
    "eip158Block": 0, // new EVM code supoorts
    "byzantiumBlock": 0 // enable byzantium fork
  },
  "nonce": "0x0000000000000042",
  "difficulty": "0x9999", // difficulty for miner
  "mixhash": "0x0000000000000000000000000000000000000000000000000000000000000000",
  "coinbase": "0x0000000000000000000000000000000000000000",
  "timestamp": "0x5b3f70b6", // genesis block timestamp
  "parentHash": "0x0000000000000000000000000000000000000000000000000000000000000000",
  "extraData": "0x11bbe8db4e347b4e8c937c1c8370e4b5ed33adb3db69cbdb7a38e1e50b1b82fa",
  "gasLimit": "0x4c4b40", // gas limit
  "alloc": {
    // genesis account balance
    "0xcc3AF91DCF8d38613Dc0B55dB5fd567d2e1f68FA": {
      "balance": "0x3635c9adc5dea000000"
    }
  }
}
```

## init

1.  mkdir data
2.  geth --datadir data init genesis.json

## console attach

1. open new terminal window
2. geth --datadir data --rpc --rpccorsdomain "\*" --nodiscover console

## console commands

1. import account: personal.importRawKey("", "password")
2. create new account: personal.newAccount("password")
3. node info: admin.nodeInfo
4. get balance: eth.getBalance("account")
5. mining: miner.start(cpu-core-number)
6. stop mining: miner.stop()
7. transfer: eth.sendTransaction({from:eth.accounts[0],to:"0x587e57a516730381958f86703b1f8e970ff445d9",value:web3.toWei(3,"ether")})
