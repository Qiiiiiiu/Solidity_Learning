//SPDX-License-Identifier:MIT
pragma solidity ^0.8.13;

contract Mapping {
    // mapping语法是mapping(key => value)
    // key可以是string uint bool bytes h或者已经部署的合约
    // value可以是多种类型的变量 甚至是另一个mapping或者是一个array(动态数组)
    mapping(address => uint) myMap;

    function get(address _addr) public view returns(uint){
        return myMap[_addr];
    }

    function set(address _addr,uint _i) public{
        myMap[_addr] = _i;
    }


    function remove(address _addr) public {
        delete myMap[_addr];
    }

}

contract NestedMapping{
    mapping(address => mapping(uint => bool)) public nested;

    function get(address add,uint _i) public view returns(bool) {
        return nested[add][_i];
    }

    function set(address add,uint _i,bool _b) public{
        nested[add][_i] = _b;}

    function remove(address add,uint _i) public{
        delete nested[add][_i];
    }
}