// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

contract NFTMarket is ReentrancyGuard{
    using Counters for Counters.Counter;
    Counters.Counter private _itemIds;
    Counters.Counter private _itemsSold;

    //setting the owner that will be able to get paid (commission) depending on what contract we write - like commission on listings, etc
    address payable owner;

    //here ether means 18 zeros, i.e it is weird to see ether here when we here are working with Polygon and that is MATIC, but it says the it all means the same here
    uint256 listingPrice = 0.025 ether;

    //this constructor says that the owner of this contract is the person deploying it
    constructor() {
        owner = payable(msg.sender);
    }

    //structure for each individual market item

    struct MarketItem {
        uint itemId;
        address nftContract;
        uint256 tokenId;
        address payable seller;
        address payable owner;
        uint256 price;
        bool sold;
    }

    




    

}