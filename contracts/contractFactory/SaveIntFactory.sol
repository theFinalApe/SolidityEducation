// This code was writen by Charalampos Chastoukis for educational purposes
// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "./SaveInt.sol";

contract SaveIntFactory {

    //Array of SaveInt contract
    SaveInt[] public saveIntArray;

    //Create a saveInt contract and add its adress to the array
    function createSaveIntContract() public {
        SaveInt myContract = new SaveInt();
        saveIntArray.push(myContract);
    }

    //Setter
    function setContractInt(uint256 _saveIntIndex, int256 _saveIntValue) public {
        SaveInt(address(saveIntArray[_saveIntIndex])).setMyNumber(_saveIntValue);
    }

    //Getter
    function getContractInt(uint256 _saveIntIndex) public view returns(int256){
        return SaveInt(address(saveIntArray[_saveIntIndex])).getMyNumber();
    }

}