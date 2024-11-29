//SPDX-License-Identifier:MIT
pragma solidity ^0.8.13;

// 生成数据唯一标识
// 加密签名
// 安全加密

// keccak256()是solidity最常用的哈希方法，keccak256(...)
contract HashFunction{
    function hash(address _addr,string memory _text,uint256 _num)
        public pure returns(bytes32){
            return keccak256(abi.encodePacked(_text, _num, _addr));
            // abi.encodePacked比abi.encode的编码结果节约了许多0
        }
    
    // 哈希碰撞
    // 当向abi.encodePacked传输多余一个动态数据类型(string)的时候可能会发生哈希碰撞(不同值的哈希值一样)。
    // 这是最好用abi.encode去代替bi.encodePacked
    // 测试强抗碰撞性
    function collision(
        string memory _message1,
        string memory _message2
    ) public 
      pure
      returns(bytes32){
        return keccak256(abi.encodePacked(_message1,_message2));
        // 传入(aa,bb)和传入(a,abb)最后的哈希值一样
      }
}

contract GuessTheMagicWord {
    bytes32 public answer =
        0x60298f78cc0b47170ba79c10aa3851d7648bd96f2f8e46a19dbc777c36fb0c00;

    // Magic word is "Solidity"
    function guess(string memory _word) public view returns (bool) {
        return keccak256(abi.encodePacked(_word)) == answer;
    }
}