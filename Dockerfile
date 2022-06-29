# syntax=docker/dockerfile:experimental
FROM --platform=${BUILDPLATFORM} golang:1.18.3-alpine as compiler
ARG VERSION=v1.10.20
ENV GO111MODULE=on
RUN apk add --no-cache make gcc musl-dev linux-headers git ca-certificates
WORKDIR /geth
RUN git clone --quiet --branch ${VERSION} --depth 1 https://github.com/ethereum/go-ethereum .
RUN make geth

FROM --platform=${BUILDPLATFORM} alpine:3.16.0
RUN addgroup -g 1000 geth && adduser -u 1000 -G geth -s /bin/sh -D geth
COPY --from=BUILDER /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
COPY --from=BUILDER /geth/build/bin/geth /usr/local/bin/
EXPOSE 8545 8546 30303 30303/udp
STOPSIGNAL SIGINT
ENTRYPOINT ["geth"]
