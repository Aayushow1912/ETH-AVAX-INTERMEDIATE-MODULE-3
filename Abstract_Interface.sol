// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

// Interface
interface IMyInterface {
    functionINTERFACE_function() external;
}

// Abstract contract
abstract contract MyAbstractContract {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function abstractFunction() public virtual;
}

// Main contract
contract MyContract is MyAbstractContract, IMyInterface {
    uint public count;

    constructor() {
        count = 0;
    }

    // Implement abstract function
    function abstractFunction() public override {
        count += 1;
    }

    // Implement interface function
    function INTERFACE_function() public {
        count += 2;
    }
}

