# onchain-base
Experiments and tools for building on Base L2
# 🕹️ Base Game Experiments

This repository contains experimental blockchain games built on **Base**, Coinbase's Ethereum L2.

---

## 🔶 About Base
Base is a secure, low-cost, developer-friendly Ethereum L2 built to bring the next billion users onchain.

---

## 🛠️ Project Goals
- Build simple, interactive games that live entirely or partially onchain
- Explore gas-efficient mechanics for L2
- Use Base’s fast finality & low fees to experiment with new game ideas

---

## 📁 Folder Structure (Planned)
```
/contracts      # Solidity smart contracts
/frontend       # dApp frontend code (React, Vite, etc.)
/scripts        # Deployment and interaction scripts
/docs           # Additional documentation or specs
```

---

## 🚧 Planned Games
- [ ] 2048 Onchain (each move costs 0.0000001 ETH)
- [ ] Onchain Rock-Paper-Scissors
- [ ] Leaderboard contract with XP tracking

---

## 📚 Tech Stack
- Solidity
- Hardhat
- Base Goerli/Mainnet
- Ethers.js / Wagmi / RainbowKit
- React + Tailwind CSS (optional)

---

## 📜 License
MIT — feel free to use or fork for your own ideas!

---

## 🙌 Contribute
Pull requests and game ideas welcome!

---

## Smart Contracts on Base

In addition to game experiments, this repo includes a small collection of
Solidity smart contracts deployed on **Base Mainnet**. Each contract demonstrates
a different on-chain primitive — from public guestbooks to time-locked savings.

See [**CONTRACTS.md**](CONTRACTS.md) for descriptions and deployed addresses.

Contracts live in [`contracts/`](contracts/).
