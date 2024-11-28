// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/*
How much ether do you need to pay for a transaction?->交易需要支付多少以太币？
You pay gas spent * gas price amount of ether, where->您支付的gas spent*gas price以太币的金额，其中

gas is a unit of computation->gas是一个计算单位
gas spent is the total amount of gas used in a transaction->gas spent是指交易中使用的gas总量
gas price is how much ether you are willing to pay per gas->gas price是指你愿意为每种天然气支付多少以太币
Transactions with higher gas price have higher priority to be included in a block.
->gas price较高的交易在纳入区块时具有更高的优先级

Unspent gas will be refunded.->未使用的gas将被退还

There are 2 upper bounds to the amount of gas you can spend->你可以消耗的gas有两个上限
gas limit (max amount of gas you're willing to use for your transaction, set by you)
->您愿意用于交易的最大gas量，由您设置
block gas limit (max amount of gas allowed in a block, set by the network)
->由网络设置的区块中允许的最大gas量
*/
contract Gas {
    uint256 public i=0;
    // Using up all of the gas that you send causes your transaction to fail.
    //->用完您发送的所有gas会导致交易失败
    // State changes are undone.
    //->状态更改将撤消。
    // Gas spent are not refunded.
    //->已消耗的gas不予退还。

    function forever() public {
        // Here we run a loop until all of the gas are spent
        // and the transaction fails
        while (true) {
            i += 1;
        }
    }
}

