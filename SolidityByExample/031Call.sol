//SPDX-License-Identifier:MIT
pragma solidity ^0.8.13;

// call是一种用来和其他合约进行交互的low level(?)函数
// 通过调用fallback函数来进行Ether发送的过程中，call是一个比较推崇的方式
// 但在调用已存在的函数时，并不是一个推崇的方式

// low level call函数不被推崇的原因
// 1. A call B时出错，B如果有revert操作，在A的命令行中看不到反馈
// https://yos.io/2022/07/16/bubbling-up-errors-in-solidity/
// 2. 会绕数据类型检查
// 3. 不会进行函数存在行检查(Function existence checks are omitted)

contract Receive{
    event received(address caller,uint amount,string message);

    fallback() external payable{
        emit received(msg.sender,msg.value,"Failed was called");
    }

    function foo(string memory _message,uint _i) public payable returns(uint){
        emit received(msg.sender, msg.value, _message);

        return (_i + 1);
    }
}

contract Caller{
    // 假设并不知道receiver的源码
    // 但是知道receiver的地址和函数
    event Response(bool success,bytes data);

    function testCallFoo(address payable _addr) public payable {
        (bool success,bytes memory data) = _addr.call{
            value:msg.value,
            gas:5000
            // 调用已有函数foo()
            }(abi.encodeWithSignature("foo(string,uint256)", "call foo", 123));

            emit Response(success, data);
    }

    // 通过调用一个不存在的函数来触发fallback
    function testCallDoesNotExist(address payable _addr) public payable{
        (bool success,bytes memory data) = _addr.call{value:msg.value}(
            // 调用不存在的函数doesNotExist()
        abi.encodeWithSignature("doesNotExist()"));

            emit Response(success, data);
    }


}