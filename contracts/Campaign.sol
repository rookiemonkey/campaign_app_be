// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;

import '../structs/Request.sol';

/*
* BUGS:
* - manager can also contribute
*/

contract Campaign {
    address public manager;
    uint public minimumContribution;
    address[] public approvers;
    Request[] public requests;

    constructor(uint minimum) {
        manager = msg.sender;
        minimumContribution = minimum;
    }

    modifier onlyForManager() {
        require(msg.sender == manager);
        _;
    }

    function contribute() public payable {
        require(msg.value >= minimumContribution); 
        approvers.push(msg.sender);
    }

    function createRequest(string memory description, uint value, address recipient) 
        public onlyForManager 
    {
        Request memory newRequest = Request(description, value, recipient, false);

        requests.push(newRequest);
    }
}