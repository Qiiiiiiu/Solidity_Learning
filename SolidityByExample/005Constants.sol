//SPDX-License-Identifier:MIT
pragma solidity ^0.8.13;

contract constants{
    // constant 修饰的变量是不能被修改的，这样存储的时候可以减少很多GAS消耗

    address public constant MY_ADDRESS = 0x777788889999AaAAbBbbCcccddDdeeeEfFFfCcCc;

    uint256 public constant MY_UINT = 123;

    function mod() public{
        //MY_ADDRESS = 0x777788889999AaAAbBbbCcCcddDdeeeEfFFfCcCc;
        //更改常量会报错
    }
}