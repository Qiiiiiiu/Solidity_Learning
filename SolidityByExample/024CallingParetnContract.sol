//SPDX-License-Identifier:MIT
pragma solidity ^0.8.13;

/* Inheritance tree
   A
 /  \
B   C
 \ /
  D
*/

// 父合约可被直接调用，也可以用super关键字去调用
// 用super关键字去调用时，将会把所有的直接父合约都调用(对D来说C、B、A都是直接父合约)

contract A {
    event Log(string message);

    function foo() public virtual  {
        emit Log("A.foo called");
    }

    function bar() public virtual {
        emit Log("A.bar called");
    }
}

contract B is A{
    function foo() public virtual override {
        emit Log("B.foo called");
        A.foo();
    }

    function bar() public virtual override {
        emit Log("B.bar called");
        super.bar();
    }
}

contract C is A{
    function foo() public virtual override {
        emit Log("C.foo called");
        A.foo();
    }

    function bar() public virtual override {
        emit Log("C.bar called");
        super.bar();
    }
}

contract D is B, C{

    function foo() public override(B,C) virtual  {
        super.foo();
    }

    function bar() public override(B,C) virtual  {
        super.bar();
    }
}

contract E is A, B, C{

    function foo() public override(A,B,C) {
        super.foo();
    }

    function bar() public override(A,B,C) {
        super.bar();
    }
}

contract F is D{

    function foo() public override {
        super.foo();
    }

    function bar() public override {
        super.bar();
    }
}