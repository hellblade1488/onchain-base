# onchain-base

Experiments and tools for building on **Base** — Coinbase's Ethereum L2.

This repo collects everything I'm shipping on Base: smart contracts and a live dApp.

---

## 🟦 Live dApp

**Base GuestBook** — public on-chain guestbook. Connect your wallet, leave a 280-char message, and it lives forever in a smart contract.

🔗 **Try it:** <https://hellblade1488.github.io/onchain-base/dapps/guestbook/>

📂 Source: [`dapps/guestbook/`](dapps/guestbook/)

---

## 📜 Smart contracts on Base mainnet

Five Solidity contracts deployed and verified on Base (chain id `8453`):

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
- dApp hosted free on **GitHub Pages**

---

## License

[MIT](LICENSE)
