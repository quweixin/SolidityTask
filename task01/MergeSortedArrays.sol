// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

contract MergeSortedArrays {
    function merge(int256[] memory nums1, int256[] memory nums2) public pure returns (int256[] memory) {
        uint256 n = nums2.length;
        uint256 m = nums1.length - n;

        int256 i = int256(m) - 1;
        int256 j = int256(n) - 1;
        int256 k = int256(m + n) - 1;

        while (i >= 0 && j >= 0) {
            if (nums1[uint256(i)] > nums2[uint256(j)]) {
                nums1[uint256(k)] = nums1[uint256(i)];
                i--;
            } else {
                nums1[uint256(k)] = nums2[uint256(j)];
                j--;
            }
            k--;
        }

        while (j >= 0) {
            nums1[uint256(k)] = nums2[uint256(j)];
            j--;
            k--;
        }
        return nums1;
    }
}
