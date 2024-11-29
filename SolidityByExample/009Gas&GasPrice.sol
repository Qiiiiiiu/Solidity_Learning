//SPDX-License-Identifier:MIT
pragma solidity ^0.8.13;

// 一笔交易你需要支付多少ether呢？
// 你将会支付 (gas消耗量)*(gas的单价)
// // 1. gas代表着一种计算单元
// // 2. gas消耗量 是指在一笔交易中所使用的所有的gas的总量
// // 3. gas的单价 是指你愿意为每个gas支付多少Ether

// 拥有更改Gas单价的交易，会更优先的被涵盖到链中
// 不支付gas的交易会被退还

// Gas Limit
// 还有两个关于你能消耗的gas的数量上限
// 1. gas limit：你愿意为订单支付的gas的最大数量，由你定义
// 2. block gas limit：块中能被允许的gas的最大数量，由网络定义
contract Gas{
    uint public i = 0;

    // 这个死循环最后会消耗所有的gas
    // 然后导致交易失败
    function forever() public {
        while (true) {
            i += 1;
        }
    }
}