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

    /**
    通常情况下，小的数字在大的数字右边，表示相加
    当小的数字在大的数字左边时，表示相减（如 IV = 4, IX = 9, XL = 40, XC = 90, CD = 400, CM = 900）
     * @dev 将罗马数字转换为整数
     * @param romanStr 罗马数字字符串
     * @return 整数
     */
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
