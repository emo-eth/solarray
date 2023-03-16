// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.6.2 <0.9.0;

import "forge-std/Test.sol";
import "../src/Solarray.sol";

contract SolarrayTest is Test {
    function setUp() public {}

    function testUint8s() public {
        uint8[] memory uint8s = Solarray.uint8s(0, 1, 2);
        assertEq(uint8s.length, 3);
        assertEq(uint8s[0], 0);
        assertEq(uint8s[1], 1);
        assertEq(uint8s[2], 2);
    }

    function testUint256s() public {
        uint256[] memory uint256s = Solarray.uint256s(0, 1, 2);
        assertEq(uint256s.length, 3);
        assertEq(uint256s[0], 0);
        assertEq(uint256s[1], 1);
        assertEq(uint256s[2], 2);
    }

    function testStrings() public {
        string[] memory strings = Solarray.strings("a", "b", "c", "d");
        assertEq(strings.length, 4);
        assertEq(strings[0], "a");
        assertEq(strings[1], "b");
        assertEq(strings[2], "c");
        assertEq(strings[3], "d");
    }

    function testAllocateAndAppendUnsafe() public {
        uint256[] memory uint256s = Solarray.allocateUints(3);
        uint256[] memory idk = new uint256[](3);

        uint256 i = 0;
        assertEmpty(idk, 3);
        assertContainsAscending(uint256s, i);

        i = 1;
        Solarray.appendUnsafe(uint256s, i);
        assertEmpty(idk, 3);
        assertContainsAscending(uint256s, i);

        i = 2;
        Solarray.appendUnsafe(uint256s, i);
        assertEmpty(idk, 3);
        assertContainsAscending(uint256s, i);

        i = 3;
        Solarray.appendUnsafe(uint256s, i);
        assertEmpty(idk, 3);
        assertContainsAscending(uint256s, i);

        i = 4;
        Solarray.appendUnsafe(uint256s, i);
        assertEq(idk.length, 4, "memory should be contaminated");
    }

    function testAppendSafe() public {
        uint256[] memory uint256s;
        uint256[] memory idk = new uint256[](3);

        uint256 i = 0;
        assertEmpty(idk, 3);
        assertContainsAscending(uint256s, i);

        i = 1;
        uint256s = Solarray.append(uint256s, i);
        assertEmpty(idk, 3);
        assertContainsAscending(uint256s, i);

        i = 2;
        uint256s = Solarray.append(uint256s, i);
        assertEmpty(idk, 3);
        assertContainsAscending(uint256s, i);

        i = 3;
        uint256s = Solarray.append(uint256s, i);
        assertEmpty(idk, 3);
        assertContainsAscending(uint256s, i);

        i = 4;
        uint256s = Solarray.append(uint256s, i);
        assertEq(idk.length, 3, "memory should not be contaminated");
        assertContainsAscending(uint256s, i);
    }

    function testExtend() public {
        uint256[] memory a = Solarray.uints(1, 2, 3);
        uint256[] memory b = Solarray.uints(4, 5, 6, 7);
        uint256[] memory c = Solarray.extend(a, b);
        assertContainsAscending(c, 7);
        assertEq(a.length, 3);
        assertEq(b.length, 4);
    }

    function testCopy() public {
        uint256[] memory a = Solarray.uints(1, 2, 3);
        uint256[] memory b = Solarray.copy(a);
        assertContainsAscending(b, 3);
        assertEq(a.length, 3);
        assertEq(b.length, 3);
        bool equal;
        assembly {
            equal := eq(a, b)
        }
        assertEq(equal, false, "memory pointer should be different");
    }

    function testCopyAndResize() public {
        uint256[] memory a = Solarray.uints(1, 2, 3);
        uint256[] memory b = Solarray.copyAndResize(a, 5);
        assertEq(a.length, 3);
        assertEq(b.length, 5);
        bool equal;
        assembly {
            equal := eq(a, b)
        }
        assertEq(equal, false, "memory pointer should be different");

        b = Solarray.copyAndResize(a, 2);
        assertEq(a.length, 3);
        assertEq(b.length, 2);
        assembly {
            equal := eq(a, b)
        }
        assertEq(equal, false, "memory pointer should be different");
        assertContainsAscending(b, 2);
    }

    function testCopyAndAllocate() public {
        uint256[] memory a = Solarray.uints(1, 2, 3);
        uint256[] memory b = Solarray.copyAndAllocate(a, 4);
        uint256[] memory c = Solarray.uints(1, 2, 3);
        assertEq(a.length, 3);
        assertEq(b.length, 3);
        bool equal;
        assembly {
            equal := eq(a, b)
        }
        assertEq(equal, false, "memory pointer should be different");

        b = Solarray.appendUnsafe(b, 4);
        assertEq(a.length, 3);
        assertEq(b.length, 4);
        assertContainsAscending(b, 4);
        b = Solarray.appendUnsafe(b, 5);
        assertEq(a.length, 3);
        assertContainsAscending(b, 5);
        assertEq(c.length, 5, "memory should have been dirtied");
    }

    function testTruncate() public {
        uint256[] memory a = Solarray.uints(1, 2, 3, 4, 5);
        uint256[] memory b = Solarray.truncate(a, 3);
        assertEq(a.length, 3);
        assertEq(b.length, 3);
        assertContainsAscending(b, 3);
        bool equal;
        assembly {
            equal := eq(a, b)
        }
        assertEq(equal, true, "memory pointer should be the same");
    }

    function testPop() public {
        uint256[] memory a = Solarray.uints(1, 2);
        uint256 value = Solarray.pop(a);
        assertEq(a.length, 1, "length should be 1");
        assertEq(value, 2, "value should be 2");
        value = Solarray.popUnsafe(a);
        assertEq(a.length, 0, "length should be 0");
        assertEq(value, 1, "value should be 1");

        vm.expectRevert( /*abi.encodeWithSignature("Panic(uint256)", 0x11)*/ );
        this.extPop(a);
    }

    function testFromFixed() public {
        uint256[3] memory f = [uint256(1), uint256(2), uint256(3)];
        uint256[] memory a = Solarray.fromFixed(f);
        assertContainsAscending(a, 3);
        a = Solarray.fromFixedWithMaxLength(f, 5);
        uint256[] memory b = Solarray.fromFixed(f);
        assertContainsAscending(a, 3);
        assertContainsAscending(b, 3);
        Solarray.appendUnsafe(a, 4);
        Solarray.appendUnsafe(a, 5);
        Solarray.appendUnsafe(a, 6);
        assertContainsAscending(a, 6);
        assertEq(b.length, 6, "memory should have been dirtied");
    }

    function testPopLeft() public {
        uint256[] memory a = Solarray.uints(1, 2);
        uint256 value;
        (a, value) = Solarray.popLeft(a);
        assertEq(a.length, 1, "length should be 1");
        assertEq(value, 1, "value should be 1");
        (a, value) = Solarray.popLeftUnsafe(a);
        assertEq(a.length, 0, "length should be 0");
        assertEq(value, 2, "value should be 2");
        assertEq(a.length, 0, "length should be 0");

        vm.expectRevert( /*abi.encodeWithSignature("Panic(uint256)", 0x11)*/ );
        this.extPopLeft(a);
    }

    function extPop(uint256[] memory arr) external pure returns (uint256[] memory _arr, uint256 value) {
        _arr = arr;
        value = Solarray.pop(_arr);
    }

    function extPopLeft(uint256[] memory arr) external pure returns (uint256[] memory _arr, uint256 value) {
        (_arr, value) = Solarray.popLeft(arr);
    }

    function assertEmpty(uint256[] memory uint256s, uint256 expectedLength) internal {
        assertEq(uint256s.length, expectedLength, "not correct length");
        for (uint256 i = 0; i < uint256s.length; i++) {
            assertEq(uint256s[i], 0, "not empty");
        }
    }

    function assertContainsAscending(uint256[] memory uint256s, uint256 length) internal {
        assertEq(uint256s.length, length, "not correct length");
        for (uint256 i = 0; i < length; i++) {
            assertEq(uint256s[i], i + 1, "not ascending");
        }
    }
}
