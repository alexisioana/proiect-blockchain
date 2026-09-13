# Blockchain-Based Medical Records Platform

A decentralized platform for managing medical records using Ethereum smart contracts. The project implements access control, record management, and blockchain-based payments for granting access to medical data.

## Technologies

- Solidity 0.8.28
- Hardhat
- Ethereum
- JavaScript
- Chainlink Price Feeds
- ERC-20 tokens

## Smart Contracts

### AccessControl

Manages permissions for medical records.

- Grant access to a user
- Revoke access
- Manage contract ownership
- Check access rights

### MedicalRecords

Handles medical record management and access payments.

- Add medical records
- Retrieve authorized records
- Retrieve the caller's own record
- Pay for access
- Withdraw payments

## Features

- Role-based access control
- Secure medical record management
- Blockchain-based access permissions
- ERC-20 token integration
- ETH/USD price conversion using Chainlink
- Access payments
- Local Hardhat and Sepolia testnet deployment

## Project Structure

```text
proiect-blockchain/
├── contracts/
│   ├── AccessControl.sol
│   └── MedicalRecords.sol
├── hardhat.config.js
├── package.json
├── package-lock.json
└── README.md
