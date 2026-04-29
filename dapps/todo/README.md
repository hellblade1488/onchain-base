# OnChain Todo dApp

A frontend for the [OnChainTodo smart contract](https://basescan.org/address/0x3b96111b2e59aCbaCfD8240cc6B24504489Ef06D)
deployed on Base mainnet. Each address has its own personal task list, stored
forever in the contract.

## Features

- 🎨 Base-themed dark UI with gradient title
- 🔌 Top-right wallet pill with disconnect button + network indicator
- ➕ Add tasks (up to 200 chars)
- ✅ Complete tasks with one click (on-chain)
- ✕ Remove tasks (on-chain, irreversible)
- 📊 Live progress: total / done / pending + progress bar
- 🔍 Look up any address to see their public task list
- 🔔 Live updates via `TaskAdded`, `TaskCompleted`, `TaskRemoved` events
- 💾 Auto-reconnect on page load + persistent disconnect
- 📱 Mobile responsive

## Tech

- Pure HTML + CSS + JavaScript — no build step
- [ethers.js v6](https://docs.ethers.org/v6/) loaded from CDN
- Read-only fallback uses public Base RPC (`https://mainnet.base.org`)

## Live demo

`https://hellblade1488.github.io/onchain-base/dapps/todo/`

## Contract

| Field | Value |
|-------|-------|
| Address | [`0x3b96111b2e59aCbaCfD8240cc6B24504489Ef06D`](https://basescan.org/address/0x3b96111b2e59aCbaCfD8240cc6B24504489Ef06D) |
| Network | Base mainnet (chain id `8453`) |
| Source | [`contracts/5_OnChainTodo.sol`](../../contracts/5_OnChainTodo.sol) |

## License

MIT
