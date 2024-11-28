// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/*
Constants are variables that cannot be modified.->不可修改的

Their value is hard coded and using constants can save gas cost.->硬编码并且节省gas
*/
contract Constants{
    // coding convention to uppercase constant variables->大写常量变量的编码约定
    address public constant MY_ADDRESS=0x777788889999AaAAbBbbCcccddDdeeeEfFFfCcCc;
    uint256 public constant MY_UINT=123;
}