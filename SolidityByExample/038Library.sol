// SPDX-License-Identifier:MIT
pragma solidity ^0.8.24;

// library和contract很想，但不能定义状态变量也不能发送Ether
// 如果library的所有函数都是internal的，那必须被嵌入到合约当中
// 或者library必须要在要连接的合约被部署之前进行部署

library Math{
     function sqrt(uint256 y) internal pure returns (uint256 z) {
        if (y > 3) {
            z = y;
            uint256 x = y / 2 + 1;
            while (x < z) {
                z = x;
                x = (y / x + x) / 2;
            }
        } else if (y != 0) {
            z = 1;
        }
        // else z = 0 (default value)
    }
}

contract TestMath{

    function testSqrt(uint y) public pure returns(uint z){
        return Math.sqrt(y);
    } 
}

// array函数通过index来进行删除元素并重排Array
// 所以元素之间是没有空隙的
library Array{
    function remove(uint[] storage arr,uint index) public {
        require(arr.length > 0,"Can't remove from empty array");
        arr[index] = arr[arr.length - 1];
        arr.pop();
    }
}

contract TestArray {
    
}
