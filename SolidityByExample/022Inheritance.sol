//SPDX-License-Identifier:MIT
pragma solidity ^0.8.13;

/* Graph of inheritance
    A
   / \
  B   C
 / \ /
F  D,E

*/

contract A {
    function foo() public pure virtual returns(string memory){
        return "A";
    }
}

contract B is A {
    function foo() public pure virtual override returns(string memory){
        return "B";
    } 
}

contract C is A {
    function foo() public pure virtual override returns(string memory){
        return "C";
    } 
}

// 合约继承多个合约时，
// 当方法在多个合约中定义过多次时
// 父合约将从右到左，以深度优先的方式进行搜索
contract D is B,C {
    function foo() public pure override(B,C) returns(string memory){
        return super.foo();
    } 
}

contract E is C,B{
    function foo() public pure override(C,B) returns(string memory){
        return super.foo();
    } 
}

// 继承必须从 最父级 到 最子级 的顺序去排序，不然报错
contract F is A,B{
    function foo() public pure override(A,B) returns(string memory) {
        return super.foo();
    }
}

contract G is A,C,B{
    function foo() public pure override(A,C,B) returns(string memory) {
        return super.foo();
    }
}