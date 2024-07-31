// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <=0.9.0;

contract Test {
    uint256 age;
    string name;

    constructor() {
        age = 20;
        name = "Abhi";
    }

    function getAge() public view returns (uint) {
        return age;
    }

    function getName() public view returns (string memory) {
        return name;
    }

    function setAge(uint256 newAge) public {
        age = newAge;
    }

    function setName(string memory newName) public {
        name = newName;
    }

    function localFun(uint256 num) public pure returns (uint256) {
        return num;
    }
}
