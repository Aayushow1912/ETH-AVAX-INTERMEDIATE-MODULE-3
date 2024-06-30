// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract EtherReceiver {
    address public owner;
    uint public balance;

    constructor() {
        owner = msg.sender;
        balance = 0;
    }

    // Accept Ether
    receive() external payable {
        balance += msg.value;
    }

    // Handle any unrecognized calls
    fallback() external payable {
        // You can add custom logic here to handle unrecognized calls
        // For now, we simply ignore them
    }

    // Withdraw Ether
    function withdraw(uint amount) public {
        require(msg.sender == owner, "Only owner can withdraw");
        payable(msg.sender).transfer(amount);
        balance -= amount;
    }

    // Get balance
    function getBalance() public view returns (uint) {
        return balance;
    }
}
