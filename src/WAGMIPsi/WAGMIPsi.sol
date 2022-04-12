// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.13;

import "ERC721Psi/ERC721Psi.sol";

contract WAGMIPsi is ERC721Psi {
  constructor() ERC721Psi("WAGMI", "WAGMI") {}

  function mintTo(address to) public {
    _safeMint(to, 1);
  }

  function multiMintTo(address to, uint256 amount) public {
      _safeMint(to, amount);
  }
}
