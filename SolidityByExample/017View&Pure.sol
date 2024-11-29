//SPDX-License-Identifier:MIT
pragma solidity ^0.8.13;

// 访问函数可以被声明为 view 和 pure
// view function表示函数不会对合约中的状态(or变量)进行修改，但可以使用合约中的状态(or变量)
// pure function表示函数不会对合约中的状态(or变量)进行修改或读取

// 

contract ViewAndPure{
    uint public i = 5;

    // 不修改合约中的状态
    function addToX(uint _x) public view returns(uint){
        return (_x+i);
    }

    
    // 不修改也不读取合约中的状态
    function add(uint x,uint y) public pure returns(uint){
        return (x+y);
    }
}