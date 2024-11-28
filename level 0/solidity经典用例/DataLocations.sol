// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/*
Variables are declared as either storage, memory or calldata to explicitly specify the location of the data.
->变量被声明为存储、内存或调用数据，以明确指定数据的位置。
storage variable is a state variable (store on blockchain)
->存储变量是一个状态变量（存储在区块链上）
memory variable is in memory and it exists while a function is being called
->内存变量在内存中，并且在调用函数时存在
calldata special data location that contains function arguments
->calldata包含函数参数的特殊数据位置
*/
contract DataLocations {

    uint256[] public arr;

    mapping(uint256 => address) map;

    struct MyStruct{
        uint256 foo;
    }

    mapping(uint256=>MyStruct) myStructs;

    function f() public {
         // call _f with state variables
         _f(arr,map,myStructs[1]);

        // get a struct from a mapping
         MyStruct storage myStruct = myStructs[1];

        // create a struct in memory
        MyStruct memory myMemStruct = MyStruct(0);
    }

    function _f(uint256[] storage _arr,mapping(uint256 => address) storage _map,MyStruct storage _myStruct) internal {
         // do something with storage variables
    }

    // You can return memory variables
    function g(uint256[] memory _arr) public returns (uint256[] memory) {
        // do something with memory array
    }

    function h(uint256[] calldata _arr) external {
        // do something with calldata array
    }

}