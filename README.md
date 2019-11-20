# Geth Docker

```
docker pull islishude/geth
mkdir chaindata
docker run -d -p 8545:8545 -p 30330:30330 -v $(pwd)/chaindata:/home/geth/.ethereum islishude/geth
```
