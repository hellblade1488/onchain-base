// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title TipJar
/// @notice A simple tip jar on Base. Anyone can send ETH with an optional note.
///         Only the owner can withdraw collected tips.
contract TipJar {
    address public immutable owner;
    uint256 public totalTips;
    uint256 public tipCount;

    struct Tip {
        address sender;
        uint256 amount;
        string note;
        uint256 timestamp;
    }

    Tip[] public tips;

    event NewTip(address indexed sender, uint256 amount, string note);
    event Withdraw(address indexed owner, uint256 amount);

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    /// @notice Send a tip with a note attached.
    function tip(string calldata _note) external payable {
        require(msg.value > 0, "Tip must be > 0");
        tips.push(Tip(msg.sender, msg.value, _note, block.timestamp));
        totalTips += msg.value;
        tipCount += 1;
        emit NewTip(msg.sender, msg.value, _note);
    }

    /// @notice Plain ETH transfers also count as a tip with no note.
    receive() external payable {
        tips.push(Tip(msg.sender, msg.value, "", block.timestamp));
        totalTips += msg.value;
        tipCount += 1;
        emit NewTip(msg.sender, msg.value, "");
    }

    /// @notice Owner pulls all ETH out of the jar.
    function withdraw() external onlyOwner {
        uint256 bal = address(this).balance;
        require(bal > 0, "Nothing to withdraw");
        (bool ok, ) = payable(owner).call{value: bal}("");
        require(ok, "Withdraw failed");
        emit Withdraw(owner, bal);
    }

    function balance() external view returns (uint256) {
        return address(this).balance;
    }
}
