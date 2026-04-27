// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title GuestBook
/// @notice On-chain guestbook where anyone can leave a signed message on Base.
/// @dev Each entry stores the author, message, and timestamp. Public, immutable history.
contract GuestBook {
    struct Entry {
        address author;
        string message;
        uint256 timestamp;
    }

    Entry[] private entries;

    event MessageSigned(address indexed author, string message, uint256 timestamp, uint256 indexed entryId);

    /// @notice Sign the guestbook with a public message.
    /// @param _message The text you want to leave on-chain.
    function sign(string calldata _message) external {
        require(bytes(_message).length > 0, "Message cannot be empty");
        require(bytes(_message).length <= 280, "Message too long (max 280 chars)");

        entries.push(Entry({
            author: msg.sender,
            message: _message,
            timestamp: block.timestamp
        }));

        emit MessageSigned(msg.sender, _message, block.timestamp, entries.length - 1);
    }

    /// @notice Read a specific entry by id.
    function getEntry(uint256 _id) external view returns (address, string memory, uint256) {
        require(_id < entries.length, "Entry does not exist");
        Entry memory e = entries[_id];
        return (e.author, e.message, e.timestamp);
    }

    /// @notice Total number of entries in the guestbook.
    function totalEntries() external view returns (uint256) {
        return entries.length;
    }
}
