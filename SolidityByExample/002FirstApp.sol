//SPDX-License-Identifier:MIT
// 以上为授权信息
pragma solidity ^0.8.13; //编译器版本

contract Coutner{
    // uint 初始默认值为0，我们也可以给他一个值
    uint256 public count;
    // 用public定义的，本身就会带着一个get()方法

    function get() public view returns(uint256){
        return count;
    }

    function inc() public{
        count += 1;
    }

    function dec() public{
        count -= 1;
    }
}