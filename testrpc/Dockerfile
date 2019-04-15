FROM ethereum/client-go:v1.8.26
WORKDIR /root/.ethereum
VOLUME [ "/root/.ethereum" ]
COPY genesis.json ./
RUN geth init genesis.json
ENTRYPOINT [ "geth" ]
