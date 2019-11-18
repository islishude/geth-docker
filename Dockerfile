FROM golang:1.13.4-alpine as BUILDER

ARG VERSION=v1.9.7
RUN apk add --no-cache make gcc musl-dev linux-headers git ca-certificates
WORKDIR /
RUN git clone https://github.com/ethereum/go-ethereum geth
RUN cd geth && git checkout ${VERSION} && make geth

FROM alpine:3.10
RUN addgroup -g 1000 geth && adduser -u 1000 -G geth -s /bin/sh -D geth
COPY --from=BUILDER /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
COPY --from=BUILDER /geth/build/bin/geth /usr/local/bin/
EXPOSE 8545 8546 30303 30303/udp
USER geth
VOLUME [ "/home/geth" ]
ENTRYPOINT ["/usr/local/bin/geth"]
