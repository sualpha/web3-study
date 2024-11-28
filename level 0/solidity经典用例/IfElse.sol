// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract IfElse {
    /*
    pure 修饰符的用途
    不读取状态变量：pure 函数不能读取合约的任何状态变量。
    不修改状态变量：pure 函数不能修改合约的任何状态变量。
    纯计算：pure 函数通常用于执行纯计算任务，例如数学运算、字符串处理等。
    */
    function foo(uint256 x) public pure returns (uint256) {
        if (x < 10) {
            return 0;
        } else if (x < 20) {
            return 1;
        } else {
            return 2;
        }
    }

    function ternary(uint256 _x) public pure returns (uint256) {
        // if (_x < 10) {
        //     return 1;
        // }
        // return 2;

        // shorthand way to write if / else statement
        // the "?" operator is called the ternary operator
        return _x < 10 ? 1 : 2;
    }
}