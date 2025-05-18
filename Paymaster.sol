// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract Paymaster {
    address public sponsor;         // Address of the entity sponsoring gas
    mapping(address => uint256) public gasSponsored; // Track gas sponsored per wallet

    // Event to log gas sponsorship
    event GasSponsored(address indexed wallet, uint256 amount);

    // Constructor to set the sponsor
    constructor(address _sponsor) {
        sponsor = _sponsor;         // Set the sponsor (e.g., a service or entity)
    }

    // Function to sponsor gas for a wallet
    function sponsorGas(address wallet, uint256 amount) external {
        require(msg.sender == sponsor, "Only sponsor can call this");
        gasSponsored[wallet] += amount; // Record the sponsored gas amount
        emit GasSponsored(wallet, amount); // Log the sponsorship
    }

    // Function to check sponsored gas (for simulation)
    function getSponsoredGas(address wallet) external view returns (uint256) {
        return gasSponsored[wallet];    // Return the amount of gas sponsored
    }
}