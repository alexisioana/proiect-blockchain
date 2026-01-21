// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

interface IAccessControl {
    function hasAccess(address patient, address doctor) external view returns (bool);
}
