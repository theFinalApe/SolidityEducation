// This code was writen by Charalampos Chastoukis for educational purposes
// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "./SaveInt.sol";

contract InheritSaveInt is SaveInt {

    function incrementMyNumber() public {
        myNumber += 1;
    }
    
}