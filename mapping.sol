// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <=0.9.0;
contract MappingEx{
    mapping (uint=>string) public rollNo;
    function setter(uint key, string memory value) public {
        rollNo[key] = value;
    }
}