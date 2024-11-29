//SPDX-License-Identifier:MIT
pragma solidity ^0.8.13;

contract variables{
    
    //local 存在函数内存中 调用的时候才有
    //blockchain 存在链上的 是需要消耗Gas
    //global 默认是全局变量，整个以太坊自带的变量

    // function外声明的变量存储在blockchain上
    string public text = "text";
    uint256 public num = 123;

    function doSomething() public view returns(uint,address) {
        // function内声明的变量存储在内存上
        // uint i = 99;

        // 全局变量
        uint timestamp = block.timestamp; //当前区块的时间戳 全局变量 是距1970年到目前的秒数
        address sender = msg.sender; // msg.sender 调用这个函数的地址

        return (timestamp,sender);
    }
    
}