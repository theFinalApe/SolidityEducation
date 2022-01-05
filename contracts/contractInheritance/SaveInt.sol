// This code was writen by Charalampos Chastoukis for educational purposes
// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract SaveInt {

    int256 myNumber = -10;

    // Setter
    function setMyNumber(int256 _myNumber) public {
        myNumber = _myNumber;
    }

    //Getter
    function getMyNumber() public view returns(int256) {
        return myNumber;
    }

}