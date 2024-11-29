//SPDX-License-Identifier:MIT
pragma solidity ^0.8.13;

// delegatecall和call相似都是low level函数
// 当A合约使用delegatecall调用了B合约，B合约的代码将用
// A合约的存储、msg.sender和msg.value去执行

// 先部署这个合约
contract B{
    // B合约声明的变量名称必须和A合约的一样
    uint256 public num;
    address public addr;
    uint256 public value;

    function setVars(uint256 _num) public payable {
        num = _num;
        addr = msg.sender;
        value = msg.value;
    }
   
}

contract A{
    uint256 public num;
    address public addr;
    uint256 public value;

    function setVars(address _addr,uint256 _num) public payable {
        (bool success,bytes memory data) = _addr.delegatecall(
            abi.encodeWithSignature("setVars(uint256)", _num)
        );
        require(success,"Failed to Delegatecall.");
    }
}