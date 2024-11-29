//SPDX-License-Identifier:MIT
pragma solidity ^0.8.13;

// 可以通过声明接口的方式继承其他合约
// 接口
// 没用具体实现
// 可以从其他接口继承
// 所有声明的功能必须是external修饰的
// 无法声明构造函数
// 无法声明状态变量


// 1. 通过 interface和对应合约的地址 来对对应合约的方法进行调用
contract Counter{
    uint public count;

    function increment() external {
        count += 1;
    }
}

interface ICounter {
    function count() external view returns(uint);

    function increment() external;
}

contract MyContract {
    // _counter是Counter合约的地址
    function incrementCounter(address _counter) external {
        ICounter(_counter).increment();
    }
    // _count是Counter合约的地址
    function getCount(address _count) external view returns(uint) {
        return(ICounter(_count).count());
    }
}

// 2.Uniswap example
interface UniswapV2Factory  {
    function getPair(address tokenA,address tokenB) external view 
        returns(address pair);
}

interface UniswapV2Pair {
    function getReserves() external view 
        returns(uint112 reserve0, uint112 reserve1, uint32 blockTimestampLast);
}

contract UniswapExample{
    address private factory = 0x5C69bEe701ef814a2B6a3EDD4B1652CB9cc5aA6f;
    address private dai = 0x6B175474E89094C44Da98b954EedeAC495271d0F;
    address private weth = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;

    function getTokenReserves() external view returns(uint256,uint256){
        address pair = UniswapV2Factory(factory).getPair(dai,weth);
        (uint reserve0,uint reserve1,) = UniswapV2Pair(pair).getReserves();
        return (reserve0,reserve1);
    }
}