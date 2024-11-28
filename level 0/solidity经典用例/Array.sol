// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Array {
    // Several ways to initialize an array

    uint256[] public arr;

    uint256[] public arr2=[1,2,3];

     // Fixed sized array, all elements initialize to 0

    uint256[10] public myFixedSizeArr;

    function get(uint256 i) public view returns (uint256){
        return arr[i];
    }

    // Solidity can return the entire array.->Solidity可以返回整个数组。
    // But this function should be avoided for->但应避免使用此功能
    // arrays that can grow indefinitely in length.->长度可以无限增长的数组。
    function getArr() public view returns (uint256[] memory) {
        return arr;
    }

    function push(uint256 i) public{
        // Append to array
        // This will increase the array length by 1.
        arr.push(i);
    }

    function pop() public{
         // Remove last element from array
        // This will decrease the array length by 1
        arr.pop();
    }

    function getLength() public view returns (uint256){
        return arr.length;
    }

    function remove(uint256 index) public{
        // Delete does not change the array length.
        // It resets the value at index to it's default value,
        // in this case 0
        delete arr[index];
    }

    //external 修饰符表示该函数只能从外部调用，不能在合约内部调用。
    //这意味着该函数不能被合约内的其他函数调用，只能通过外部交易或合约调用。
    function examples() external pure{
         // create array in memory, only fixed size can be created
         uint256[] memory a =new uint256[](5);
    }
}