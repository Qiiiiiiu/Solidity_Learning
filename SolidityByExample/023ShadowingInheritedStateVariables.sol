//SPDX-License-Identifier:MIT
pragma solidity ^0.8.13;

// 隐藏继承的状态变量. 与函数不同，状态变量state variable不能通过在子合约中重新声明来重写。
// 让我们学习如何正确地重写继承的状态变量.

contract A{
    string public name = "Contract A";

    function getName() public view virtual returns(string memory) {
        return name;
    }
}

// 0.6版本之后这种形式被ban了
// contract B is A {
//     string public name = "Contract B";
// }

contract C is A{
    constructor() {
        name = "Conrtract c";
    }

    // C.getName returns "Contract C"

}