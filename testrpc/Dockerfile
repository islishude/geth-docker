FROM ethereum/client-go:v1.9.7
RUN adduser -D --shell /bin/sh --home /geth geth
USER geth
WORKDIR /geth
VOLUME [ "/geth" ]
COPY genesis.json ./
RUN geth init genesis.json
ENTRYPOINT [ "geth" ]
