// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Primitives{

    bool public boo=true;

  /*
    uint stands for unsigned integer, meaning non negative integers ->  uint代表无符号整数，意思是非负整数
    different sizes are available->有不同尺寸可供选择
        uint8   ranges from 0 to 2 ** 8 - 1
        uint16  ranges from 0 to 2 ** 16 - 1
        ...
        uint256 ranges from 0 to 2 ** 256 - 1
    */
    uint8 public u8=1;

    uint256 public u256=456;

    uint256 public u=123;// uint is an alias for uint256->uint是uint256的别名

    /*
    Negative numbers are allowed for int types.
    Like uint, different ranges are available from int8 to int256

    ->int类型允许使用负数。与uint一样，从int8到int256都有不同的范围
    
    int256 ranges from -2 ** 255 to 2 ** 255 - 1
    int128 ranges from -2 ** 127 to 2 ** 127 - 1
    */
    int8 public i8 =-1;

    int256 public i256=456;

    int256  public i =-123;

    int256 public minInt=type(int256).min;

    int256 public maxInt=type(int256).max;

    address public addr =0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c;


    /*
    In Solidity, the data type byte represent a sequence of bytes. ->在Solidity中，数据类型字节表示字节序列。
    Solidity presents two type of bytes types :->Solidity提供两种字节类型：

     - fixed-sized byte arrays->固定大小的字节数组
     - dynamically-sized byte arrays.
     
     The term bytes in Solidity represents a dynamic array of bytes. ->Solidity中的术语bytes表示字节的动态数组。
     It’s a shorthand for byte[] .->这是byte[]的简写
    */
    bytes1 a =0xb5;

    bytes1 b =0x56;

    // Default values
    // Unassigned variables have a default value
    bool public defaultBoo;

    uint256 public defaultUint;

    int256 public defaultInt;

    address public defaultAddr;

}