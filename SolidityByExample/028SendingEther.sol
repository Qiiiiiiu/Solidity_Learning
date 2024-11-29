//SPDX-License-Identifier:MIT
pragma solidity ^0.8.13;

// 发送
// 向别的合约发送Ether有三种途径
// transfer:2300gas,抛异常
// send:    2300gas,返回布尔
// call:    forward all gas or set gas,返回布尔

// 接收
// 一个合约去接受Ether必须有以下函数之一
// receive() external payable
// fallback() external payable

// 推荐的实现
// 在2019年12月 call结合re-entrancy guard的方式是更为推荐的
// 防范re-entrancy的方式是:
// 调用其他合约前，令所有状态发生变动
// 使用re-entrancy guard的modifier

contract ReceiveEther{
    /*
    Which function is called, fallback() or receive()?

           send Ether
               |
         msg.data is empty?
              / \
            yes  no
            /     \
    receive() exists?  fallback()
         /   \
        yes   no
        /      \
    receive()   fallback()
    */

    // 函数接受Ether时，msg.data必须时空的
    receive() external payable { }

    // fallback将会被调用当msg.data不是空的时候
    fallback() external payable { }

    function getBalance() public view returns(uint){
        return address(this).balance;
    } 
}

contract sendEther{
    function sendViaTransfer(address payable _addr) public payable {
        // tranfer方法不推荐
        _addr.transfer(msg.value);
    }

    function sendViaSend(address payable _addr) public payable {
        // send将返回一个bool，来说明发送成功与否
        // send方法发送ether也不推荐
        bool flag = _addr.send(msg.value);
        require(flag,"Failed to send Ether");
    }

    function sendViaCall(address payable _addr) public payable {
        // call将返回一个bool，来说明发送成功与否
        // 该方法为推荐方法
        (bool sent,) = _addr.call{value:msg.value}("");
        require(sent,"Failed to send Ether");
    }
}