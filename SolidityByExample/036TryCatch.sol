//SPDX-License-Identifier:MIT
pragma solidity ^0.8.13;

//  try/catch只能捕捉到外部函数和合约调用时产生errors

// 外部合约使用TryCatch样例
contract Foo{
    address public owner;

    constructor(address _owner) {
        require(_owner != address(0),"Invalid Address!");
        assert(_owner != 0x0000000000000000000000000000000000000001);
        owner = _owner;
    }

    function myFunc(uint i) public pure returns(string memory){
        require(i != 0,"require failed");
        return "my func was called";
    }
}

contract Bar{
    event Log(string message);
    event LogBytes(bytes data);

    Foo public foo;

    constructor() {
        foo = new Foo(address(msg.sender));
    }

    // 外部调用的try/catch样例
    // tryCatchExternalCall(0) => Log("external call failed")
    // tryCatchExternalCall(1) => Log("my func was called")
    function tryCatchExternalCall(uint _i) public {
        try foo.myFunc(_i) returns(string memory result){
            emit Log(result);
        }catch{
            emit Log("external call failed");
        }
    }

    function tryCatchNewContract(address _addr) public {
        try new Foo(_addr) returns(Foo foo){
            emit Log("Foo created");
        }catch Error(string memory reason) {
            emit Log(reason);
        }catch (bytes memory reason){
            emit LogBytes(reason);
        }
    }
}