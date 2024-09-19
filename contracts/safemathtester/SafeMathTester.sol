// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18; 
// pragma solidity ^0.6.0; 

contract SafeMathTester {
    uint8 public bigNumber = 255;

     function add() public {
        bigNumber = bigNumber + 1; // Unchecked for 0.6.x by default its checked in 0.8.x versions 
         // unchecked {bigNumber = bigNumber + 1;} // This is similar to above statementin 0.6.x
         // unchecked makes the transactions lighter and gas prices are lower. 
    }
}