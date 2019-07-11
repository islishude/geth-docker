FROM golang:1.12-alpine as builder
RUN apk add --no-cache make gcc musl-dev linux-headers 
WORKDIR /
RUN wget https://github.com/ethereum/go-ethereum/archive/v1.9.0.tar.gz -O geth.tar.gz
RUN tar zxvf geth.tar.gz
RUN cd /go-ethereum-1.8.27 && make geth

FROM alpine:latest
RUN apk add --no-cache ca-certificates
COPY --from=builder /go-ethereum-1.8.27/build/bin/geth /usr/local/bin/
EXPOSE 8545 8546 30303 30303/udp
ENTRYPOINT ["/usr/local/bin/geth"]
