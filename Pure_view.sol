// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract MyContract {
    address public owner;
    uint public count;

    constructor() {
        owner = msg.sender;
        count = 0;
    }

    // View function to get the count
    function getCount() public view returns (uint) {
        return count;
    }

    // Pure function to calculate the double of a number
    function double(uint num) public pure returns (uint) {
        return num * 2;
    }

    // Function to increment the count
    function increment() public {
        count += 1;
    }
}

