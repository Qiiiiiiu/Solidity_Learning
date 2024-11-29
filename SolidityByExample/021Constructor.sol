//SPDX-License-Identifier:MIT
pragma solidity ^0.8.13;

// 创建constructor是一件可选的行为，它会在合约创建之前执行
// 以下是向constructor传递参数的样例

contract X{
    string public name;

    constructor(string memory _name){
        name = _name;
    }

}

contract Y{
    string public text;

    constructor(string memory _text){
        text = _text;
    }
}

// 有两种办法去带着参数的初始化父合约
// 1.在继承列传参
contract B is X("Input to X"), Y("Input to Y"){}

contract C is X, Y{
    // 2.在构造器中传递参数
    // 比较像modifier
    constructor(string memory _name,string memory _text) X(_name) Y(_text) {}
}

// 总是按照继承的父构造器顺序去调用，而不看父合约的顺序
// X -> Y -> D
contract D is X, Y{
    constructor() X("X was called") Y("Y was called") {}
}

// X -> Y -> E
contract E is Y, X {
    constructor() Y("Y was called") X("X was called") {} 
}