//SPDX-License-Identifier:MIT
pragma solidity ^0.8.13;

contract ifelse{
    function foo(uint myuint) public pure returns(uint){
        if(myuint < 10){
            return 1;
        }else if(myuint == 10){
            return 0;
        }else{
            return 2;
        }
    }

    function ternary(uint _myuint) public pure returns(uint){
        return _myuint == 10?1:0;
    }
}