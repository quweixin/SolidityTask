// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

contract RomanToInteger {
    mapping(bytes1 => uint256) private romanToInt;

    constructor(){
        romanToInt[bytes1('I')] = 1;
        romanToInt[bytes1('V')] = 5;
        romanToInt[bytes1('X')] = 10;
        romanToInt[bytes1('L')] = 50;
        romanToInt[bytes1('C')] = 100;
        romanToInt[bytes1('D')] = 500;
        romanToInt[bytes1('M')] = 1000;
    }

    function romanConvertToInt(string memory romanStr) public view returns (uint256) {
        uint256 result = 0;
        bytes  memory romanBytes = bytes(romanStr);
        for (uint256 i = 0; i < romanBytes.length; i++) {
            uint256 currentValue = romanToInt[romanBytes[i]];
            if(i < romanBytes.length - 1){
                uint256 nextValue = romanToInt[romanBytes[i+1]];
                if(currentValue < nextValue){
                    result -= currentValue;
                }else{
                    result += currentValue;
                }
            }else{
                result += currentValue;
            }
        }
        return result;
    }
}
