# Hellblade Donation — TipJar dApp

A frontend for the [TipJar smart contract](https://basescan.org/address/0x1aacf2B6e0f4da4B7DF380Fd048566CD66eD2C1F)
deployed on Base mainnet. Anyone can send ETH on chain with a public note,
and the owner can withdraw the accumulated balance.

## Features

- 🎨 Modern UI in Base's signature blue palette
- 🔌 Top-right wallet connect (MetaMask / Rabby / any EIP-1193 wallet)
- ⚡ Send ETH with a custom note via on-chain transaction
- 💸 Quick-pick amounts (0.0005 / 0.001 / 0.005 / 0.01)
- 📊 Live stats: total ETH collected, tip count, current jar balance
- 📜 Real-time list of the last 10 tips
- 👑 Owner-only withdraw section (auto-shown if connected wallet matches owner)
- 🔔 Live updates via the contract's `NewTip` event
- 📱 Mobile responsive

## Tech

- Pure HTML + CSS + JavaScript — no build step
- [ethers.js v6](https://docs.ethers.org/v6/) loaded from CDN
- Single-file dApp, deployable on any static host

## Live demo

`https://hellblade1488.github.io/onchain-base/dapps/tipjar/`

## Contract

| Field | Value |
|-------|-------|
| Address | [`0x1aacf2B6e0f4da4B7DF380Fd048566CD66eD2C1F`](https://basescan.org/address/0x1aacf2B6e0f4da4B7DF380Fd048566CD66eD2C1F) |
| Network | Base mainnet (chain id `8453`) |
| Source | [`contracts/2_TipJar.sol`](../../contracts/2_TipJar.sol) |

## License

MIT
