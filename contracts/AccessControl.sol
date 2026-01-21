// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract AccessControl {

    address public owner;

    // pacient => medic => are acces?
    mapping(address => mapping(address => bool)) private accessRights;

    // EVENTS
    event AccessGranted(address indexed patient, address indexed doctor);
    event AccessRevoked(address indexed patient, address indexed doctor);

    // MODIFIER
    modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    // pacientul acorda acces unui medic
    function grantAccess(address doctor) external {
        accessRights[msg.sender][doctor] = true;
        emit AccessGranted(msg.sender, doctor);
    }

    // pacientul revoca accesul
    function revokeAccess(address doctor) external {
        accessRights[msg.sender][doctor] = false;
        emit AccessRevoked(msg.sender, doctor);
    }

    // verificare acces (folosita de alt contract)
    function hasAccess(address patient, address doctor) external view returns (bool) {
        return accessRights[patient][doctor];
    }

    // exemplu functie PURE (cerinta barem)
    function version() external pure returns (string memory) {
        return "AccessControl v1.0";
    }

    // ===== ADAUGAT (pentru barem) =====

    // folosire modifier onlyOwner
    function changeOwner(address newOwner) external onlyOwner {
        require(newOwner != add
