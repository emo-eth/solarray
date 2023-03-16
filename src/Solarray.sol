// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

library Solarray {
    function uint8s(uint8 a) internal pure returns (uint8[] memory) {
        uint8[] memory arr = new uint8[](1);
        arr[0] = a;
        return arr;
    }

    function uint8s(uint8 a, uint8 b) internal pure returns (uint8[] memory) {
        uint8[] memory arr = new uint8[](2);
        arr[0] = a;
        arr[1] = b;
        return arr;
    }

    function uint8s(uint8 a, uint8 b, uint8 c) internal pure returns (uint8[] memory) {
        uint8[] memory arr = new uint8[](3);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        return arr;
    }

    function uint8s(uint8 a, uint8 b, uint8 c, uint8 d) internal pure returns (uint8[] memory) {
        uint8[] memory arr = new uint8[](4);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        return arr;
    }

    function uint8s(uint8 a, uint8 b, uint8 c, uint8 d, uint8 e) internal pure returns (uint8[] memory) {
        uint8[] memory arr = new uint8[](5);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        return arr;
    }

    function uint8s(uint8 a, uint8 b, uint8 c, uint8 d, uint8 e, uint8 f) internal pure returns (uint8[] memory) {
        uint8[] memory arr = new uint8[](6);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        arr[5] = f;
        return arr;
    }

    function uint8s(uint8 a, uint8 b, uint8 c, uint8 d, uint8 e, uint8 f, uint8 g)
        internal
        pure
        returns (uint8[] memory)
    {
        uint8[] memory arr = new uint8[](7);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        arr[5] = f;
        arr[6] = g;
        return arr;
    }

    function extend(uint8[] memory arr1, uint8[] memory arr2) internal pure returns (uint8[] memory newArr) {
        uint256 length1 = arr1.length;
        uint256 length2 = arr2.length;
        newArr = new uint8[](length1+ length2);
        for (uint256 i = 0; i < length1;) {
            newArr[i] = arr1[i];
            unchecked {
                ++i;
            }
        }
        for (uint256 i = 0; i < arr2.length;) {
            uint256 j;
            unchecked {
                j = i + length1;
            }
            newArr[j] = arr2[i];
            unchecked {
                ++i;
            }
        }
    }

    function allocateUint8s(uint256 length) internal pure returns (uint8[] memory arr) {
        arr = new uint8[](length);
        assembly {
            mstore(arr, 0)
        }
    }

    function append(uint8[] memory arr, uint8 value) internal pure returns (uint8[] memory newArr) {
        uint256 length = arr.length;
        newArr = new uint8[](length + 1);
        newArr[length] = value;
        for (uint256 i = 0; i < length;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function appendUnsafe(uint8[] memory arr, uint8 value) internal pure returns (uint8[] memory modifiedArr) {
        uint256 length = arr.length;
        modifiedArr = arr;
        assembly {
            mstore(modifiedArr, add(length, 1))
            mstore(add(modifiedArr, shl(5, add(length, 1))), value)
        }
    }

    function uint16s(uint16 a) internal pure returns (uint16[] memory) {
        uint16[] memory arr = new uint16[](1);
        arr[0] = a;
        return arr;
    }

    function uint16s(uint16 a, uint16 b) internal pure returns (uint16[] memory) {
        uint16[] memory arr = new uint16[](2);
        arr[0] = a;
        arr[1] = b;
        return arr;
    }

    function uint16s(uint16 a, uint16 b, uint16 c) internal pure returns (uint16[] memory) {
        uint16[] memory arr = new uint16[](3);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        return arr;
    }

    function uint16s(uint16 a, uint16 b, uint16 c, uint16 d) internal pure returns (uint16[] memory) {
        uint16[] memory arr = new uint16[](4);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        return arr;
    }

    function uint16s(uint16 a, uint16 b, uint16 c, uint16 d, uint16 e) internal pure returns (uint16[] memory) {
        uint16[] memory arr = new uint16[](5);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        return arr;
    }

    function uint16s(uint16 a, uint16 b, uint16 c, uint16 d, uint16 e, uint16 f)
        internal
        pure
        returns (uint16[] memory)
    {
        uint16[] memory arr = new uint16[](6);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        arr[5] = f;
        return arr;
    }

    function uint16s(uint16 a, uint16 b, uint16 c, uint16 d, uint16 e, uint16 f, uint16 g)
        internal
        pure
        returns (uint16[] memory)
    {
        uint16[] memory arr = new uint16[](7);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        arr[5] = f;
        arr[6] = g;
        return arr;
    }

    function extend(uint16[] memory arr1, uint16[] memory arr2) internal pure returns (uint16[] memory newArr) {
        uint256 length1 = arr1.length;
        uint256 length2 = arr2.length;
        newArr = new uint16[](length1+ length2);
        for (uint256 i = 0; i < length1;) {
            newArr[i] = arr1[i];
            unchecked {
                ++i;
            }
        }
        for (uint256 i = 0; i < arr2.length;) {
            uint256 j;
            unchecked {
                j = i + length1;
            }
            newArr[j] = arr2[i];
            unchecked {
                ++i;
            }
        }
    }

    function allocateUint16s(uint256 length) internal pure returns (uint16[] memory arr) {
        arr = new uint16[](length);
        assembly {
            mstore(arr, 0)
        }
    }

    function append(uint16[] memory arr, uint16 value) internal pure returns (uint16[] memory newArr) {
        uint256 length = arr.length;
        newArr = new uint16[](length + 1);
        newArr[length] = value;
        for (uint256 i = 0; i < length;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function appendUnsafe(uint16[] memory arr, uint16 value) internal pure returns (uint16[] memory modifiedArr) {
        uint256 length = arr.length;
        modifiedArr = arr;
        assembly {
            mstore(modifiedArr, add(length, 1))
            mstore(add(modifiedArr, shl(5, add(length, 1))), value)
        }
    }

    function uint32s(uint32 a) internal pure returns (uint32[] memory) {
        uint32[] memory arr = new uint32[](1);
        arr[0] = a;
        return arr;
    }

    function uint32s(uint32 a, uint32 b) internal pure returns (uint32[] memory) {
        uint32[] memory arr = new uint32[](2);
        arr[0] = a;
        arr[1] = b;
        return arr;
    }

    function uint32s(uint32 a, uint32 b, uint32 c) internal pure returns (uint32[] memory) {
        uint32[] memory arr = new uint32[](3);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        return arr;
    }

    function uint32s(uint32 a, uint32 b, uint32 c, uint32 d) internal pure returns (uint32[] memory) {
        uint32[] memory arr = new uint32[](4);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        return arr;
    }

    function uint32s(uint32 a, uint32 b, uint32 c, uint32 d, uint32 e) internal pure returns (uint32[] memory) {
        uint32[] memory arr = new uint32[](5);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        return arr;
    }

    function uint32s(uint32 a, uint32 b, uint32 c, uint32 d, uint32 e, uint32 f)
        internal
        pure
        returns (uint32[] memory)
    {
        uint32[] memory arr = new uint32[](6);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        arr[5] = f;
        return arr;
    }

    function uint32s(uint32 a, uint32 b, uint32 c, uint32 d, uint32 e, uint32 f, uint32 g)
        internal
        pure
        returns (uint32[] memory)
    {
        uint32[] memory arr = new uint32[](7);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        arr[5] = f;
        arr[6] = g;
        return arr;
    }

    function extend(uint32[] memory arr1, uint32[] memory arr2) internal pure returns (uint32[] memory newArr) {
        uint256 length1 = arr1.length;
        uint256 length2 = arr2.length;
        newArr = new uint32[](length1+ length2);
        for (uint256 i = 0; i < length1;) {
            newArr[i] = arr1[i];
            unchecked {
                ++i;
            }
        }
        for (uint256 i = 0; i < arr2.length;) {
            uint256 j;
            unchecked {
                j = i + length1;
            }
            newArr[j] = arr2[i];
            unchecked {
                ++i;
            }
        }
    }

    function allocateUint32s(uint256 length) internal pure returns (uint32[] memory arr) {
        arr = new uint32[](length);
        assembly {
            mstore(arr, 0)
        }
    }

    function append(uint32[] memory arr, uint32 value) internal pure returns (uint32[] memory newArr) {
        uint256 length = arr.length;
        newArr = new uint32[](length + 1);
        newArr[length] = value;
        for (uint256 i = 0; i < length;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function appendUnsafe(uint32[] memory arr, uint32 value) internal pure returns (uint32[] memory modifiedArr) {
        uint256 length = arr.length;
        modifiedArr = arr;
        assembly {
            mstore(modifiedArr, add(length, 1))
            mstore(add(modifiedArr, shl(5, add(length, 1))), value)
        }
    }

    function uint64s(uint64 a) internal pure returns (uint64[] memory) {
        uint64[] memory arr = new uint64[](1);
        arr[0] = a;
        return arr;
    }

    function uint64s(uint64 a, uint64 b) internal pure returns (uint64[] memory) {
        uint64[] memory arr = new uint64[](2);
        arr[0] = a;
        arr[1] = b;
        return arr;
    }

    function uint64s(uint64 a, uint64 b, uint64 c) internal pure returns (uint64[] memory) {
        uint64[] memory arr = new uint64[](3);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        return arr;
    }

    function uint64s(uint64 a, uint64 b, uint64 c, uint64 d) internal pure returns (uint64[] memory) {
        uint64[] memory arr = new uint64[](4);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        return arr;
    }

    function uint64s(uint64 a, uint64 b, uint64 c, uint64 d, uint64 e) internal pure returns (uint64[] memory) {
        uint64[] memory arr = new uint64[](5);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        return arr;
    }

    function uint64s(uint64 a, uint64 b, uint64 c, uint64 d, uint64 e, uint64 f)
        internal
        pure
        returns (uint64[] memory)
    {
        uint64[] memory arr = new uint64[](6);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        arr[5] = f;
        return arr;
    }

    function uint64s(uint64 a, uint64 b, uint64 c, uint64 d, uint64 e, uint64 f, uint64 g)
        internal
        pure
        returns (uint64[] memory)
    {
        uint64[] memory arr = new uint64[](7);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        arr[5] = f;
        arr[6] = g;
        return arr;
    }

    function extend(uint64[] memory arr1, uint64[] memory arr2) internal pure returns (uint64[] memory newArr) {
        uint256 length1 = arr1.length;
        uint256 length2 = arr2.length;
        newArr = new uint64[](length1+ length2);
        for (uint256 i = 0; i < length1;) {
            newArr[i] = arr1[i];
            unchecked {
                ++i;
            }
        }
        for (uint256 i = 0; i < arr2.length;) {
            uint256 j;
            unchecked {
                j = i + length1;
            }
            newArr[j] = arr2[i];
            unchecked {
                ++i;
            }
        }
    }

    function allocateUint64s(uint256 length) internal pure returns (uint64[] memory arr) {
        arr = new uint64[](length);
        assembly {
            mstore(arr, 0)
        }
    }

    function append(uint64[] memory arr, uint64 value) internal pure returns (uint64[] memory newArr) {
        uint256 length = arr.length;
        newArr = new uint64[](length + 1);
        newArr[length] = value;
        for (uint256 i = 0; i < length;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function appendUnsafe(uint64[] memory arr, uint64 value) internal pure returns (uint64[] memory modifiedArr) {
        uint256 length = arr.length;
        modifiedArr = arr;
        assembly {
            mstore(modifiedArr, add(length, 1))
            mstore(add(modifiedArr, shl(5, add(length, 1))), value)
        }
    }

    function uint128s(uint128 a) internal pure returns (uint128[] memory) {
        uint128[] memory arr = new uint128[](1);
        arr[0] = a;
        return arr;
    }

    function uint128s(uint128 a, uint128 b) internal pure returns (uint128[] memory) {
        uint128[] memory arr = new uint128[](2);
        arr[0] = a;
        arr[1] = b;
        return arr;
    }

    function uint128s(uint128 a, uint128 b, uint128 c) internal pure returns (uint128[] memory) {
        uint128[] memory arr = new uint128[](3);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        return arr;
    }

    function uint128s(uint128 a, uint128 b, uint128 c, uint128 d) internal pure returns (uint128[] memory) {
        uint128[] memory arr = new uint128[](4);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        return arr;
    }

    function uint128s(uint128 a, uint128 b, uint128 c, uint128 d, uint128 e) internal pure returns (uint128[] memory) {
        uint128[] memory arr = new uint128[](5);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        return arr;
    }

    function uint128s(uint128 a, uint128 b, uint128 c, uint128 d, uint128 e, uint128 f)
        internal
        pure
        returns (uint128[] memory)
    {
        uint128[] memory arr = new uint128[](6);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        arr[5] = f;
        return arr;
    }

    function uint128s(uint128 a, uint128 b, uint128 c, uint128 d, uint128 e, uint128 f, uint128 g)
        internal
        pure
        returns (uint128[] memory)
    {
        uint128[] memory arr = new uint128[](7);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        arr[5] = f;
        arr[6] = g;
        return arr;
    }

    function extend(uint128[] memory arr1, uint128[] memory arr2) internal pure returns (uint128[] memory newArr) {
        uint256 length1 = arr1.length;
        uint256 length2 = arr2.length;
        newArr = new uint128[](length1+ length2);
        for (uint256 i = 0; i < length1;) {
            newArr[i] = arr1[i];
            unchecked {
                ++i;
            }
        }
        for (uint256 i = 0; i < arr2.length;) {
            uint256 j;
            unchecked {
                j = i + length1;
            }
            newArr[j] = arr2[i];
            unchecked {
                ++i;
            }
        }
    }

    function allocateUint128s(uint256 length) internal pure returns (uint128[] memory arr) {
        arr = new uint128[](length);
        assembly {
            mstore(arr, 0)
        }
    }

    function append(uint128[] memory arr, uint128 value) internal pure returns (uint128[] memory newArr) {
        uint256 length = arr.length;
        newArr = new uint128[](length + 1);
        newArr[length] = value;
        for (uint256 i = 0; i < length;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function appendUnsafe(uint128[] memory arr, uint128 value) internal pure returns (uint128[] memory modifiedArr) {
        uint256 length = arr.length;
        modifiedArr = arr;
        assembly {
            mstore(modifiedArr, add(length, 1))
            mstore(add(modifiedArr, shl(5, add(length, 1))), value)
        }
    }

    function uint256s(uint256 a) internal pure returns (uint256[] memory) {
        uint256[] memory arr = new uint256[](1);
        arr[0] = a;
        return arr;
    }

    function uint256s(uint256 a, uint256 b) internal pure returns (uint256[] memory) {
        uint256[] memory arr = new uint256[](2);
        arr[0] = a;
        arr[1] = b;
        return arr;
    }

    function uint256s(uint256 a, uint256 b, uint256 c) internal pure returns (uint256[] memory) {
        uint256[] memory arr = new uint256[](3);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        return arr;
    }

    function uint256s(uint256 a, uint256 b, uint256 c, uint256 d) internal pure returns (uint256[] memory) {
        uint256[] memory arr = new uint256[](4);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        return arr;
    }

    function uint256s(uint256 a, uint256 b, uint256 c, uint256 d, uint256 e) internal pure returns (uint256[] memory) {
        uint256[] memory arr = new uint256[](5);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        return arr;
    }

    function uint256s(uint256 a, uint256 b, uint256 c, uint256 d, uint256 e, uint256 f)
        internal
        pure
        returns (uint256[] memory)
    {
        uint256[] memory arr = new uint256[](6);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        arr[5] = f;
        return arr;
    }

    function uint256s(uint256 a, uint256 b, uint256 c, uint256 d, uint256 e, uint256 f, uint256 g)
        internal
        pure
        returns (uint256[] memory)
    {
        uint256[] memory arr = new uint256[](7);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        arr[5] = f;
        arr[6] = g;
        return arr;
    }

    function extend(uint256[] memory arr1, uint256[] memory arr2) internal pure returns (uint256[] memory newArr) {
        uint256 length1 = arr1.length;
        uint256 length2 = arr2.length;
        newArr = new uint256[](length1+ length2);
        for (uint256 i = 0; i < length1;) {
            newArr[i] = arr1[i];
            unchecked {
                ++i;
            }
        }
        for (uint256 i = 0; i < arr2.length;) {
            uint256 j;
            unchecked {
                j = i + length1;
            }
            newArr[j] = arr2[i];
            unchecked {
                ++i;
            }
        }
    }

    function allocateUint256s(uint256 length) internal pure returns (uint256[] memory arr) {
        arr = new uint256[](length);
        assembly {
            mstore(arr, 0)
        }
    }

    function append(uint256[] memory arr, uint256 value) internal pure returns (uint256[] memory newArr) {
        uint256 length = arr.length;
        newArr = new uint256[](length + 1);
        newArr[length] = value;
        for (uint256 i = 0; i < length;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function appendUnsafe(uint256[] memory arr, uint256 value) internal pure returns (uint256[] memory modifiedArr) {
        uint256 length = arr.length;
        modifiedArr = arr;
        assembly {
            mstore(modifiedArr, add(length, 1))
            mstore(add(modifiedArr, shl(5, add(length, 1))), value)
        }
    }

    function int8s(int8 a) internal pure returns (int8[] memory) {
        int8[] memory arr = new int8[](1);
        arr[0] = a;
        return arr;
    }

    function int8s(int8 a, int8 b) internal pure returns (int8[] memory) {
        int8[] memory arr = new int8[](2);
        arr[0] = a;
        arr[1] = b;
        return arr;
    }

    function int8s(int8 a, int8 b, int8 c) internal pure returns (int8[] memory) {
        int8[] memory arr = new int8[](3);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        return arr;
    }

    function int8s(int8 a, int8 b, int8 c, int8 d) internal pure returns (int8[] memory) {
        int8[] memory arr = new int8[](4);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        return arr;
    }

    function int8s(int8 a, int8 b, int8 c, int8 d, int8 e) internal pure returns (int8[] memory) {
        int8[] memory arr = new int8[](5);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        return arr;
    }

    function int8s(int8 a, int8 b, int8 c, int8 d, int8 e, int8 f) internal pure returns (int8[] memory) {
        int8[] memory arr = new int8[](6);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        arr[5] = f;
        return arr;
    }

    function int8s(int8 a, int8 b, int8 c, int8 d, int8 e, int8 f, int8 g) internal pure returns (int8[] memory) {
        int8[] memory arr = new int8[](7);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        arr[5] = f;
        arr[6] = g;
        return arr;
    }

    function extend(int8[] memory arr1, int8[] memory arr2) internal pure returns (int8[] memory newArr) {
        uint256 length1 = arr1.length;
        uint256 length2 = arr2.length;
        newArr = new int8[](length1+ length2);
        for (uint256 i = 0; i < length1;) {
            newArr[i] = arr1[i];
            unchecked {
                ++i;
            }
        }
        for (uint256 i = 0; i < arr2.length;) {
            uint256 j;
            unchecked {
                j = i + length1;
            }
            newArr[j] = arr2[i];
            unchecked {
                ++i;
            }
        }
    }

    function allocateInt8s(uint256 length) internal pure returns (int8[] memory arr) {
        arr = new int8[](length);
        assembly {
            mstore(arr, 0)
        }
    }

    function append(int8[] memory arr, int8 value) internal pure returns (int8[] memory newArr) {
        uint256 length = arr.length;
        newArr = new int8[](length + 1);
        newArr[length] = value;
        for (uint256 i = 0; i < length;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function appendUnsafe(int8[] memory arr, int8 value) internal pure returns (int8[] memory modifiedArr) {
        uint256 length = arr.length;
        modifiedArr = arr;
        assembly {
            mstore(modifiedArr, add(length, 1))
            mstore(add(modifiedArr, shl(5, add(length, 1))), value)
        }
    }

    function int16s(int16 a) internal pure returns (int16[] memory) {
        int16[] memory arr = new int16[](1);
        arr[0] = a;
        return arr;
    }

    function int16s(int16 a, int16 b) internal pure returns (int16[] memory) {
        int16[] memory arr = new int16[](2);
        arr[0] = a;
        arr[1] = b;
        return arr;
    }

    function int16s(int16 a, int16 b, int16 c) internal pure returns (int16[] memory) {
        int16[] memory arr = new int16[](3);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        return arr;
    }

    function int16s(int16 a, int16 b, int16 c, int16 d) internal pure returns (int16[] memory) {
        int16[] memory arr = new int16[](4);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        return arr;
    }

    function int16s(int16 a, int16 b, int16 c, int16 d, int16 e) internal pure returns (int16[] memory) {
        int16[] memory arr = new int16[](5);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        return arr;
    }

    function int16s(int16 a, int16 b, int16 c, int16 d, int16 e, int16 f) internal pure returns (int16[] memory) {
        int16[] memory arr = new int16[](6);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        arr[5] = f;
        return arr;
    }

    function int16s(int16 a, int16 b, int16 c, int16 d, int16 e, int16 f, int16 g)
        internal
        pure
        returns (int16[] memory)
    {
        int16[] memory arr = new int16[](7);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        arr[5] = f;
        arr[6] = g;
        return arr;
    }

    function extend(int16[] memory arr1, int16[] memory arr2) internal pure returns (int16[] memory newArr) {
        uint256 length1 = arr1.length;
        uint256 length2 = arr2.length;
        newArr = new int16[](length1+ length2);
        for (uint256 i = 0; i < length1;) {
            newArr[i] = arr1[i];
            unchecked {
                ++i;
            }
        }
        for (uint256 i = 0; i < arr2.length;) {
            uint256 j;
            unchecked {
                j = i + length1;
            }
            newArr[j] = arr2[i];
            unchecked {
                ++i;
            }
        }
    }

    function allocateInt16s(uint256 length) internal pure returns (int16[] memory arr) {
        arr = new int16[](length);
        assembly {
            mstore(arr, 0)
        }
    }

    function append(int16[] memory arr, int16 value) internal pure returns (int16[] memory newArr) {
        uint256 length = arr.length;
        newArr = new int16[](length + 1);
        newArr[length] = value;
        for (uint256 i = 0; i < length;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function appendUnsafe(int16[] memory arr, int16 value) internal pure returns (int16[] memory modifiedArr) {
        uint256 length = arr.length;
        modifiedArr = arr;
        assembly {
            mstore(modifiedArr, add(length, 1))
            mstore(add(modifiedArr, shl(5, add(length, 1))), value)
        }
    }

    function int32s(int32 a) internal pure returns (int32[] memory) {
        int32[] memory arr = new int32[](1);
        arr[0] = a;
        return arr;
    }

    function int32s(int32 a, int32 b) internal pure returns (int32[] memory) {
        int32[] memory arr = new int32[](2);
        arr[0] = a;
        arr[1] = b;
        return arr;
    }

    function int32s(int32 a, int32 b, int32 c) internal pure returns (int32[] memory) {
        int32[] memory arr = new int32[](3);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        return arr;
    }

    function int32s(int32 a, int32 b, int32 c, int32 d) internal pure returns (int32[] memory) {
        int32[] memory arr = new int32[](4);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        return arr;
    }

    function int32s(int32 a, int32 b, int32 c, int32 d, int32 e) internal pure returns (int32[] memory) {
        int32[] memory arr = new int32[](5);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        return arr;
    }

    function int32s(int32 a, int32 b, int32 c, int32 d, int32 e, int32 f) internal pure returns (int32[] memory) {
        int32[] memory arr = new int32[](6);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        arr[5] = f;
        return arr;
    }

    function int32s(int32 a, int32 b, int32 c, int32 d, int32 e, int32 f, int32 g)
        internal
        pure
        returns (int32[] memory)
    {
        int32[] memory arr = new int32[](7);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        arr[5] = f;
        arr[6] = g;
        return arr;
    }

    function extend(int32[] memory arr1, int32[] memory arr2) internal pure returns (int32[] memory newArr) {
        uint256 length1 = arr1.length;
        uint256 length2 = arr2.length;
        newArr = new int32[](length1+ length2);
        for (uint256 i = 0; i < length1;) {
            newArr[i] = arr1[i];
            unchecked {
                ++i;
            }
        }
        for (uint256 i = 0; i < arr2.length;) {
            uint256 j;
            unchecked {
                j = i + length1;
            }
            newArr[j] = arr2[i];
            unchecked {
                ++i;
            }
        }
    }

    function allocateInt32s(uint256 length) internal pure returns (int32[] memory arr) {
        arr = new int32[](length);
        assembly {
            mstore(arr, 0)
        }
    }

    function append(int32[] memory arr, int32 value) internal pure returns (int32[] memory newArr) {
        uint256 length = arr.length;
        newArr = new int32[](length + 1);
        newArr[length] = value;
        for (uint256 i = 0; i < length;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function appendUnsafe(int32[] memory arr, int32 value) internal pure returns (int32[] memory modifiedArr) {
        uint256 length = arr.length;
        modifiedArr = arr;
        assembly {
            mstore(modifiedArr, add(length, 1))
            mstore(add(modifiedArr, shl(5, add(length, 1))), value)
        }
    }

    function int64s(int64 a) internal pure returns (int64[] memory) {
        int64[] memory arr = new int64[](1);
        arr[0] = a;
        return arr;
    }

    function int64s(int64 a, int64 b) internal pure returns (int64[] memory) {
        int64[] memory arr = new int64[](2);
        arr[0] = a;
        arr[1] = b;
        return arr;
    }

    function int64s(int64 a, int64 b, int64 c) internal pure returns (int64[] memory) {
        int64[] memory arr = new int64[](3);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        return arr;
    }

    function int64s(int64 a, int64 b, int64 c, int64 d) internal pure returns (int64[] memory) {
        int64[] memory arr = new int64[](4);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        return arr;
    }

    function int64s(int64 a, int64 b, int64 c, int64 d, int64 e) internal pure returns (int64[] memory) {
        int64[] memory arr = new int64[](5);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        return arr;
    }

    function int64s(int64 a, int64 b, int64 c, int64 d, int64 e, int64 f) internal pure returns (int64[] memory) {
        int64[] memory arr = new int64[](6);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        arr[5] = f;
        return arr;
    }

    function int64s(int64 a, int64 b, int64 c, int64 d, int64 e, int64 f, int64 g)
        internal
        pure
        returns (int64[] memory)
    {
        int64[] memory arr = new int64[](7);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        arr[5] = f;
        arr[6] = g;
        return arr;
    }

    function extend(int64[] memory arr1, int64[] memory arr2) internal pure returns (int64[] memory newArr) {
        uint256 length1 = arr1.length;
        uint256 length2 = arr2.length;
        newArr = new int64[](length1+ length2);
        for (uint256 i = 0; i < length1;) {
            newArr[i] = arr1[i];
            unchecked {
                ++i;
            }
        }
        for (uint256 i = 0; i < arr2.length;) {
            uint256 j;
            unchecked {
                j = i + length1;
            }
            newArr[j] = arr2[i];
            unchecked {
                ++i;
            }
        }
    }

    function allocateInt64s(uint256 length) internal pure returns (int64[] memory arr) {
        arr = new int64[](length);
        assembly {
            mstore(arr, 0)
        }
    }

    function append(int64[] memory arr, int64 value) internal pure returns (int64[] memory newArr) {
        uint256 length = arr.length;
        newArr = new int64[](length + 1);
        newArr[length] = value;
        for (uint256 i = 0; i < length;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function appendUnsafe(int64[] memory arr, int64 value) internal pure returns (int64[] memory modifiedArr) {
        uint256 length = arr.length;
        modifiedArr = arr;
        assembly {
            mstore(modifiedArr, add(length, 1))
            mstore(add(modifiedArr, shl(5, add(length, 1))), value)
        }
    }

    function int128s(int128 a) internal pure returns (int128[] memory) {
        int128[] memory arr = new int128[](1);
        arr[0] = a;
        return arr;
    }

    function int128s(int128 a, int128 b) internal pure returns (int128[] memory) {
        int128[] memory arr = new int128[](2);
        arr[0] = a;
        arr[1] = b;
        return arr;
    }

    function int128s(int128 a, int128 b, int128 c) internal pure returns (int128[] memory) {
        int128[] memory arr = new int128[](3);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        return arr;
    }

    function int128s(int128 a, int128 b, int128 c, int128 d) internal pure returns (int128[] memory) {
        int128[] memory arr = new int128[](4);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        return arr;
    }

    function int128s(int128 a, int128 b, int128 c, int128 d, int128 e) internal pure returns (int128[] memory) {
        int128[] memory arr = new int128[](5);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        return arr;
    }

    function int128s(int128 a, int128 b, int128 c, int128 d, int128 e, int128 f)
        internal
        pure
        returns (int128[] memory)
    {
        int128[] memory arr = new int128[](6);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        arr[5] = f;
        return arr;
    }

    function int128s(int128 a, int128 b, int128 c, int128 d, int128 e, int128 f, int128 g)
        internal
        pure
        returns (int128[] memory)
    {
        int128[] memory arr = new int128[](7);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        arr[5] = f;
        arr[6] = g;
        return arr;
    }

    function extend(int128[] memory arr1, int128[] memory arr2) internal pure returns (int128[] memory newArr) {
        uint256 length1 = arr1.length;
        uint256 length2 = arr2.length;
        newArr = new int128[](length1+ length2);
        for (uint256 i = 0; i < length1;) {
            newArr[i] = arr1[i];
            unchecked {
                ++i;
            }
        }
        for (uint256 i = 0; i < arr2.length;) {
            uint256 j;
            unchecked {
                j = i + length1;
            }
            newArr[j] = arr2[i];
            unchecked {
                ++i;
            }
        }
    }

    function allocateInt128s(uint256 length) internal pure returns (int128[] memory arr) {
        arr = new int128[](length);
        assembly {
            mstore(arr, 0)
        }
    }

    function append(int128[] memory arr, int128 value) internal pure returns (int128[] memory newArr) {
        uint256 length = arr.length;
        newArr = new int128[](length + 1);
        newArr[length] = value;
        for (uint256 i = 0; i < length;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function appendUnsafe(int128[] memory arr, int128 value) internal pure returns (int128[] memory modifiedArr) {
        uint256 length = arr.length;
        modifiedArr = arr;
        assembly {
            mstore(modifiedArr, add(length, 1))
            mstore(add(modifiedArr, shl(5, add(length, 1))), value)
        }
    }

    function int256s(int256 a) internal pure returns (int256[] memory) {
        int256[] memory arr = new int256[](1);
        arr[0] = a;
        return arr;
    }

    function int256s(int256 a, int256 b) internal pure returns (int256[] memory) {
        int256[] memory arr = new int256[](2);
        arr[0] = a;
        arr[1] = b;
        return arr;
    }

    function int256s(int256 a, int256 b, int256 c) internal pure returns (int256[] memory) {
        int256[] memory arr = new int256[](3);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        return arr;
    }

    function int256s(int256 a, int256 b, int256 c, int256 d) internal pure returns (int256[] memory) {
        int256[] memory arr = new int256[](4);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        return arr;
    }

    function int256s(int256 a, int256 b, int256 c, int256 d, int256 e) internal pure returns (int256[] memory) {
        int256[] memory arr = new int256[](5);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        return arr;
    }

    function int256s(int256 a, int256 b, int256 c, int256 d, int256 e, int256 f)
        internal
        pure
        returns (int256[] memory)
    {
        int256[] memory arr = new int256[](6);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        arr[5] = f;
        return arr;
    }

    function int256s(int256 a, int256 b, int256 c, int256 d, int256 e, int256 f, int256 g)
        internal
        pure
        returns (int256[] memory)
    {
        int256[] memory arr = new int256[](7);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        arr[5] = f;
        arr[6] = g;
        return arr;
    }

    function extend(int256[] memory arr1, int256[] memory arr2) internal pure returns (int256[] memory newArr) {
        uint256 length1 = arr1.length;
        uint256 length2 = arr2.length;
        newArr = new int256[](length1+ length2);
        for (uint256 i = 0; i < length1;) {
            newArr[i] = arr1[i];
            unchecked {
                ++i;
            }
        }
        for (uint256 i = 0; i < arr2.length;) {
            uint256 j;
            unchecked {
                j = i + length1;
            }
            newArr[j] = arr2[i];
            unchecked {
                ++i;
            }
        }
    }

    function allocateInt256s(uint256 length) internal pure returns (int256[] memory arr) {
        arr = new int256[](length);
        assembly {
            mstore(arr, 0)
        }
    }

    function append(int256[] memory arr, int256 value) internal pure returns (int256[] memory newArr) {
        uint256 length = arr.length;
        newArr = new int256[](length + 1);
        newArr[length] = value;
        for (uint256 i = 0; i < length;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function appendUnsafe(int256[] memory arr, int256 value) internal pure returns (int256[] memory modifiedArr) {
        uint256 length = arr.length;
        modifiedArr = arr;
        assembly {
            mstore(modifiedArr, add(length, 1))
            mstore(add(modifiedArr, shl(5, add(length, 1))), value)
        }
    }

    function bytes1s(bytes1 a) internal pure returns (bytes1[] memory) {
        bytes1[] memory arr = new bytes1[](1);
        arr[0] = a;
        return arr;
    }

    function bytes1s(bytes1 a, bytes1 b) internal pure returns (bytes1[] memory) {
        bytes1[] memory arr = new bytes1[](2);
        arr[0] = a;
        arr[1] = b;
        return arr;
    }

    function bytes1s(bytes1 a, bytes1 b, bytes1 c) internal pure returns (bytes1[] memory) {
        bytes1[] memory arr = new bytes1[](3);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        return arr;
    }

    function bytes1s(bytes1 a, bytes1 b, bytes1 c, bytes1 d) internal pure returns (bytes1[] memory) {
        bytes1[] memory arr = new bytes1[](4);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        return arr;
    }

    function bytes1s(bytes1 a, bytes1 b, bytes1 c, bytes1 d, bytes1 e) internal pure returns (bytes1[] memory) {
        bytes1[] memory arr = new bytes1[](5);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        return arr;
    }

    function bytes1s(bytes1 a, bytes1 b, bytes1 c, bytes1 d, bytes1 e, bytes1 f)
        internal
        pure
        returns (bytes1[] memory)
    {
        bytes1[] memory arr = new bytes1[](6);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        arr[5] = f;
        return arr;
    }

    function bytes1s(bytes1 a, bytes1 b, bytes1 c, bytes1 d, bytes1 e, bytes1 f, bytes1 g)
        internal
        pure
        returns (bytes1[] memory)
    {
        bytes1[] memory arr = new bytes1[](7);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        arr[5] = f;
        arr[6] = g;
        return arr;
    }

    function extend(bytes1[] memory arr1, bytes1[] memory arr2) internal pure returns (bytes1[] memory newArr) {
        uint256 length1 = arr1.length;
        uint256 length2 = arr2.length;
        newArr = new bytes1[](length1+ length2);
        for (uint256 i = 0; i < length1;) {
            newArr[i] = arr1[i];
            unchecked {
                ++i;
            }
        }
        for (uint256 i = 0; i < arr2.length;) {
            uint256 j;
            unchecked {
                j = i + length1;
            }
            newArr[j] = arr2[i];
            unchecked {
                ++i;
            }
        }
    }

    function allocateBytes1s(uint256 length) internal pure returns (bytes1[] memory arr) {
        arr = new bytes1[](length);
        assembly {
            mstore(arr, 0)
        }
    }

    function append(bytes1[] memory arr, bytes1 value) internal pure returns (bytes1[] memory newArr) {
        uint256 length = arr.length;
        newArr = new bytes1[](length + 1);
        newArr[length] = value;
        for (uint256 i = 0; i < length;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function appendUnsafe(bytes1[] memory arr, bytes1 value) internal pure returns (bytes1[] memory modifiedArr) {
        uint256 length = arr.length;
        modifiedArr = arr;
        assembly {
            mstore(modifiedArr, add(length, 1))
            mstore(add(modifiedArr, shl(5, add(length, 1))), value)
        }
    }

    function bytes4s(bytes4 a) internal pure returns (bytes4[] memory) {
        bytes4[] memory arr = new bytes4[](1);
        arr[0] = a;
        return arr;
    }

    function bytes4s(bytes4 a, bytes4 b) internal pure returns (bytes4[] memory) {
        bytes4[] memory arr = new bytes4[](2);
        arr[0] = a;
        arr[1] = b;
        return arr;
    }

    function bytes4s(bytes4 a, bytes4 b, bytes4 c) internal pure returns (bytes4[] memory) {
        bytes4[] memory arr = new bytes4[](3);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        return arr;
    }

    function bytes4s(bytes4 a, bytes4 b, bytes4 c, bytes4 d) internal pure returns (bytes4[] memory) {
        bytes4[] memory arr = new bytes4[](4);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        return arr;
    }

    function bytes4s(bytes4 a, bytes4 b, bytes4 c, bytes4 d, bytes4 e) internal pure returns (bytes4[] memory) {
        bytes4[] memory arr = new bytes4[](5);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        return arr;
    }

    function bytes4s(bytes4 a, bytes4 b, bytes4 c, bytes4 d, bytes4 e, bytes4 f)
        internal
        pure
        returns (bytes4[] memory)
    {
        bytes4[] memory arr = new bytes4[](6);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        arr[5] = f;
        return arr;
    }

    function bytes4s(bytes4 a, bytes4 b, bytes4 c, bytes4 d, bytes4 e, bytes4 f, bytes4 g)
        internal
        pure
        returns (bytes4[] memory)
    {
        bytes4[] memory arr = new bytes4[](7);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        arr[5] = f;
        arr[6] = g;
        return arr;
    }

    function extend(bytes4[] memory arr1, bytes4[] memory arr2) internal pure returns (bytes4[] memory newArr) {
        uint256 length1 = arr1.length;
        uint256 length2 = arr2.length;
        newArr = new bytes4[](length1+ length2);
        for (uint256 i = 0; i < length1;) {
            newArr[i] = arr1[i];
            unchecked {
                ++i;
            }
        }
        for (uint256 i = 0; i < arr2.length;) {
            uint256 j;
            unchecked {
                j = i + length1;
            }
            newArr[j] = arr2[i];
            unchecked {
                ++i;
            }
        }
    }

    function allocateBytes4s(uint256 length) internal pure returns (bytes4[] memory arr) {
        arr = new bytes4[](length);
        assembly {
            mstore(arr, 0)
        }
    }

    function append(bytes4[] memory arr, bytes4 value) internal pure returns (bytes4[] memory newArr) {
        uint256 length = arr.length;
        newArr = new bytes4[](length + 1);
        newArr[length] = value;
        for (uint256 i = 0; i < length;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function appendUnsafe(bytes4[] memory arr, bytes4 value) internal pure returns (bytes4[] memory modifiedArr) {
        uint256 length = arr.length;
        modifiedArr = arr;
        assembly {
            mstore(modifiedArr, add(length, 1))
            mstore(add(modifiedArr, shl(5, add(length, 1))), value)
        }
    }

    function bytes8s(bytes8 a) internal pure returns (bytes8[] memory) {
        bytes8[] memory arr = new bytes8[](1);
        arr[0] = a;
        return arr;
    }

    function bytes8s(bytes8 a, bytes8 b) internal pure returns (bytes8[] memory) {
        bytes8[] memory arr = new bytes8[](2);
        arr[0] = a;
        arr[1] = b;
        return arr;
    }

    function bytes8s(bytes8 a, bytes8 b, bytes8 c) internal pure returns (bytes8[] memory) {
        bytes8[] memory arr = new bytes8[](3);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        return arr;
    }

    function bytes8s(bytes8 a, bytes8 b, bytes8 c, bytes8 d) internal pure returns (bytes8[] memory) {
        bytes8[] memory arr = new bytes8[](4);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        return arr;
    }

    function bytes8s(bytes8 a, bytes8 b, bytes8 c, bytes8 d, bytes8 e) internal pure returns (bytes8[] memory) {
        bytes8[] memory arr = new bytes8[](5);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        return arr;
    }

    function bytes8s(bytes8 a, bytes8 b, bytes8 c, bytes8 d, bytes8 e, bytes8 f)
        internal
        pure
        returns (bytes8[] memory)
    {
        bytes8[] memory arr = new bytes8[](6);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        arr[5] = f;
        return arr;
    }

    function bytes8s(bytes8 a, bytes8 b, bytes8 c, bytes8 d, bytes8 e, bytes8 f, bytes8 g)
        internal
        pure
        returns (bytes8[] memory)
    {
        bytes8[] memory arr = new bytes8[](7);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        arr[5] = f;
        arr[6] = g;
        return arr;
    }

    function extend(bytes8[] memory arr1, bytes8[] memory arr2) internal pure returns (bytes8[] memory newArr) {
        uint256 length1 = arr1.length;
        uint256 length2 = arr2.length;
        newArr = new bytes8[](length1+ length2);
        for (uint256 i = 0; i < length1;) {
            newArr[i] = arr1[i];
            unchecked {
                ++i;
            }
        }
        for (uint256 i = 0; i < arr2.length;) {
            uint256 j;
            unchecked {
                j = i + length1;
            }
            newArr[j] = arr2[i];
            unchecked {
                ++i;
            }
        }
    }

    function allocateBytes8s(uint256 length) internal pure returns (bytes8[] memory arr) {
        arr = new bytes8[](length);
        assembly {
            mstore(arr, 0)
        }
    }

    function append(bytes8[] memory arr, bytes8 value) internal pure returns (bytes8[] memory newArr) {
        uint256 length = arr.length;
        newArr = new bytes8[](length + 1);
        newArr[length] = value;
        for (uint256 i = 0; i < length;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function appendUnsafe(bytes8[] memory arr, bytes8 value) internal pure returns (bytes8[] memory modifiedArr) {
        uint256 length = arr.length;
        modifiedArr = arr;
        assembly {
            mstore(modifiedArr, add(length, 1))
            mstore(add(modifiedArr, shl(5, add(length, 1))), value)
        }
    }

    function bytes20s(bytes20 a) internal pure returns (bytes20[] memory) {
        bytes20[] memory arr = new bytes20[](1);
        arr[0] = a;
        return arr;
    }

    function bytes20s(bytes20 a, bytes20 b) internal pure returns (bytes20[] memory) {
        bytes20[] memory arr = new bytes20[](2);
        arr[0] = a;
        arr[1] = b;
        return arr;
    }

    function bytes20s(bytes20 a, bytes20 b, bytes20 c) internal pure returns (bytes20[] memory) {
        bytes20[] memory arr = new bytes20[](3);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        return arr;
    }

    function bytes20s(bytes20 a, bytes20 b, bytes20 c, bytes20 d) internal pure returns (bytes20[] memory) {
        bytes20[] memory arr = new bytes20[](4);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        return arr;
    }

    function bytes20s(bytes20 a, bytes20 b, bytes20 c, bytes20 d, bytes20 e) internal pure returns (bytes20[] memory) {
        bytes20[] memory arr = new bytes20[](5);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        return arr;
    }

    function bytes20s(bytes20 a, bytes20 b, bytes20 c, bytes20 d, bytes20 e, bytes20 f)
        internal
        pure
        returns (bytes20[] memory)
    {
        bytes20[] memory arr = new bytes20[](6);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        arr[5] = f;
        return arr;
    }

    function bytes20s(bytes20 a, bytes20 b, bytes20 c, bytes20 d, bytes20 e, bytes20 f, bytes20 g)
        internal
        pure
        returns (bytes20[] memory)
    {
        bytes20[] memory arr = new bytes20[](7);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        arr[5] = f;
        arr[6] = g;
        return arr;
    }

    function extend(bytes20[] memory arr1, bytes20[] memory arr2) internal pure returns (bytes20[] memory newArr) {
        uint256 length1 = arr1.length;
        uint256 length2 = arr2.length;
        newArr = new bytes20[](length1+ length2);
        for (uint256 i = 0; i < length1;) {
            newArr[i] = arr1[i];
            unchecked {
                ++i;
            }
        }
        for (uint256 i = 0; i < arr2.length;) {
            uint256 j;
            unchecked {
                j = i + length1;
            }
            newArr[j] = arr2[i];
            unchecked {
                ++i;
            }
        }
    }

    function allocateBytes20s(uint256 length) internal pure returns (bytes20[] memory arr) {
        arr = new bytes20[](length);
        assembly {
            mstore(arr, 0)
        }
    }

    function append(bytes20[] memory arr, bytes20 value) internal pure returns (bytes20[] memory newArr) {
        uint256 length = arr.length;
        newArr = new bytes20[](length + 1);
        newArr[length] = value;
        for (uint256 i = 0; i < length;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function appendUnsafe(bytes20[] memory arr, bytes20 value) internal pure returns (bytes20[] memory modifiedArr) {
        uint256 length = arr.length;
        modifiedArr = arr;
        assembly {
            mstore(modifiedArr, add(length, 1))
            mstore(add(modifiedArr, shl(5, add(length, 1))), value)
        }
    }

    function bytes32s(bytes32 a) internal pure returns (bytes32[] memory) {
        bytes32[] memory arr = new bytes32[](1);
        arr[0] = a;
        return arr;
    }

    function bytes32s(bytes32 a, bytes32 b) internal pure returns (bytes32[] memory) {
        bytes32[] memory arr = new bytes32[](2);
        arr[0] = a;
        arr[1] = b;
        return arr;
    }

    function bytes32s(bytes32 a, bytes32 b, bytes32 c) internal pure returns (bytes32[] memory) {
        bytes32[] memory arr = new bytes32[](3);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        return arr;
    }

    function bytes32s(bytes32 a, bytes32 b, bytes32 c, bytes32 d) internal pure returns (bytes32[] memory) {
        bytes32[] memory arr = new bytes32[](4);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        return arr;
    }

    function bytes32s(bytes32 a, bytes32 b, bytes32 c, bytes32 d, bytes32 e) internal pure returns (bytes32[] memory) {
        bytes32[] memory arr = new bytes32[](5);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        return arr;
    }

    function bytes32s(bytes32 a, bytes32 b, bytes32 c, bytes32 d, bytes32 e, bytes32 f)
        internal
        pure
        returns (bytes32[] memory)
    {
        bytes32[] memory arr = new bytes32[](6);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        arr[5] = f;
        return arr;
    }

    function bytes32s(bytes32 a, bytes32 b, bytes32 c, bytes32 d, bytes32 e, bytes32 f, bytes32 g)
        internal
        pure
        returns (bytes32[] memory)
    {
        bytes32[] memory arr = new bytes32[](7);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        arr[5] = f;
        arr[6] = g;
        return arr;
    }

    function extend(bytes32[] memory arr1, bytes32[] memory arr2) internal pure returns (bytes32[] memory newArr) {
        uint256 length1 = arr1.length;
        uint256 length2 = arr2.length;
        newArr = new bytes32[](length1+ length2);
        for (uint256 i = 0; i < length1;) {
            newArr[i] = arr1[i];
            unchecked {
                ++i;
            }
        }
        for (uint256 i = 0; i < arr2.length;) {
            uint256 j;
            unchecked {
                j = i + length1;
            }
            newArr[j] = arr2[i];
            unchecked {
                ++i;
            }
        }
    }

    function allocateBytes32s(uint256 length) internal pure returns (bytes32[] memory arr) {
        arr = new bytes32[](length);
        assembly {
            mstore(arr, 0)
        }
    }

    function append(bytes32[] memory arr, bytes32 value) internal pure returns (bytes32[] memory newArr) {
        uint256 length = arr.length;
        newArr = new bytes32[](length + 1);
        newArr[length] = value;
        for (uint256 i = 0; i < length;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function appendUnsafe(bytes32[] memory arr, bytes32 value) internal pure returns (bytes32[] memory modifiedArr) {
        uint256 length = arr.length;
        modifiedArr = arr;
        assembly {
            mstore(modifiedArr, add(length, 1))
            mstore(add(modifiedArr, shl(5, add(length, 1))), value)
        }
    }

    function addresses(address a) internal pure returns (address[] memory) {
        address[] memory arr = new address[](1);
        arr[0] = a;
        return arr;
    }

    function addresses(address a, address b) internal pure returns (address[] memory) {
        address[] memory arr = new address[](2);
        arr[0] = a;
        arr[1] = b;
        return arr;
    }

    function addresses(address a, address b, address c) internal pure returns (address[] memory) {
        address[] memory arr = new address[](3);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        return arr;
    }

    function addresses(address a, address b, address c, address d) internal pure returns (address[] memory) {
        address[] memory arr = new address[](4);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        return arr;
    }

    function addresses(address a, address b, address c, address d, address e)
        internal
        pure
        returns (address[] memory)
    {
        address[] memory arr = new address[](5);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        return arr;
    }

    function addresses(address a, address b, address c, address d, address e, address f)
        internal
        pure
        returns (address[] memory)
    {
        address[] memory arr = new address[](6);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        arr[5] = f;
        return arr;
    }

    function addresses(address a, address b, address c, address d, address e, address f, address g)
        internal
        pure
        returns (address[] memory)
    {
        address[] memory arr = new address[](7);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        arr[5] = f;
        arr[6] = g;
        return arr;
    }

    function extend(address[] memory arr1, address[] memory arr2) internal pure returns (address[] memory newArr) {
        uint256 length1 = arr1.length;
        uint256 length2 = arr2.length;
        newArr = new address[](length1+ length2);
        for (uint256 i = 0; i < length1;) {
            newArr[i] = arr1[i];
            unchecked {
                ++i;
            }
        }
        for (uint256 i = 0; i < arr2.length;) {
            uint256 j;
            unchecked {
                j = i + length1;
            }
            newArr[j] = arr2[i];
            unchecked {
                ++i;
            }
        }
    }

    function allocateAddresses(uint256 length) internal pure returns (address[] memory arr) {
        arr = new address[](length);
        assembly {
            mstore(arr, 0)
        }
    }

    function append(address[] memory arr, address value) internal pure returns (address[] memory newArr) {
        uint256 length = arr.length;
        newArr = new address[](length + 1);
        newArr[length] = value;
        for (uint256 i = 0; i < length;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function appendUnsafe(address[] memory arr, address value) internal pure returns (address[] memory modifiedArr) {
        uint256 length = arr.length;
        modifiedArr = arr;
        assembly {
            mstore(modifiedArr, add(length, 1))
            mstore(add(modifiedArr, shl(5, add(length, 1))), value)
        }
    }

    function bools(bool a) internal pure returns (bool[] memory) {
        bool[] memory arr = new bool[](1);
        arr[0] = a;
        return arr;
    }

    function bools(bool a, bool b) internal pure returns (bool[] memory) {
        bool[] memory arr = new bool[](2);
        arr[0] = a;
        arr[1] = b;
        return arr;
    }

    function bools(bool a, bool b, bool c) internal pure returns (bool[] memory) {
        bool[] memory arr = new bool[](3);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        return arr;
    }

    function bools(bool a, bool b, bool c, bool d) internal pure returns (bool[] memory) {
        bool[] memory arr = new bool[](4);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        return arr;
    }

    function bools(bool a, bool b, bool c, bool d, bool e) internal pure returns (bool[] memory) {
        bool[] memory arr = new bool[](5);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        return arr;
    }

    function bools(bool a, bool b, bool c, bool d, bool e, bool f) internal pure returns (bool[] memory) {
        bool[] memory arr = new bool[](6);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        arr[5] = f;
        return arr;
    }

    function bools(bool a, bool b, bool c, bool d, bool e, bool f, bool g) internal pure returns (bool[] memory) {
        bool[] memory arr = new bool[](7);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        arr[5] = f;
        arr[6] = g;
        return arr;
    }

    function extend(bool[] memory arr1, bool[] memory arr2) internal pure returns (bool[] memory newArr) {
        uint256 length1 = arr1.length;
        uint256 length2 = arr2.length;
        newArr = new bool[](length1+ length2);
        for (uint256 i = 0; i < length1;) {
            newArr[i] = arr1[i];
            unchecked {
                ++i;
            }
        }
        for (uint256 i = 0; i < arr2.length;) {
            uint256 j;
            unchecked {
                j = i + length1;
            }
            newArr[j] = arr2[i];
            unchecked {
                ++i;
            }
        }
    }

    function allocateBools(uint256 length) internal pure returns (bool[] memory arr) {
        arr = new bool[](length);
        assembly {
            mstore(arr, 0)
        }
    }

    function append(bool[] memory arr, bool value) internal pure returns (bool[] memory newArr) {
        uint256 length = arr.length;
        newArr = new bool[](length + 1);
        newArr[length] = value;
        for (uint256 i = 0; i < length;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function appendUnsafe(bool[] memory arr, bool value) internal pure returns (bool[] memory modifiedArr) {
        uint256 length = arr.length;
        modifiedArr = arr;
        assembly {
            mstore(modifiedArr, add(length, 1))
            mstore(add(modifiedArr, shl(5, add(length, 1))), value)
        }
    }

    function bytesArray(bytes memory a) internal pure returns (bytes[] memory) {
        bytes[] memory arr = new bytes[](1);
        arr[0] = a;
        return arr;
    }

    function bytesArray(bytes memory a, bytes memory b) internal pure returns (bytes[] memory) {
        bytes[] memory arr = new bytes[](2);
        arr[0] = a;
        arr[1] = b;
        return arr;
    }

    function bytesArray(bytes memory a, bytes memory b, bytes memory c) internal pure returns (bytes[] memory) {
        bytes[] memory arr = new bytes[](3);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        return arr;
    }

    function bytesArray(bytes memory a, bytes memory b, bytes memory c, bytes memory d)
        internal
        pure
        returns (bytes[] memory)
    {
        bytes[] memory arr = new bytes[](4);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        return arr;
    }

    function bytesArray(bytes memory a, bytes memory b, bytes memory c, bytes memory d, bytes memory e)
        internal
        pure
        returns (bytes[] memory)
    {
        bytes[] memory arr = new bytes[](5);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        return arr;
    }

    function bytesArray(bytes memory a, bytes memory b, bytes memory c, bytes memory d, bytes memory e, bytes memory f)
        internal
        pure
        returns (bytes[] memory)
    {
        bytes[] memory arr = new bytes[](6);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        arr[5] = f;
        return arr;
    }

    function bytesArray(
        bytes memory a,
        bytes memory b,
        bytes memory c,
        bytes memory d,
        bytes memory e,
        bytes memory f,
        bytes memory g
    ) internal pure returns (bytes[] memory) {
        bytes[] memory arr = new bytes[](7);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        arr[5] = f;
        arr[6] = g;
        return arr;
    }

    function extend(bytes[] memory arr1, bytes[] memory arr2) internal pure returns (bytes[] memory newArr) {
        uint256 length1 = arr1.length;
        uint256 length2 = arr2.length;
        newArr = new bytes[](length1+ length2);
        for (uint256 i = 0; i < length1;) {
            newArr[i] = arr1[i];
            unchecked {
                ++i;
            }
        }
        for (uint256 i = 0; i < arr2.length;) {
            uint256 j;
            unchecked {
                j = i + length1;
            }
            newArr[j] = arr2[i];
            unchecked {
                ++i;
            }
        }
    }

    function allocateBytesArray(uint256 length) internal pure returns (bytes[] memory arr) {
        arr = new bytes[](length);
        assembly {
            mstore(arr, 0)
        }
    }

    function append(bytes[] memory arr, bytes memory value) internal pure returns (bytes[] memory newArr) {
        uint256 length = arr.length;
        newArr = new bytes[](length + 1);
        newArr[length] = value;
        for (uint256 i = 0; i < length;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function appendUnsafe(bytes[] memory arr, bytes memory value) internal pure returns (bytes[] memory modifiedArr) {
        uint256 length = arr.length;
        modifiedArr = arr;
        assembly {
            mstore(modifiedArr, add(length, 1))
            mstore(add(modifiedArr, shl(5, add(length, 1))), value)
        }
    }

    function strings(string memory a) internal pure returns (string[] memory) {
        string[] memory arr = new string[](1);
        arr[0] = a;
        return arr;
    }

    function strings(string memory a, string memory b) internal pure returns (string[] memory) {
        string[] memory arr = new string[](2);
        arr[0] = a;
        arr[1] = b;
        return arr;
    }

    function strings(string memory a, string memory b, string memory c) internal pure returns (string[] memory) {
        string[] memory arr = new string[](3);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        return arr;
    }

    function strings(string memory a, string memory b, string memory c, string memory d)
        internal
        pure
        returns (string[] memory)
    {
        string[] memory arr = new string[](4);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        return arr;
    }

    function strings(string memory a, string memory b, string memory c, string memory d, string memory e)
        internal
        pure
        returns (string[] memory)
    {
        string[] memory arr = new string[](5);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        return arr;
    }

    function strings(
        string memory a,
        string memory b,
        string memory c,
        string memory d,
        string memory e,
        string memory f
    ) internal pure returns (string[] memory) {
        string[] memory arr = new string[](6);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        arr[5] = f;
        return arr;
    }

    function strings(
        string memory a,
        string memory b,
        string memory c,
        string memory d,
        string memory e,
        string memory f,
        string memory g
    ) internal pure returns (string[] memory) {
        string[] memory arr = new string[](7);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        arr[5] = f;
        arr[6] = g;
        return arr;
    }

    function extend(string[] memory arr1, string[] memory arr2) internal pure returns (string[] memory newArr) {
        uint256 length1 = arr1.length;
        uint256 length2 = arr2.length;
        newArr = new string[](length1+ length2);
        for (uint256 i = 0; i < length1;) {
            newArr[i] = arr1[i];
            unchecked {
                ++i;
            }
        }
        for (uint256 i = 0; i < arr2.length;) {
            uint256 j;
            unchecked {
                j = i + length1;
            }
            newArr[j] = arr2[i];
            unchecked {
                ++i;
            }
        }
    }

    function allocateStrings(uint256 length) internal pure returns (string[] memory arr) {
        arr = new string[](length);
        assembly {
            mstore(arr, 0)
        }
    }

    function append(string[] memory arr, string memory value) internal pure returns (string[] memory newArr) {
        uint256 length = arr.length;
        newArr = new string[](length + 1);
        newArr[length] = value;
        for (uint256 i = 0; i < length;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function appendUnsafe(string[] memory arr, string memory value)
        internal
        pure
        returns (string[] memory modifiedArr)
    {
        uint256 length = arr.length;
        modifiedArr = arr;
        assembly {
            mstore(modifiedArr, add(length, 1))
            mstore(add(modifiedArr, shl(5, add(length, 1))), value)
        }
    }

    function uints(uint256 a) internal pure returns (uint256[] memory) {
        uint256[] memory arr = new uint[](1);
        arr[0] = a;
        return arr;
    }

    function uints(uint256 a, uint256 b) internal pure returns (uint256[] memory) {
        uint256[] memory arr = new uint[](2);
        arr[0] = a;
        arr[1] = b;
        return arr;
    }

    function uints(uint256 a, uint256 b, uint256 c) internal pure returns (uint256[] memory) {
        uint256[] memory arr = new uint[](3);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        return arr;
    }

    function uints(uint256 a, uint256 b, uint256 c, uint256 d) internal pure returns (uint256[] memory) {
        uint256[] memory arr = new uint[](4);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        return arr;
    }

    function uints(uint256 a, uint256 b, uint256 c, uint256 d, uint256 e) internal pure returns (uint256[] memory) {
        uint256[] memory arr = new uint[](5);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        return arr;
    }

    function uints(uint256 a, uint256 b, uint256 c, uint256 d, uint256 e, uint256 f)
        internal
        pure
        returns (uint256[] memory)
    {
        uint256[] memory arr = new uint[](6);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        arr[5] = f;
        return arr;
    }

    function uints(uint256 a, uint256 b, uint256 c, uint256 d, uint256 e, uint256 f, uint256 g)
        internal
        pure
        returns (uint256[] memory)
    {
        uint256[] memory arr = new uint[](7);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        arr[5] = f;
        arr[6] = g;
        return arr;
    }

    function allocateUints(uint256 length) internal pure returns (uint256[] memory arr) {
        arr = new uint[](length);
        assembly {
            mstore(arr, 0)
        }
    }

    function ints(int256 a) internal pure returns (int256[] memory) {
        int256[] memory arr = new int[](1);
        arr[0] = a;
        return arr;
    }

    function ints(int256 a, int256 b) internal pure returns (int256[] memory) {
        int256[] memory arr = new int[](2);
        arr[0] = a;
        arr[1] = b;
        return arr;
    }

    function ints(int256 a, int256 b, int256 c) internal pure returns (int256[] memory) {
        int256[] memory arr = new int[](3);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        return arr;
    }

    function ints(int256 a, int256 b, int256 c, int256 d) internal pure returns (int256[] memory) {
        int256[] memory arr = new int[](4);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        return arr;
    }

    function ints(int256 a, int256 b, int256 c, int256 d, int256 e) internal pure returns (int256[] memory) {
        int256[] memory arr = new int[](5);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        return arr;
    }

    function ints(int256 a, int256 b, int256 c, int256 d, int256 e, int256 f) internal pure returns (int256[] memory) {
        int256[] memory arr = new int[](6);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        arr[5] = f;
        return arr;
    }

    function ints(int256 a, int256 b, int256 c, int256 d, int256 e, int256 f, int256 g)
        internal
        pure
        returns (int256[] memory)
    {
        int256[] memory arr = new int[](7);
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        arr[5] = f;
        arr[6] = g;
        return arr;
    }

    function allocateInts(uint256 length) internal pure returns (int256[] memory arr) {
        arr = new int[](length);
        assembly {
            mstore(arr, 0)
        }
    }
}
