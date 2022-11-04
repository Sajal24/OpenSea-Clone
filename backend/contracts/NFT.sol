// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

//declaring our contract and imports
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

//writing the NFT contract, the `is` here means that we are inheriting from -
contract NFT is ERC721URIStorage {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    //tokenIds with counters.counter will help us in keeping up with the increment of value of unique id for each token

    address contractAddress;

    //contractAddress here means the address of the NFT marketplace with which our NFTs will be able to interact

     //now we will create a constructor which will take the marketplaceAddress as its parameter

     constructor(address marketplaceAddress) ERC721("Metaverse Tokens", "METT") {
        contractAddress = marketplaceAddress;
     }

      //now this function for minting new tokens, and only taking tokenURI as its parameter, as we already have enough metadata available
      
      function createToken(string memory tokenURI) public returns (uint) {
        _tokenIds.increment();
        uint256 newItemId = _tokenIds.current();

        //now minting

        _mint(msg.sender, newItemId);
        _setTokenURI(newItemId, tokenURI);
        setApprovalForAll(contractAddress, true);

        //returing the itemId as it can be used in frontend/client side applications
        return newItemId;
      }
}






