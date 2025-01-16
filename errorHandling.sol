// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title ErrorHandling
 * @author DevSaisa
 * @notice  
 * the most common way to handle errors is using the equire statement
 * essentially is is a function inside solidity that checks if the value is true or false
 * 

 */

contract ErrorHandling {
    event log(string message);
    //IN THIS EXAMPLE WE ARE USING THE REQUIRE FUNCTION TO CHECK IF THE VALUE IS GREATER THAN 10

    function example1(uint _value) public {
        require(_value > 1o, "Value must be greater than 10");
        emit log("Success, value is greater than 10");
    }

    //REVERT FUNCTION
    /**
     * @notice The revert function is used to revert the transaction and return the error message
     * when the revert fu
     */

    // Custom error
    error InsufficientBalance(uint256 requested, uint256 available);

    function withdraw(uint256 amount) public {
        uint256 balance = address(this).balance;
        if (amount > balance) {
            revert InsufficientBalance({
                requested: amount,
                available: balance
            });
        }
        // Logic to withdraw the amount
    }
}