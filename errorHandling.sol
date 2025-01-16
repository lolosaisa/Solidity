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
     * when the revert fuction is called all changes made to the blockchain during the transactions are  undone
     * any remaining gas fee is refunded to the sender.,
     * mainly used for access control and input validation
     */
    function example2(uint _value) public {
        if(_value < 10) {
            revert("Value must be greater than 10");
        }
    }

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