# Foundry-uups-Demo

An uups contracts demo for foundry

## Install Dependencies

```bash
forge install foundry-rs/forge-std
forge install OpenZeppelin/openzeppelin-foundry-upgrades
forge install OpenZeppelin/openzeppelin-contracts-upgradeable
```

## Set env

```bash
export PRIVATE_KEY=""
export RPC_URL=""
export ETHERSCAN_API_KEY=""
export VERIFIER_URL="https://api-sepolia.etherscan.io/api"
```

## Deploy proxy & V1 contracts

```bash
forge script script/Deploy-MyContractV1.s.sol:DeployMyContractV1 \
--chain sepolia  --verifier-url $VERIFIER_URL \
--rpc-url $RPC_URL  --private-key $PRIVATE_KEY --broadcast --verify --ffi
```

## V2 contracts & upgrade proxy implementation to V2

```bash
forge script script/Upgradge-to-MyContractV2.s.sol:UpgradgeToMyContractV2 \
--chain sepolia  --verifier-url $VERIFIER_URL \
--rpc-url $RPC_URL  --private-key $PRIVATE_KEY --broadcast --verify --ffi
```

## Summarize

- deploy MyContractV1
- deploy a ERC1967Proxy with MyContractV1 as implementation

- deploy MyContractV2
- upgrade ERC1967Proxy implementation to MyContractV2(Call MyContractV1 upgradeTo function)

So all UUPS implementation contracts have to implement upgrade logic if they want to be upgraded. This is different from Transparent upgradeable proxy.

## Reference

https://github.com/OpenZeppelin/openzeppelin-foundry-upgrades
https://github.com/jordaniza/OZ-Upgradeable-Foundry/blob/main/script/DeployUUPS.s.sol
https://mirror.xyz/rbtree.eth/qDSQvenBZ_TWqZLUTlxiXVlhKQzPygRyv88EMFWxJro
