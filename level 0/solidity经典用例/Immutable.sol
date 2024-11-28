// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/*
Immutable variables are like constants. Values of immutable variables can be set inside the constructor but cannot be modified afterwards.
不可变量的值可以在构造函数中设置,但之后不能修改
*/
contract Immutable{
    // coding convention to uppercase constant variables
    address public immutable MY_ADDRESS;
    uint256 public immutable NY_UINT;

    constructor(uint256 _myUint){
        MY_ADDRESS=msg.sender;
        NY_UINT=_myUint;
    }

}