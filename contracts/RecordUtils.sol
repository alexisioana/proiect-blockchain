// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

library RecordUtils {

    function isValidRecord(string memory record) internal pure returns (bool) {
        return bytes(record).length > 0;
    }
}
