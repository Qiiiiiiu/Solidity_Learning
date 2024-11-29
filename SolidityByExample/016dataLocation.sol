//SPDX-License-Identifier:MIT
pragma solidity ^0.8.13;

// memory修饰的变量存储在内存中
// storage修饰的变量将永久存储在区块链上 struct/mapping/array string可以理解为array
// calldata一般只用有在外部函数的参数被强制指定为calldata,这种数据位置是只读的，不会持久化到区块链中.
//          internal接口中常常出现。
//          如果你的变量不想在函数中被修改了，可以用calldata在函数头中定义