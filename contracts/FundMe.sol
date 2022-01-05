// This code was writen by Charalampos Chastoukis for educational purposes
// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "@chainlink/contracts/src/v0.6/interfaces/AggregatorV3Interface.sol";
import "@chainlink/contracts/src/v0.6/vendor/SafeMathChainlink.sol";

contract FundMe {

    //Ensures uint256 dont overflow
    using SafeMathChainlink for uint256;

    //Map of addresses to the amount they have founded
    mapping(address => uint256) public amountFunded;

    //Contract Owner
    address owner;

    //Sets owner to the contract creator
    constructor() public {
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

    //Funds contract if amount>=50USD
    function fund() public payable {
        uint256 minimumUSD = 50 * 10 ** 18;
        require(getConversionRate(msg.value) >= minimumUSD);
        amountFunded[msg.sender] += msg.value;
    }

    //Owner withdraws all funds
    function withdraw() public onlyOwner payable {
        msg.sender.transfer(address(this).balance);
    }

    //Get aggregators version
    function getVersion() public view returns(uint256) {
        //Rinkeby Testnet
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
        return priceFeed.version();
    }

    //Get live eth price
    function getPrice() public view returns(uint256) {
        //Rinkeby Testnet
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
        (,int price,,,) = priceFeed.latestRoundData();
        return uint256(price * 10 ** 10);
    }

    //Get live eth conversion rate
    function getConversionRate(uint256 ethAmount) public view returns(uint256) {
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount)/(10 ** 18);
        return ethAmountInUsd;
    }

}