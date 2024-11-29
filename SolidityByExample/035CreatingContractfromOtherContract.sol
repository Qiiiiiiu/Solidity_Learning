//SPDX-License-Identifier:MIT
pragma solidity ^0.8.13;

// 合约可以通过其他合约使用new关键字进行创建
// 0.8.0版本以后，支持create2的方式，但是要加上salt的参数

contract Car{
    address public owner;
    string public model;
    address public carAddr;

    constructor(address _addr,string memory _model) payable {
        owner = _addr;
        model = _model;
        carAddr = address(this);
    }
}

contract CarFactory {
    Car[] public cars;

    function createCar(address _addr,string memory _model) public {
        Car car = new Car(_addr,_model);
        cars.push(car);
    }

    function createAndSendEther(address _addr,string memory _model) public payable{
        Car car = (new Car){value:msg.value}(_addr,_model);
        cars.push(car);
    }

    function create2Car(
        address _addr,
        string memory _model,
        bytes32 _salt
    ) public {
        Car car = (new Car){salt:_salt}(_addr,_model);
        cars.push(car);
    }

    function create2AndSendEther(
        address _addr,
        string memory _model,
        bytes32 _salt
    ) public payable{
        Car car = (new Car){value:msg.value,salt:_salt}(_addr,_model);
        cars.push(car);
    }

    function getCar(uint index) public view returns(
        address owner,
        string memory model,
        address carAddr,
        uint balance){
        Car car = cars[index];
        return (
            car.owner(),
            car.model(),
            car.carAddr(),
            address(car).balance
        );
    }
}