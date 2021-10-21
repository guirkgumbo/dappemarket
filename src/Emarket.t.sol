// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.6;

import "ds-test/test.sol";

import "./Emarket.sol";

contract EmarketTest is DSTest {
    Emarket emarket;

    function setUp() public {
        emarket = new Emarket();
    }

    function testFail_basic_sanity() public {
        assertTrue(false);
    }

    function test_basic_sanity() public {
        assertTrue(true);
    }
}
