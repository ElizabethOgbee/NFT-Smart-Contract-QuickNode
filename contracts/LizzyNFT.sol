// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";

contract LizzyNFT is ERC721Enumerable {
    constructor() ERC721("LizzyNFT", "LT"){}

    uint256 public constant MAX_TOKENS = 25;
    uint256 public constant PRICE = 0.1 ether;

    function mintTokens(uint256 _amountOfTokens) external payable {
    require(totalSupply() + _amountOfTokens <= MAX_TOKENS, "Not enough tokens left to mint.");
    require(msg.value >= _amountOfTokens * PRICE, "Amount of ether sent is not correct.");

    for (uint256 i = 0; i < _amountOfTokens; i++) {
        _safeMint(msg.sender, totalSupply());
    }
}
}