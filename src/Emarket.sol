// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.6;

contract Emarket {
    struct Item {
        string description;
        address seller;
        address buyer;
        uint price;
        bool sold;
    }

    mapping(uint256=>Item) public items;
    uint256 public itemCount;

    // Called when seller lists an item in the emarket
    // Records description, seller and price
    function addItem(string memory _description, uint _price) public returns(uint) {
        itemCount++;
        items[itemCount].description = _description;
        items[itemCount].seller = msg.sender;
        items[itemCount].price = _price;
        return itemCount;
    }

    // Called when we want detail of an item
    // we will get back the description, price and seller
    function getItem(uint _index) public view returns(string memory, uint){
        Item storage i = items[_index];
        require(i.seller != address(0), "no such item"); // doesnt exists
        return(i.description, i.price);
    }

    // Called when we want to know if an item still exists
    // Should this just be on the getItem???
    function checkItemExisting(uint _index) public view returns (bool) {
        Item storage i = items[_index];
        return (i.seller != address(0));
    }

    // Called to see if the item has already been sold
    function checkItemSold(uint _index) public view returns (bool) {
        Item storage i = items[_index];
        require(i.seller != address(0), "no such item"); // doesnt exists
        return i.sold;
    }

    // Called by the buyer to remove the item from listing
    // Marks as sold
    function removeItem(uint _index) public {
        Item storage i = items[_index];
        require(i.seller != address(0), "no such item");
        require(i.seller == msg.sender, "only seller can remove item");
        require(!i.sold, "item sold already");
        delete items[_index];
    }

    function  buyItem(uint _index) public {
        Item storage i = items[_index];
        require(i.seller != address(0), "no such item");
        require(!i.sold, "item sold already");
        i.buyer = msg.sender;
        i.sold = true;
    }

}
