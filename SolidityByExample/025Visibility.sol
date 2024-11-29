//SPDX-License-Identifier:MIT
pragma solidity ^0.8.13;

// 功能和状态变量state contract必须被声明，无论他们是否能被其他合约访问
// function可以被声明为：
//  public：    任意合约都可以调用
//  private:    只用在定义功能的合约里可以被调用
//  internal:   只能在定义功能的合约里和继承该功能的合约中
//  external：  只能被其他合约和账户调用

// 状态变量可以声明为: public private internal

contract Base{

    // private
    // 只能在这个合约中使用
    // 继承这个合约的合约，也不能使用这个方法
    function privateFunc() private pure returns(string memory){
        return "private function called";
    }

    function testPrivate() public pure returns(string memory){
        return privateFunc();
    }

    // Internal
    // 定义合约的内部使用
    // 继承这个合约的合约使用
    function internalFunc() internal pure virtual returns(string memory){
        return "internal function called";
    }

    function testInternalFunc() public pure virtual returns(string memory){
        return internalFunc();
    }

    // public
    // 本合约内
    // 继承的合约内
    // 其他合约和账户
    function publicFunc() public pure returns(string memory){
        return "public function called";
    }

    // external
    // 其他合约和账户调用
    function externalFunc() external pure returns(string memory){
        return "external function called";
    }

    string private privateVar = "my private variable";
    string internal internalVar = "my internal variable";
    string public publicVar = "my public variable";

}

contract Child is Base{
    function testInternalFunc() public pure override returns(string memory){
        return internalFunc();
    }

    function testInternalFunc_() public pure returns(string memory){
    return internalFunc();
    }
}