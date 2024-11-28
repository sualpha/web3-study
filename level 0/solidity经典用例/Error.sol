// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
/*
An error will undo all changes made to the state during a transaction.
->错误将撤消在事务期间对状态所做的所有更改。

You can throw an error by calling require, revert or assert.
->您可以通过调用require、reverse或assert来抛出错误。

require is used to validate inputs and conditions before execution.
->require用于在执行之前验证输入和条件。
revert is similar to require. See the code below for details.
->revert类似于require。有关详细信息，请参阅下面的代码。
assert is used to check for code that should never be false. Failing assertion probably means that there is a bug.
->assert用于检查不应为false的代码。断言失败可能意味着存在错误。
Use custom error to save gas.
->用自定义错误来节省gas。
*/

contract Error {

        function testRequire(uint256 _i) public pure {
        // Require should be used to validate conditions such as:
        // - inputs
        // - conditions before execution
        // - return values from calls to other functions
        require(_i > 10, "Input must be greater than 10");
        }

       function testRevert(uint256 _i) public pure {
        // Revert is useful when the condition to check is complex.
        // This code does the exact same thing as the example above
            if (_i <= 10) {
                revert("Input must be greater than 10");
            }
        }

        uint256 public num;

        function testAssert() public view {
            // Assert should only be used to test for internal errors,
            // and to check invariants.

            // Here we assert that num is always equal to 0
            // since it is impossible to update the value of num
            assert(num == 0);
        }

        // custom error
        error InsufficientBalance(uint256 balance, uint256 withdrawAmount);

        function testCustomError(uint256 _withdrawAmount) public view {
            uint256 bal = address(this).balance;
            if (bal < _withdrawAmount) {
                revert InsufficientBalance({
                    balance: bal,
                    withdrawAmount: _withdrawAmount
                });
            }
        }

}