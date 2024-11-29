//SPDX-License-Identifier:MIT
pragma solidity ^0.8.13;

// 当一个函数被调用，calldata数据位置的前四个字节定义了是什么函数调用了它
// 这四个字节就是函数选择器

// addr.call(abi.encodeWithSignature("transfer(address,uint256)", 0xSomeAddress, 123))
// 上面的代码:调用了addr的合约的tranfer函数
// 从 abi.encodeWithSignature(....) 返回回来的前四个字节就是函数选择器

// 也许预计算或者内置了函数选择器到你的代码里会帮你节约gas(?)

contract FunctionSelector{

/*
    "transfer(address,uint256)" =>  0xa9059cbb
    "loop()"                    =>  0xa92100cb
*/
    function getSelector(string calldata _func) external pure returns(bytes4){
        return bytes4(keccak256(bytes(_func)));
    }
}