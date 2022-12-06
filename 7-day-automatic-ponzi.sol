pragma solidity ^0.6.0;

contract Timer {
    // Mapping from user address to deposit date/time
    mapping(address => uint256) public depositDates;

    // Mapping from user address to initial deposit amount
    mapping(address => uint256) public initialDeposits;

    // Event that is emitted when a user's deposit has been multiplied
    event DepositMultiplied(
        address indexed user,
        uint256 initialDeposit,
        uint256 multipliedDeposit
    );

    // Function that allows a user to deposit USDT
    function deposit(uint256 amount) public {
        // Record the current date/time
        depositDates[msg.sender] = now;

        // Record the initial deposit amount
        initialDeposits[msg.sender] = amount;
    }

    // Function that multiplies a user's initial deposit by 1.10x and sends
    // the multiplied amount back to the user
    function multiplyDeposit(address user) public {
        // Retrieve the user's initial deposit amount
        uint256 initialDeposit = initialDeposits[user];

        // Multiply the initial deposit by 1.10x
        uint256 multipliedDeposit = initialDeposit.mul(110).div(100);

        // Send the multiplied deposit back to the user
        user.transfer(multipliedDeposit);

        // Emit an event to signal that the deposit has been multiplied
        emit DepositMultiplied(user, initialDeposit, multipliedDeposit);
    }

    // Function that can be called by the user to check if their deposit
    // is eligible for multiplication
    function checkDeposit(address user) public view returns (bool) {
        // Retrieve the user's deposit date/time
        uint256 depositDate = depositDates[user];

        // Check if at least 7 days have passed since the user's deposit
        return depositDate + 7 days <= now;
    }
}
