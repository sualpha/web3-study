// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Enum {

    //Enum representing shipping status ->枚举表示装运状态
     enum Status {
        Pending,
        Shipped,
        Accepted,
        Rejected,
        Canceled
    }

    // Default value is the first element listed in ->默认值是中列出的第一个元素
    // definition of the type, in this case "Pending" ->类型的定义，在本例中为“待定”
    Status public status;

     // Returns uint
    // Pending  - 0
    // Shipped  - 1
    // Accepted - 2
    // Rejected - 3
    // Canceled - 4

     function get() public view returns (Status) {
        return status;
    }

     // Update status by passing uint into input
    function set(Status _status) public {
        status = _status;
    }

     // You can update to a specific enum like this
    function cancel() public {
        status = Status.Canceled;
    }

    // delete resets the enum to its first value, 0 ->delete将枚举重置为其第一个值0
    function reset() public {
        delete status;
    }
}