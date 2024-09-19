// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract RecieveFallbackExample {
    uint256 public result;

    // Fallback function must be declared as external.
    fallback() external payable {
        result = 1;
    }

    receive() external payable {
        result = 2;
    }
}