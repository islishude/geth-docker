FROM ethereum/client-go:v1.8.27
RUN adduser -D --shell /bin/sh --home /geth geth
USER geth
WORKDIR /geth
VOLUME [ "/geth" ]
COPY genesis.json ./
RUN geth init genesis.json
ENTRYPOINT [ "geth" ]
