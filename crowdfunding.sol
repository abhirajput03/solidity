// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <=0.9.0;

contract CrowdFund {
    address public manager;
    struct Request {
        string description;
        uint256 target;
        uint256 deadline;
        uint256 minAmount;
        uint256 raisedFund;
        uint256 contributorsNo;
        address receipent;
        bool isCompleted;
        mapping(address => uint256) contribution;
    }
    mapping(uint256 => Request) public requests;
    uint256 public requestId = 0;

    constructor() {
        manager = msg.sender;
    }

    function createRequest(
        string memory _description,
        uint256 _target,
        uint256 _deadline,
        uint256 _minAmount,
        address _receipent
    ) public {
        require(msg.sender == manager, "Only manager can make request!");
        Request storage newRequest = requests[requestId++];
        newRequest.description = _description;
        newRequest.target = _target;
        newRequest.deadline = block.timestamp + _deadline;
        newRequest.minAmount = _minAmount;
        newRequest.isCompleted = false;
        newRequest.raisedFund = 0;
        newRequest.contributorsNo = 0;
        newRequest.receipent = _receipent;
    }

    function sendEther(uint256 _requestId) public payable {
        Request storage req = requests[_requestId];
        require( msg.value >= req.minAmount, "Minmum Amount condition is not met");
        require( block.timestamp < req.deadline,"Deadline has passed for this request");
        require(msg.value <= req.target,"You can't pay this much amount");
        require(req.target > req.raisedFund,"Target has reached");
        if (req.contribution[msg.sender] == 0) {
            req.contributorsNo++;
        }
        req.contribution[msg.sender] += msg.value;
        req.raisedFund += msg.value;
    }

    function getContractBalance() public view returns (uint){
        return address(this).balance;
    }
}
