// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/*
Events allow logging to the Ethereum blockchain. Some use cases for events are:
->事件允许记录到以太坊区块链。事件的一些用例是：

Listening for events and updating user interface
->监听事件并更新用户
A cheap form of storage
->一种廉价的存储方式
*/

contract Event {
    // Event declaration
    // Up to 3 parameters can be indexed.->最多可以索引3个参数
    // Indexed parameters helps you filter the logs by the indexed parameter
    //->索引参数可帮助您根据索引参数过滤日志
    event Log(address indexed sender, string message);
    event AnotherLog();

    function test() public {
        //调用 emit 方法来通知所有监听该事件的回调函数或处理程序
        emit Log(msg.sender, "Hello World!");
        emit Log(msg.sender, "Hello EVM!");
        emit AnotherLog();
    }
}