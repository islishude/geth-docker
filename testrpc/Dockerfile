FROM ethereum/client-go:v1.8.27
WORKDIR /root/.ethereum
VOLUME [ "/root/.ethereum" ]
EXPOSE 8545 8546
COPY genesis.json ./
RUN geth init genesis.json
ENTRYPOINT [ "geth" ]
