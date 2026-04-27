// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title OnChainTodo
/// @notice Personal todo list living on Base. Each address has its own list.
contract OnChainTodo {
    struct Task {
        uint256 id;
        string text;
        bool done;
        uint256 createdAt;
    }

    // owner => list of tasks
    mapping(address => Task[]) private tasks;
    // owner => next id
    mapping(address => uint256) private nextId;

    event TaskAdded(address indexed owner, uint256 indexed id, string text);
    event TaskCompleted(address indexed owner, uint256 indexed id);
    event TaskRemoved(address indexed owner, uint256 indexed id);

    /// @notice Add a new task to your list.
    function addTask(string calldata _text) external returns (uint256 id) {
        require(bytes(_text).length > 0, "Empty task");
        require(bytes(_text).length <= 200, "Task too long");

        id = nextId[msg.sender]++;
        tasks[msg.sender].push(Task({
            id: id,
            text: _text,
            done: false,
            createdAt: block.timestamp
        }));
        emit TaskAdded(msg.sender, id, _text);
    }

    /// @notice Mark one of your tasks as done by its id.
    function completeTask(uint256 _id) external {
        Task[] storage list = tasks[msg.sender];
        for (uint256 i = 0; i < list.length; i++) {
            if (list[i].id == _id) {
                require(!list[i].done, "Already done");
                list[i].done = true;
                emit TaskCompleted(msg.sender, _id);
                return;
            }
        }
        revert("Task not found");
    }

    /// @notice Permanently remove a task from your list.
    function removeTask(uint256 _id) external {
        Task[] storage list = tasks[msg.sender];
        for (uint256 i = 0; i < list.length; i++) {
            if (list[i].id == _id) {
                list[i] = list[list.length - 1];
                list.pop();
                emit TaskRemoved(msg.sender, _id);
                return;
            }
        }
        revert("Task not found");
    }

    /// @notice Read your full task list.
    function myTasks() external view returns (Task[] memory) {
        return tasks[msg.sender];
    }

    /// @notice Read someone else's public task list.
    function tasksOf(address _user) external view returns (Task[] memory) {
        return tasks[_user];
    }

    function taskCount(address _user) external view returns (uint256) {
        return tasks[_user].length;
    }
}
