//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { MyContract } from "../src/MyContract.sol";
import { Test } from "lib/forge-std/src/Test.sol";
import { StdInvariant } from "lib/forge-std/src/StdInvariant.sol";

contract TestMyContract is StdInvariant, Test {
    MyContract public myContract;

    function setUp() public {
        myContract = new MyContract();
        targetContract(address(myContract));
    }

    function testDoStuff(uint256 data) public {
        myContract.doStuff(data);
        assert(myContract.shouldAlwaysBeZero() == 0);
    }

    function invariant_testAlwaysReturnZero() public view {
        assert(myContract.shouldAlwaysBeZero() == 0);
    }
}
