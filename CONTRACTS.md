# Smart Contracts on Base

A small collection of self-contained Solidity contracts deployed on **Base Mainnet** (chain id `8453`)
as part of the on-chain experiments in this repo. Each contract demonstrates a different primitive,
written from scratch in Solidity `^0.8.20`.

## Deployed contracts

| # | Contract | Address | Verified |
|---|----------|---------|----------|
| 1 | **GuestBook** | [`0x701546B92991CAC01f98c9aaB3AB8C8dd6d1999f`](https://basescan.org/address/0x701546B92991CAC01f98c9aaB3AB8C8dd6d1999f) | [Sourcify](https://repo.sourcify.dev/8453/0x701546B92991CAC01f98c9aaB3AB8C8dd6d1999f) |
| 2 | **TipJar** | [`0x1aacf2B6e0f4da4B7DF380Fd048566CD66eD2C1F`](https://basescan.org/address/0x1aacf2B6e0f4da4B7DF380Fd048566CD66eD2C1F) | [Blockscout](https://base.blockscout.com/address/0x1aacf2B6e0f4da4B7DF380Fd048566CD66eD2C1F?tab=contract) |
| 3 | **SimpleVoting** | [`0x94482B77E1b7a570FbB68bf4FDcbbdec55326c75`](https://basescan.org/address/0x94482B77E1b7a570FbB68bf4FDcbbdec55326c75) | [Blockscout](https://base.blockscout.com/address/0x94482B77E1b7a570FbB68bf4FDcbbdec55326c75?tab=contract) |
| 4 | **TimeLockedSavings** | [`0x4b115F329ab9EF584cDFbD81b7aA0BeDAf75C9ed`](https://basescan.org/address/0x4b115F329ab9EF584cDFbD81b7aA0BeDAf75C9ed) | [Blockscout](https://base.blockscout.com/address/0x4b115F329ab9EF584cDFbD81b7aA0BeDAf75C9ed?tab=contract) |
| 5 | **OnChainTodo** | [`0x3b96111b2e59aCbaCfD8240cc6B24504489Ef06D`](https://basescan.org/address/0x3b96111b2e59aCbaCfD8240cc6B24504489Ef06D) | [Blockscout](https://base.blockscout.com/address/0x3b96111b2e59aCbaCfD8240cc6B24504489Ef06D?tab=contract) |

## What each contract does

### 1. GuestBook — [`contracts/1_GuestBook.sol`](contracts/1_GuestBook.sol)
Public, append-only on-chain guestbook. Anyone can call `sign(string)` to leave a message
of up to 280 characters. Each entry stores the author, the message text, and the block timestamp.
Emits `MessageSigned` events for indexers.

### 2. TipJar — [`contracts/2_TipJar.sol`](contracts/2_TipJar.sol)
A tip jar that accepts ETH together with an optional note via `tip(string)`, or plain transfers
via `receive()`. All tips are recorded with sender, amount, note and timestamp. Only the deployer
(immutable `owner`) can call `withdraw()` to drain the jar.

### 3. SimpleVoting — [`contracts/3_SimpleVoting.sol`](contracts/3_SimpleVoting.sol)
Lightweight on-chain polling. The owner creates proposals via `createProposal(question, options[], duration)`
with 2–8 options and a deadline. Any address can call `vote(proposalId, optionIndex)` exactly once per proposal.
Vote counts are stored in a nested mapping for cheap reads.

### 4. TimeLockedSavings — [`contracts/4_TimeLockedSavings.sol`](contracts/4_TimeLockedSavings.sol)
Per-user ETH lockbox. `deposit(unlockTime)` locks the sent ETH until the chosen UNIX timestamp,
`topUp()` adds more without changing the unlock time, and `withdraw()` releases the funds — but only
once `block.timestamp >= unlockTime`. No admin override; even the deployer cannot pull the funds early.

### 5. OnChainTodo — [`contracts/5_OnChainTodo.sol`](contracts/5_OnChainTodo.sol)
A todo list scoped per address. Anyone can call `addTask(string)` to append a task to their own list,
`completeTask(id)` to mark it done, and `removeTask(id)` to delete it. Lists are public and readable
via `tasksOf(address)`.

## Tech

- Solidity `^0.8.20`
- Compiler: `0.8.34+commit.80d5c536`, no optimization
- Deployed via [Remix IDE](https://remix.ethereum.org) + browser wallet
- Network: **Base Mainnet** (chain id `8453`)
- License: MIT

## Try them

Open any contract address on [BaseScan](https://basescan.org) or [Blockscout](https://base.blockscout.com),
go to the **Read / Write Contract** tab, connect your wallet, and call the functions directly from the explorer.

For example, sign the GuestBook:

1. Go to [`0x701546B92991CAC01f98c9aaB3AB8C8dd6d1999f`](https://base.blockscout.com/address/0x701546B92991CAC01f98c9aaB3AB8C8dd6d1999f?tab=write_contract)
2. Connect your wallet on the Base network
3. Call `sign("hello base")`
4. Read it back with `getEntry(0)`

## License

MIT — see [LICENSE](LICENSE).
