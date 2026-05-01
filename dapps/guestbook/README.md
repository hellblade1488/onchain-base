# GuestBook dApp

A simple, single-file frontend for the [GuestBook smart contract](https://basescan.org/address/0x701546B92991CAC01f98c9aaB3AB8C8dd6d1999f)
deployed on Base mainnet.

Connect your wallet, sign a public message on chain, and read the latest entries
left by other people.

## Features

- Connects to MetaMask / Rabby / any EIP-1193 wallet
- Auto-detects the network and offers a one-click switch to Base
- Reads the total number of entries and the 10 most recent ones
- Lets you sign a new entry (up to 280 characters)
- Live updates via the contract's `MessageSigned` event
- Mobile-friendly, dark theme

## Tech

- Pure HTML + CSS + JavaScript — no build step
- [ethers.js v6](https://docs.ethers.org/v6/) loaded from a CDN

## Live demo

[hellblade1488.github.io/onchain-base/dapps/guestbook/](https://hellblade1488.github.io/onchain-base/dapps/guestbook/)

## Contract

| Field | Value |
|-------|-------|
| Address | [`0x701546B92991CAC01f98c9aaB3AB8C8dd6d1999f`](https://basescan.org/address/0x701546B92991CAC01f98c9aaB3AB8C8dd6d1999f) |
| Network | Base mainnet (chain id `8453`) |
| Source | [`contracts/1_GuestBook.sol`](../../contracts/1_GuestBook.sol) |
| Verified | [Sourcify](https://repo.sourcify.dev/8453/0x701546B92991CAC01f98c9aaB3AB8C8dd6d1999f) |

## Sibling dApps

Other dApps in this repo:

- [**tipjar**](../tipjar/) — send ETH on Base with a public note
- [**voting**](../voting/) — on-chain polls
- [**vault**](../vault/) — time-locked ETH savings
- [**todo**](../todo/) — personal todo list on chain

## License

MIT
