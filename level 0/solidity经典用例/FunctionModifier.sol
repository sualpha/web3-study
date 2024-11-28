// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/*
Modifiers are code that can be run before and / or after a function call.
->修饰符是可以在函数调用之前和/或之后运行的代码。
Modifiers can be used to:
->修改器可用于：
Restrict access->限制访问
Validate inputs->验证输入
Guard against reentrancy hack->防范重入式黑客攻击
*/
contract FunctionModifier {

     // We will use these variables to demonstrate how to use->我们将使用这些变量来演示如何使用
    // modifiers.
    address public owner;
    uint256 public x = 10;
    bool public locked;
    constructor() {
        // Set the transaction sender as the owner of the contract.->将交易发送方设置为合同的所有者。
        owner = msg.sender;
    }

    // Modifier to check that the caller is the owner of the contract ->修饰符，用于检查调用者是否是合约的所有者。

     modifier onlyOwner() {
        require(msg.sender == owner, "Not owner");
        // Underscore is a special character only used inside->下划线是一个仅在内部使用的特殊字符
        // a function modifier and it tells Solidity to
        // execute the rest of the code.->执行其余代码。
        _;
    }

    // Modifiers can take inputs. This modifier checks that the address passed in is not the zero address.
    modifier validAddress(address _addr) {
        require(_addr != address(0), "Not valid address");
        _;
    }

     function changeOwner(address _newOwner) public onlyOwner validAddress(_newOwner)
    {
        owner = _newOwner;
    }

    // Modifiers can be called before and / or after a function.->修饰符可以在函数之前和/或之后调用。
    // This modifier prevents a function from being called while->此修饰符可防止在以下情况下调用函数
    // it is still executing.
    //防重入
    modifier noReentrancy() {
        require(!locked, "No reentrancy");

        locked = true;
        _;
        locked = false;
    }

    function decrement(uint256 i) public noReentrancy {
        x -= i;

        if (i > 1) {
            decrement(i - 1);
        }
    }

}