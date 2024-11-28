// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
/*
You can define your own type by creating a struct.

They are useful for grouping together related data.
它们可用于将相关数据组合在一起

Structs can be declared outside of a contract and imported in another contract.
结构可以在合同之外声明，也可以在另一个合同中导入
*/
contract Todos {

    struct Todo{
        string text;
        bool completed;
    }

    // An array of 'Todo' structs
    Todo[] public todos;

    function create(string calldata _text) public {
        // 3 ways to initialize a struct
        // - calling it like a function
        todos.push(Todo(_text, false));

        // key value mapping
        todos.push(Todo({text: _text, completed: false}));

        // initialize an empty struct and then update it
         Todo memory todo;
         todo.text = _text;

        // todo.completed initialized to false
        todos.push(todo);
    }

    // Solidity automatically created a getter for 'todos' so
    // you don't actually need this function.
    function get(uint256 _index) public
        view
        returns (string memory text, bool completed){
            //storage 关键字表示 todo 是一个指向 todos 数组中某个元素的引用，而不是一个新的副本
            Todo storage todo = todos[_index];
            return (todo.text, todo.completed);
    }

     // update text
    function updateText(uint256 _index, string calldata _text) public {
        Todo storage todo = todos[_index];
        todo.text = _text;
    }

     // update completed
    function toggleCompleted(uint256 _index) public {
        Todo storage todo = todos[_index];
        todo.completed = !todo.completed;
    }
}