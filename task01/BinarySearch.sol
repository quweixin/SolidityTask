// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

contract BinarySearch {
    /**
    * 在有序数组中查找目标值
    * @param nums 有序数组
     * @param target 目标值
     * @return 索引（未找到返回 -1）
     */
    function search(int256[] memory nums, int256 target) public pure returns (int256) {
        int256 left = 0;
        int256 right = int256(nums.length) - 1;

        while (left <= right) {
//             安全写法
            int256 mid = left + (right - left) / 2;
//            Solidity 要求数组索引必须是无符号整数类型
            if (nums[uint256(mid)] == target) {
                return mid;
            } else if (nums[uint256(mid)] < target) {
                left = mid + 1;
            } else {
//                但当需要递减时
//right = mid - 1; // 0 - 1 = 2^256 - 1（下溢！非常大的数）
//                所以要用 int256类型
                right = mid - 1;
            }
        }
        return -1;
    }
}
