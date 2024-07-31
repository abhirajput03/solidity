// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract Lottery {
    address public manager;
    address payable[] public participants;

    constructor() {
        manager = msg.sender;
    }

    modifier onlyOwner {
     require(msg.sender == manager,"only manager can call this");
     _;
}

    receive() external payable {
        require(msg.value >= 1000 wei, "fees is not sufficient");
        participants.push();
    }

    function getContractBalance() public view onlyOwner returns (uint256) {
        return address(this).balance;
    }

    function generateRandomNumber() public view returns (uint256) {
        return uint256(keccak256(abi.encodePacked(block.timestamp,msg.sender,participants.length)));
    }

    function findWinner() public payable onlyOwner returns(address){
        require(participants.length >= 3,"Not enough participants");
        address payable winner = participants[generateRandomNumber() % participants.length];
        winner.transfer(getContractBalance());
        participants = new address payable [](0);
        return winner;
    }
}
