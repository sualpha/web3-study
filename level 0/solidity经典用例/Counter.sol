// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Counter{

    //无符号整数类型，长度为 256 位
    uint256 public count;

    //returns (uint256) 指定方法返回一个无符号整数
    function get() public view returns (uint256){
        return count;
    }

    function inc() public {
        count +=1;
    }

    function dec() public {
        count -=1;
    }

}