# syntax=docker/dockerfile:1
FROM --platform=${BUILDPLATFORM} golang:1.20.4 as BUILDER
RUN apt update && apt install -y build-essential git
WORKDIR /geth
ARG VERSION=v1.12.0
RUN git clone --quiet --branch ${VERSION} --depth 1 https://github.com/ethereum/go-ethereum .
RUN go run build/ci.go install -static ./cmd/geth

FROM --platform=${BUILDPLATFORM} gcr.io/distroless/static
COPY --from=BUILDER /geth/build/bin/geth /usr/local/bin/
EXPOSE 8545 8546 8551 30303 30303/udp
USER 65532
ENTRYPOINT ["geth"]
