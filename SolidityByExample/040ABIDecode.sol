// SPDX-License-Identifier:MIT
pragma solidity ^0.8.24;

contract AbiDecode{
    struct MyStruct {
        string name;
        bool flag;
    }

    MyStruct myStruct;

    function encode(
        uint256 x,
        address _addr,
        uint256[] calldata arr
    ) external returns(bytes memory){
        MyStruct storage _myStruct = myStruct;
        _myStruct.name = "hello";
        _myStruct.flag = true;
        return abi.encode(x,_addr,arr,_myStruct);
    }

    function decode(bytes memory data)
        external
        pure
        returns(
        uint256 x,
        address _addr,
        uint256[] memory arr,
        MyStruct  memory _myStruct
        ){
            (x,_addr,arr,_myStruct) = abi.decode(data,(uint256,address,uint256[],MyStruct));
        }
}