// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <=0.9.0;

contract Enum {
    enum User {
        allowed,
        notAllowed,
        wait
    }
    uint256 public lottery = 1000;
    User public user1 = User.allowed;

    function owner() public {
        if (user1 == User.allowed) {
            lottery = 0;
        }
    }
    function changeOwner() public {
        user1 = User.notAllowed;
        lottery = 1000;
    }
}
