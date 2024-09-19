// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {PriceConverter} from "./PriceConverter.sol";

/**
 * This contract will do the following:
 * - Get funds
 * - Withdraw funds
 * - Set minimum funding value in USD
 */
contract FundMe {
    // This line tells that the price converter library has to be used for uint256 type of variables. 
    using PriceConverter for uint256;

    uint256 public myVal = 1;

    // Minimum USD that can be transferred
    uint256 public minimumUSD = 5e18; // 5 * 1e18

    // List of funders
    address[] public funders;

// Map of the funder and the amount funded 
    mapping (address funder => uint256 amountFunded) public addressToAmountFunded;

    /**
     * This method will allow users to send $, have a check for minimum $ that can be sent
     * IMPORTANT:
     * - How do we send ETH to the contract
     * - Mark the function as payable to work with ETH
     */
    function fund() public payable {
        myVal = myVal + 2;

        // 1e18 wei = 1ETH
        // This statement will requirement the transaction to have more than 1 ETH being sent in the request
        require(msg.value.getConversionRate() > minimumUSD, "Didn't send enough ETH...");

        // What is a revert?
        // A revert will undo the action done so far, and send the remaining gas back.

        // msg.sender contains the address of the sender. 
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = addressToAmountFunded[msg.sender] + msg.value;
    }
}

// Blockchain oracle is an external system that is used to provide real world information to the blockchain.
