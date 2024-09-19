// EVM, Ethereum Virtual Machine
// Ethereum, Polygon, Arbitrum, Optimism, Zksync

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18; // Stating our version of solidity - The ^ says the contract would work wit 0.8.18 or higher.
// pragma solidity >=0.8.18 <0.9.0 - States version range.

/**
 * @title Simple Storage Contract - Solidity 101
 * @author Soumil Vavikar
 * @notice NA
 */
contract SimpleStorage {
    /*
     * Visibility Specifiers for Types and Functions
     * -----------------------------------------------
     * public - visible externally and internally
     * private - only visible in current contract
     * external - only visible externally (only applicable for functions
     * internal - only visible internally within the contract
     */

    /*
     * Basic Type: boolean, uint (only positive whole number), int (can be positive or negative), address (blockchain account address), bytes
     * Default visibility of the variables is internal. If they are to be made accessible, we need to explicitly mention them as public
     */
    bool hasFavoriteNumber = true; // Default = false
    string favoriteNumberText = "88";
    int256 favoriteInt = -88;
    address myAddress = 0xC61D69b07F84fCE21d65Fd35004B4D851A92db9B;
    bytes32 favoriteByte32 = "dog"; // bytes and bytes32 are not same. bytes32 is max

    // uint and uint256 are same - max possible bits = 256 // default = 0
    uint256 myFavoriteNumber;
    // Array / list of uint256
    uint256[] listOfFavoriteNumber;

    // struct is nothing BUT model object in solidity
    struct Person {
        uint256 favoriteNumber;
        string name;
    }

    // Default initialization is empty list. Person[] or Person[3] - Dynamic or static
    Person[] public listOfPeople;

    // Defining a map - if key is not present, the mapping returns default value
    mapping(string => uint256) public nameToFavoriteNumber;

    // Initialization of struct
    // Person soumil = Person({favoriteNumber: 15, name: "Soumil"}); // or Person(15, "Soumil");

    /*
     * Data Locations: only for arrays / struct / string AND not for primitives
     *
     * calldata - temporary variables -and cannot be modified
     * memory - only will store in memory and can be changed inside the function
     * string - need to be specified whether its calldata or memory while defining methods
     * storage - permanent variable, can exist outside of functions (can't be used for variables in function definition)
     */
    // This function will add the person to the the listOfPeople
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        Person memory person = Person({
            favoriteNumber: _favoriteNumber,
            name: _name
        });
        listOfPeople.push(person);
        // OR
        // listOfPeople.push(Person({favoriteNumber: _favoriteNumber, name: _name}));

        nameToFavoriteNumber[_name] = _favoriteNumber;
    }

    // This function is used to store the favoriteNumber
    // The function will virtual keyword can be overriden. Without this keyword we can't override it. 
    function store(uint256 _favoriteNumber) public virtual {
        myFavoriteNumber = _favoriteNumber;
        // The more work we do in the functions the more gas it takes to execute the function.
    }

    /*
     * Keywords - view / pure
     * view - doesn't let allow updating the state
     * pure - doesn't let you allow to read or update the state
     */

    // This function is to return the favorite number.
    function retrieve() public view returns (uint256) {
        return myFavoriteNumber;
    }
    // Each contract deployed on the blockchain has a address - 0xd9145CCE52D386f254917e481eB44e9943F39138
}
