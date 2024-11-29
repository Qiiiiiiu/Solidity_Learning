//SPDX-License-Identifier:MIT
pragma solidity ^0.8.13;

/*
    签名核验
    #   签名
    1. 创建message去签名
    2. 对message进行hash
    3. 对hash签名(链下，不要让别人知道你的主键)

    #   验证
    1. 通过原始信息重建hash
    2. 通过签名和哈希恢复签名人
    3. 比对恢复了的签名人和声称的签名人是否一致
*/

contract VerifySignature {
    
}