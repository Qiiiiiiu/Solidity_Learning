//SPDX-License-Identifier:MIT
pragma solidity ^0.8.13;

contract Immutable{

    // immutable修饰的变量可以在声名时不去进行赋值，之后构造器中(constructor)进行赋值，但是赋值后便不能再修改
    address public immutable MY_ADDRESS;
    uint public immutable MY_UINT;

    constructor(uint _myUint){
        MY_ADDRESS = msg.sender;
        MY_UINT = _myUint;
    }
}