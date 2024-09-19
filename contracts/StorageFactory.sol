// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18; // Stating our version of solidity - The ^ says the contract would work wit 0.8.18 or higher.

// Import contract from the .sol file into this contract
// import "./SimpleStorage.sol"; - Imports everything in the file.
// import {SimpleStorage, ..} from "./SimpleStorage.sol"; - Imports only the contracts mentioned inside in the {}
import {SimpleStorage} from "./SimpleStorage.sol";

// We can have more than 1 contract in the same file, BUT it is not a good practice.
contract StorageFactory {
    // Defining a contract
    SimpleStorage public simpleStorage;
    // Defining an array/list of contracts
    SimpleStorage[] public simpleStorageArray;

    /**
    * This function will create the simple storage contract
    */
    function createSimpleStorageContract() public {
        // new keyword helps to initialize / deploy a contract from within a contract
        simpleStorage = new SimpleStorage();
        simpleStorageArray.push(simpleStorage);
    }

    // Address - ABI - Application Binary Interface

    /**
     * This function will call simple storage contract and store the number
     */
    function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber)
        public
    {
        simpleStorageArray[_simpleStorageIndex].store(_simpleStorageNumber);
        // OR
        // SimpleStorage mySimpleStorage = simpleStorageArray[_simpleStorageIndex];
        // Calling the store method present in the simple storage contract
        // mySimpleStorage.store(_simpleStorageNumber);
    }

    /**
     * This function will retireve the value from the contract and return it
     */
    function sfGet(uint256 _simpleStorageIndex) public view returns (uint256) {
        simpleStorageArray[_simpleStorageIndex].retrieve();
        // OR
        // SimpleStorage mySimpleStorage = simpleStorageArray[_simpleStorageIndex];
        // return mySimpleStorage.retrieve();
    }
}
