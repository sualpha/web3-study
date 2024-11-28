pragma solidity ^0.8.24;

/*
Data stored in transient storage is cleared out after transaction.
->存储在临时存储器中的数据在交易后被清除。
*/

// Make sure EVM version and VM set to Cancun
//->确保EVM版本和VM设置为Cancun

// Storage - data is stored on the blockchain
// Memory - data is cleared out after a function call->函数调用后数据被清除
// Transient storage - data is cleared out after a transaction->交易后数据被清除

interface ITest {
    function val() external view returns (uint256);
    function test() external;
}

contract Callback{

    uint256 public val;

    /*
    fallback 函数在合约收到以太币或调用未知函数时被触发。
    */
    fallback() external {
        val = ITest(msg.sender).val();
    }

    function test(address target) external {
        ITest(target).test();
    }
}


contract TestStorage {
     uint256 public val;

     function test() public {
        val = 123;
        bytes memory b = "";
        //调用 msg.sender 的回退函数。
        msg.sender.call(b);
    }
}

contract TestTransientStorage {

    //定义常量 在编译期间就确定值，以后都不能再改变的变量。
    //因为 constant 是不能更改的，所以使用它可以避免意外修改那些不应该改变的值。提高合约安全性。
    bytes32 constant SLOT = 0;

    function test() public {
        //内联汇编将 321 存储在 SLOT 中
        assembly {
            tstore(SLOT, 321)
        }
        bytes memory b = "";
        //调用 msg.sender 的回退函数。
        msg.sender.call(b);
    }

    function val() public view returns (uint256 v) {
        //使用内联汇编从 SLOT 中读取值并返回
        assembly {
            v := tload(SLOT)
        }
    }
}

contract ReentrancyGuard {

    //locked 是一个私有的布尔变量，用于防止重入攻击。
    bool private locked;

    modifier lock() {
        require(!locked);
        locked = true;
        _;//执行函数体
        locked = false;
    }

    // 35313 gas
    function test() public lock {
        // Ignore call error
        bytes memory b = "";
        msg.sender.call(b);
    }
}

contract ReentrancyGuardTransient {
    //使用内联汇编来防止重入攻击
    bytes32 constant SLOT = 0;

    //revert 与 require 有点相似，不同的是它不进行任何检查，直接就抛出异常。它可以被使用在任何你想要马上抛出异常，状态变量恢复原样的场景。
    modifier lock() {
        assembly {
            if tload(SLOT) { revert(0, 0) }
            tstore(SLOT, 1)
        }
        _;
        assembly {
            tstore(SLOT, 0)
        }
    }

    // 21887 gas
    function test() external lock {
        // Ignore call error
        bytes memory b = "";
        msg.sender.call(b);
    }
}