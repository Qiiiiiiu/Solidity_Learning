//SPDX-License-Identifier:MIT
pragma solidity ^0.8.13;
// 不要写出死循环，这会导致击穿gas limit,会导致交易失败
contract Loop{
    function loop() public pure returns(uint){
        for(uint i = 0;i < 10; i++){
            if(i == 3){
                continue;
            }
            if (i==5){
                break;
            }
        }

        uint j;
        while (j < 10){
            j++;
        }
        return j;
    }
}