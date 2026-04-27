// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title TimeLockedSavings
/// @notice Each user can deposit ETH and lock it until a chosen unlock time.
///         No one (not even the deployer) can pull funds out before that time.
contract TimeLockedSavings {
    struct Lock {
        uint256 amount;
        uint256 unlockTime;
    }

    mapping(address => Lock) public locks;

    event Deposited(address indexed user, uint256 amount, uint256 unlockTime);
    event ToppedUp(address indexed user, uint256 amount);
    event Withdrawn(address indexed user, uint256 amount);

    /// @notice Deposit ETH and set an unlock timestamp.
    /// @param _unlockTime Unix timestamp when the funds become withdrawable.
    function deposit(uint256 _unlockTime) external payable {
        require(msg.value > 0, "Send ETH");
        require(_unlockTime > block.timestamp, "Unlock must be in the future");
        require(locks[msg.sender].amount == 0, "Already have a lock; topUp or withdraw first");

        locks[msg.sender] = Lock({amount: msg.value, unlockTime: _unlockTime});
        emit Deposited(msg.sender, msg.value, _unlockTime);
    }

    /// @notice Add more ETH to your existing lock without changing the unlock time.
    function topUp() external payable {
        require(msg.value > 0, "Send ETH");
        Lock storage l = locks[msg.sender];
        require(l.amount > 0, "No active lock");
        l.amount += msg.value;
        emit ToppedUp(msg.sender, msg.value);
    }

    /// @notice Withdraw your ETH after the unlock time has passed.
    function withdraw() external {
        Lock storage l = locks[msg.sender];
        require(l.amount > 0, "Nothing locked");
        require(block.timestamp >= l.unlockTime, "Still locked");

        uint256 amount = l.amount;
        delete locks[msg.sender];

        (bool ok, ) = payable(msg.sender).call{value: amount}("");
        require(ok, "Withdraw failed");
        emit Withdrawn(msg.sender, amount);
    }

    /// @notice How many seconds remain until your funds unlock (0 if already unlocked).
    function timeRemaining(address _user) external view returns (uint256) {
        Lock memory l = locks[_user];
        if (l.amount == 0 || block.timestamp >= l.unlockTime) return 0;
        return l.unlockTime - block.timestamp;
    }
}
