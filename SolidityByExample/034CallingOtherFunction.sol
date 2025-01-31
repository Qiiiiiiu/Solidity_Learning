//SPDX-License-Identifier:MIT
pragma solidity ^0.8.13;

// 合约调用其他合约有两种方式:
// 1. A.foo(x,y,z)
// 2. 使用low-level call (推崇)

contract Callee{
    uint public x;
    uint public value;

    function setX(uint _x) public returns (uint) {
        x = _x;
        return x;
    }

    function setXandSendEther(uint _x) public payable returns(uint , uint){
        x = _x;
        value = msg.value;

        return (x, value);
    }
}

contract Caller{
    // 方式一
    function setX(Callee _callee,uint _x) public {
        uint x = _callee.setX(_x);
    }

    // 方式二
    function setXFromAddress(address _addr,uint _x) public {
        Callee callee = Callee(_addr);
        callee.setX(_x);
    }

    // 方式三
    function setXandSendEther(Callee _callee,uint _x) public payable{
        (uint x,uint value) = _callee.setXandSendEther{value: msg.value}( _x);
    }
}