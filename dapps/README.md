# dApps

Frontends for the smart contracts deployed in [`contracts/`](../contracts/).
Each dApp is a self-contained, single-file HTML page using ethers.js v6 from CDN —
no build step required.

## Available dApps

| dApp | What it does | Live |
|------|--------------|------|
| [**guestbook**](guestbook/) | Sign a 280-char public message on chain | [demo](https://hellblade1488.github.io/onchain-base/dapps/guestbook/) |
| [**tipjar**](tipjar/) | Send ETH to support the author with a public note | [demo](https://hellblade1488.github.io/onchain-base/dapps/tipjar/) |

More dApps coming for the rest of the contracts (`SimpleVoting`, `TimeLockedSavings`, `OnChainTodo`).

## Stack

- Pure HTML + CSS + JavaScript, no bundlers
- [ethers.js v6](https://docs.ethers.org/v6/) loaded from CDN
- Hosted free on **GitHub Pages**
- Talks to contracts on **Base mainnet** (chain id `8453`)

## Run locally

Just open any `index.html` in a modern browser, or serve the folder with any
static file server:

```sh
npx serve dapps/guestbook
```
