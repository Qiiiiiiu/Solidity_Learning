//SPDX-License-Identifier:MIT
pragma solidity ^0.8.13;

// modifiers可以在一个function在被调用前/后进行运行的代码

contract FuntionModifer{
    address public owner;
    uint public x = 10;
    bool public locked;

    constructor() {
        // 将交易的发出者设置为该合约的拥有人
        owner = msg.sender;
    }

    // 检查(方法)调用人是否是合约的拥有者
    modifier OnlyOwner() {
        require(owner == msg.sender,"Not Owner");
        // 下划线时只会在function modifer中使用的特殊字符
        // 它意味着让solidity执行之后的代码 
        _;
    }

    // 修饰器可以带着输入值。
    // 该修饰器实在查看输入的地址不为地址0
    modifier validAddress(address _add){
        require(_add != address(0),"not valid address");
        _;
    }

    function changeOwner(address _newOwner) public OnlyOwner validAddress(_newOwner){
        owner = _newOwner;
    }

    // 函数修饰符可以在函数主体之前被调用,也可以在函数主题之后或者中间被调用
    modifier noReentrancy{
        require(!locked,"No reentrancy");

        locked = true;
        _;
        locked = false;
        // locked为true，函数才能进行，函数进行完成后，再把locked改为false
    }

    function decrement(uint i) public noReentrancy returns(uint){
        x -= i;

        if(i > 1){
            decrement(i - 1);
        }
        return x;
    }
}