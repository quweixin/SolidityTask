// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

contract StringReverse {
    function reverseString(string memory _input) public pure returns (string memory) {
//    将字符串转换成字节数组
//     string 没有length
        bytes memory inputBytes = bytes(_input);
//     创建一个与输入字符串长度相同的字节数组，用于存储反转后的字符串
        bytes memory reversedBytes = new bytes(inputBytes.length);
//   反转字符串
        for (uint256 i = 0; i < inputBytes.length; i++) {
            reversedBytes[i] = inputBytes[inputBytes.length - 1 - i];
        }
//     将字节数组转换成字符串并返回
        return string(reversedBytes);
    }
}
