//SPDX-License-Identifier:MIT
pragma solidity ^0.8.13;

// owner:0x5B38Da6a701c568545dCfcB03FcB875f56beddC4

contract Payable{
    address payable public owner;

    constructor() payable {
        owner = payable(msg.sender);
    }

    function deposit() public payable{}

    function getBalance() public view returns(uint){
        return address(this).balance;
    }

    function withdraw() public {
        // 获取合约中的以太坊数量
        uint num = getBalance();

        // 发送所有以太坊给owner
        (bool success,) = owner.call{value:num}("");
        require(success,"Failed to send Ether");
    }

    // 从合约转账到某个地址的函数
    function transfer(address payable _to,uint _amount) public {
        (bool success,) = _to.call{value:_amount}("");
        require(success,"Failed to send Ether!");
    }
}