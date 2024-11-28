// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/*
To write or update a state variable you need to send a transaction.->要写入或更新状态变量，您需要发送一个事务。

On the other hand, you can read state variables, for free, without any transaction fee.->另一方面，您可以免费读取状态变量，无需任何交易费用。
*/
contract SimpleStorage {
    // State variable to store a number->用于存储数字的状态变量
    uint256 public num;

    //You need to send a transaction to write to a state variable.
    function set(uint256 _num) public{
        num=_num;
    }

    // You can read from a state variable without sending a transaction.
    function get() public view returns (uint256){
        return num;
    }
}