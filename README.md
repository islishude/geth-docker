# Geth Docker

## Production node

**Don't run container by root!**

```shell
# make sure that YOUR uid is 1000 or create it
groupadd -g 1000 -r geth && useradd -g 1000 -D -r -u 1000 geth
chmod -aG docker geth
```

```shell
docker pull islishude/geth
mkdir chaindata
docker run -d -p 8545:8545 -p 30330:30330 -v $(pwd)/chaindata:/home/geth/.ethereum -u 1000 islishude/geth
```

## Private chain and test node

### Quick start

```shell
docker pull islishude/geth
# create chaindata and edit genesis.json
mkdir -p chaindata
# init genesis data for test environment
docker run --rm -v $(pwd)/chaindata:/home/geth/.ethereum \
  -v $(pwd)/genesis.json:/home/geth/genesis.json:ro \
  -u 1000 islishude/geth init genesis.json
# use flowing docker-compose config and start testrpc
docker-compose up -d
```

### docker-compose test for node

```yaml
version: "3"

services:
  geth:
    build: .
    restart: unless-stopped
    ports:
      - "8545:8545"
      - "8546:8546"
    user: geth
    volumes:
      - ${PWD}/chaindata:/home/geth/.ethereum/
    stop_signal: SIGINT
    stop_grace_period: 2m
    command:
      - --rpc
      - --rpcaddr=0.0.0.0
      - --rpcvhosts=*
      - --rpccorsdomain=*
      - --ws
      - --wsorigins=*
      - --nodiscover
    logging:
      driver: "json-file"
      options:
        max-size: "200k"
        max-file: "10"
```

### Import your raw private key

```shell
docker-compose exec geth sh
geth attach
person.importRawKey("RAW KEY WITHOUT 0x SEE BLOW", "YOUR-PASSWORD")
```

### Mining

run mining after imported your etherbase key

```shell
docker-compose exec geth sh
geth attach
> miner.start(1) // use 1 core cpu
true
> miner.stop()
true
```

## prvkeys within genesis.json

Each of the following accounts has 1024 ETH

### BIP39 Mnemonic

awful negative waste juice love truth nose coffee top legend method imitate

### private keys list

| address                                    | private key                                                        |
| ------------------------------------------ | ------------------------------------------------------------------ |
| 0x13C1B1751F84498C08Fb8b63978eF1857Bc4fBbC | 0x70f04852e5a64654d0af2d5af418e69c9d677ae974f5eec0a6496f0f2b74d2d3 |
| 0x377F8F32957C9E2c07282FA7F799dF2f95Fe0B34 | 0x5d8f8d53ffcc0755dec6d7b6cfc6b00c0112a1fd865c1ddc8ad2627ae2efc6a4 |
| 0xc2767b03C2071Caf422da0F5E8681Ea7dE3E99D5 | 0x23c8e3845a8097be824a68b304d96cdfcfec085654b27773cb32088b2904001b |
| 0x613F7377E6Be9C009DAD53E58e4EE7783CCB2521 | 0xc93dcb3f0e171ca5deb2ee76308bad2645d18a44fe112110c59493705223f8d5 |
| 0xC63E0F0C5afeb28304ed9E1a9813A98E40E78c62 | 0x69d32faea08376b00b1f108e009d41e69ceea92c6e6062e8610be82843cfb17d |
| 0x6C868a6d8815b27ffa93B5937dfC0b1c4Cbe7a7f | 0x628ceb0112549e6352b85e319dfd1390c9c3073cc9515dddb88d1d1a90b7b4a3 |
| 0xB9A7aDdb46E5618C43EEC15be01667Df07B9d45f | 0x31f4084f06b721a7220d5c4a2a0bdf3ec1368142e0723668a60b1daaaab0001b |
| 0x364154fE9152A63b62683FEE5cd89ccAc3D02a17 | 0x32cfca5863f4c21f1f5f3c016e74ef445eea4523561d7141a570950940984229 |
| 0xEd35D5574Ea005f061c617f2E2A2376Cc961b3a2 | 0xe1613517f66b9fafad026f42852b92c595bdfe692bc1da68f17feacea3ff4e41 |
| 0x0623053c6555F1b39a5e9B955258C08549A2fb1B | 0xe03a2ca7cd6ac1c5f08223ae7dab497bb3baa065998519284279d6795b9f9ae8 |
| 0x75fd4E0c5ae49Ee72801221E6CA628Df08264415 | 0xf2f077e2c930bdcfe5b8632a6060201d603b821496a4930478bedad0dce614c3 |
| 0x19CfBCceBa8C2D605e227Be9C02F191914ff9903 | 0x226805c03c6a8d58a23ed8c85050e669ebbe07be5020dd9397a015d5cfd2617a |
| 0xd648095a73470aE1A956A47C28dD4D5a7710442F | 0x721e11a8b76493285a02600ca7f21ed562c57e2c456735cc9aded0d05345510c |
| 0xc91479455DA08C80d024D947e475B66c9972Acd3 | 0x17e25317a3caa36708e8e8bbe8dd9f7d1005f12c1916118bd4d509559c921ec1 |
| 0xA1577f3bDfCFF65A3Ee1b7d9bE1262C85FE7aD00 | 0x7ee356717f4b1416697bac9e96f19fb3211da877e062a945f67e828807627c03 |
| 0x6f1B090B78ebdC5b55A9caA250093aD6f309b90E | 0xa8124a98f14310eb96c18491567f44aecea55907303e4ea25f5217d378b94b20 |
| 0x4E51e6DEe0472BE0E211f05752c731a5661023Dd | 0xe6bad29a4b6822eb5ca4734da9a1b3155fa642b4b91191c213e799b15ae9b1de |
| 0xC623dE82f369207A9B1262f13D01437B90C68069 | 0xc38f2a9d963749cddf9b48e3ade52b7353e13ee6674746ff4d57fd8de500e38b |
| 0x5D4E04a3fdbe87CD30BADCE6435Ce2456E4C430a | 0x3ebfe5cbd91ac3a823ad5088aeafc14b5e376b13ae854bec2c4a7f9616a14835 |
| 0x56a5AF7918F7aD52c4167a2fBCaB57F4BC938b13 | 0xf51428344c5993b3e5571a50e7856cf8db9ab49cc7cb7a49a0ccd1a4be7e59d7 |
