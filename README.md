# onchain-base

Experiments and tools for building on **Base** — Coinbase's Ethereum L2.

This repo collects everything I'm shipping on Base: smart contracts and live dApps.

---

## 🟦 Live dApps

Five working frontends, all hosted free on GitHub Pages and talking directly to
verified contracts on Base mainnet:

| dApp | Description | Open |
|------|-------------|------|
| **GuestBook** | Public on-chain guestbook (sign a 280-char immutable message) | [open ↗](https://hellblade1488.github.io/onchain-base/dapps/guestbook/) |
| **TipJar** | Send ETH on Base with an optional public note | [open ↗](https://hellblade1488.github.io/onchain-base/dapps/tipjar/) |
| **Voting** | Owner creates proposals, anyone votes once per proposal | [open ↗](https://hellblade1488.github.io/onchain-base/dapps/voting/) |
| **Vault** | Time-locked ETH savings with live countdown | [open ↗](https://hellblade1488.github.io/onchain-base/dapps/vault/) |
| **Todo** | On-chain personal todo list, scoped per address | [open ↗](https://hellblade1488.github.io/onchain-base/dapps/todo/) |

📂 dApp source: [`dapps/`](dapps/)

---

## 📜 Smart contracts on Base mainnet

Five Solidity contracts, deployed and verified on Base (chain id `8453`):

| Contract | Purpose |
|----------|---------|
| GuestBook | Public on-chain guestbook with 280-char messages |
| TipJar | ETH tip jar with optional notes; owner-only withdrawal |
| SimpleVoting | Lightweight on-chain polling, one vote per address |
| TimeLockedSavings | Per-user ETH lockbox with chosen unlock time |
| OnChainTodo | Personal todo list, scoped per address |

→ Full list with deployed addresses and verification links: [**CONTRACTS.md**](CONTRACTS.md)

📂 Solidity source: [`contracts/`](contracts/)

---

## 🛠 Tech

- Solidity `^0.8.20`, compiled with `0.8.34`
- Frontends use **ethers.js v6** loaded from CDN — no build step, single-file dApps
- Contracts deployed via [Remix IDE](https://remix.ethereum.org)
- Verified on [Sourcify](https://sourcify.dev) and viewable on [BaseScan](https://basescan.org)
- dApps hosted free on **GitHub Pages**

---

## License

[MIT](LICENSE)
