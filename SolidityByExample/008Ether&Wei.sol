//SPDX-License-Identifier:MIT
pragma solidity ^0.8.13;

contract EtherUnits{
    // 1eth = 10**18 wei,wei是以太坊上的最小单位
    uint public onewei = 1 wei;

    // 1wei == 1
    bool public isOneWei = 1 wei == 1;

    uint public oneEther = 1 ether;
    // 1ether = 10^18
    bool public isOneEther = oneEther == 1e18; //1e18 = 10**18

}