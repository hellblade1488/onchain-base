// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title SimpleVoting
/// @notice Lightweight on-chain poll. Owner creates proposals with options;
///         each address can vote once per proposal.
contract SimpleVoting {
    address public immutable owner;

    struct Proposal {
        string question;
        string[] options;
        uint256 deadline;
        bool exists;
    }

    Proposal[] private proposals;

    // proposalId => optionIndex => voteCount
    mapping(uint256 => mapping(uint256 => uint256)) public voteCounts;
    // proposalId => voter => hasVoted
    mapping(uint256 => mapping(address => bool)) public hasVoted;

    event ProposalCreated(uint256 indexed proposalId, string question, uint256 deadline);
    event Voted(uint256 indexed proposalId, address indexed voter, uint256 optionIndex);

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    /// @notice Create a new proposal with up to 8 options.
    function createProposal(string calldata _question, string[] calldata _options, uint256 _durationSeconds)
        external
        onlyOwner
        returns (uint256 proposalId)
    {
        require(_options.length >= 2 && _options.length <= 8, "Need 2-8 options");
        require(_durationSeconds > 0, "Duration must be > 0");

        Proposal storage p = proposals.push();
        p.question = _question;
        p.deadline = block.timestamp + _durationSeconds;
        p.exists = true;
        for (uint256 i = 0; i < _options.length; i++) {
            p.options.push(_options[i]);
        }

        proposalId = proposals.length - 1;
        emit ProposalCreated(proposalId, _question, p.deadline);
    }

    /// @notice Cast your vote on a proposal. Only one vote per address.
    function vote(uint256 _proposalId, uint256 _optionIndex) external {
        require(_proposalId < proposals.length, "Proposal not found");
        Proposal storage p = proposals[_proposalId];
        require(block.timestamp < p.deadline, "Voting ended");
        require(_optionIndex < p.options.length, "Bad option");
        require(!hasVoted[_proposalId][msg.sender], "Already voted");

        hasVoted[_proposalId][msg.sender] = true;
        voteCounts[_proposalId][_optionIndex] += 1;
        emit Voted(_proposalId, msg.sender, _optionIndex);
    }

    function getProposal(uint256 _proposalId)
        external
        view
        returns (string memory question, string[] memory options, uint256 deadline)
    {
        require(_proposalId < proposals.length, "Proposal not found");
        Proposal storage p = proposals[_proposalId];
        return (p.question, p.options, p.deadline);
    }

    function totalProposals() external view returns (uint256) {
        return proposals.length;
    }
}
