FROM golang:1.12-alpine as builder
RUN apk add --no-cache make gcc musl-dev linux-headers
ADD https://github.com/ethereum/go-ethereum/archive/v1.8.26.tar.gz /go-ethereum
RUN cd /go-ethereum && make geth

FROM alpine:latest
RUN apk add --no-cache ca-certificates
COPY --from=builder /go-ethereum/build/bin/geth /usr/local/bin/
EXPOSE 8545 8546 30303 30303/udp
ENTRYPOINT ["/usr/local/bin/geth"]
