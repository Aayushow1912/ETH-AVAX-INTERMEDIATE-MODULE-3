// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract MyERC20Token {
    string public name = "MotorBike";
    string public symbol = "MTK";
    uint public decimals = 18;
    uint public totalSupply = 100000000 * (10 ** decimals);

    address public owner;
    mapping(address => uint) public balances;

    constructor() {
        owner = msg.sender;
        balances[owner] = totalSupply;
    }

    function mint(address to, uint amount) public {
        require(msg.sender == owner, "Only owner can mint");
        require(amount > 0, "Invalid amount");
        balances[to] += amount;
    }

    function burn(uint amount) public {
        require(amount > 0, "Invalid amount");
        balances[msg.sender] -= amount;
    }

    function transfer(address to, uint amount) public {
        require(amount > 0, "Invalid amount");
        require(balances[msg.sender] >= amount, "Insufficient balance");
        balances[msg.sender] -= amount;
        balances[to] += amount;
    }
}
