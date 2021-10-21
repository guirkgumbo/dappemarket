// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.6;

import "ds-test/test.sol";

import "./Emarket.sol";

contract EmarketTest is DSTest {
    Emarket emarket;

    function setUp() public {
        emarket = new Emarket();
    }

    function testAddAnItem() public {

        string memory desc_pen = "a pen";
        uint price_pen = 300;
        emarket.addItem(desc_pen, price_pen);

        string memory desc_book = "a book";
        uint price_book = 200;
        emarket.addItem(desc_book, price_book);

        assertTrue(emarket.itemCount() == 2);
    }

    function testGetItem() public {

        string memory desc_pen = "a pen";
        uint price_pen = 300;
        emarket.addItem(desc_pen, price_pen);

        string memory desc;
        uint price;

        (desc, price) = emarket.getItem(1);
        assertTrue(price == 300);
    }

    function testRemoveItem() public {
        string memory desc_pen = "a pen";
        uint price_pen = 300;
        emarket.addItem(desc_pen, price_pen);

        string memory desc_book = "a book";
        uint price_book = 200;
        emarket.addItem(desc_book, price_book);

        assertTrue(emarket.checkItemExisting(1));
        
        emarket.removeItem(1);

        assertTrue(!emarket.checkItemExisting(1));
    }

    function testBuyItem() public {
        string memory desc_pen = "a pen";
        uint price_pen = 300;
        emarket.addItem(desc_pen, price_pen);
        assertTrue(!emarket.checkItemSold(1));

        emarket.buyItem(1);
        assertTrue(emarket.checkItemSold(1));
    }

    function testFail_basic_sanity() public {
        assertTrue(false);
    }

    function test_basic_sanity() public {
        assertTrue(true);
    }
}
