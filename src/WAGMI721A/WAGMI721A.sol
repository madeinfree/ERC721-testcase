// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.13;

import "ERC721A/ERC721A.sol";

contract WAGMI721A is ERC721A {

  uint256 currentTokenId = 0;

  constructor() ERC721A("WAGMI", "WAGMI") {}

  function mintTo(address to) public {
    _safeMint(to, 1);
  }

  function multiMintTo(address to, uint256 amount) public {
    _safeMint(to, amount);
  }
}
