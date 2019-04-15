FROM ethereum/client-go:v1.8.26
WORKDIR /ethereum
VOLUME [ "/ethereum" ]
COPY genesis.json ./
RUN mkdir chaindata && geth --datadir chaindata init genesis.json
ENTRYPOINT [ "geth" ]
