# ETH Vault — TimeLockedSavings dApp

A frontend for the [TimeLockedSavings smart contract](https://basescan.org/address/0x4b115F329ab9EF584cDFbD81b7aA0BeDAf75C9ed)
deployed on Base mainnet. Lock ETH until a chosen date — even the contract deployer
cannot pull the funds out before time.

## Features

- 🎨 Base-themed dark UI with gradient title
- ⏰ Live countdown timer (days / hours / mins / secs) tickling every second
- 📊 Progress bar showing how much of the lock period has elapsed
- 🔒 Deposit ETH with a custom unlock date or quick presets (1d / 7d / 30d / 1y)
- ➕ Top up your existing lock without changing the unlock time
- ✅ Withdraw button that activates only after the unlock time
- 🔍 Look up any address to see their public vault status
- 🔔 Live updates via `Deposited` / `ToppedUp` / `Withdrawn` events
- 💾 Auto-reconnect on page load + persistent disconnect
- 📱 Mobile responsive

## Tech

- Pure HTML + CSS + JavaScript — no build step
- [ethers.js v6](https://docs.ethers.org/v6/) loaded from CDN
- Read-only fallback uses public Base RPC (`https://mainnet.base.org`)

## Live demo

`https://hellblade1488.github.io/onchain-base/dapps/vault/`

## Contract

| Field | Value |
|-------|-------|
| Address | [`0x4b115F329ab9EF584cDFbD81b7aA0BeDAf75C9ed`](https://basescan.org/address/0x4b115F329ab9EF584cDFbD81b7aA0BeDAf75C9ed) |
| Network | Base mainnet (chain id `8453`) |
| Source | [`contracts/4_TimeLockedSavings.sol`](../../contracts/4_TimeLockedSavings.sol) |

## License

MIT
