# Geth Docker

## Production node

```
docker pull islishude/geth
mkdir chaindata
docker run -d -p 8545:8545 -p 30330:30330 -v $(pwd)/chaindata:/home/geth/.ethereum islishude/geth
```

## Private chain and test node

### Quick start

```shell
docker pull islishude/geth
# create chaindata and edit genesis.json
mkdir -p chaindata
# init genesis data for test environment
docker run -it --rm -v $(pwd)/chaindata:/home/geth/.ethereum -v $(pwd)/genesis.json:/home/geth/genesis.json:ro islishude/geth init genesis.json
# edit docker-compose and start testrpc
docker-compose up -d
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

## Built-in Addresses

Each of the following accounts has 1024ETH

### BIP39 Mnemonic

awful negative waste juice love truth nose coffee top legend method imitate

### List

| path              | address                                    | public key                                                           | private key                                                        |
| ----------------- | ------------------------------------------ | -------------------------------------------------------------------- | ------------------------------------------------------------------ |
| m/44'/60'/0'/0/0  | 0x13C1B1751F84498C08Fb8b63978eF1857Bc4fBbC | 0x03980e92169ceb47a6b715413184f70ec765226a549bffc9eecb06a28ab3aa4db3 | 0x70f04852e5a64654d0af2d5af418e69c9d677ae974f5eec0a6496f0f2b74d2d3 |
| m/44'/60'/0'/0/1  | 0x377F8F32957C9E2c07282FA7F799dF2f95Fe0B34 | 0x03c8836d4970cbf7ff737df2b51efb8975985f0b6759f3f0f2ed82b51db8f987d9 | 0x5d8f8d53ffcc0755dec6d7b6cfc6b00c0112a1fd865c1ddc8ad2627ae2efc6a4 |
| m/44'/60'/0'/0/2  | 0xc2767b03C2071Caf422da0F5E8681Ea7dE3E99D5 | 0x03c9506cea914582e429c1405cb63c1f4cb7b1e32562de16e23d7559bbde7bcbfd | 0x23c8e3845a8097be824a68b304d96cdfcfec085654b27773cb32088b2904001b |
| m/44'/60'/0'/0/3  | 0x613F7377E6Be9C009DAD53E58e4EE7783CCB2521 | 0x02b93457e09160e81ab5fb53416ed155e3d54230371abd0015e45adafbecedc525 | 0xc93dcb3f0e171ca5deb2ee76308bad2645d18a44fe112110c59493705223f8d5 |
| m/44'/60'/0'/0/4  | 0xC63E0F0C5afeb28304ed9E1a9813A98E40E78c62 | 0x02c327539d9247864de88d305be3f39c8755fb3d5d19cacbc7b6c919d35e3dbe8e | 0x69d32faea08376b00b1f108e009d41e69ceea92c6e6062e8610be82843cfb17d |
| m/44'/60'/0'/0/5  | 0x6C868a6d8815b27ffa93B5937dfC0b1c4Cbe7a7f | 0x0396473b8b071bef04b21e2550d91d3afa0fe108cf734145f8541fd948ee249e20 | 0x628ceb0112549e6352b85e319dfd1390c9c3073cc9515dddb88d1d1a90b7b4a3 |
| m/44'/60'/0'/0/6  | 0xB9A7aDdb46E5618C43EEC15be01667Df07B9d45f | 0x0376df45b127ec23197f9a8757d8f4f91126ffb2f3ba396f0e1f3a1c8fd2f1e562 | 0x31f4084f06b721a7220d5c4a2a0bdf3ec1368142e0723668a60b1daaaab0001b |
| m/44'/60'/0'/0/7  | 0x364154fE9152A63b62683FEE5cd89ccAc3D02a17 | 0x02d0a507140fa944a940e74f5ec89c2bfc1bad9929cad478d94c0004f78ccb4c74 | 0x32cfca5863f4c21f1f5f3c016e74ef445eea4523561d7141a570950940984229 |
| m/44'/60'/0'/0/8  | 0xEd35D5574Ea005f061c617f2E2A2376Cc961b3a2 | 0x025ccf49d179c5a228ec5964fa82cf5dfb2e6762768aa35b71854e866fb1c75201 | 0xe1613517f66b9fafad026f42852b92c595bdfe692bc1da68f17feacea3ff4e41 |
| m/44'/60'/0'/0/9  | 0x0623053c6555F1b39a5e9B955258C08549A2fb1B | 0x036a00c16e52f61fd897a4247df16a54b3a850452e6d1d85742e15000ab7db645d | 0xe03a2ca7cd6ac1c5f08223ae7dab497bb3baa065998519284279d6795b9f9ae8 |
| m/44'/60'/0'/0/10 | 0x75fd4E0c5ae49Ee72801221E6CA628Df08264415 | 0x026aebc023b631386786c3c058645f9d989c04c0c9219efbef4af71d6ed4eed39d | 0xf2f077e2c930bdcfe5b8632a6060201d603b821496a4930478bedad0dce614c3 |
| m/44'/60'/0'/0/11 | 0x19CfBCceBa8C2D605e227Be9C02F191914ff9903 | 0x028ec9ce13804f44a210b2aa760a889d1f2c31373422e1a6dbb5a59f8f9235bd67 | 0x226805c03c6a8d58a23ed8c85050e669ebbe07be5020dd9397a015d5cfd2617a |
| m/44'/60'/0'/0/12 | 0xd648095a73470aE1A956A47C28dD4D5a7710442F | 0x034d63b6f00c6fa1d8596d8caec6e3fa1087e065b77a8be42c3b956991473c5051 | 0x721e11a8b76493285a02600ca7f21ed562c57e2c456735cc9aded0d05345510c |
| m/44'/60'/0'/0/13 | 0xc91479455DA08C80d024D947e475B66c9972Acd3 | 0x0246f1968c626f6dc4ce0e43b8ddfea9bb178b0dc4bc143d3300611c92bda012ed | 0x17e25317a3caa36708e8e8bbe8dd9f7d1005f12c1916118bd4d509559c921ec1 |
| m/44'/60'/0'/0/14 | 0xA1577f3bDfCFF65A3Ee1b7d9bE1262C85FE7aD00 | 0x020085e3fa892a87228e4e229fd265e4ef45dde13d9934cba63e732adc423b01fc | 0x7ee356717f4b1416697bac9e96f19fb3211da877e062a945f67e828807627c03 |
| m/44'/60'/0'/0/15 | 0x6f1B090B78ebdC5b55A9caA250093aD6f309b90E | 0x025ed0b626595ef52eba10cdec186c3e75b148bd97d630de68d955ec5907a859ab | 0xa8124a98f14310eb96c18491567f44aecea55907303e4ea25f5217d378b94b20 |
| m/44'/60'/0'/0/16 | 0x4E51e6DEe0472BE0E211f05752c731a5661023Dd | 0x0286ed07927deb1067b7646c48a637d90a259144470117d3d78933500a9bfe856d | 0xe6bad29a4b6822eb5ca4734da9a1b3155fa642b4b91191c213e799b15ae9b1de |
| m/44'/60'/0'/0/17 | 0xC623dE82f369207A9B1262f13D01437B90C68069 | 0x02fea7f1f0375816ac5b9e7aa22a1ac9afd83d472502f8709e638ade1c233d0369 | 0xc38f2a9d963749cddf9b48e3ade52b7353e13ee6674746ff4d57fd8de500e38b |
| m/44'/60'/0'/0/18 | 0x5D4E04a3fdbe87CD30BADCE6435Ce2456E4C430a | 0x035f3082fb68483a6059d0679fefc062c61bf99643e4c0879933338ee82ad98802 | 0x3ebfe5cbd91ac3a823ad5088aeafc14b5e376b13ae854bec2c4a7f9616a14835 |
| m/44'/60'/0'/0/19 | 0x56a5AF7918F7aD52c4167a2fBCaB57F4BC938b13 | 0x02650575c25b80df3796f894b1d44a58d3bb5fa441672b68137b05bc6f4555e56c | 0xf51428344c5993b3e5571a50e7856cf8db9ab49cc7cb7a49a0ccd1a4be7e59d7 |
