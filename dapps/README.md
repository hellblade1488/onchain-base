# dApps

Frontends for the smart contracts deployed in [`contracts/`](../contracts/).
Each dApp is a self-contained, single-file HTML page using ethers.js v6 from CDN —
no build step required.

## Available dApps

| dApp | What it does | Contract | Live demo |
|------|--------------|----------|-----------|
| [**guestbook**](guestbook/) | Sign a 280-char public message on chain | [`GuestBook`](../contracts/1_GuestBook.sol) | [demo](https://hellblade1488.github.io/onchain-base/dapps/guestbook/) |
| [**tipjar**](tipjar/) | Send ETH to support the author with a public note | [`TipJar`](../contracts/2_TipJar.sol) | [demo](https://hellblade1488.github.io/onchain-base/dapps/tipjar/) |
| [**voting**](voting/) | Create polls and vote on chain (one address — one vote per proposal) | [`SimpleVoting`](../contracts/3_SimpleVoting.sol) | [demo](https://hellblade1488.github.io/onchain-base/dapps/voting/) |
| [**vault**](vault/) | Time-locked ETH savings — lock until a chosen date with no admin override | [`TimeLockedSavings`](../contracts/4_TimeLockedSavings.sol) | [demo](https://hellblade1488.github.io/onchain-base/dapps/vault/) |
| [**todo**](todo/) | Personal todo list scoped per address, stored in the contract | [`OnChainTodo`](../contracts/5_OnChainTodo.sol) | [demo](https://hellblade1488.github.io/onchain-base/dapps/todo/) |

All five contracts are deployed and verified on Base mainnet.
See [**CONTRACTS.md**](../CONTRACTS.md) for the deployed addresses.

## Stack

- Pure HTML + CSS + JavaScript, no bundlers
- [ethers.js v6](https://docs.ethers.org/v6/) loaded from CDN
- Hosted free on **GitHub Pages**
- Talks to contracts on **Base mainnet** (chain id `8453`)
- Wallet: any EIP-1193 wallet (MetaMask, Rabby, Coinbase Wallet, …)

## Run locally

Just open any `index.html` in a modern browser, or serve the folder with any
static file server:

```sh
npx serve dapps/guestbook
```
