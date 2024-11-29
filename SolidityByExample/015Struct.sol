//SPDX-License-Identifier:MIT
pragma solidity ^0.8.13;

// 015Struct当中涉及的calldata memory storage会在下一张介绍

contract Todos{
    struct Todo{
        string text;
        bool completed;
    }

    Todo[] public todos;

    function create(string calldata _text) public{
        // 三种方式去初始化struct
        // 1
        todos.push(Todo(_text,false));

        // 2
        todos.push(Todo({text:_text,completed:false}));

        // 3
        Todo memory todo;
        todo.text = _text;
        // bool的默认值就是false
        todos.push(todo);
    }

    // 定义todos时，solidity会默认创建一个get
    // 所以一下function不必自己创建
    function get(uint _i) public view returns(string memory text,bool completed){
        Todo storage todo = todos[_i];
        return(todo.text,todo.completed);
    }

    // 更新text
    function updateText(uint _i,string calldata _text) public {
        Todo storage todo = todos[_i];
        todo.text = _text;
    }

     // 更新Completed
    function updateCompleted(uint _i) public {
        Todo storage todo = todos[_i];
        todo.completed = !todo.completed;
    }

}