// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/*
Transactions are paid with ether. ->交易使用以太币支付。

Similar to how one dollar is equal to 100 cent, one ether is equal to 10(18) wei.->就像一美元等于100美分一样，一个以太等于10（18）微。
*/
contract EtherUnits {

    uint256 public oneWei=1 wei;
    // 1 wei is equal to 1
    bool public isOneWei =(oneWei ==1);

    uint256 public oneGwei=1 gwei;
    //1 gwei is equal to 10^9 gwei
    bool public  isOneGWei=(oneGwei ==1e9);

    uint256 public oneEther= 1 ether;
    //1 ether is equal to 10^18wei
    bool public isOneEther =(oneEther==1e18);
}