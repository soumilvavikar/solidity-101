// EVM, Ethereum Virtual Machine
// Ethereum, Polygon, Arbitrum, Optimism, Zksync

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {SimpleStorage} from "./SimpleStorage.sol";

/**
 * Inheritance example where this contract will inherit from SimpleStorage
 */
contract AddFiveStorage is SimpleStorage {
    /**
     * Dummy method to prove inheritance
     */
    function sayHello() public pure returns (string memory) {
        return "Hello";
    }

    /**
     * This is example of how to use override
     * This method will override the store method and add 5 to the incoming number before storing. 
     */
    function store(uint256 _newNumber) public override {
        myFavoriteNumber = _newNumber + 5;
    }
}
