// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <=0.9.0;

contract Wallet {
    string public name = "wallet";
    uint256 public num;

    function setNum(uint256 _num) public {
        num = _num;
    }

    function getNum() public view returns (uint256) {
        return num;
    }

    function sendEtherToContract() public payable {}

    function getContractBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function sendEther(address to) public payable {
        payable(to).transfer(msg.value);
    }

    function getBalance(address _address) public view returns(uint){
        return _address.balance;
    }
}

//0xCEE4B685aF2ddbb157d8819f553C03dcFf838851