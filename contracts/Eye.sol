// contracts/GLDToken.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract EyeTestToken is ERC20 {
    
    //Contract Owner
    address owner;

    //Sets owner to the contract creator and mints coins
    constructor() ERC20("ApeTestToken", "ATT"){
        owner = msg.sender;
    }

    //Modifies a function so it can only be run by the owner
    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    //Changes Owner
    function changeOwner(address newOwner) public onlyOwner{
        owner = newOwner;
    }

    //Owner can mint
    function mint(uint256 amount) public onlyOwner{
        require( totalSupply()+amount <= 10000);
        _mint(msg.sender, amount);
    }

    //Burn
    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }

    //Eye for an Eye
    function eye(address enemy, uint256 amount) public {
        require(balanceOf(msg.sender) >= amount, "ERC20: burn amount exceeds balance");
        require(balanceOf(enemy) >= amount, "ERC20: burn amount exceeds enemys balance");
        _burn(msg.sender, amount);
        _burn(enemy, amount);
    }
}
