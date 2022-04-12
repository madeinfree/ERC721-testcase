// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.13;

import "solmate/tokens/ERC721.sol";

contract WAGMISolmate is ERC721 {
  uint256 currentTokenId = 0;

  constructor() ERC721("WAGMI", "WAGMI") {}

  function mintTo(address to) public {
    uint256 tokenId = ++currentTokenId;
    _safeMint(to, tokenId);
  }

  function multiMintTo(address to, uint256 amount) public {
    for(uint256 i = 0; i < amount; i++) {
    uint256 tokenId = currentTokenId++;
      _safeMint(to, tokenId);
    }
  }

  function tokenURI(uint256 id) public view virtual override returns (string memory) {
    return "";
  }
}
