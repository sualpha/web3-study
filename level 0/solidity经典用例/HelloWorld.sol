// SPDX-License-Identifier: MIT
// pragma specifies the compiler version of Solidity. pragma指定编译器的版本
// compiler version must be greater than or equal to 0.8.24 and less than 0.9.0 编译器版本必须大于或等于0.8.24且小于0.9.0
pragma solidity ^0.8.24;

//关键字用于定义一个智能合约。
//HelloWorld 是这个合约的名字。
contract HelloWorld{
    /*
    * string 是一个字符串类型的变量。
      public 是访问修饰符，表示这个变量可以被外部访问。
      greet 是变量名。
      = "Hello world" 是变量的初始值。
    */
    string public greet="Hello world";
}