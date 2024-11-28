
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/*
A constructor is an optional function that is executed upon contract creation.
->构造函数是在合约创建时执行的可选函数。
*/

// Base contract X
contract X {
    string public name;

    constructor(string memory _name) {
        name = _name;
    }
}

// Base contract Y

contract Y {
    string public text;

    constructor(string memory _text) {
        text = _text;
    }
}

// There are 2 ways to initialize parent contract with parameters.
//->有两种方法可以使用参数初始化父合约

// Pass the parameters here in the inheritance list.
//通过继承列表中传递参数
contract B is X("Input to X"), Y("Input to Y") {}

contract C is X, Y {
    // Pass the parameters here in the constructor,
    // similar to function modifiers.
    constructor(string memory _name, string memory _text) X(_name) Y(_text) {}
}

// Parent constructors are always called in the order of inheritance regardless of the order of parent contracts listed in the constructor of the child contract.
// ->父构造函数总是按照继承的顺序调用，而不管子合约构造函数中列出的父合约的顺序如何。

// Order of constructors called:
// 1. X
// 2. Y
// 3. D
contract D is X, Y {
    constructor() X("X was called") Y("Y was called") {}
}

// Order of constructors called:
// 1. X
// 2. Y
// 3. E
contract E is X, Y {
    constructor() Y("Y was called") X("X was called") {}
}