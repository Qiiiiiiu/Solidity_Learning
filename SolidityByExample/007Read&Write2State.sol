//SPDX-License-Identifier:MIT
pragma solidity ^0.8.13;

    //写入和读取变量的方法
    // 写入和修改变量是会有花费的
    //  但是读取变量是免费的
contract SimpleStorage {
    uint public num;

    function set(uint _num) public{
        num = _num;
    }

    
    function get() public view returns(uint){
        return num;
    }
   
}