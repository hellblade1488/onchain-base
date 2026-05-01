# Base Voting — SimpleVoting dApp

A frontend for the [SimpleVoting smart contract](https://basescan.org/address/0x94482B77E1b7a570FbB68bf4FDcbbdec55326c75)
deployed on Base mainnet. Owner creates proposals with options, anyone can vote
once per proposal — fully tamper-proof and on-chain.

## Features

- 🎨 Base-themed dark UI with gradient title
- 👑 Owner-only proposal creation form (auto-shown if connected wallet matches owner)
- ➕ Dynamic options field (2–8 options)
- 🗳️ One-click voting with confirmation
- 📊 Live progress bars showing vote distribution per option
- 🏆 Winner highlight after voting closes
- ⏱️ Time-left indicator per proposal (1d 4h left / closed)
- 🏷️ Status badges: open / voted / closed
- 🔔 Live updates via `ProposalCreated` and `Voted` events
- 💾 Auto-reconnect on page load + persistent disconnect
- 📱 Mobile responsive

## Tech

- Pure HTML + CSS + JavaScript — no build step
- [ethers.js v6](https://docs.ethers.org/v6/) loaded from CDN

## Live demo

[hellblade1488.github.io/onchain-base/dapps/voting/](https://hellblade1488.github.io/onchain-base/dapps/voting/)

## Contract

| Field | Value |
|-------|-------|
| Address | [`0x94482B77E1b7a570FbB68bf4FDcbbdec55326c75`](https://basescan.org/address/0x94482B77E1b7a570FbB68bf4FDcbbdec55326c75) |
| Network | Base mainnet (chain id `8453`) |
| Source | [`contracts/3_SimpleVoting.sol`](../../contracts/3_SimpleVoting.sol) |

## Sibling dApps

Other dApps in this repo:

- [**guestbook**](../guestbook/) — public on-chain guestbook
- [**tipjar**](../tipjar/) — send ETH on Base with a public note
- [**vault**](../vault/) — time-locked ETH savings
- [**todo**](../todo/) — personal todo list on chain

## License

MIT
