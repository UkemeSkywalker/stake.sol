//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract stakes{

    uint256 stakingFee; // The total amount staked
    address Owner; // contract creator

    constructor() {
        Owner == payable(msg.sender);
        // stakingFee = 2 ether;
    }

    event logStake(address _from, uint256 _amount);
    mapping(address => uint) balanceOf;

    modifier onlyOwner(){
        require(msg.sender == Owner, "Not owner");
        _;
    }

    
    // get address balance
    function getBalance(address _address) public view returns(uint256){
        return _address.balance;
    }


    function stake(address payable _address, uint256 _amount) external payable {
         balanceOf[_address] -= _amount;
         balanceOf[Owner] += _amount;

        emit logStake(_address, _amount);
    }

}