//SPDX-License-Identifier:MIT
pragma solidity ^0.8.13;

// require是在执行前去验证输入数据和条件的匹配性
// revert和require比较像，看例子
// assert是用来检查代码是否有误，如果assert失败了应该是意味着有bug

contract Error {
    function testRequire(uint _i) public pure {
        require(_i > 10, "Input must be greater than 10");
    }

    function teatRevert(uint _i) public pure returns(uint){
        // 当条件检查比较复杂时，使用revert会比较好
        // 此案例的执行逻辑和上面的是一样的
        if(_i <= 10){
            revert("Input must be greater than 10");
        }
        return 5;
    }

    uint public num;
    function testAssert() public view returns(uint){
        // assert只能用来测试内部错误和检查不变性(?invariants)
        // 这里我们assert num等于0,所以num就不能修改值了
        assert(num == 1);
        return num;
    }

    // 定制error
    error InsufficientBalance(uint balance,uint withdrawAmount);

    function testCustomError(uint _withdrawAmount) public view returns(uint){
        uint bal = address(this).balance;
        if(bal < _withdrawAmount){
            revert InsufficientBalance({
                balance : bal,
                withdrawAmount : _withdrawAmount
            });
        }
        return address(this).balance;
    }
}