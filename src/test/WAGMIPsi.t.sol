// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.13;

import "ds-test/test.sol";
import "../WAGMIPsi/WAGMIPsi.sol";

interface CheatCodes {
    function prank(address) external;

    function startPrank(address) external;

    function stopPrank() external;
}

contract WAGMITest is DSTest {
    WAGMIPsi wagmi;

    CheatCodes cheats = CheatCodes(HEVM_ADDRESS);

    function setUp() public {
        wagmi = new WAGMIPsi();
        wagmi.multiMintTo(address(0x00a329c0648769A73afAc7F9381E08FB43dBEA72), 1000);
    }

    function testMint() public {
        wagmi.mintTo(tx.origin);
    }

    function testMultiMint() public {
        wagmi.multiMintTo(tx.origin, 2);
    }

    function testBalanceOf() public {
        wagmi.multiMintTo(tx.origin, 3);
        assertEq(wagmi.balanceOf(tx.origin), 1003);
    }

    function testApprove() public {
        cheats.prank(address(0x00a329c0648769A73afAc7F9381E08FB43dBEA72));
        wagmi.approve(address(0x1337), 610);
    }

    function testOwnerOf() public {
        wagmi.multiMintTo(tx.origin, 3);
        assertEq(wagmi.ownerOf(2), tx.origin);
    }

    function testTokenOfOwnerByIndex() public {
        wagmi.tokenOfOwnerByIndex(address(0x00a329c0648769A73afAc7F9381E08FB43dBEA72), 600);
    }

    function testSafeTransferFrom() public { 
        cheats.prank(address(tx.origin));
        wagmi.safeTransferFrom(tx.origin, address(0x1337), 888);
    }
}
