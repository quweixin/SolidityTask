// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

contract IntegerToRoman {
    uint256[] private values = [1000,900,500,400,100,90,50,40,10,9,5,4,1];
    string[] private romans = ["M","CM","D","CD","C","XC","L","XL","X","IX","V","IV","I"];

    function intToRoman(uint256 num) public view returns (string memory) {
        if (num == 0){
            return "";
        }
        // 使用 bytes 动态构建结果字符串
        bytes memory result = new bytes(15); // 预分配足够空间
        uint256 resultIndex = 0;

        // 遍历所有可能的罗马数字组合
        for (uint256 i = 0; i < values.length; i++) {
            // 计算当前数值可以被减去多少次
            uint256 count = num / values[i];
            // 添加对应数量的罗马数字
            for (uint256 j = 0; j < count; j++) {
                bytes memory currentNumeral = bytes(romans[i]);
                for (uint256 k = 0; k < currentNumeral.length; k++) {
                    result[resultIndex++] = currentNumeral[k];
                }
            }
            // 更新剩余数值
            num = num % values[i];
            // 如果已经转换完成，提前退出
            if (num == 0) {
                break;
            }
        }
        // 调整结果数组的实际大小
        bytes memory finalResult = new bytes(resultIndex);
        for (uint256 i = 0; i < resultIndex; i++) {
            finalResult[i] = result[i];
        }
        return string(finalResult);
    }
}
