// Contract Rinkeby: 0xA2BBf5a088eDB35C273BA60e8De8f0C1A57821D5
// This code was writen by Charalampos Chastoukis for educational purposes
// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract DataTypes {

    //-------------------- Getter and Setter for int ----------------------------------------
    int256 public myNumber = -10;

    function setMyNumber(int256 _myNumber) public {
        myNumber = _myNumber;
    }

    //-------------------- Getter and Setter for positive int -------------------------------
    uint256 public myPositiveNumber = 10;

    function setMyPositiveNumber(uint256 _myPositiveNumber) public {
        myPositiveNumber = _myPositiveNumber;
    }

    //-------------------- Getter and Setter for boolean ------------------------------------
    bool public myBoolean = false;

    function setMyBoolean(bool _myBoolean) public {
        myBoolean = _myBoolean;
    }

    //-------------------- Getter and Setter for string -------------------------------------
    string public myText = "Hello World!";

    function setMyText(string memory _myText) public {
        myText = _myText;
    }

    //-------------------- Getter and Setter for address ------------------------------------
    address public myWalletAddress = 0x4178591D22acfef3BC745e6e51a6e4191438083c;

    function setMyWalletAddress(address _myWalletAddress) public {
        myWalletAddress = _myWalletAddress;
    }

    //-------------------- Getter and Setter for byteCode ------------------------------------
    bytes32 public myByteCode = "cat";

    function setMyByteCode(bytes32 _myByteCode) public {
        myByteCode = _myByteCode;
    }

    //-------------------- Getter and Setter for struct --------------------------------------
    struct Pearson {
        string name;
        uint256 balance;
    }

    Pearson public myPearson = Pearson("Haris",1000);   

    function setMyPearson(string memory _name, uint256 _balance) public {
        myPearson = Pearson(_name, _balance);
    }

    //-------------------- Getter, Appender and Setter for array of structs -------------------
    Pearson[] public myPeopleArray;

    function addPersonArray(string memory _name, uint256 _balance) public {
        myPeopleArray.push(Pearson(_name, _balance));
    }

    function setPersonArray(uint i, string memory _name, uint256 _balance) public {
        myPeopleArray[i] = Pearson(_name, _balance);
    }

    //-------------------- Getter and Setter for mapping --------------------------------------
    mapping(string => uint256) public nameToBalanceMap;

    function setPersonMap(string memory _name, uint256 _balance) public {
        nameToBalanceMap[_name] = _balance;
    }

}