//SPDX-License-Identifier:MIT
pragma solidity ^0.8.13;

// event允许在以太坊区块链上发送日志.使用案例:
// 1.监听时间并更新用户的界面
// 2.一个廉价的存储形式

contract Event{
    // event的声明最多可以设置三个索引参数(参数个数不止三个，但是索引参数最多三个)
    // 通过indexed参数，你可以来过滤log信息
    event Log_2(address indexed from,string message);
    event Log_4(address indexed from,address indexed to,address indexed tri,uint i);
    event anotherLog();

    function test() public{
        // 通过 `emit` 关键字，合约可以触发事件并传递事件参数的值。
        emit Log_2(msg.sender,"Hello,World!");
        emit Log_2(msg.sender,"Hello,EVM!");
        emit anotherLog();
    }
}