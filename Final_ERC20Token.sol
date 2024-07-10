// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyCrypto is ERC20{
   address public owner;

   modifier Owner(){
    require(msg.sender == owner,"Only Owner can access the tokens");
    _;
   }
   constructor() ERC20("Ubuntu","UB"){
    _mint(msg.sender,50*10**18);
    owner = msg.sender;
   }

   function MintTokens(address to, uint256 amount) external Owner{
    _mint(to,amount);
   }

    function TransferTokens(address to, uint256 amount) public  returns(bool) {
    _transfer(msg.sender,to,amount);
    return true;
   }

    function BurnTokens(uint256 amount) external Owner{
    _burn(msg.sender,amount);
   }
}

