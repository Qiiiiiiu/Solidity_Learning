//SPDX-License-Identifier:MIT
pragma solidity ^0.8.13;

contract primitives{
    bool public boo;// bool为solidity中的逻辑运算符(true/false)，默认为false
    
    uint8 public numa = 10; // uint8为非负整数,最大值为(2**8)-1——>0~255

    uint16 public numb = 65535; // 0~((2**16)-1)

    uint public numc = 2**256-1; // uint 为uint256的缩写

    int8 public numi = -128; // int 为整数类型，范围[-2**7,(2**7)-1]
    int8 public numj = 127;

    int public num256 = 2**255 -1;
    int public num256d = -2**255;   // int 默认为 int256

    int public numMax = type(int).max;
    int public numMin = type(int).min;

    address public addr = 0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c;

    bytes1 public a = 0x8b; //16进制

    bool public defaultBoo; // false
    uint256 public defaultUint; // 0
    int256 public defaultInt; // 0
    address public defaultAddr; // 0x0000000000000000000000000000000000000000
}