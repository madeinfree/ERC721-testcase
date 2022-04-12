// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.13;

import "ds-test/test.sol";
import "../WAGMI721/WAGMI721.sol";

interface CheatCodes {
    function prank(address) external;

    function startPrank(address) external;

    function stopPrank() external;
}

contract WAGMI721Test is DSTest {
    WAGMI721 wagmi;
    CheatCodes cheats = CheatCodes(HEVM_ADDRESS);

    function setUp() public {
        wagmi = new WAGMI721();
        wagmi.multiMintTo(address(0x00a329c0648769A73afAc7F9381E08FB43dBEA72), 1000);
    }

    function testMint() public {
        wagmi.mintTo(tx.origin);
    }

    function testMultiMint() public {
        wagmi.multiMintTo(tx.origin, 10);
    }

    function testBalanceOf() public {
        wagmi.multiMintTo(tx.origin, 3);
        assertEq(wagmi.balanceOf(tx.origin), 1003);
    }

    function testOwnerOf() public {
        wagmi.multiMintTo(tx.origin, 3);
        assertEq(wagmi.ownerOf(2), tx.origin);
    }

    function testSafeTransferFrom() public {
        cheats.prank(address(tx.origin));
        wagmi.safeTransferFrom(tx.origin, address(0x1337), 888);
    }

    // function testTokenOfOwnerByIndex() public {
    //     wagmi.multiMintTo(tx.origin, 1);
    //     wagmi.multiMintTo(address(0x1337), 2);
    //     wagmi.multiMintTo(tx.origin, 3);
    //     wagmi.tokenOfOwnerByIndex(address(tx.origin), 1);
    //     wagmi.tokenByIndex(1);
    // }
}
