// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <=0.9.0;

contract Demo {
    uint public num;
    constructor() {
        num = 10;
    }
    function setNum(uint _num) public {
        num = _num;
    }
    function getNum() public view returns (uint) {
        return num;
    }
}
