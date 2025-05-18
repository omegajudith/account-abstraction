// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract SmartWallet {
    address public owner;           // Stores the wallet owner's address
    uint256 public nonce;           // Tracks transaction count to prevent replay attacks
    address public guardian;        // Optional guardian address for recovery (not required but added for flexibility)

    // Event to log successful executions
    event ExecutionSuccess(address to, uint value, bytes data);

    // Constructor to set the owner when the contract is deployed
    constructor(address _owner) {
        owner = _owner;             // Set the deployer as the owner
        nonce = 0;                  // Initialize nonce to 0
    }

    // Modifier to restrict functions to the owner only
    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this");
        _;
    }

    // Function to execute a transaction (call any contract or send ETH)
    function execute(address to, uint value, bytes calldata data) external onlyOwner returns (bool) {
        nonce += 1;                 // Increment nonce to prevent replay
        (bool success, ) = to.call{value: value}(data); // Execute the call with ETH value
        require(success, "Execution failed");           // Check if the call succeeded
        emit ExecutionSuccess(to, value, data);         // Log the success
        return true;
    }

    // Function to simulate validating a UserOperation (checks signature)
    function validateUserOp(bytes calldata signature) external pure returns (bool) {
        // Simulate signature validation (in a real case, this would verify the signature)
        // For now, simply check if the signature is not empty
        require(signature.length > 0, "Invalid signature");
        // Add more complex logic here in a real implementation (e.g., recover signer)
        return true;                // Return true to simulate successful validation
    }

    // Function to update owner (for recovery, optional)
    function updateOwner(address newOwner) external onlyOwner {
        owner = newOwner;           // Allow owner to change ownership
    }
}