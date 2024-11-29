// SPDX-License-Identifier:MIT
pragma solidity ^0.8.24;

interface IERC20{
    function transfer(address,uint) external;
}

contract Token{
    function transfer(address,uint) external {}
}

contract AbiEncode {
    function test(address _contract,bytes calldata data) external {
        (bool ok,) = _contract.call(data);
        require(ok,"call failed");
    }

    function encodeWithSignature(address _to,uint _amount) 
        external
        pure
        returns (bytes memory)
    {
        return abi.encodeWithSignature("transfer(address,uint)", _to, _amount);
    }

    function encodeCall(address to, uint amount)
        external
        pure
        returns (bytes memory){
            return abi.encodeCall(IERC20.transfer ,(to,amount));
        }
}