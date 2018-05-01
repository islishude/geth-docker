## geth-docker-compose

install docker and docker-compose,and run `docker-compose -d up`

install successed if `curl --data '{"method":"eth_accounts","params":[],"id":1,"jsonrpc":"2.0"}' -H "Content-Type: application/json" -X POST localhost:8545` return a JSON response.
