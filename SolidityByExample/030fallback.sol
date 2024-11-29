//SPDX-License-Identifier:MIT
pragma solidity ^0.8.13;

// fallback是一个特殊的函数，在以下任意情况下都会执行：
// 1. 当一个函数并不存在但是被调用了
// 2. Ether被直接发送到了合约，但是这个合约没有定义receive() 或者 合约的msg.data不为空

// 当fallback被send和transfer调用时，会有2300gas的限制

contract Fallback{
    event Log(string func,uint gas);

    // fallback必须被第一位external函数
    fallback() external payable {
        emit Log("fallback",gasleft());  //gaskeft():会返回当前合约还有多少gas可消耗
     }

    // receive是fallback的一个变种，只有msg.data不为空时才会被触发
    receive() external payable { 
        emit Log("receive",gasleft());
    }

    function getBalance() public view returns(uint){
        return address(this).balance;
    }
}

contract sendToFallback{
    function transfer2Fallback(address payable _to) public payable{
        _to.transfer(msg.value);
    }

    function callFallback(address payable _to)public payable {
        (bool sent,) = _to.call{value: msg.value}("");
        require(sent,"Failed to send Ether");
    }
}