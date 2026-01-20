// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import "./AccessControl.sol";

contract MedicalRecords {

    AccessControl public accessControl;

    address public owner;

    // pacient => hash / CID date medicale
    mapping(address => string) private records;

    // EVENTS
    event RecordAdded(address indexed patient, string recordHash);
    event RecordAccessed(address indexed patient, address indexed doctor);

    // MODIFIER
    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    constructor(address accessControlAddress) {
        owner = msg.sender;
        accessControl = AccessControl(accessControlAddress);
    }

    // pacientul adauga / actualizeaza datele sale
    function addRecord(string calldata recordHash) external {
        records[msg.sender] = recordHash;
        emit RecordAdded(msg.sender, recordHash);
    }

    // medicul citeste datele daca are acces
    function getRecord(address patient) external view returns (string memory) {
        require(
            accessControl.hasAccess(patient, msg.sender),
            "Access denied"
        );
        return records[patient];
    }

    // exemplu transfer ETH (cerinta barem)
    function payForAccess(address patient) external payable {
        require(msg.value > 0, "Send ETH");
        emit RecordAccessed(patient, msg.sender);
    }

    // functie view
    function getMyRecord() external view returns (string memory) {
        return records[msg.sender];
    }
}
