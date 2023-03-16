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

    function uint8sWithMaxLength(uint256 maxLength, uint8 a) internal pure returns (uint8[] memory) {
        uint8[] memory arr = new uint8[](maxLength);
        assembly {
            mstore(arr, 1)
        }
        arr[0] = a;
        return arr;
    }

    function uint8sWithMaxLength(uint256 maxLength, uint8 a, uint8 b) internal pure returns (uint8[] memory) {
        uint8[] memory arr = new uint8[](maxLength);
        assembly {
            mstore(arr, 2)
        }
        arr[0] = a;
        arr[1] = b;
        return arr;
    }

    function uint8sWithMaxLength(uint256 maxLength, uint8 a, uint8 b, uint8 c) internal pure returns (uint8[] memory) {
        uint8[] memory arr = new uint8[](maxLength);
        assembly {
            mstore(arr, 3)
        }
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        return arr;
    }

    function uint8sWithMaxLength(uint256 maxLength, uint8 a, uint8 b, uint8 c, uint8 d)
        internal
        pure
        returns (uint8[] memory)
    {
        uint8[] memory arr = new uint8[](maxLength);
        assembly {
            mstore(arr, 4)
        }
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        return arr;
    }

    function uint8sWithMaxLength(uint256 maxLength, uint8 a, uint8 b, uint8 c, uint8 d, uint8 e)
        internal
        pure
        returns (uint8[] memory)
    {
        uint8[] memory arr = new uint8[](maxLength);
        assembly {
            mstore(arr, 5)
        }
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        return arr;
    }

    function uint8sWithMaxLength(uint256 maxLength, uint8 a, uint8 b, uint8 c, uint8 d, uint8 e, uint8 f)
        internal
        pure
        returns (uint8[] memory)
    {
        uint8[] memory arr = new uint8[](maxLength);
        assembly {
            mstore(arr, 6)
        }
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        arr[5] = f;
        return arr;
    }

    function uint8sWithMaxLength(uint256 maxLength, uint8 a, uint8 b, uint8 c, uint8 d, uint8 e, uint8 f, uint8 g)
        internal
        pure
        returns (uint8[] memory)
    {
        uint8[] memory arr = new uint8[](maxLength);
        assembly {
            mstore(arr, 7)
        }
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

    function truncate(uint8[] memory arr, uint256 newLength) internal pure returns (uint8[] memory _arr) {
        // truncate the array
        assembly {
            let oldLength := mload(arr)
            returndatacopy(returndatasize(), returndatasize(), gt(newLength, oldLength))
            mstore(arr, newLength)
            _arr := arr
        }
    }

    function truncateUnsafe(uint8[] memory arr, uint256 newLength) internal pure returns (uint8[] memory _arr) {
        // truncate the array
        assembly {
            mstore(arr, newLength)
            _arr := arr
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

    function copy(uint8[] memory arr) internal pure returns (uint8[] memory newArr) {
        uint256 length = arr.length;
        newArr = new uint8[](length);
        for (uint256 i = 0; i < length;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function copyAndResize(uint8[] memory arr, uint256 newLength) internal pure returns (uint8[] memory newArr) {
        newArr = new uint8[](newLength);
        uint256 length = arr.length;
        // allow shrinking a copy without copying extra members
        length = (length > newLength) ? newLength : length;
        for (uint256 i = 0; i < length;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        // TODO: consider writing 0-pointer to the rest of the array if longer for dynamic elements
    }

    function copyAndAllocate(uint8[] memory arr, uint256 maxLength) internal pure returns (uint8[] memory newArr) {
        newArr = new uint8[](maxLength);
        uint256 originalLength = arr.length;
        for (uint256 i = 0; i < originalLength;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, originalLength)
        }
    }

    function pop(uint8[] memory arr) internal pure returns (uint8 value) {
        assembly {
            let length := mload(arr)
            returndatacopy(returndatasize(), returndatasize(), iszero(length))
            value := mload(add(arr, shl(5, length)))
            mstore(arr, sub(length, 1))
        }
    }

    function popUnsafe(uint8[] memory arr) internal pure returns (uint8 value) {
        // This function is unsafe because it does not check if the array is empty.
        assembly {
            let length := mload(arr)
            value := mload(add(arr, shl(5, length)))
            mstore(arr, sub(length, 1))
        }
    }

    function popLeft(uint8[] memory arr) internal pure returns (uint8[] memory newArr, uint8 value) {
        assembly {
            let length := mload(arr)
            returndatacopy(returndatasize(), returndatasize(), iszero(length))
            value := mload(add(arr, 0x20))
            newArr := add(arr, 0x20)
            mstore(newArr, sub(length, 1))
        }
    }

    function popLeftUnsafe(uint8[] memory arr) internal pure returns (uint8[] memory newArr, uint8 value) {
        // This function is unsafe because it does not check if the array is empty.
        assembly {
            let length := mload(arr)
            value := mload(add(arr, 0x20))
            newArr := add(arr, 0x20)
            mstore(newArr, sub(length, 1))
        }
    }

    function fromFixed(uint8[1] memory arr) internal pure returns (uint8[] memory newArr) {
        newArr = new uint8[](1);
        for (uint256 i = 0; i < 1;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(uint8[1] memory arr, uint256 maxLength)
        internal
        pure
        returns (uint8[] memory newArr)
    {
        newArr = new uint8[](maxLength);
        for (uint256 i = 0; i < 1;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 1)
        }
    }

    function fromFixed(uint8[2] memory arr) internal pure returns (uint8[] memory newArr) {
        newArr = new uint8[](2);
        for (uint256 i = 0; i < 2;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(uint8[2] memory arr, uint256 maxLength)
        internal
        pure
        returns (uint8[] memory newArr)
    {
        newArr = new uint8[](maxLength);
        for (uint256 i = 0; i < 2;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 2)
        }
    }

    function fromFixed(uint8[3] memory arr) internal pure returns (uint8[] memory newArr) {
        newArr = new uint8[](3);
        for (uint256 i = 0; i < 3;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(uint8[3] memory arr, uint256 maxLength)
        internal
        pure
        returns (uint8[] memory newArr)
    {
        newArr = new uint8[](maxLength);
        for (uint256 i = 0; i < 3;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 3)
        }
    }

    function fromFixed(uint8[4] memory arr) internal pure returns (uint8[] memory newArr) {
        newArr = new uint8[](4);
        for (uint256 i = 0; i < 4;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(uint8[4] memory arr, uint256 maxLength)
        internal
        pure
        returns (uint8[] memory newArr)
    {
        newArr = new uint8[](maxLength);
        for (uint256 i = 0; i < 4;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 4)
        }
    }

    function fromFixed(uint8[5] memory arr) internal pure returns (uint8[] memory newArr) {
        newArr = new uint8[](5);
        for (uint256 i = 0; i < 5;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(uint8[5] memory arr, uint256 maxLength)
        internal
        pure
        returns (uint8[] memory newArr)
    {
        newArr = new uint8[](maxLength);
        for (uint256 i = 0; i < 5;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 5)
        }
    }

    function fromFixed(uint8[6] memory arr) internal pure returns (uint8[] memory newArr) {
        newArr = new uint8[](6);
        for (uint256 i = 0; i < 6;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(uint8[6] memory arr, uint256 maxLength)
        internal
        pure
        returns (uint8[] memory newArr)
    {
        newArr = new uint8[](maxLength);
        for (uint256 i = 0; i < 6;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 6)
        }
    }

    function fromFixed(uint8[7] memory arr) internal pure returns (uint8[] memory newArr) {
        newArr = new uint8[](7);
        for (uint256 i = 0; i < 7;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(uint8[7] memory arr, uint256 maxLength)
        internal
        pure
        returns (uint8[] memory newArr)
    {
        newArr = new uint8[](maxLength);
        for (uint256 i = 0; i < 7;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 7)
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

    function uint16sWithMaxLength(uint256 maxLength, uint16 a) internal pure returns (uint16[] memory) {
        uint16[] memory arr = new uint16[](maxLength);
        assembly {
            mstore(arr, 1)
        }
        arr[0] = a;
        return arr;
    }

    function uint16sWithMaxLength(uint256 maxLength, uint16 a, uint16 b) internal pure returns (uint16[] memory) {
        uint16[] memory arr = new uint16[](maxLength);
        assembly {
            mstore(arr, 2)
        }
        arr[0] = a;
        arr[1] = b;
        return arr;
    }

    function uint16sWithMaxLength(uint256 maxLength, uint16 a, uint16 b, uint16 c)
        internal
        pure
        returns (uint16[] memory)
    {
        uint16[] memory arr = new uint16[](maxLength);
        assembly {
            mstore(arr, 3)
        }
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        return arr;
    }

    function uint16sWithMaxLength(uint256 maxLength, uint16 a, uint16 b, uint16 c, uint16 d)
        internal
        pure
        returns (uint16[] memory)
    {
        uint16[] memory arr = new uint16[](maxLength);
        assembly {
            mstore(arr, 4)
        }
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        return arr;
    }

    function uint16sWithMaxLength(uint256 maxLength, uint16 a, uint16 b, uint16 c, uint16 d, uint16 e)
        internal
        pure
        returns (uint16[] memory)
    {
        uint16[] memory arr = new uint16[](maxLength);
        assembly {
            mstore(arr, 5)
        }
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        return arr;
    }

    function uint16sWithMaxLength(uint256 maxLength, uint16 a, uint16 b, uint16 c, uint16 d, uint16 e, uint16 f)
        internal
        pure
        returns (uint16[] memory)
    {
        uint16[] memory arr = new uint16[](maxLength);
        assembly {
            mstore(arr, 6)
        }
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        arr[5] = f;
        return arr;
    }

    function uint16sWithMaxLength(
        uint256 maxLength,
        uint16 a,
        uint16 b,
        uint16 c,
        uint16 d,
        uint16 e,
        uint16 f,
        uint16 g
    ) internal pure returns (uint16[] memory) {
        uint16[] memory arr = new uint16[](maxLength);
        assembly {
            mstore(arr, 7)
        }
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

    function truncate(uint16[] memory arr, uint256 newLength) internal pure returns (uint16[] memory _arr) {
        // truncate the array
        assembly {
            let oldLength := mload(arr)
            returndatacopy(returndatasize(), returndatasize(), gt(newLength, oldLength))
            mstore(arr, newLength)
            _arr := arr
        }
    }

    function truncateUnsafe(uint16[] memory arr, uint256 newLength) internal pure returns (uint16[] memory _arr) {
        // truncate the array
        assembly {
            mstore(arr, newLength)
            _arr := arr
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

    function copy(uint16[] memory arr) internal pure returns (uint16[] memory newArr) {
        uint256 length = arr.length;
        newArr = new uint16[](length);
        for (uint256 i = 0; i < length;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function copyAndResize(uint16[] memory arr, uint256 newLength) internal pure returns (uint16[] memory newArr) {
        newArr = new uint16[](newLength);
        uint256 length = arr.length;
        // allow shrinking a copy without copying extra members
        length = (length > newLength) ? newLength : length;
        for (uint256 i = 0; i < length;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        // TODO: consider writing 0-pointer to the rest of the array if longer for dynamic elements
    }

    function copyAndAllocate(uint16[] memory arr, uint256 maxLength) internal pure returns (uint16[] memory newArr) {
        newArr = new uint16[](maxLength);
        uint256 originalLength = arr.length;
        for (uint256 i = 0; i < originalLength;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, originalLength)
        }
    }

    function pop(uint16[] memory arr) internal pure returns (uint16 value) {
        assembly {
            let length := mload(arr)
            returndatacopy(returndatasize(), returndatasize(), iszero(length))
            value := mload(add(arr, shl(5, length)))
            mstore(arr, sub(length, 1))
        }
    }

    function popUnsafe(uint16[] memory arr) internal pure returns (uint16 value) {
        // This function is unsafe because it does not check if the array is empty.
        assembly {
            let length := mload(arr)
            value := mload(add(arr, shl(5, length)))
            mstore(arr, sub(length, 1))
        }
    }

    function popLeft(uint16[] memory arr) internal pure returns (uint16[] memory newArr, uint16 value) {
        assembly {
            let length := mload(arr)
            returndatacopy(returndatasize(), returndatasize(), iszero(length))
            value := mload(add(arr, 0x20))
            newArr := add(arr, 0x20)
            mstore(newArr, sub(length, 1))
        }
    }

    function popLeftUnsafe(uint16[] memory arr) internal pure returns (uint16[] memory newArr, uint16 value) {
        // This function is unsafe because it does not check if the array is empty.
        assembly {
            let length := mload(arr)
            value := mload(add(arr, 0x20))
            newArr := add(arr, 0x20)
            mstore(newArr, sub(length, 1))
        }
    }

    function fromFixed(uint16[1] memory arr) internal pure returns (uint16[] memory newArr) {
        newArr = new uint16[](1);
        for (uint256 i = 0; i < 1;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(uint16[1] memory arr, uint256 maxLength)
        internal
        pure
        returns (uint16[] memory newArr)
    {
        newArr = new uint16[](maxLength);
        for (uint256 i = 0; i < 1;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 1)
        }
    }

    function fromFixed(uint16[2] memory arr) internal pure returns (uint16[] memory newArr) {
        newArr = new uint16[](2);
        for (uint256 i = 0; i < 2;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(uint16[2] memory arr, uint256 maxLength)
        internal
        pure
        returns (uint16[] memory newArr)
    {
        newArr = new uint16[](maxLength);
        for (uint256 i = 0; i < 2;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 2)
        }
    }

    function fromFixed(uint16[3] memory arr) internal pure returns (uint16[] memory newArr) {
        newArr = new uint16[](3);
        for (uint256 i = 0; i < 3;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(uint16[3] memory arr, uint256 maxLength)
        internal
        pure
        returns (uint16[] memory newArr)
    {
        newArr = new uint16[](maxLength);
        for (uint256 i = 0; i < 3;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 3)
        }
    }

    function fromFixed(uint16[4] memory arr) internal pure returns (uint16[] memory newArr) {
        newArr = new uint16[](4);
        for (uint256 i = 0; i < 4;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(uint16[4] memory arr, uint256 maxLength)
        internal
        pure
        returns (uint16[] memory newArr)
    {
        newArr = new uint16[](maxLength);
        for (uint256 i = 0; i < 4;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 4)
        }
    }

    function fromFixed(uint16[5] memory arr) internal pure returns (uint16[] memory newArr) {
        newArr = new uint16[](5);
        for (uint256 i = 0; i < 5;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(uint16[5] memory arr, uint256 maxLength)
        internal
        pure
        returns (uint16[] memory newArr)
    {
        newArr = new uint16[](maxLength);
        for (uint256 i = 0; i < 5;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 5)
        }
    }

    function fromFixed(uint16[6] memory arr) internal pure returns (uint16[] memory newArr) {
        newArr = new uint16[](6);
        for (uint256 i = 0; i < 6;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(uint16[6] memory arr, uint256 maxLength)
        internal
        pure
        returns (uint16[] memory newArr)
    {
        newArr = new uint16[](maxLength);
        for (uint256 i = 0; i < 6;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 6)
        }
    }

    function fromFixed(uint16[7] memory arr) internal pure returns (uint16[] memory newArr) {
        newArr = new uint16[](7);
        for (uint256 i = 0; i < 7;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(uint16[7] memory arr, uint256 maxLength)
        internal
        pure
        returns (uint16[] memory newArr)
    {
        newArr = new uint16[](maxLength);
        for (uint256 i = 0; i < 7;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 7)
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

    function uint32sWithMaxLength(uint256 maxLength, uint32 a) internal pure returns (uint32[] memory) {
        uint32[] memory arr = new uint32[](maxLength);
        assembly {
            mstore(arr, 1)
        }
        arr[0] = a;
        return arr;
    }

    function uint32sWithMaxLength(uint256 maxLength, uint32 a, uint32 b) internal pure returns (uint32[] memory) {
        uint32[] memory arr = new uint32[](maxLength);
        assembly {
            mstore(arr, 2)
        }
        arr[0] = a;
        arr[1] = b;
        return arr;
    }

    function uint32sWithMaxLength(uint256 maxLength, uint32 a, uint32 b, uint32 c)
        internal
        pure
        returns (uint32[] memory)
    {
        uint32[] memory arr = new uint32[](maxLength);
        assembly {
            mstore(arr, 3)
        }
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        return arr;
    }

    function uint32sWithMaxLength(uint256 maxLength, uint32 a, uint32 b, uint32 c, uint32 d)
        internal
        pure
        returns (uint32[] memory)
    {
        uint32[] memory arr = new uint32[](maxLength);
        assembly {
            mstore(arr, 4)
        }
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        return arr;
    }

    function uint32sWithMaxLength(uint256 maxLength, uint32 a, uint32 b, uint32 c, uint32 d, uint32 e)
        internal
        pure
        returns (uint32[] memory)
    {
        uint32[] memory arr = new uint32[](maxLength);
        assembly {
            mstore(arr, 5)
        }
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        return arr;
    }

    function uint32sWithMaxLength(uint256 maxLength, uint32 a, uint32 b, uint32 c, uint32 d, uint32 e, uint32 f)
        internal
        pure
        returns (uint32[] memory)
    {
        uint32[] memory arr = new uint32[](maxLength);
        assembly {
            mstore(arr, 6)
        }
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        arr[5] = f;
        return arr;
    }

    function uint32sWithMaxLength(
        uint256 maxLength,
        uint32 a,
        uint32 b,
        uint32 c,
        uint32 d,
        uint32 e,
        uint32 f,
        uint32 g
    ) internal pure returns (uint32[] memory) {
        uint32[] memory arr = new uint32[](maxLength);
        assembly {
            mstore(arr, 7)
        }
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

    function truncate(uint32[] memory arr, uint256 newLength) internal pure returns (uint32[] memory _arr) {
        // truncate the array
        assembly {
            let oldLength := mload(arr)
            returndatacopy(returndatasize(), returndatasize(), gt(newLength, oldLength))
            mstore(arr, newLength)
            _arr := arr
        }
    }

    function truncateUnsafe(uint32[] memory arr, uint256 newLength) internal pure returns (uint32[] memory _arr) {
        // truncate the array
        assembly {
            mstore(arr, newLength)
            _arr := arr
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

    function copy(uint32[] memory arr) internal pure returns (uint32[] memory newArr) {
        uint256 length = arr.length;
        newArr = new uint32[](length);
        for (uint256 i = 0; i < length;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function copyAndResize(uint32[] memory arr, uint256 newLength) internal pure returns (uint32[] memory newArr) {
        newArr = new uint32[](newLength);
        uint256 length = arr.length;
        // allow shrinking a copy without copying extra members
        length = (length > newLength) ? newLength : length;
        for (uint256 i = 0; i < length;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        // TODO: consider writing 0-pointer to the rest of the array if longer for dynamic elements
    }

    function copyAndAllocate(uint32[] memory arr, uint256 maxLength) internal pure returns (uint32[] memory newArr) {
        newArr = new uint32[](maxLength);
        uint256 originalLength = arr.length;
        for (uint256 i = 0; i < originalLength;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, originalLength)
        }
    }

    function pop(uint32[] memory arr) internal pure returns (uint32 value) {
        assembly {
            let length := mload(arr)
            returndatacopy(returndatasize(), returndatasize(), iszero(length))
            value := mload(add(arr, shl(5, length)))
            mstore(arr, sub(length, 1))
        }
    }

    function popUnsafe(uint32[] memory arr) internal pure returns (uint32 value) {
        // This function is unsafe because it does not check if the array is empty.
        assembly {
            let length := mload(arr)
            value := mload(add(arr, shl(5, length)))
            mstore(arr, sub(length, 1))
        }
    }

    function popLeft(uint32[] memory arr) internal pure returns (uint32[] memory newArr, uint32 value) {
        assembly {
            let length := mload(arr)
            returndatacopy(returndatasize(), returndatasize(), iszero(length))
            value := mload(add(arr, 0x20))
            newArr := add(arr, 0x20)
            mstore(newArr, sub(length, 1))
        }
    }

    function popLeftUnsafe(uint32[] memory arr) internal pure returns (uint32[] memory newArr, uint32 value) {
        // This function is unsafe because it does not check if the array is empty.
        assembly {
            let length := mload(arr)
            value := mload(add(arr, 0x20))
            newArr := add(arr, 0x20)
            mstore(newArr, sub(length, 1))
        }
    }

    function fromFixed(uint32[1] memory arr) internal pure returns (uint32[] memory newArr) {
        newArr = new uint32[](1);
        for (uint256 i = 0; i < 1;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(uint32[1] memory arr, uint256 maxLength)
        internal
        pure
        returns (uint32[] memory newArr)
    {
        newArr = new uint32[](maxLength);
        for (uint256 i = 0; i < 1;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 1)
        }
    }

    function fromFixed(uint32[2] memory arr) internal pure returns (uint32[] memory newArr) {
        newArr = new uint32[](2);
        for (uint256 i = 0; i < 2;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(uint32[2] memory arr, uint256 maxLength)
        internal
        pure
        returns (uint32[] memory newArr)
    {
        newArr = new uint32[](maxLength);
        for (uint256 i = 0; i < 2;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 2)
        }
    }

    function fromFixed(uint32[3] memory arr) internal pure returns (uint32[] memory newArr) {
        newArr = new uint32[](3);
        for (uint256 i = 0; i < 3;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(uint32[3] memory arr, uint256 maxLength)
        internal
        pure
        returns (uint32[] memory newArr)
    {
        newArr = new uint32[](maxLength);
        for (uint256 i = 0; i < 3;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 3)
        }
    }

    function fromFixed(uint32[4] memory arr) internal pure returns (uint32[] memory newArr) {
        newArr = new uint32[](4);
        for (uint256 i = 0; i < 4;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(uint32[4] memory arr, uint256 maxLength)
        internal
        pure
        returns (uint32[] memory newArr)
    {
        newArr = new uint32[](maxLength);
        for (uint256 i = 0; i < 4;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 4)
        }
    }

    function fromFixed(uint32[5] memory arr) internal pure returns (uint32[] memory newArr) {
        newArr = new uint32[](5);
        for (uint256 i = 0; i < 5;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(uint32[5] memory arr, uint256 maxLength)
        internal
        pure
        returns (uint32[] memory newArr)
    {
        newArr = new uint32[](maxLength);
        for (uint256 i = 0; i < 5;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 5)
        }
    }

    function fromFixed(uint32[6] memory arr) internal pure returns (uint32[] memory newArr) {
        newArr = new uint32[](6);
        for (uint256 i = 0; i < 6;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(uint32[6] memory arr, uint256 maxLength)
        internal
        pure
        returns (uint32[] memory newArr)
    {
        newArr = new uint32[](maxLength);
        for (uint256 i = 0; i < 6;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 6)
        }
    }

    function fromFixed(uint32[7] memory arr) internal pure returns (uint32[] memory newArr) {
        newArr = new uint32[](7);
        for (uint256 i = 0; i < 7;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(uint32[7] memory arr, uint256 maxLength)
        internal
        pure
        returns (uint32[] memory newArr)
    {
        newArr = new uint32[](maxLength);
        for (uint256 i = 0; i < 7;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 7)
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

    function uint64sWithMaxLength(uint256 maxLength, uint64 a) internal pure returns (uint64[] memory) {
        uint64[] memory arr = new uint64[](maxLength);
        assembly {
            mstore(arr, 1)
        }
        arr[0] = a;
        return arr;
    }

    function uint64sWithMaxLength(uint256 maxLength, uint64 a, uint64 b) internal pure returns (uint64[] memory) {
        uint64[] memory arr = new uint64[](maxLength);
        assembly {
            mstore(arr, 2)
        }
        arr[0] = a;
        arr[1] = b;
        return arr;
    }

    function uint64sWithMaxLength(uint256 maxLength, uint64 a, uint64 b, uint64 c)
        internal
        pure
        returns (uint64[] memory)
    {
        uint64[] memory arr = new uint64[](maxLength);
        assembly {
            mstore(arr, 3)
        }
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        return arr;
    }

    function uint64sWithMaxLength(uint256 maxLength, uint64 a, uint64 b, uint64 c, uint64 d)
        internal
        pure
        returns (uint64[] memory)
    {
        uint64[] memory arr = new uint64[](maxLength);
        assembly {
            mstore(arr, 4)
        }
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        return arr;
    }

    function uint64sWithMaxLength(uint256 maxLength, uint64 a, uint64 b, uint64 c, uint64 d, uint64 e)
        internal
        pure
        returns (uint64[] memory)
    {
        uint64[] memory arr = new uint64[](maxLength);
        assembly {
            mstore(arr, 5)
        }
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        return arr;
    }

    function uint64sWithMaxLength(uint256 maxLength, uint64 a, uint64 b, uint64 c, uint64 d, uint64 e, uint64 f)
        internal
        pure
        returns (uint64[] memory)
    {
        uint64[] memory arr = new uint64[](maxLength);
        assembly {
            mstore(arr, 6)
        }
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        arr[5] = f;
        return arr;
    }

    function uint64sWithMaxLength(
        uint256 maxLength,
        uint64 a,
        uint64 b,
        uint64 c,
        uint64 d,
        uint64 e,
        uint64 f,
        uint64 g
    ) internal pure returns (uint64[] memory) {
        uint64[] memory arr = new uint64[](maxLength);
        assembly {
            mstore(arr, 7)
        }
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

    function truncate(uint64[] memory arr, uint256 newLength) internal pure returns (uint64[] memory _arr) {
        // truncate the array
        assembly {
            let oldLength := mload(arr)
            returndatacopy(returndatasize(), returndatasize(), gt(newLength, oldLength))
            mstore(arr, newLength)
            _arr := arr
        }
    }

    function truncateUnsafe(uint64[] memory arr, uint256 newLength) internal pure returns (uint64[] memory _arr) {
        // truncate the array
        assembly {
            mstore(arr, newLength)
            _arr := arr
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

    function copy(uint64[] memory arr) internal pure returns (uint64[] memory newArr) {
        uint256 length = arr.length;
        newArr = new uint64[](length);
        for (uint256 i = 0; i < length;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function copyAndResize(uint64[] memory arr, uint256 newLength) internal pure returns (uint64[] memory newArr) {
        newArr = new uint64[](newLength);
        uint256 length = arr.length;
        // allow shrinking a copy without copying extra members
        length = (length > newLength) ? newLength : length;
        for (uint256 i = 0; i < length;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        // TODO: consider writing 0-pointer to the rest of the array if longer for dynamic elements
    }

    function copyAndAllocate(uint64[] memory arr, uint256 maxLength) internal pure returns (uint64[] memory newArr) {
        newArr = new uint64[](maxLength);
        uint256 originalLength = arr.length;
        for (uint256 i = 0; i < originalLength;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, originalLength)
        }
    }

    function pop(uint64[] memory arr) internal pure returns (uint64 value) {
        assembly {
            let length := mload(arr)
            returndatacopy(returndatasize(), returndatasize(), iszero(length))
            value := mload(add(arr, shl(5, length)))
            mstore(arr, sub(length, 1))
        }
    }

    function popUnsafe(uint64[] memory arr) internal pure returns (uint64 value) {
        // This function is unsafe because it does not check if the array is empty.
        assembly {
            let length := mload(arr)
            value := mload(add(arr, shl(5, length)))
            mstore(arr, sub(length, 1))
        }
    }

    function popLeft(uint64[] memory arr) internal pure returns (uint64[] memory newArr, uint64 value) {
        assembly {
            let length := mload(arr)
            returndatacopy(returndatasize(), returndatasize(), iszero(length))
            value := mload(add(arr, 0x20))
            newArr := add(arr, 0x20)
            mstore(newArr, sub(length, 1))
        }
    }

    function popLeftUnsafe(uint64[] memory arr) internal pure returns (uint64[] memory newArr, uint64 value) {
        // This function is unsafe because it does not check if the array is empty.
        assembly {
            let length := mload(arr)
            value := mload(add(arr, 0x20))
            newArr := add(arr, 0x20)
            mstore(newArr, sub(length, 1))
        }
    }

    function fromFixed(uint64[1] memory arr) internal pure returns (uint64[] memory newArr) {
        newArr = new uint64[](1);
        for (uint256 i = 0; i < 1;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(uint64[1] memory arr, uint256 maxLength)
        internal
        pure
        returns (uint64[] memory newArr)
    {
        newArr = new uint64[](maxLength);
        for (uint256 i = 0; i < 1;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 1)
        }
    }

    function fromFixed(uint64[2] memory arr) internal pure returns (uint64[] memory newArr) {
        newArr = new uint64[](2);
        for (uint256 i = 0; i < 2;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(uint64[2] memory arr, uint256 maxLength)
        internal
        pure
        returns (uint64[] memory newArr)
    {
        newArr = new uint64[](maxLength);
        for (uint256 i = 0; i < 2;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 2)
        }
    }

    function fromFixed(uint64[3] memory arr) internal pure returns (uint64[] memory newArr) {
        newArr = new uint64[](3);
        for (uint256 i = 0; i < 3;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(uint64[3] memory arr, uint256 maxLength)
        internal
        pure
        returns (uint64[] memory newArr)
    {
        newArr = new uint64[](maxLength);
        for (uint256 i = 0; i < 3;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 3)
        }
    }

    function fromFixed(uint64[4] memory arr) internal pure returns (uint64[] memory newArr) {
        newArr = new uint64[](4);
        for (uint256 i = 0; i < 4;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(uint64[4] memory arr, uint256 maxLength)
        internal
        pure
        returns (uint64[] memory newArr)
    {
        newArr = new uint64[](maxLength);
        for (uint256 i = 0; i < 4;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 4)
        }
    }

    function fromFixed(uint64[5] memory arr) internal pure returns (uint64[] memory newArr) {
        newArr = new uint64[](5);
        for (uint256 i = 0; i < 5;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(uint64[5] memory arr, uint256 maxLength)
        internal
        pure
        returns (uint64[] memory newArr)
    {
        newArr = new uint64[](maxLength);
        for (uint256 i = 0; i < 5;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 5)
        }
    }

    function fromFixed(uint64[6] memory arr) internal pure returns (uint64[] memory newArr) {
        newArr = new uint64[](6);
        for (uint256 i = 0; i < 6;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(uint64[6] memory arr, uint256 maxLength)
        internal
        pure
        returns (uint64[] memory newArr)
    {
        newArr = new uint64[](maxLength);
        for (uint256 i = 0; i < 6;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 6)
        }
    }

    function fromFixed(uint64[7] memory arr) internal pure returns (uint64[] memory newArr) {
        newArr = new uint64[](7);
        for (uint256 i = 0; i < 7;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(uint64[7] memory arr, uint256 maxLength)
        internal
        pure
        returns (uint64[] memory newArr)
    {
        newArr = new uint64[](maxLength);
        for (uint256 i = 0; i < 7;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 7)
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

    function uint128sWithMaxLength(uint256 maxLength, uint128 a) internal pure returns (uint128[] memory) {
        uint128[] memory arr = new uint128[](maxLength);
        assembly {
            mstore(arr, 1)
        }
        arr[0] = a;
        return arr;
    }

    function uint128sWithMaxLength(uint256 maxLength, uint128 a, uint128 b) internal pure returns (uint128[] memory) {
        uint128[] memory arr = new uint128[](maxLength);
        assembly {
            mstore(arr, 2)
        }
        arr[0] = a;
        arr[1] = b;
        return arr;
    }

    function uint128sWithMaxLength(uint256 maxLength, uint128 a, uint128 b, uint128 c)
        internal
        pure
        returns (uint128[] memory)
    {
        uint128[] memory arr = new uint128[](maxLength);
        assembly {
            mstore(arr, 3)
        }
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        return arr;
    }

    function uint128sWithMaxLength(uint256 maxLength, uint128 a, uint128 b, uint128 c, uint128 d)
        internal
        pure
        returns (uint128[] memory)
    {
        uint128[] memory arr = new uint128[](maxLength);
        assembly {
            mstore(arr, 4)
        }
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        return arr;
    }

    function uint128sWithMaxLength(uint256 maxLength, uint128 a, uint128 b, uint128 c, uint128 d, uint128 e)
        internal
        pure
        returns (uint128[] memory)
    {
        uint128[] memory arr = new uint128[](maxLength);
        assembly {
            mstore(arr, 5)
        }
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        return arr;
    }

    function uint128sWithMaxLength(uint256 maxLength, uint128 a, uint128 b, uint128 c, uint128 d, uint128 e, uint128 f)
        internal
        pure
        returns (uint128[] memory)
    {
        uint128[] memory arr = new uint128[](maxLength);
        assembly {
            mstore(arr, 6)
        }
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        arr[5] = f;
        return arr;
    }

    function uint128sWithMaxLength(
        uint256 maxLength,
        uint128 a,
        uint128 b,
        uint128 c,
        uint128 d,
        uint128 e,
        uint128 f,
        uint128 g
    ) internal pure returns (uint128[] memory) {
        uint128[] memory arr = new uint128[](maxLength);
        assembly {
            mstore(arr, 7)
        }
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

    function truncate(uint128[] memory arr, uint256 newLength) internal pure returns (uint128[] memory _arr) {
        // truncate the array
        assembly {
            let oldLength := mload(arr)
            returndatacopy(returndatasize(), returndatasize(), gt(newLength, oldLength))
            mstore(arr, newLength)
            _arr := arr
        }
    }

    function truncateUnsafe(uint128[] memory arr, uint256 newLength) internal pure returns (uint128[] memory _arr) {
        // truncate the array
        assembly {
            mstore(arr, newLength)
            _arr := arr
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

    function copy(uint128[] memory arr) internal pure returns (uint128[] memory newArr) {
        uint256 length = arr.length;
        newArr = new uint128[](length);
        for (uint256 i = 0; i < length;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function copyAndResize(uint128[] memory arr, uint256 newLength) internal pure returns (uint128[] memory newArr) {
        newArr = new uint128[](newLength);
        uint256 length = arr.length;
        // allow shrinking a copy without copying extra members
        length = (length > newLength) ? newLength : length;
        for (uint256 i = 0; i < length;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        // TODO: consider writing 0-pointer to the rest of the array if longer for dynamic elements
    }

    function copyAndAllocate(uint128[] memory arr, uint256 maxLength) internal pure returns (uint128[] memory newArr) {
        newArr = new uint128[](maxLength);
        uint256 originalLength = arr.length;
        for (uint256 i = 0; i < originalLength;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, originalLength)
        }
    }

    function pop(uint128[] memory arr) internal pure returns (uint128 value) {
        assembly {
            let length := mload(arr)
            returndatacopy(returndatasize(), returndatasize(), iszero(length))
            value := mload(add(arr, shl(5, length)))
            mstore(arr, sub(length, 1))
        }
    }

    function popUnsafe(uint128[] memory arr) internal pure returns (uint128 value) {
        // This function is unsafe because it does not check if the array is empty.
        assembly {
            let length := mload(arr)
            value := mload(add(arr, shl(5, length)))
            mstore(arr, sub(length, 1))
        }
    }

    function popLeft(uint128[] memory arr) internal pure returns (uint128[] memory newArr, uint128 value) {
        assembly {
            let length := mload(arr)
            returndatacopy(returndatasize(), returndatasize(), iszero(length))
            value := mload(add(arr, 0x20))
            newArr := add(arr, 0x20)
            mstore(newArr, sub(length, 1))
        }
    }

    function popLeftUnsafe(uint128[] memory arr) internal pure returns (uint128[] memory newArr, uint128 value) {
        // This function is unsafe because it does not check if the array is empty.
        assembly {
            let length := mload(arr)
            value := mload(add(arr, 0x20))
            newArr := add(arr, 0x20)
            mstore(newArr, sub(length, 1))
        }
    }

    function fromFixed(uint128[1] memory arr) internal pure returns (uint128[] memory newArr) {
        newArr = new uint128[](1);
        for (uint256 i = 0; i < 1;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(uint128[1] memory arr, uint256 maxLength)
        internal
        pure
        returns (uint128[] memory newArr)
    {
        newArr = new uint128[](maxLength);
        for (uint256 i = 0; i < 1;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 1)
        }
    }

    function fromFixed(uint128[2] memory arr) internal pure returns (uint128[] memory newArr) {
        newArr = new uint128[](2);
        for (uint256 i = 0; i < 2;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(uint128[2] memory arr, uint256 maxLength)
        internal
        pure
        returns (uint128[] memory newArr)
    {
        newArr = new uint128[](maxLength);
        for (uint256 i = 0; i < 2;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 2)
        }
    }

    function fromFixed(uint128[3] memory arr) internal pure returns (uint128[] memory newArr) {
        newArr = new uint128[](3);
        for (uint256 i = 0; i < 3;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(uint128[3] memory arr, uint256 maxLength)
        internal
        pure
        returns (uint128[] memory newArr)
    {
        newArr = new uint128[](maxLength);
        for (uint256 i = 0; i < 3;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 3)
        }
    }

    function fromFixed(uint128[4] memory arr) internal pure returns (uint128[] memory newArr) {
        newArr = new uint128[](4);
        for (uint256 i = 0; i < 4;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(uint128[4] memory arr, uint256 maxLength)
        internal
        pure
        returns (uint128[] memory newArr)
    {
        newArr = new uint128[](maxLength);
        for (uint256 i = 0; i < 4;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 4)
        }
    }

    function fromFixed(uint128[5] memory arr) internal pure returns (uint128[] memory newArr) {
        newArr = new uint128[](5);
        for (uint256 i = 0; i < 5;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(uint128[5] memory arr, uint256 maxLength)
        internal
        pure
        returns (uint128[] memory newArr)
    {
        newArr = new uint128[](maxLength);
        for (uint256 i = 0; i < 5;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 5)
        }
    }

    function fromFixed(uint128[6] memory arr) internal pure returns (uint128[] memory newArr) {
        newArr = new uint128[](6);
        for (uint256 i = 0; i < 6;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(uint128[6] memory arr, uint256 maxLength)
        internal
        pure
        returns (uint128[] memory newArr)
    {
        newArr = new uint128[](maxLength);
        for (uint256 i = 0; i < 6;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 6)
        }
    }

    function fromFixed(uint128[7] memory arr) internal pure returns (uint128[] memory newArr) {
        newArr = new uint128[](7);
        for (uint256 i = 0; i < 7;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(uint128[7] memory arr, uint256 maxLength)
        internal
        pure
        returns (uint128[] memory newArr)
    {
        newArr = new uint128[](maxLength);
        for (uint256 i = 0; i < 7;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 7)
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

    function uint256sWithMaxLength(uint256 maxLength, uint256 a) internal pure returns (uint256[] memory) {
        uint256[] memory arr = new uint256[](maxLength);
        assembly {
            mstore(arr, 1)
        }
        arr[0] = a;
        return arr;
    }

    function uint256sWithMaxLength(uint256 maxLength, uint256 a, uint256 b) internal pure returns (uint256[] memory) {
        uint256[] memory arr = new uint256[](maxLength);
        assembly {
            mstore(arr, 2)
        }
        arr[0] = a;
        arr[1] = b;
        return arr;
    }

    function uint256sWithMaxLength(uint256 maxLength, uint256 a, uint256 b, uint256 c)
        internal
        pure
        returns (uint256[] memory)
    {
        uint256[] memory arr = new uint256[](maxLength);
        assembly {
            mstore(arr, 3)
        }
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        return arr;
    }

    function uint256sWithMaxLength(uint256 maxLength, uint256 a, uint256 b, uint256 c, uint256 d)
        internal
        pure
        returns (uint256[] memory)
    {
        uint256[] memory arr = new uint256[](maxLength);
        assembly {
            mstore(arr, 4)
        }
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        return arr;
    }

    function uint256sWithMaxLength(uint256 maxLength, uint256 a, uint256 b, uint256 c, uint256 d, uint256 e)
        internal
        pure
        returns (uint256[] memory)
    {
        uint256[] memory arr = new uint256[](maxLength);
        assembly {
            mstore(arr, 5)
        }
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        return arr;
    }

    function uint256sWithMaxLength(uint256 maxLength, uint256 a, uint256 b, uint256 c, uint256 d, uint256 e, uint256 f)
        internal
        pure
        returns (uint256[] memory)
    {
        uint256[] memory arr = new uint256[](maxLength);
        assembly {
            mstore(arr, 6)
        }
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        arr[5] = f;
        return arr;
    }

    function uint256sWithMaxLength(
        uint256 maxLength,
        uint256 a,
        uint256 b,
        uint256 c,
        uint256 d,
        uint256 e,
        uint256 f,
        uint256 g
    ) internal pure returns (uint256[] memory) {
        uint256[] memory arr = new uint256[](maxLength);
        assembly {
            mstore(arr, 7)
        }
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

    function truncate(uint256[] memory arr, uint256 newLength) internal pure returns (uint256[] memory _arr) {
        // truncate the array
        assembly {
            let oldLength := mload(arr)
            returndatacopy(returndatasize(), returndatasize(), gt(newLength, oldLength))
            mstore(arr, newLength)
            _arr := arr
        }
    }

    function truncateUnsafe(uint256[] memory arr, uint256 newLength) internal pure returns (uint256[] memory _arr) {
        // truncate the array
        assembly {
            mstore(arr, newLength)
            _arr := arr
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

    function copy(uint256[] memory arr) internal pure returns (uint256[] memory newArr) {
        uint256 length = arr.length;
        newArr = new uint256[](length);
        for (uint256 i = 0; i < length;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function copyAndResize(uint256[] memory arr, uint256 newLength) internal pure returns (uint256[] memory newArr) {
        newArr = new uint256[](newLength);
        uint256 length = arr.length;
        // allow shrinking a copy without copying extra members
        length = (length > newLength) ? newLength : length;
        for (uint256 i = 0; i < length;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        // TODO: consider writing 0-pointer to the rest of the array if longer for dynamic elements
    }

    function copyAndAllocate(uint256[] memory arr, uint256 maxLength) internal pure returns (uint256[] memory newArr) {
        newArr = new uint256[](maxLength);
        uint256 originalLength = arr.length;
        for (uint256 i = 0; i < originalLength;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, originalLength)
        }
    }

    function pop(uint256[] memory arr) internal pure returns (uint256 value) {
        assembly {
            let length := mload(arr)
            returndatacopy(returndatasize(), returndatasize(), iszero(length))
            value := mload(add(arr, shl(5, length)))
            mstore(arr, sub(length, 1))
        }
    }

    function popUnsafe(uint256[] memory arr) internal pure returns (uint256 value) {
        // This function is unsafe because it does not check if the array is empty.
        assembly {
            let length := mload(arr)
            value := mload(add(arr, shl(5, length)))
            mstore(arr, sub(length, 1))
        }
    }

    function popLeft(uint256[] memory arr) internal pure returns (uint256[] memory newArr, uint256 value) {
        assembly {
            let length := mload(arr)
            returndatacopy(returndatasize(), returndatasize(), iszero(length))
            value := mload(add(arr, 0x20))
            newArr := add(arr, 0x20)
            mstore(newArr, sub(length, 1))
        }
    }

    function popLeftUnsafe(uint256[] memory arr) internal pure returns (uint256[] memory newArr, uint256 value) {
        // This function is unsafe because it does not check if the array is empty.
        assembly {
            let length := mload(arr)
            value := mload(add(arr, 0x20))
            newArr := add(arr, 0x20)
            mstore(newArr, sub(length, 1))
        }
    }

    function fromFixed(uint256[1] memory arr) internal pure returns (uint256[] memory newArr) {
        newArr = new uint256[](1);
        for (uint256 i = 0; i < 1;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(uint256[1] memory arr, uint256 maxLength)
        internal
        pure
        returns (uint256[] memory newArr)
    {
        newArr = new uint256[](maxLength);
        for (uint256 i = 0; i < 1;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 1)
        }
    }

    function fromFixed(uint256[2] memory arr) internal pure returns (uint256[] memory newArr) {
        newArr = new uint256[](2);
        for (uint256 i = 0; i < 2;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(uint256[2] memory arr, uint256 maxLength)
        internal
        pure
        returns (uint256[] memory newArr)
    {
        newArr = new uint256[](maxLength);
        for (uint256 i = 0; i < 2;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 2)
        }
    }

    function fromFixed(uint256[3] memory arr) internal pure returns (uint256[] memory newArr) {
        newArr = new uint256[](3);
        for (uint256 i = 0; i < 3;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(uint256[3] memory arr, uint256 maxLength)
        internal
        pure
        returns (uint256[] memory newArr)
    {
        newArr = new uint256[](maxLength);
        for (uint256 i = 0; i < 3;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 3)
        }
    }

    function fromFixed(uint256[4] memory arr) internal pure returns (uint256[] memory newArr) {
        newArr = new uint256[](4);
        for (uint256 i = 0; i < 4;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(uint256[4] memory arr, uint256 maxLength)
        internal
        pure
        returns (uint256[] memory newArr)
    {
        newArr = new uint256[](maxLength);
        for (uint256 i = 0; i < 4;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 4)
        }
    }

    function fromFixed(uint256[5] memory arr) internal pure returns (uint256[] memory newArr) {
        newArr = new uint256[](5);
        for (uint256 i = 0; i < 5;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(uint256[5] memory arr, uint256 maxLength)
        internal
        pure
        returns (uint256[] memory newArr)
    {
        newArr = new uint256[](maxLength);
        for (uint256 i = 0; i < 5;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 5)
        }
    }

    function fromFixed(uint256[6] memory arr) internal pure returns (uint256[] memory newArr) {
        newArr = new uint256[](6);
        for (uint256 i = 0; i < 6;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(uint256[6] memory arr, uint256 maxLength)
        internal
        pure
        returns (uint256[] memory newArr)
    {
        newArr = new uint256[](maxLength);
        for (uint256 i = 0; i < 6;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 6)
        }
    }

    function fromFixed(uint256[7] memory arr) internal pure returns (uint256[] memory newArr) {
        newArr = new uint256[](7);
        for (uint256 i = 0; i < 7;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(uint256[7] memory arr, uint256 maxLength)
        internal
        pure
        returns (uint256[] memory newArr)
    {
        newArr = new uint256[](maxLength);
        for (uint256 i = 0; i < 7;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 7)
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

    function int8sWithMaxLength(uint256 maxLength, int8 a) internal pure returns (int8[] memory) {
        int8[] memory arr = new int8[](maxLength);
        assembly {
            mstore(arr, 1)
        }
        arr[0] = a;
        return arr;
    }

    function int8sWithMaxLength(uint256 maxLength, int8 a, int8 b) internal pure returns (int8[] memory) {
        int8[] memory arr = new int8[](maxLength);
        assembly {
            mstore(arr, 2)
        }
        arr[0] = a;
        arr[1] = b;
        return arr;
    }

    function int8sWithMaxLength(uint256 maxLength, int8 a, int8 b, int8 c) internal pure returns (int8[] memory) {
        int8[] memory arr = new int8[](maxLength);
        assembly {
            mstore(arr, 3)
        }
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        return arr;
    }

    function int8sWithMaxLength(uint256 maxLength, int8 a, int8 b, int8 c, int8 d)
        internal
        pure
        returns (int8[] memory)
    {
        int8[] memory arr = new int8[](maxLength);
        assembly {
            mstore(arr, 4)
        }
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        return arr;
    }

    function int8sWithMaxLength(uint256 maxLength, int8 a, int8 b, int8 c, int8 d, int8 e)
        internal
        pure
        returns (int8[] memory)
    {
        int8[] memory arr = new int8[](maxLength);
        assembly {
            mstore(arr, 5)
        }
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        return arr;
    }

    function int8sWithMaxLength(uint256 maxLength, int8 a, int8 b, int8 c, int8 d, int8 e, int8 f)
        internal
        pure
        returns (int8[] memory)
    {
        int8[] memory arr = new int8[](maxLength);
        assembly {
            mstore(arr, 6)
        }
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        arr[5] = f;
        return arr;
    }

    function int8sWithMaxLength(uint256 maxLength, int8 a, int8 b, int8 c, int8 d, int8 e, int8 f, int8 g)
        internal
        pure
        returns (int8[] memory)
    {
        int8[] memory arr = new int8[](maxLength);
        assembly {
            mstore(arr, 7)
        }
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

    function truncate(int8[] memory arr, uint256 newLength) internal pure returns (int8[] memory _arr) {
        // truncate the array
        assembly {
            let oldLength := mload(arr)
            returndatacopy(returndatasize(), returndatasize(), gt(newLength, oldLength))
            mstore(arr, newLength)
            _arr := arr
        }
    }

    function truncateUnsafe(int8[] memory arr, uint256 newLength) internal pure returns (int8[] memory _arr) {
        // truncate the array
        assembly {
            mstore(arr, newLength)
            _arr := arr
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

    function copy(int8[] memory arr) internal pure returns (int8[] memory newArr) {
        uint256 length = arr.length;
        newArr = new int8[](length);
        for (uint256 i = 0; i < length;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function copyAndResize(int8[] memory arr, uint256 newLength) internal pure returns (int8[] memory newArr) {
        newArr = new int8[](newLength);
        uint256 length = arr.length;
        // allow shrinking a copy without copying extra members
        length = (length > newLength) ? newLength : length;
        for (uint256 i = 0; i < length;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        // TODO: consider writing 0-pointer to the rest of the array if longer for dynamic elements
    }

    function copyAndAllocate(int8[] memory arr, uint256 maxLength) internal pure returns (int8[] memory newArr) {
        newArr = new int8[](maxLength);
        uint256 originalLength = arr.length;
        for (uint256 i = 0; i < originalLength;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, originalLength)
        }
    }

    function pop(int8[] memory arr) internal pure returns (int8 value) {
        assembly {
            let length := mload(arr)
            returndatacopy(returndatasize(), returndatasize(), iszero(length))
            value := mload(add(arr, shl(5, length)))
            mstore(arr, sub(length, 1))
        }
    }

    function popUnsafe(int8[] memory arr) internal pure returns (int8 value) {
        // This function is unsafe because it does not check if the array is empty.
        assembly {
            let length := mload(arr)
            value := mload(add(arr, shl(5, length)))
            mstore(arr, sub(length, 1))
        }
    }

    function popLeft(int8[] memory arr) internal pure returns (int8[] memory newArr, int8 value) {
        assembly {
            let length := mload(arr)
            returndatacopy(returndatasize(), returndatasize(), iszero(length))
            value := mload(add(arr, 0x20))
            newArr := add(arr, 0x20)
            mstore(newArr, sub(length, 1))
        }
    }

    function popLeftUnsafe(int8[] memory arr) internal pure returns (int8[] memory newArr, int8 value) {
        // This function is unsafe because it does not check if the array is empty.
        assembly {
            let length := mload(arr)
            value := mload(add(arr, 0x20))
            newArr := add(arr, 0x20)
            mstore(newArr, sub(length, 1))
        }
    }

    function fromFixed(int8[1] memory arr) internal pure returns (int8[] memory newArr) {
        newArr = new int8[](1);
        for (uint256 i = 0; i < 1;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(int8[1] memory arr, uint256 maxLength)
        internal
        pure
        returns (int8[] memory newArr)
    {
        newArr = new int8[](maxLength);
        for (uint256 i = 0; i < 1;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 1)
        }
    }

    function fromFixed(int8[2] memory arr) internal pure returns (int8[] memory newArr) {
        newArr = new int8[](2);
        for (uint256 i = 0; i < 2;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(int8[2] memory arr, uint256 maxLength)
        internal
        pure
        returns (int8[] memory newArr)
    {
        newArr = new int8[](maxLength);
        for (uint256 i = 0; i < 2;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 2)
        }
    }

    function fromFixed(int8[3] memory arr) internal pure returns (int8[] memory newArr) {
        newArr = new int8[](3);
        for (uint256 i = 0; i < 3;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(int8[3] memory arr, uint256 maxLength)
        internal
        pure
        returns (int8[] memory newArr)
    {
        newArr = new int8[](maxLength);
        for (uint256 i = 0; i < 3;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 3)
        }
    }

    function fromFixed(int8[4] memory arr) internal pure returns (int8[] memory newArr) {
        newArr = new int8[](4);
        for (uint256 i = 0; i < 4;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(int8[4] memory arr, uint256 maxLength)
        internal
        pure
        returns (int8[] memory newArr)
    {
        newArr = new int8[](maxLength);
        for (uint256 i = 0; i < 4;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 4)
        }
    }

    function fromFixed(int8[5] memory arr) internal pure returns (int8[] memory newArr) {
        newArr = new int8[](5);
        for (uint256 i = 0; i < 5;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(int8[5] memory arr, uint256 maxLength)
        internal
        pure
        returns (int8[] memory newArr)
    {
        newArr = new int8[](maxLength);
        for (uint256 i = 0; i < 5;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 5)
        }
    }

    function fromFixed(int8[6] memory arr) internal pure returns (int8[] memory newArr) {
        newArr = new int8[](6);
        for (uint256 i = 0; i < 6;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(int8[6] memory arr, uint256 maxLength)
        internal
        pure
        returns (int8[] memory newArr)
    {
        newArr = new int8[](maxLength);
        for (uint256 i = 0; i < 6;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 6)
        }
    }

    function fromFixed(int8[7] memory arr) internal pure returns (int8[] memory newArr) {
        newArr = new int8[](7);
        for (uint256 i = 0; i < 7;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(int8[7] memory arr, uint256 maxLength)
        internal
        pure
        returns (int8[] memory newArr)
    {
        newArr = new int8[](maxLength);
        for (uint256 i = 0; i < 7;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 7)
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

    function int16sWithMaxLength(uint256 maxLength, int16 a) internal pure returns (int16[] memory) {
        int16[] memory arr = new int16[](maxLength);
        assembly {
            mstore(arr, 1)
        }
        arr[0] = a;
        return arr;
    }

    function int16sWithMaxLength(uint256 maxLength, int16 a, int16 b) internal pure returns (int16[] memory) {
        int16[] memory arr = new int16[](maxLength);
        assembly {
            mstore(arr, 2)
        }
        arr[0] = a;
        arr[1] = b;
        return arr;
    }

    function int16sWithMaxLength(uint256 maxLength, int16 a, int16 b, int16 c) internal pure returns (int16[] memory) {
        int16[] memory arr = new int16[](maxLength);
        assembly {
            mstore(arr, 3)
        }
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        return arr;
    }

    function int16sWithMaxLength(uint256 maxLength, int16 a, int16 b, int16 c, int16 d)
        internal
        pure
        returns (int16[] memory)
    {
        int16[] memory arr = new int16[](maxLength);
        assembly {
            mstore(arr, 4)
        }
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        return arr;
    }

    function int16sWithMaxLength(uint256 maxLength, int16 a, int16 b, int16 c, int16 d, int16 e)
        internal
        pure
        returns (int16[] memory)
    {
        int16[] memory arr = new int16[](maxLength);
        assembly {
            mstore(arr, 5)
        }
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        return arr;
    }

    function int16sWithMaxLength(uint256 maxLength, int16 a, int16 b, int16 c, int16 d, int16 e, int16 f)
        internal
        pure
        returns (int16[] memory)
    {
        int16[] memory arr = new int16[](maxLength);
        assembly {
            mstore(arr, 6)
        }
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        arr[5] = f;
        return arr;
    }

    function int16sWithMaxLength(uint256 maxLength, int16 a, int16 b, int16 c, int16 d, int16 e, int16 f, int16 g)
        internal
        pure
        returns (int16[] memory)
    {
        int16[] memory arr = new int16[](maxLength);
        assembly {
            mstore(arr, 7)
        }
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

    function truncate(int16[] memory arr, uint256 newLength) internal pure returns (int16[] memory _arr) {
        // truncate the array
        assembly {
            let oldLength := mload(arr)
            returndatacopy(returndatasize(), returndatasize(), gt(newLength, oldLength))
            mstore(arr, newLength)
            _arr := arr
        }
    }

    function truncateUnsafe(int16[] memory arr, uint256 newLength) internal pure returns (int16[] memory _arr) {
        // truncate the array
        assembly {
            mstore(arr, newLength)
            _arr := arr
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

    function copy(int16[] memory arr) internal pure returns (int16[] memory newArr) {
        uint256 length = arr.length;
        newArr = new int16[](length);
        for (uint256 i = 0; i < length;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function copyAndResize(int16[] memory arr, uint256 newLength) internal pure returns (int16[] memory newArr) {
        newArr = new int16[](newLength);
        uint256 length = arr.length;
        // allow shrinking a copy without copying extra members
        length = (length > newLength) ? newLength : length;
        for (uint256 i = 0; i < length;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        // TODO: consider writing 0-pointer to the rest of the array if longer for dynamic elements
    }

    function copyAndAllocate(int16[] memory arr, uint256 maxLength) internal pure returns (int16[] memory newArr) {
        newArr = new int16[](maxLength);
        uint256 originalLength = arr.length;
        for (uint256 i = 0; i < originalLength;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, originalLength)
        }
    }

    function pop(int16[] memory arr) internal pure returns (int16 value) {
        assembly {
            let length := mload(arr)
            returndatacopy(returndatasize(), returndatasize(), iszero(length))
            value := mload(add(arr, shl(5, length)))
            mstore(arr, sub(length, 1))
        }
    }

    function popUnsafe(int16[] memory arr) internal pure returns (int16 value) {
        // This function is unsafe because it does not check if the array is empty.
        assembly {
            let length := mload(arr)
            value := mload(add(arr, shl(5, length)))
            mstore(arr, sub(length, 1))
        }
    }

    function popLeft(int16[] memory arr) internal pure returns (int16[] memory newArr, int16 value) {
        assembly {
            let length := mload(arr)
            returndatacopy(returndatasize(), returndatasize(), iszero(length))
            value := mload(add(arr, 0x20))
            newArr := add(arr, 0x20)
            mstore(newArr, sub(length, 1))
        }
    }

    function popLeftUnsafe(int16[] memory arr) internal pure returns (int16[] memory newArr, int16 value) {
        // This function is unsafe because it does not check if the array is empty.
        assembly {
            let length := mload(arr)
            value := mload(add(arr, 0x20))
            newArr := add(arr, 0x20)
            mstore(newArr, sub(length, 1))
        }
    }

    function fromFixed(int16[1] memory arr) internal pure returns (int16[] memory newArr) {
        newArr = new int16[](1);
        for (uint256 i = 0; i < 1;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(int16[1] memory arr, uint256 maxLength)
        internal
        pure
        returns (int16[] memory newArr)
    {
        newArr = new int16[](maxLength);
        for (uint256 i = 0; i < 1;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 1)
        }
    }

    function fromFixed(int16[2] memory arr) internal pure returns (int16[] memory newArr) {
        newArr = new int16[](2);
        for (uint256 i = 0; i < 2;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(int16[2] memory arr, uint256 maxLength)
        internal
        pure
        returns (int16[] memory newArr)
    {
        newArr = new int16[](maxLength);
        for (uint256 i = 0; i < 2;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 2)
        }
    }

    function fromFixed(int16[3] memory arr) internal pure returns (int16[] memory newArr) {
        newArr = new int16[](3);
        for (uint256 i = 0; i < 3;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(int16[3] memory arr, uint256 maxLength)
        internal
        pure
        returns (int16[] memory newArr)
    {
        newArr = new int16[](maxLength);
        for (uint256 i = 0; i < 3;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 3)
        }
    }

    function fromFixed(int16[4] memory arr) internal pure returns (int16[] memory newArr) {
        newArr = new int16[](4);
        for (uint256 i = 0; i < 4;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(int16[4] memory arr, uint256 maxLength)
        internal
        pure
        returns (int16[] memory newArr)
    {
        newArr = new int16[](maxLength);
        for (uint256 i = 0; i < 4;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 4)
        }
    }

    function fromFixed(int16[5] memory arr) internal pure returns (int16[] memory newArr) {
        newArr = new int16[](5);
        for (uint256 i = 0; i < 5;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(int16[5] memory arr, uint256 maxLength)
        internal
        pure
        returns (int16[] memory newArr)
    {
        newArr = new int16[](maxLength);
        for (uint256 i = 0; i < 5;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 5)
        }
    }

    function fromFixed(int16[6] memory arr) internal pure returns (int16[] memory newArr) {
        newArr = new int16[](6);
        for (uint256 i = 0; i < 6;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(int16[6] memory arr, uint256 maxLength)
        internal
        pure
        returns (int16[] memory newArr)
    {
        newArr = new int16[](maxLength);
        for (uint256 i = 0; i < 6;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 6)
        }
    }

    function fromFixed(int16[7] memory arr) internal pure returns (int16[] memory newArr) {
        newArr = new int16[](7);
        for (uint256 i = 0; i < 7;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(int16[7] memory arr, uint256 maxLength)
        internal
        pure
        returns (int16[] memory newArr)
    {
        newArr = new int16[](maxLength);
        for (uint256 i = 0; i < 7;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 7)
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

    function int32sWithMaxLength(uint256 maxLength, int32 a) internal pure returns (int32[] memory) {
        int32[] memory arr = new int32[](maxLength);
        assembly {
            mstore(arr, 1)
        }
        arr[0] = a;
        return arr;
    }

    function int32sWithMaxLength(uint256 maxLength, int32 a, int32 b) internal pure returns (int32[] memory) {
        int32[] memory arr = new int32[](maxLength);
        assembly {
            mstore(arr, 2)
        }
        arr[0] = a;
        arr[1] = b;
        return arr;
    }

    function int32sWithMaxLength(uint256 maxLength, int32 a, int32 b, int32 c) internal pure returns (int32[] memory) {
        int32[] memory arr = new int32[](maxLength);
        assembly {
            mstore(arr, 3)
        }
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        return arr;
    }

    function int32sWithMaxLength(uint256 maxLength, int32 a, int32 b, int32 c, int32 d)
        internal
        pure
        returns (int32[] memory)
    {
        int32[] memory arr = new int32[](maxLength);
        assembly {
            mstore(arr, 4)
        }
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        return arr;
    }

    function int32sWithMaxLength(uint256 maxLength, int32 a, int32 b, int32 c, int32 d, int32 e)
        internal
        pure
        returns (int32[] memory)
    {
        int32[] memory arr = new int32[](maxLength);
        assembly {
            mstore(arr, 5)
        }
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        return arr;
    }

    function int32sWithMaxLength(uint256 maxLength, int32 a, int32 b, int32 c, int32 d, int32 e, int32 f)
        internal
        pure
        returns (int32[] memory)
    {
        int32[] memory arr = new int32[](maxLength);
        assembly {
            mstore(arr, 6)
        }
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        arr[5] = f;
        return arr;
    }

    function int32sWithMaxLength(uint256 maxLength, int32 a, int32 b, int32 c, int32 d, int32 e, int32 f, int32 g)
        internal
        pure
        returns (int32[] memory)
    {
        int32[] memory arr = new int32[](maxLength);
        assembly {
            mstore(arr, 7)
        }
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

    function truncate(int32[] memory arr, uint256 newLength) internal pure returns (int32[] memory _arr) {
        // truncate the array
        assembly {
            let oldLength := mload(arr)
            returndatacopy(returndatasize(), returndatasize(), gt(newLength, oldLength))
            mstore(arr, newLength)
            _arr := arr
        }
    }

    function truncateUnsafe(int32[] memory arr, uint256 newLength) internal pure returns (int32[] memory _arr) {
        // truncate the array
        assembly {
            mstore(arr, newLength)
            _arr := arr
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

    function copy(int32[] memory arr) internal pure returns (int32[] memory newArr) {
        uint256 length = arr.length;
        newArr = new int32[](length);
        for (uint256 i = 0; i < length;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function copyAndResize(int32[] memory arr, uint256 newLength) internal pure returns (int32[] memory newArr) {
        newArr = new int32[](newLength);
        uint256 length = arr.length;
        // allow shrinking a copy without copying extra members
        length = (length > newLength) ? newLength : length;
        for (uint256 i = 0; i < length;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        // TODO: consider writing 0-pointer to the rest of the array if longer for dynamic elements
    }

    function copyAndAllocate(int32[] memory arr, uint256 maxLength) internal pure returns (int32[] memory newArr) {
        newArr = new int32[](maxLength);
        uint256 originalLength = arr.length;
        for (uint256 i = 0; i < originalLength;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, originalLength)
        }
    }

    function pop(int32[] memory arr) internal pure returns (int32 value) {
        assembly {
            let length := mload(arr)
            returndatacopy(returndatasize(), returndatasize(), iszero(length))
            value := mload(add(arr, shl(5, length)))
            mstore(arr, sub(length, 1))
        }
    }

    function popUnsafe(int32[] memory arr) internal pure returns (int32 value) {
        // This function is unsafe because it does not check if the array is empty.
        assembly {
            let length := mload(arr)
            value := mload(add(arr, shl(5, length)))
            mstore(arr, sub(length, 1))
        }
    }

    function popLeft(int32[] memory arr) internal pure returns (int32[] memory newArr, int32 value) {
        assembly {
            let length := mload(arr)
            returndatacopy(returndatasize(), returndatasize(), iszero(length))
            value := mload(add(arr, 0x20))
            newArr := add(arr, 0x20)
            mstore(newArr, sub(length, 1))
        }
    }

    function popLeftUnsafe(int32[] memory arr) internal pure returns (int32[] memory newArr, int32 value) {
        // This function is unsafe because it does not check if the array is empty.
        assembly {
            let length := mload(arr)
            value := mload(add(arr, 0x20))
            newArr := add(arr, 0x20)
            mstore(newArr, sub(length, 1))
        }
    }

    function fromFixed(int32[1] memory arr) internal pure returns (int32[] memory newArr) {
        newArr = new int32[](1);
        for (uint256 i = 0; i < 1;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(int32[1] memory arr, uint256 maxLength)
        internal
        pure
        returns (int32[] memory newArr)
    {
        newArr = new int32[](maxLength);
        for (uint256 i = 0; i < 1;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 1)
        }
    }

    function fromFixed(int32[2] memory arr) internal pure returns (int32[] memory newArr) {
        newArr = new int32[](2);
        for (uint256 i = 0; i < 2;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(int32[2] memory arr, uint256 maxLength)
        internal
        pure
        returns (int32[] memory newArr)
    {
        newArr = new int32[](maxLength);
        for (uint256 i = 0; i < 2;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 2)
        }
    }

    function fromFixed(int32[3] memory arr) internal pure returns (int32[] memory newArr) {
        newArr = new int32[](3);
        for (uint256 i = 0; i < 3;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(int32[3] memory arr, uint256 maxLength)
        internal
        pure
        returns (int32[] memory newArr)
    {
        newArr = new int32[](maxLength);
        for (uint256 i = 0; i < 3;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 3)
        }
    }

    function fromFixed(int32[4] memory arr) internal pure returns (int32[] memory newArr) {
        newArr = new int32[](4);
        for (uint256 i = 0; i < 4;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(int32[4] memory arr, uint256 maxLength)
        internal
        pure
        returns (int32[] memory newArr)
    {
        newArr = new int32[](maxLength);
        for (uint256 i = 0; i < 4;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 4)
        }
    }

    function fromFixed(int32[5] memory arr) internal pure returns (int32[] memory newArr) {
        newArr = new int32[](5);
        for (uint256 i = 0; i < 5;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(int32[5] memory arr, uint256 maxLength)
        internal
        pure
        returns (int32[] memory newArr)
    {
        newArr = new int32[](maxLength);
        for (uint256 i = 0; i < 5;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 5)
        }
    }

    function fromFixed(int32[6] memory arr) internal pure returns (int32[] memory newArr) {
        newArr = new int32[](6);
        for (uint256 i = 0; i < 6;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(int32[6] memory arr, uint256 maxLength)
        internal
        pure
        returns (int32[] memory newArr)
    {
        newArr = new int32[](maxLength);
        for (uint256 i = 0; i < 6;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 6)
        }
    }

    function fromFixed(int32[7] memory arr) internal pure returns (int32[] memory newArr) {
        newArr = new int32[](7);
        for (uint256 i = 0; i < 7;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(int32[7] memory arr, uint256 maxLength)
        internal
        pure
        returns (int32[] memory newArr)
    {
        newArr = new int32[](maxLength);
        for (uint256 i = 0; i < 7;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 7)
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

    function int64sWithMaxLength(uint256 maxLength, int64 a) internal pure returns (int64[] memory) {
        int64[] memory arr = new int64[](maxLength);
        assembly {
            mstore(arr, 1)
        }
        arr[0] = a;
        return arr;
    }

    function int64sWithMaxLength(uint256 maxLength, int64 a, int64 b) internal pure returns (int64[] memory) {
        int64[] memory arr = new int64[](maxLength);
        assembly {
            mstore(arr, 2)
        }
        arr[0] = a;
        arr[1] = b;
        return arr;
    }

    function int64sWithMaxLength(uint256 maxLength, int64 a, int64 b, int64 c) internal pure returns (int64[] memory) {
        int64[] memory arr = new int64[](maxLength);
        assembly {
            mstore(arr, 3)
        }
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        return arr;
    }

    function int64sWithMaxLength(uint256 maxLength, int64 a, int64 b, int64 c, int64 d)
        internal
        pure
        returns (int64[] memory)
    {
        int64[] memory arr = new int64[](maxLength);
        assembly {
            mstore(arr, 4)
        }
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        return arr;
    }

    function int64sWithMaxLength(uint256 maxLength, int64 a, int64 b, int64 c, int64 d, int64 e)
        internal
        pure
        returns (int64[] memory)
    {
        int64[] memory arr = new int64[](maxLength);
        assembly {
            mstore(arr, 5)
        }
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        return arr;
    }

    function int64sWithMaxLength(uint256 maxLength, int64 a, int64 b, int64 c, int64 d, int64 e, int64 f)
        internal
        pure
        returns (int64[] memory)
    {
        int64[] memory arr = new int64[](maxLength);
        assembly {
            mstore(arr, 6)
        }
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        arr[5] = f;
        return arr;
    }

    function int64sWithMaxLength(uint256 maxLength, int64 a, int64 b, int64 c, int64 d, int64 e, int64 f, int64 g)
        internal
        pure
        returns (int64[] memory)
    {
        int64[] memory arr = new int64[](maxLength);
        assembly {
            mstore(arr, 7)
        }
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

    function truncate(int64[] memory arr, uint256 newLength) internal pure returns (int64[] memory _arr) {
        // truncate the array
        assembly {
            let oldLength := mload(arr)
            returndatacopy(returndatasize(), returndatasize(), gt(newLength, oldLength))
            mstore(arr, newLength)
            _arr := arr
        }
    }

    function truncateUnsafe(int64[] memory arr, uint256 newLength) internal pure returns (int64[] memory _arr) {
        // truncate the array
        assembly {
            mstore(arr, newLength)
            _arr := arr
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

    function copy(int64[] memory arr) internal pure returns (int64[] memory newArr) {
        uint256 length = arr.length;
        newArr = new int64[](length);
        for (uint256 i = 0; i < length;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function copyAndResize(int64[] memory arr, uint256 newLength) internal pure returns (int64[] memory newArr) {
        newArr = new int64[](newLength);
        uint256 length = arr.length;
        // allow shrinking a copy without copying extra members
        length = (length > newLength) ? newLength : length;
        for (uint256 i = 0; i < length;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        // TODO: consider writing 0-pointer to the rest of the array if longer for dynamic elements
    }

    function copyAndAllocate(int64[] memory arr, uint256 maxLength) internal pure returns (int64[] memory newArr) {
        newArr = new int64[](maxLength);
        uint256 originalLength = arr.length;
        for (uint256 i = 0; i < originalLength;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, originalLength)
        }
    }

    function pop(int64[] memory arr) internal pure returns (int64 value) {
        assembly {
            let length := mload(arr)
            returndatacopy(returndatasize(), returndatasize(), iszero(length))
            value := mload(add(arr, shl(5, length)))
            mstore(arr, sub(length, 1))
        }
    }

    function popUnsafe(int64[] memory arr) internal pure returns (int64 value) {
        // This function is unsafe because it does not check if the array is empty.
        assembly {
            let length := mload(arr)
            value := mload(add(arr, shl(5, length)))
            mstore(arr, sub(length, 1))
        }
    }

    function popLeft(int64[] memory arr) internal pure returns (int64[] memory newArr, int64 value) {
        assembly {
            let length := mload(arr)
            returndatacopy(returndatasize(), returndatasize(), iszero(length))
            value := mload(add(arr, 0x20))
            newArr := add(arr, 0x20)
            mstore(newArr, sub(length, 1))
        }
    }

    function popLeftUnsafe(int64[] memory arr) internal pure returns (int64[] memory newArr, int64 value) {
        // This function is unsafe because it does not check if the array is empty.
        assembly {
            let length := mload(arr)
            value := mload(add(arr, 0x20))
            newArr := add(arr, 0x20)
            mstore(newArr, sub(length, 1))
        }
    }

    function fromFixed(int64[1] memory arr) internal pure returns (int64[] memory newArr) {
        newArr = new int64[](1);
        for (uint256 i = 0; i < 1;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(int64[1] memory arr, uint256 maxLength)
        internal
        pure
        returns (int64[] memory newArr)
    {
        newArr = new int64[](maxLength);
        for (uint256 i = 0; i < 1;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 1)
        }
    }

    function fromFixed(int64[2] memory arr) internal pure returns (int64[] memory newArr) {
        newArr = new int64[](2);
        for (uint256 i = 0; i < 2;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(int64[2] memory arr, uint256 maxLength)
        internal
        pure
        returns (int64[] memory newArr)
    {
        newArr = new int64[](maxLength);
        for (uint256 i = 0; i < 2;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 2)
        }
    }

    function fromFixed(int64[3] memory arr) internal pure returns (int64[] memory newArr) {
        newArr = new int64[](3);
        for (uint256 i = 0; i < 3;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(int64[3] memory arr, uint256 maxLength)
        internal
        pure
        returns (int64[] memory newArr)
    {
        newArr = new int64[](maxLength);
        for (uint256 i = 0; i < 3;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 3)
        }
    }

    function fromFixed(int64[4] memory arr) internal pure returns (int64[] memory newArr) {
        newArr = new int64[](4);
        for (uint256 i = 0; i < 4;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(int64[4] memory arr, uint256 maxLength)
        internal
        pure
        returns (int64[] memory newArr)
    {
        newArr = new int64[](maxLength);
        for (uint256 i = 0; i < 4;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 4)
        }
    }

    function fromFixed(int64[5] memory arr) internal pure returns (int64[] memory newArr) {
        newArr = new int64[](5);
        for (uint256 i = 0; i < 5;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(int64[5] memory arr, uint256 maxLength)
        internal
        pure
        returns (int64[] memory newArr)
    {
        newArr = new int64[](maxLength);
        for (uint256 i = 0; i < 5;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 5)
        }
    }

    function fromFixed(int64[6] memory arr) internal pure returns (int64[] memory newArr) {
        newArr = new int64[](6);
        for (uint256 i = 0; i < 6;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(int64[6] memory arr, uint256 maxLength)
        internal
        pure
        returns (int64[] memory newArr)
    {
        newArr = new int64[](maxLength);
        for (uint256 i = 0; i < 6;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 6)
        }
    }

    function fromFixed(int64[7] memory arr) internal pure returns (int64[] memory newArr) {
        newArr = new int64[](7);
        for (uint256 i = 0; i < 7;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(int64[7] memory arr, uint256 maxLength)
        internal
        pure
        returns (int64[] memory newArr)
    {
        newArr = new int64[](maxLength);
        for (uint256 i = 0; i < 7;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 7)
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

    function int128sWithMaxLength(uint256 maxLength, int128 a) internal pure returns (int128[] memory) {
        int128[] memory arr = new int128[](maxLength);
        assembly {
            mstore(arr, 1)
        }
        arr[0] = a;
        return arr;
    }

    function int128sWithMaxLength(uint256 maxLength, int128 a, int128 b) internal pure returns (int128[] memory) {
        int128[] memory arr = new int128[](maxLength);
        assembly {
            mstore(arr, 2)
        }
        arr[0] = a;
        arr[1] = b;
        return arr;
    }

    function int128sWithMaxLength(uint256 maxLength, int128 a, int128 b, int128 c)
        internal
        pure
        returns (int128[] memory)
    {
        int128[] memory arr = new int128[](maxLength);
        assembly {
            mstore(arr, 3)
        }
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        return arr;
    }

    function int128sWithMaxLength(uint256 maxLength, int128 a, int128 b, int128 c, int128 d)
        internal
        pure
        returns (int128[] memory)
    {
        int128[] memory arr = new int128[](maxLength);
        assembly {
            mstore(arr, 4)
        }
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        return arr;
    }

    function int128sWithMaxLength(uint256 maxLength, int128 a, int128 b, int128 c, int128 d, int128 e)
        internal
        pure
        returns (int128[] memory)
    {
        int128[] memory arr = new int128[](maxLength);
        assembly {
            mstore(arr, 5)
        }
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        return arr;
    }

    function int128sWithMaxLength(uint256 maxLength, int128 a, int128 b, int128 c, int128 d, int128 e, int128 f)
        internal
        pure
        returns (int128[] memory)
    {
        int128[] memory arr = new int128[](maxLength);
        assembly {
            mstore(arr, 6)
        }
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        arr[5] = f;
        return arr;
    }

    function int128sWithMaxLength(
        uint256 maxLength,
        int128 a,
        int128 b,
        int128 c,
        int128 d,
        int128 e,
        int128 f,
        int128 g
    ) internal pure returns (int128[] memory) {
        int128[] memory arr = new int128[](maxLength);
        assembly {
            mstore(arr, 7)
        }
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

    function truncate(int128[] memory arr, uint256 newLength) internal pure returns (int128[] memory _arr) {
        // truncate the array
        assembly {
            let oldLength := mload(arr)
            returndatacopy(returndatasize(), returndatasize(), gt(newLength, oldLength))
            mstore(arr, newLength)
            _arr := arr
        }
    }

    function truncateUnsafe(int128[] memory arr, uint256 newLength) internal pure returns (int128[] memory _arr) {
        // truncate the array
        assembly {
            mstore(arr, newLength)
            _arr := arr
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

    function copy(int128[] memory arr) internal pure returns (int128[] memory newArr) {
        uint256 length = arr.length;
        newArr = new int128[](length);
        for (uint256 i = 0; i < length;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function copyAndResize(int128[] memory arr, uint256 newLength) internal pure returns (int128[] memory newArr) {
        newArr = new int128[](newLength);
        uint256 length = arr.length;
        // allow shrinking a copy without copying extra members
        length = (length > newLength) ? newLength : length;
        for (uint256 i = 0; i < length;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        // TODO: consider writing 0-pointer to the rest of the array if longer for dynamic elements
    }

    function copyAndAllocate(int128[] memory arr, uint256 maxLength) internal pure returns (int128[] memory newArr) {
        newArr = new int128[](maxLength);
        uint256 originalLength = arr.length;
        for (uint256 i = 0; i < originalLength;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, originalLength)
        }
    }

    function pop(int128[] memory arr) internal pure returns (int128 value) {
        assembly {
            let length := mload(arr)
            returndatacopy(returndatasize(), returndatasize(), iszero(length))
            value := mload(add(arr, shl(5, length)))
            mstore(arr, sub(length, 1))
        }
    }

    function popUnsafe(int128[] memory arr) internal pure returns (int128 value) {
        // This function is unsafe because it does not check if the array is empty.
        assembly {
            let length := mload(arr)
            value := mload(add(arr, shl(5, length)))
            mstore(arr, sub(length, 1))
        }
    }

    function popLeft(int128[] memory arr) internal pure returns (int128[] memory newArr, int128 value) {
        assembly {
            let length := mload(arr)
            returndatacopy(returndatasize(), returndatasize(), iszero(length))
            value := mload(add(arr, 0x20))
            newArr := add(arr, 0x20)
            mstore(newArr, sub(length, 1))
        }
    }

    function popLeftUnsafe(int128[] memory arr) internal pure returns (int128[] memory newArr, int128 value) {
        // This function is unsafe because it does not check if the array is empty.
        assembly {
            let length := mload(arr)
            value := mload(add(arr, 0x20))
            newArr := add(arr, 0x20)
            mstore(newArr, sub(length, 1))
        }
    }

    function fromFixed(int128[1] memory arr) internal pure returns (int128[] memory newArr) {
        newArr = new int128[](1);
        for (uint256 i = 0; i < 1;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(int128[1] memory arr, uint256 maxLength)
        internal
        pure
        returns (int128[] memory newArr)
    {
        newArr = new int128[](maxLength);
        for (uint256 i = 0; i < 1;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 1)
        }
    }

    function fromFixed(int128[2] memory arr) internal pure returns (int128[] memory newArr) {
        newArr = new int128[](2);
        for (uint256 i = 0; i < 2;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(int128[2] memory arr, uint256 maxLength)
        internal
        pure
        returns (int128[] memory newArr)
    {
        newArr = new int128[](maxLength);
        for (uint256 i = 0; i < 2;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 2)
        }
    }

    function fromFixed(int128[3] memory arr) internal pure returns (int128[] memory newArr) {
        newArr = new int128[](3);
        for (uint256 i = 0; i < 3;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(int128[3] memory arr, uint256 maxLength)
        internal
        pure
        returns (int128[] memory newArr)
    {
        newArr = new int128[](maxLength);
        for (uint256 i = 0; i < 3;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 3)
        }
    }

    function fromFixed(int128[4] memory arr) internal pure returns (int128[] memory newArr) {
        newArr = new int128[](4);
        for (uint256 i = 0; i < 4;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(int128[4] memory arr, uint256 maxLength)
        internal
        pure
        returns (int128[] memory newArr)
    {
        newArr = new int128[](maxLength);
        for (uint256 i = 0; i < 4;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 4)
        }
    }

    function fromFixed(int128[5] memory arr) internal pure returns (int128[] memory newArr) {
        newArr = new int128[](5);
        for (uint256 i = 0; i < 5;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(int128[5] memory arr, uint256 maxLength)
        internal
        pure
        returns (int128[] memory newArr)
    {
        newArr = new int128[](maxLength);
        for (uint256 i = 0; i < 5;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 5)
        }
    }

    function fromFixed(int128[6] memory arr) internal pure returns (int128[] memory newArr) {
        newArr = new int128[](6);
        for (uint256 i = 0; i < 6;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(int128[6] memory arr, uint256 maxLength)
        internal
        pure
        returns (int128[] memory newArr)
    {
        newArr = new int128[](maxLength);
        for (uint256 i = 0; i < 6;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 6)
        }
    }

    function fromFixed(int128[7] memory arr) internal pure returns (int128[] memory newArr) {
        newArr = new int128[](7);
        for (uint256 i = 0; i < 7;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(int128[7] memory arr, uint256 maxLength)
        internal
        pure
        returns (int128[] memory newArr)
    {
        newArr = new int128[](maxLength);
        for (uint256 i = 0; i < 7;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 7)
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

    function int256sWithMaxLength(uint256 maxLength, int256 a) internal pure returns (int256[] memory) {
        int256[] memory arr = new int256[](maxLength);
        assembly {
            mstore(arr, 1)
        }
        arr[0] = a;
        return arr;
    }

    function int256sWithMaxLength(uint256 maxLength, int256 a, int256 b) internal pure returns (int256[] memory) {
        int256[] memory arr = new int256[](maxLength);
        assembly {
            mstore(arr, 2)
        }
        arr[0] = a;
        arr[1] = b;
        return arr;
    }

    function int256sWithMaxLength(uint256 maxLength, int256 a, int256 b, int256 c)
        internal
        pure
        returns (int256[] memory)
    {
        int256[] memory arr = new int256[](maxLength);
        assembly {
            mstore(arr, 3)
        }
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        return arr;
    }

    function int256sWithMaxLength(uint256 maxLength, int256 a, int256 b, int256 c, int256 d)
        internal
        pure
        returns (int256[] memory)
    {
        int256[] memory arr = new int256[](maxLength);
        assembly {
            mstore(arr, 4)
        }
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        return arr;
    }

    function int256sWithMaxLength(uint256 maxLength, int256 a, int256 b, int256 c, int256 d, int256 e)
        internal
        pure
        returns (int256[] memory)
    {
        int256[] memory arr = new int256[](maxLength);
        assembly {
            mstore(arr, 5)
        }
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        return arr;
    }

    function int256sWithMaxLength(uint256 maxLength, int256 a, int256 b, int256 c, int256 d, int256 e, int256 f)
        internal
        pure
        returns (int256[] memory)
    {
        int256[] memory arr = new int256[](maxLength);
        assembly {
            mstore(arr, 6)
        }
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        arr[5] = f;
        return arr;
    }

    function int256sWithMaxLength(
        uint256 maxLength,
        int256 a,
        int256 b,
        int256 c,
        int256 d,
        int256 e,
        int256 f,
        int256 g
    ) internal pure returns (int256[] memory) {
        int256[] memory arr = new int256[](maxLength);
        assembly {
            mstore(arr, 7)
        }
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

    function truncate(int256[] memory arr, uint256 newLength) internal pure returns (int256[] memory _arr) {
        // truncate the array
        assembly {
            let oldLength := mload(arr)
            returndatacopy(returndatasize(), returndatasize(), gt(newLength, oldLength))
            mstore(arr, newLength)
            _arr := arr
        }
    }

    function truncateUnsafe(int256[] memory arr, uint256 newLength) internal pure returns (int256[] memory _arr) {
        // truncate the array
        assembly {
            mstore(arr, newLength)
            _arr := arr
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

    function copy(int256[] memory arr) internal pure returns (int256[] memory newArr) {
        uint256 length = arr.length;
        newArr = new int256[](length);
        for (uint256 i = 0; i < length;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function copyAndResize(int256[] memory arr, uint256 newLength) internal pure returns (int256[] memory newArr) {
        newArr = new int256[](newLength);
        uint256 length = arr.length;
        // allow shrinking a copy without copying extra members
        length = (length > newLength) ? newLength : length;
        for (uint256 i = 0; i < length;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        // TODO: consider writing 0-pointer to the rest of the array if longer for dynamic elements
    }

    function copyAndAllocate(int256[] memory arr, uint256 maxLength) internal pure returns (int256[] memory newArr) {
        newArr = new int256[](maxLength);
        uint256 originalLength = arr.length;
        for (uint256 i = 0; i < originalLength;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, originalLength)
        }
    }

    function pop(int256[] memory arr) internal pure returns (int256 value) {
        assembly {
            let length := mload(arr)
            returndatacopy(returndatasize(), returndatasize(), iszero(length))
            value := mload(add(arr, shl(5, length)))
            mstore(arr, sub(length, 1))
        }
    }

    function popUnsafe(int256[] memory arr) internal pure returns (int256 value) {
        // This function is unsafe because it does not check if the array is empty.
        assembly {
            let length := mload(arr)
            value := mload(add(arr, shl(5, length)))
            mstore(arr, sub(length, 1))
        }
    }

    function popLeft(int256[] memory arr) internal pure returns (int256[] memory newArr, int256 value) {
        assembly {
            let length := mload(arr)
            returndatacopy(returndatasize(), returndatasize(), iszero(length))
            value := mload(add(arr, 0x20))
            newArr := add(arr, 0x20)
            mstore(newArr, sub(length, 1))
        }
    }

    function popLeftUnsafe(int256[] memory arr) internal pure returns (int256[] memory newArr, int256 value) {
        // This function is unsafe because it does not check if the array is empty.
        assembly {
            let length := mload(arr)
            value := mload(add(arr, 0x20))
            newArr := add(arr, 0x20)
            mstore(newArr, sub(length, 1))
        }
    }

    function fromFixed(int256[1] memory arr) internal pure returns (int256[] memory newArr) {
        newArr = new int256[](1);
        for (uint256 i = 0; i < 1;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(int256[1] memory arr, uint256 maxLength)
        internal
        pure
        returns (int256[] memory newArr)
    {
        newArr = new int256[](maxLength);
        for (uint256 i = 0; i < 1;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 1)
        }
    }

    function fromFixed(int256[2] memory arr) internal pure returns (int256[] memory newArr) {
        newArr = new int256[](2);
        for (uint256 i = 0; i < 2;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(int256[2] memory arr, uint256 maxLength)
        internal
        pure
        returns (int256[] memory newArr)
    {
        newArr = new int256[](maxLength);
        for (uint256 i = 0; i < 2;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 2)
        }
    }

    function fromFixed(int256[3] memory arr) internal pure returns (int256[] memory newArr) {
        newArr = new int256[](3);
        for (uint256 i = 0; i < 3;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(int256[3] memory arr, uint256 maxLength)
        internal
        pure
        returns (int256[] memory newArr)
    {
        newArr = new int256[](maxLength);
        for (uint256 i = 0; i < 3;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 3)
        }
    }

    function fromFixed(int256[4] memory arr) internal pure returns (int256[] memory newArr) {
        newArr = new int256[](4);
        for (uint256 i = 0; i < 4;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(int256[4] memory arr, uint256 maxLength)
        internal
        pure
        returns (int256[] memory newArr)
    {
        newArr = new int256[](maxLength);
        for (uint256 i = 0; i < 4;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 4)
        }
    }

    function fromFixed(int256[5] memory arr) internal pure returns (int256[] memory newArr) {
        newArr = new int256[](5);
        for (uint256 i = 0; i < 5;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(int256[5] memory arr, uint256 maxLength)
        internal
        pure
        returns (int256[] memory newArr)
    {
        newArr = new int256[](maxLength);
        for (uint256 i = 0; i < 5;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 5)
        }
    }

    function fromFixed(int256[6] memory arr) internal pure returns (int256[] memory newArr) {
        newArr = new int256[](6);
        for (uint256 i = 0; i < 6;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(int256[6] memory arr, uint256 maxLength)
        internal
        pure
        returns (int256[] memory newArr)
    {
        newArr = new int256[](maxLength);
        for (uint256 i = 0; i < 6;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 6)
        }
    }

    function fromFixed(int256[7] memory arr) internal pure returns (int256[] memory newArr) {
        newArr = new int256[](7);
        for (uint256 i = 0; i < 7;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(int256[7] memory arr, uint256 maxLength)
        internal
        pure
        returns (int256[] memory newArr)
    {
        newArr = new int256[](maxLength);
        for (uint256 i = 0; i < 7;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 7)
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

    function bytes1sWithMaxLength(uint256 maxLength, bytes1 a) internal pure returns (bytes1[] memory) {
        bytes1[] memory arr = new bytes1[](maxLength);
        assembly {
            mstore(arr, 1)
        }
        arr[0] = a;
        return arr;
    }

    function bytes1sWithMaxLength(uint256 maxLength, bytes1 a, bytes1 b) internal pure returns (bytes1[] memory) {
        bytes1[] memory arr = new bytes1[](maxLength);
        assembly {
            mstore(arr, 2)
        }
        arr[0] = a;
        arr[1] = b;
        return arr;
    }

    function bytes1sWithMaxLength(uint256 maxLength, bytes1 a, bytes1 b, bytes1 c)
        internal
        pure
        returns (bytes1[] memory)
    {
        bytes1[] memory arr = new bytes1[](maxLength);
        assembly {
            mstore(arr, 3)
        }
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        return arr;
    }

    function bytes1sWithMaxLength(uint256 maxLength, bytes1 a, bytes1 b, bytes1 c, bytes1 d)
        internal
        pure
        returns (bytes1[] memory)
    {
        bytes1[] memory arr = new bytes1[](maxLength);
        assembly {
            mstore(arr, 4)
        }
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        return arr;
    }

    function bytes1sWithMaxLength(uint256 maxLength, bytes1 a, bytes1 b, bytes1 c, bytes1 d, bytes1 e)
        internal
        pure
        returns (bytes1[] memory)
    {
        bytes1[] memory arr = new bytes1[](maxLength);
        assembly {
            mstore(arr, 5)
        }
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        return arr;
    }

    function bytes1sWithMaxLength(uint256 maxLength, bytes1 a, bytes1 b, bytes1 c, bytes1 d, bytes1 e, bytes1 f)
        internal
        pure
        returns (bytes1[] memory)
    {
        bytes1[] memory arr = new bytes1[](maxLength);
        assembly {
            mstore(arr, 6)
        }
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        arr[5] = f;
        return arr;
    }

    function bytes1sWithMaxLength(
        uint256 maxLength,
        bytes1 a,
        bytes1 b,
        bytes1 c,
        bytes1 d,
        bytes1 e,
        bytes1 f,
        bytes1 g
    ) internal pure returns (bytes1[] memory) {
        bytes1[] memory arr = new bytes1[](maxLength);
        assembly {
            mstore(arr, 7)
        }
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

    function truncate(bytes1[] memory arr, uint256 newLength) internal pure returns (bytes1[] memory _arr) {
        // truncate the array
        assembly {
            let oldLength := mload(arr)
            returndatacopy(returndatasize(), returndatasize(), gt(newLength, oldLength))
            mstore(arr, newLength)
            _arr := arr
        }
    }

    function truncateUnsafe(bytes1[] memory arr, uint256 newLength) internal pure returns (bytes1[] memory _arr) {
        // truncate the array
        assembly {
            mstore(arr, newLength)
            _arr := arr
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

    function copy(bytes1[] memory arr) internal pure returns (bytes1[] memory newArr) {
        uint256 length = arr.length;
        newArr = new bytes1[](length);
        for (uint256 i = 0; i < length;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function copyAndResize(bytes1[] memory arr, uint256 newLength) internal pure returns (bytes1[] memory newArr) {
        newArr = new bytes1[](newLength);
        uint256 length = arr.length;
        // allow shrinking a copy without copying extra members
        length = (length > newLength) ? newLength : length;
        for (uint256 i = 0; i < length;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        // TODO: consider writing 0-pointer to the rest of the array if longer for dynamic elements
    }

    function copyAndAllocate(bytes1[] memory arr, uint256 maxLength) internal pure returns (bytes1[] memory newArr) {
        newArr = new bytes1[](maxLength);
        uint256 originalLength = arr.length;
        for (uint256 i = 0; i < originalLength;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, originalLength)
        }
    }

    function pop(bytes1[] memory arr) internal pure returns (bytes1 value) {
        assembly {
            let length := mload(arr)
            returndatacopy(returndatasize(), returndatasize(), iszero(length))
            value := mload(add(arr, shl(5, length)))
            mstore(arr, sub(length, 1))
        }
    }

    function popUnsafe(bytes1[] memory arr) internal pure returns (bytes1 value) {
        // This function is unsafe because it does not check if the array is empty.
        assembly {
            let length := mload(arr)
            value := mload(add(arr, shl(5, length)))
            mstore(arr, sub(length, 1))
        }
    }

    function popLeft(bytes1[] memory arr) internal pure returns (bytes1[] memory newArr, bytes1 value) {
        assembly {
            let length := mload(arr)
            returndatacopy(returndatasize(), returndatasize(), iszero(length))
            value := mload(add(arr, 0x20))
            newArr := add(arr, 0x20)
            mstore(newArr, sub(length, 1))
        }
    }

    function popLeftUnsafe(bytes1[] memory arr) internal pure returns (bytes1[] memory newArr, bytes1 value) {
        // This function is unsafe because it does not check if the array is empty.
        assembly {
            let length := mload(arr)
            value := mload(add(arr, 0x20))
            newArr := add(arr, 0x20)
            mstore(newArr, sub(length, 1))
        }
    }

    function fromFixed(bytes1[1] memory arr) internal pure returns (bytes1[] memory newArr) {
        newArr = new bytes1[](1);
        for (uint256 i = 0; i < 1;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(bytes1[1] memory arr, uint256 maxLength)
        internal
        pure
        returns (bytes1[] memory newArr)
    {
        newArr = new bytes1[](maxLength);
        for (uint256 i = 0; i < 1;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 1)
        }
    }

    function fromFixed(bytes1[2] memory arr) internal pure returns (bytes1[] memory newArr) {
        newArr = new bytes1[](2);
        for (uint256 i = 0; i < 2;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(bytes1[2] memory arr, uint256 maxLength)
        internal
        pure
        returns (bytes1[] memory newArr)
    {
        newArr = new bytes1[](maxLength);
        for (uint256 i = 0; i < 2;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 2)
        }
    }

    function fromFixed(bytes1[3] memory arr) internal pure returns (bytes1[] memory newArr) {
        newArr = new bytes1[](3);
        for (uint256 i = 0; i < 3;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(bytes1[3] memory arr, uint256 maxLength)
        internal
        pure
        returns (bytes1[] memory newArr)
    {
        newArr = new bytes1[](maxLength);
        for (uint256 i = 0; i < 3;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 3)
        }
    }

    function fromFixed(bytes1[4] memory arr) internal pure returns (bytes1[] memory newArr) {
        newArr = new bytes1[](4);
        for (uint256 i = 0; i < 4;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(bytes1[4] memory arr, uint256 maxLength)
        internal
        pure
        returns (bytes1[] memory newArr)
    {
        newArr = new bytes1[](maxLength);
        for (uint256 i = 0; i < 4;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 4)
        }
    }

    function fromFixed(bytes1[5] memory arr) internal pure returns (bytes1[] memory newArr) {
        newArr = new bytes1[](5);
        for (uint256 i = 0; i < 5;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(bytes1[5] memory arr, uint256 maxLength)
        internal
        pure
        returns (bytes1[] memory newArr)
    {
        newArr = new bytes1[](maxLength);
        for (uint256 i = 0; i < 5;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 5)
        }
    }

    function fromFixed(bytes1[6] memory arr) internal pure returns (bytes1[] memory newArr) {
        newArr = new bytes1[](6);
        for (uint256 i = 0; i < 6;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(bytes1[6] memory arr, uint256 maxLength)
        internal
        pure
        returns (bytes1[] memory newArr)
    {
        newArr = new bytes1[](maxLength);
        for (uint256 i = 0; i < 6;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 6)
        }
    }

    function fromFixed(bytes1[7] memory arr) internal pure returns (bytes1[] memory newArr) {
        newArr = new bytes1[](7);
        for (uint256 i = 0; i < 7;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(bytes1[7] memory arr, uint256 maxLength)
        internal
        pure
        returns (bytes1[] memory newArr)
    {
        newArr = new bytes1[](maxLength);
        for (uint256 i = 0; i < 7;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 7)
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

    function bytes4sWithMaxLength(uint256 maxLength, bytes4 a) internal pure returns (bytes4[] memory) {
        bytes4[] memory arr = new bytes4[](maxLength);
        assembly {
            mstore(arr, 1)
        }
        arr[0] = a;
        return arr;
    }

    function bytes4sWithMaxLength(uint256 maxLength, bytes4 a, bytes4 b) internal pure returns (bytes4[] memory) {
        bytes4[] memory arr = new bytes4[](maxLength);
        assembly {
            mstore(arr, 2)
        }
        arr[0] = a;
        arr[1] = b;
        return arr;
    }

    function bytes4sWithMaxLength(uint256 maxLength, bytes4 a, bytes4 b, bytes4 c)
        internal
        pure
        returns (bytes4[] memory)
    {
        bytes4[] memory arr = new bytes4[](maxLength);
        assembly {
            mstore(arr, 3)
        }
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        return arr;
    }

    function bytes4sWithMaxLength(uint256 maxLength, bytes4 a, bytes4 b, bytes4 c, bytes4 d)
        internal
        pure
        returns (bytes4[] memory)
    {
        bytes4[] memory arr = new bytes4[](maxLength);
        assembly {
            mstore(arr, 4)
        }
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        return arr;
    }

    function bytes4sWithMaxLength(uint256 maxLength, bytes4 a, bytes4 b, bytes4 c, bytes4 d, bytes4 e)
        internal
        pure
        returns (bytes4[] memory)
    {
        bytes4[] memory arr = new bytes4[](maxLength);
        assembly {
            mstore(arr, 5)
        }
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        return arr;
    }

    function bytes4sWithMaxLength(uint256 maxLength, bytes4 a, bytes4 b, bytes4 c, bytes4 d, bytes4 e, bytes4 f)
        internal
        pure
        returns (bytes4[] memory)
    {
        bytes4[] memory arr = new bytes4[](maxLength);
        assembly {
            mstore(arr, 6)
        }
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        arr[5] = f;
        return arr;
    }

    function bytes4sWithMaxLength(
        uint256 maxLength,
        bytes4 a,
        bytes4 b,
        bytes4 c,
        bytes4 d,
        bytes4 e,
        bytes4 f,
        bytes4 g
    ) internal pure returns (bytes4[] memory) {
        bytes4[] memory arr = new bytes4[](maxLength);
        assembly {
            mstore(arr, 7)
        }
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

    function truncate(bytes4[] memory arr, uint256 newLength) internal pure returns (bytes4[] memory _arr) {
        // truncate the array
        assembly {
            let oldLength := mload(arr)
            returndatacopy(returndatasize(), returndatasize(), gt(newLength, oldLength))
            mstore(arr, newLength)
            _arr := arr
        }
    }

    function truncateUnsafe(bytes4[] memory arr, uint256 newLength) internal pure returns (bytes4[] memory _arr) {
        // truncate the array
        assembly {
            mstore(arr, newLength)
            _arr := arr
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

    function copy(bytes4[] memory arr) internal pure returns (bytes4[] memory newArr) {
        uint256 length = arr.length;
        newArr = new bytes4[](length);
        for (uint256 i = 0; i < length;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function copyAndResize(bytes4[] memory arr, uint256 newLength) internal pure returns (bytes4[] memory newArr) {
        newArr = new bytes4[](newLength);
        uint256 length = arr.length;
        // allow shrinking a copy without copying extra members
        length = (length > newLength) ? newLength : length;
        for (uint256 i = 0; i < length;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        // TODO: consider writing 0-pointer to the rest of the array if longer for dynamic elements
    }

    function copyAndAllocate(bytes4[] memory arr, uint256 maxLength) internal pure returns (bytes4[] memory newArr) {
        newArr = new bytes4[](maxLength);
        uint256 originalLength = arr.length;
        for (uint256 i = 0; i < originalLength;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, originalLength)
        }
    }

    function pop(bytes4[] memory arr) internal pure returns (bytes4 value) {
        assembly {
            let length := mload(arr)
            returndatacopy(returndatasize(), returndatasize(), iszero(length))
            value := mload(add(arr, shl(5, length)))
            mstore(arr, sub(length, 1))
        }
    }

    function popUnsafe(bytes4[] memory arr) internal pure returns (bytes4 value) {
        // This function is unsafe because it does not check if the array is empty.
        assembly {
            let length := mload(arr)
            value := mload(add(arr, shl(5, length)))
            mstore(arr, sub(length, 1))
        }
    }

    function popLeft(bytes4[] memory arr) internal pure returns (bytes4[] memory newArr, bytes4 value) {
        assembly {
            let length := mload(arr)
            returndatacopy(returndatasize(), returndatasize(), iszero(length))
            value := mload(add(arr, 0x20))
            newArr := add(arr, 0x20)
            mstore(newArr, sub(length, 1))
        }
    }

    function popLeftUnsafe(bytes4[] memory arr) internal pure returns (bytes4[] memory newArr, bytes4 value) {
        // This function is unsafe because it does not check if the array is empty.
        assembly {
            let length := mload(arr)
            value := mload(add(arr, 0x20))
            newArr := add(arr, 0x20)
            mstore(newArr, sub(length, 1))
        }
    }

    function fromFixed(bytes4[1] memory arr) internal pure returns (bytes4[] memory newArr) {
        newArr = new bytes4[](1);
        for (uint256 i = 0; i < 1;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(bytes4[1] memory arr, uint256 maxLength)
        internal
        pure
        returns (bytes4[] memory newArr)
    {
        newArr = new bytes4[](maxLength);
        for (uint256 i = 0; i < 1;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 1)
        }
    }

    function fromFixed(bytes4[2] memory arr) internal pure returns (bytes4[] memory newArr) {
        newArr = new bytes4[](2);
        for (uint256 i = 0; i < 2;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(bytes4[2] memory arr, uint256 maxLength)
        internal
        pure
        returns (bytes4[] memory newArr)
    {
        newArr = new bytes4[](maxLength);
        for (uint256 i = 0; i < 2;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 2)
        }
    }

    function fromFixed(bytes4[3] memory arr) internal pure returns (bytes4[] memory newArr) {
        newArr = new bytes4[](3);
        for (uint256 i = 0; i < 3;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(bytes4[3] memory arr, uint256 maxLength)
        internal
        pure
        returns (bytes4[] memory newArr)
    {
        newArr = new bytes4[](maxLength);
        for (uint256 i = 0; i < 3;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 3)
        }
    }

    function fromFixed(bytes4[4] memory arr) internal pure returns (bytes4[] memory newArr) {
        newArr = new bytes4[](4);
        for (uint256 i = 0; i < 4;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(bytes4[4] memory arr, uint256 maxLength)
        internal
        pure
        returns (bytes4[] memory newArr)
    {
        newArr = new bytes4[](maxLength);
        for (uint256 i = 0; i < 4;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 4)
        }
    }

    function fromFixed(bytes4[5] memory arr) internal pure returns (bytes4[] memory newArr) {
        newArr = new bytes4[](5);
        for (uint256 i = 0; i < 5;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(bytes4[5] memory arr, uint256 maxLength)
        internal
        pure
        returns (bytes4[] memory newArr)
    {
        newArr = new bytes4[](maxLength);
        for (uint256 i = 0; i < 5;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 5)
        }
    }

    function fromFixed(bytes4[6] memory arr) internal pure returns (bytes4[] memory newArr) {
        newArr = new bytes4[](6);
        for (uint256 i = 0; i < 6;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(bytes4[6] memory arr, uint256 maxLength)
        internal
        pure
        returns (bytes4[] memory newArr)
    {
        newArr = new bytes4[](maxLength);
        for (uint256 i = 0; i < 6;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 6)
        }
    }

    function fromFixed(bytes4[7] memory arr) internal pure returns (bytes4[] memory newArr) {
        newArr = new bytes4[](7);
        for (uint256 i = 0; i < 7;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(bytes4[7] memory arr, uint256 maxLength)
        internal
        pure
        returns (bytes4[] memory newArr)
    {
        newArr = new bytes4[](maxLength);
        for (uint256 i = 0; i < 7;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 7)
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

    function bytes8sWithMaxLength(uint256 maxLength, bytes8 a) internal pure returns (bytes8[] memory) {
        bytes8[] memory arr = new bytes8[](maxLength);
        assembly {
            mstore(arr, 1)
        }
        arr[0] = a;
        return arr;
    }

    function bytes8sWithMaxLength(uint256 maxLength, bytes8 a, bytes8 b) internal pure returns (bytes8[] memory) {
        bytes8[] memory arr = new bytes8[](maxLength);
        assembly {
            mstore(arr, 2)
        }
        arr[0] = a;
        arr[1] = b;
        return arr;
    }

    function bytes8sWithMaxLength(uint256 maxLength, bytes8 a, bytes8 b, bytes8 c)
        internal
        pure
        returns (bytes8[] memory)
    {
        bytes8[] memory arr = new bytes8[](maxLength);
        assembly {
            mstore(arr, 3)
        }
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        return arr;
    }

    function bytes8sWithMaxLength(uint256 maxLength, bytes8 a, bytes8 b, bytes8 c, bytes8 d)
        internal
        pure
        returns (bytes8[] memory)
    {
        bytes8[] memory arr = new bytes8[](maxLength);
        assembly {
            mstore(arr, 4)
        }
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        return arr;
    }

    function bytes8sWithMaxLength(uint256 maxLength, bytes8 a, bytes8 b, bytes8 c, bytes8 d, bytes8 e)
        internal
        pure
        returns (bytes8[] memory)
    {
        bytes8[] memory arr = new bytes8[](maxLength);
        assembly {
            mstore(arr, 5)
        }
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        return arr;
    }

    function bytes8sWithMaxLength(uint256 maxLength, bytes8 a, bytes8 b, bytes8 c, bytes8 d, bytes8 e, bytes8 f)
        internal
        pure
        returns (bytes8[] memory)
    {
        bytes8[] memory arr = new bytes8[](maxLength);
        assembly {
            mstore(arr, 6)
        }
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        arr[5] = f;
        return arr;
    }

    function bytes8sWithMaxLength(
        uint256 maxLength,
        bytes8 a,
        bytes8 b,
        bytes8 c,
        bytes8 d,
        bytes8 e,
        bytes8 f,
        bytes8 g
    ) internal pure returns (bytes8[] memory) {
        bytes8[] memory arr = new bytes8[](maxLength);
        assembly {
            mstore(arr, 7)
        }
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

    function truncate(bytes8[] memory arr, uint256 newLength) internal pure returns (bytes8[] memory _arr) {
        // truncate the array
        assembly {
            let oldLength := mload(arr)
            returndatacopy(returndatasize(), returndatasize(), gt(newLength, oldLength))
            mstore(arr, newLength)
            _arr := arr
        }
    }

    function truncateUnsafe(bytes8[] memory arr, uint256 newLength) internal pure returns (bytes8[] memory _arr) {
        // truncate the array
        assembly {
            mstore(arr, newLength)
            _arr := arr
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

    function copy(bytes8[] memory arr) internal pure returns (bytes8[] memory newArr) {
        uint256 length = arr.length;
        newArr = new bytes8[](length);
        for (uint256 i = 0; i < length;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function copyAndResize(bytes8[] memory arr, uint256 newLength) internal pure returns (bytes8[] memory newArr) {
        newArr = new bytes8[](newLength);
        uint256 length = arr.length;
        // allow shrinking a copy without copying extra members
        length = (length > newLength) ? newLength : length;
        for (uint256 i = 0; i < length;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        // TODO: consider writing 0-pointer to the rest of the array if longer for dynamic elements
    }

    function copyAndAllocate(bytes8[] memory arr, uint256 maxLength) internal pure returns (bytes8[] memory newArr) {
        newArr = new bytes8[](maxLength);
        uint256 originalLength = arr.length;
        for (uint256 i = 0; i < originalLength;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, originalLength)
        }
    }

    function pop(bytes8[] memory arr) internal pure returns (bytes8 value) {
        assembly {
            let length := mload(arr)
            returndatacopy(returndatasize(), returndatasize(), iszero(length))
            value := mload(add(arr, shl(5, length)))
            mstore(arr, sub(length, 1))
        }
    }

    function popUnsafe(bytes8[] memory arr) internal pure returns (bytes8 value) {
        // This function is unsafe because it does not check if the array is empty.
        assembly {
            let length := mload(arr)
            value := mload(add(arr, shl(5, length)))
            mstore(arr, sub(length, 1))
        }
    }

    function popLeft(bytes8[] memory arr) internal pure returns (bytes8[] memory newArr, bytes8 value) {
        assembly {
            let length := mload(arr)
            returndatacopy(returndatasize(), returndatasize(), iszero(length))
            value := mload(add(arr, 0x20))
            newArr := add(arr, 0x20)
            mstore(newArr, sub(length, 1))
        }
    }

    function popLeftUnsafe(bytes8[] memory arr) internal pure returns (bytes8[] memory newArr, bytes8 value) {
        // This function is unsafe because it does not check if the array is empty.
        assembly {
            let length := mload(arr)
            value := mload(add(arr, 0x20))
            newArr := add(arr, 0x20)
            mstore(newArr, sub(length, 1))
        }
    }

    function fromFixed(bytes8[1] memory arr) internal pure returns (bytes8[] memory newArr) {
        newArr = new bytes8[](1);
        for (uint256 i = 0; i < 1;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(bytes8[1] memory arr, uint256 maxLength)
        internal
        pure
        returns (bytes8[] memory newArr)
    {
        newArr = new bytes8[](maxLength);
        for (uint256 i = 0; i < 1;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 1)
        }
    }

    function fromFixed(bytes8[2] memory arr) internal pure returns (bytes8[] memory newArr) {
        newArr = new bytes8[](2);
        for (uint256 i = 0; i < 2;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(bytes8[2] memory arr, uint256 maxLength)
        internal
        pure
        returns (bytes8[] memory newArr)
    {
        newArr = new bytes8[](maxLength);
        for (uint256 i = 0; i < 2;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 2)
        }
    }

    function fromFixed(bytes8[3] memory arr) internal pure returns (bytes8[] memory newArr) {
        newArr = new bytes8[](3);
        for (uint256 i = 0; i < 3;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(bytes8[3] memory arr, uint256 maxLength)
        internal
        pure
        returns (bytes8[] memory newArr)
    {
        newArr = new bytes8[](maxLength);
        for (uint256 i = 0; i < 3;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 3)
        }
    }

    function fromFixed(bytes8[4] memory arr) internal pure returns (bytes8[] memory newArr) {
        newArr = new bytes8[](4);
        for (uint256 i = 0; i < 4;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(bytes8[4] memory arr, uint256 maxLength)
        internal
        pure
        returns (bytes8[] memory newArr)
    {
        newArr = new bytes8[](maxLength);
        for (uint256 i = 0; i < 4;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 4)
        }
    }

    function fromFixed(bytes8[5] memory arr) internal pure returns (bytes8[] memory newArr) {
        newArr = new bytes8[](5);
        for (uint256 i = 0; i < 5;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(bytes8[5] memory arr, uint256 maxLength)
        internal
        pure
        returns (bytes8[] memory newArr)
    {
        newArr = new bytes8[](maxLength);
        for (uint256 i = 0; i < 5;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 5)
        }
    }

    function fromFixed(bytes8[6] memory arr) internal pure returns (bytes8[] memory newArr) {
        newArr = new bytes8[](6);
        for (uint256 i = 0; i < 6;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(bytes8[6] memory arr, uint256 maxLength)
        internal
        pure
        returns (bytes8[] memory newArr)
    {
        newArr = new bytes8[](maxLength);
        for (uint256 i = 0; i < 6;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 6)
        }
    }

    function fromFixed(bytes8[7] memory arr) internal pure returns (bytes8[] memory newArr) {
        newArr = new bytes8[](7);
        for (uint256 i = 0; i < 7;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(bytes8[7] memory arr, uint256 maxLength)
        internal
        pure
        returns (bytes8[] memory newArr)
    {
        newArr = new bytes8[](maxLength);
        for (uint256 i = 0; i < 7;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 7)
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

    function bytes20sWithMaxLength(uint256 maxLength, bytes20 a) internal pure returns (bytes20[] memory) {
        bytes20[] memory arr = new bytes20[](maxLength);
        assembly {
            mstore(arr, 1)
        }
        arr[0] = a;
        return arr;
    }

    function bytes20sWithMaxLength(uint256 maxLength, bytes20 a, bytes20 b) internal pure returns (bytes20[] memory) {
        bytes20[] memory arr = new bytes20[](maxLength);
        assembly {
            mstore(arr, 2)
        }
        arr[0] = a;
        arr[1] = b;
        return arr;
    }

    function bytes20sWithMaxLength(uint256 maxLength, bytes20 a, bytes20 b, bytes20 c)
        internal
        pure
        returns (bytes20[] memory)
    {
        bytes20[] memory arr = new bytes20[](maxLength);
        assembly {
            mstore(arr, 3)
        }
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        return arr;
    }

    function bytes20sWithMaxLength(uint256 maxLength, bytes20 a, bytes20 b, bytes20 c, bytes20 d)
        internal
        pure
        returns (bytes20[] memory)
    {
        bytes20[] memory arr = new bytes20[](maxLength);
        assembly {
            mstore(arr, 4)
        }
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        return arr;
    }

    function bytes20sWithMaxLength(uint256 maxLength, bytes20 a, bytes20 b, bytes20 c, bytes20 d, bytes20 e)
        internal
        pure
        returns (bytes20[] memory)
    {
        bytes20[] memory arr = new bytes20[](maxLength);
        assembly {
            mstore(arr, 5)
        }
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        return arr;
    }

    function bytes20sWithMaxLength(uint256 maxLength, bytes20 a, bytes20 b, bytes20 c, bytes20 d, bytes20 e, bytes20 f)
        internal
        pure
        returns (bytes20[] memory)
    {
        bytes20[] memory arr = new bytes20[](maxLength);
        assembly {
            mstore(arr, 6)
        }
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        arr[5] = f;
        return arr;
    }

    function bytes20sWithMaxLength(
        uint256 maxLength,
        bytes20 a,
        bytes20 b,
        bytes20 c,
        bytes20 d,
        bytes20 e,
        bytes20 f,
        bytes20 g
    ) internal pure returns (bytes20[] memory) {
        bytes20[] memory arr = new bytes20[](maxLength);
        assembly {
            mstore(arr, 7)
        }
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

    function truncate(bytes20[] memory arr, uint256 newLength) internal pure returns (bytes20[] memory _arr) {
        // truncate the array
        assembly {
            let oldLength := mload(arr)
            returndatacopy(returndatasize(), returndatasize(), gt(newLength, oldLength))
            mstore(arr, newLength)
            _arr := arr
        }
    }

    function truncateUnsafe(bytes20[] memory arr, uint256 newLength) internal pure returns (bytes20[] memory _arr) {
        // truncate the array
        assembly {
            mstore(arr, newLength)
            _arr := arr
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

    function copy(bytes20[] memory arr) internal pure returns (bytes20[] memory newArr) {
        uint256 length = arr.length;
        newArr = new bytes20[](length);
        for (uint256 i = 0; i < length;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function copyAndResize(bytes20[] memory arr, uint256 newLength) internal pure returns (bytes20[] memory newArr) {
        newArr = new bytes20[](newLength);
        uint256 length = arr.length;
        // allow shrinking a copy without copying extra members
        length = (length > newLength) ? newLength : length;
        for (uint256 i = 0; i < length;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        // TODO: consider writing 0-pointer to the rest of the array if longer for dynamic elements
    }

    function copyAndAllocate(bytes20[] memory arr, uint256 maxLength) internal pure returns (bytes20[] memory newArr) {
        newArr = new bytes20[](maxLength);
        uint256 originalLength = arr.length;
        for (uint256 i = 0; i < originalLength;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, originalLength)
        }
    }

    function pop(bytes20[] memory arr) internal pure returns (bytes20 value) {
        assembly {
            let length := mload(arr)
            returndatacopy(returndatasize(), returndatasize(), iszero(length))
            value := mload(add(arr, shl(5, length)))
            mstore(arr, sub(length, 1))
        }
    }

    function popUnsafe(bytes20[] memory arr) internal pure returns (bytes20 value) {
        // This function is unsafe because it does not check if the array is empty.
        assembly {
            let length := mload(arr)
            value := mload(add(arr, shl(5, length)))
            mstore(arr, sub(length, 1))
        }
    }

    function popLeft(bytes20[] memory arr) internal pure returns (bytes20[] memory newArr, bytes20 value) {
        assembly {
            let length := mload(arr)
            returndatacopy(returndatasize(), returndatasize(), iszero(length))
            value := mload(add(arr, 0x20))
            newArr := add(arr, 0x20)
            mstore(newArr, sub(length, 1))
        }
    }

    function popLeftUnsafe(bytes20[] memory arr) internal pure returns (bytes20[] memory newArr, bytes20 value) {
        // This function is unsafe because it does not check if the array is empty.
        assembly {
            let length := mload(arr)
            value := mload(add(arr, 0x20))
            newArr := add(arr, 0x20)
            mstore(newArr, sub(length, 1))
        }
    }

    function fromFixed(bytes20[1] memory arr) internal pure returns (bytes20[] memory newArr) {
        newArr = new bytes20[](1);
        for (uint256 i = 0; i < 1;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(bytes20[1] memory arr, uint256 maxLength)
        internal
        pure
        returns (bytes20[] memory newArr)
    {
        newArr = new bytes20[](maxLength);
        for (uint256 i = 0; i < 1;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 1)
        }
    }

    function fromFixed(bytes20[2] memory arr) internal pure returns (bytes20[] memory newArr) {
        newArr = new bytes20[](2);
        for (uint256 i = 0; i < 2;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(bytes20[2] memory arr, uint256 maxLength)
        internal
        pure
        returns (bytes20[] memory newArr)
    {
        newArr = new bytes20[](maxLength);
        for (uint256 i = 0; i < 2;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 2)
        }
    }

    function fromFixed(bytes20[3] memory arr) internal pure returns (bytes20[] memory newArr) {
        newArr = new bytes20[](3);
        for (uint256 i = 0; i < 3;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(bytes20[3] memory arr, uint256 maxLength)
        internal
        pure
        returns (bytes20[] memory newArr)
    {
        newArr = new bytes20[](maxLength);
        for (uint256 i = 0; i < 3;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 3)
        }
    }

    function fromFixed(bytes20[4] memory arr) internal pure returns (bytes20[] memory newArr) {
        newArr = new bytes20[](4);
        for (uint256 i = 0; i < 4;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(bytes20[4] memory arr, uint256 maxLength)
        internal
        pure
        returns (bytes20[] memory newArr)
    {
        newArr = new bytes20[](maxLength);
        for (uint256 i = 0; i < 4;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 4)
        }
    }

    function fromFixed(bytes20[5] memory arr) internal pure returns (bytes20[] memory newArr) {
        newArr = new bytes20[](5);
        for (uint256 i = 0; i < 5;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(bytes20[5] memory arr, uint256 maxLength)
        internal
        pure
        returns (bytes20[] memory newArr)
    {
        newArr = new bytes20[](maxLength);
        for (uint256 i = 0; i < 5;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 5)
        }
    }

    function fromFixed(bytes20[6] memory arr) internal pure returns (bytes20[] memory newArr) {
        newArr = new bytes20[](6);
        for (uint256 i = 0; i < 6;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(bytes20[6] memory arr, uint256 maxLength)
        internal
        pure
        returns (bytes20[] memory newArr)
    {
        newArr = new bytes20[](maxLength);
        for (uint256 i = 0; i < 6;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 6)
        }
    }

    function fromFixed(bytes20[7] memory arr) internal pure returns (bytes20[] memory newArr) {
        newArr = new bytes20[](7);
        for (uint256 i = 0; i < 7;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(bytes20[7] memory arr, uint256 maxLength)
        internal
        pure
        returns (bytes20[] memory newArr)
    {
        newArr = new bytes20[](maxLength);
        for (uint256 i = 0; i < 7;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 7)
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

    function bytes32sWithMaxLength(uint256 maxLength, bytes32 a) internal pure returns (bytes32[] memory) {
        bytes32[] memory arr = new bytes32[](maxLength);
        assembly {
            mstore(arr, 1)
        }
        arr[0] = a;
        return arr;
    }

    function bytes32sWithMaxLength(uint256 maxLength, bytes32 a, bytes32 b) internal pure returns (bytes32[] memory) {
        bytes32[] memory arr = new bytes32[](maxLength);
        assembly {
            mstore(arr, 2)
        }
        arr[0] = a;
        arr[1] = b;
        return arr;
    }

    function bytes32sWithMaxLength(uint256 maxLength, bytes32 a, bytes32 b, bytes32 c)
        internal
        pure
        returns (bytes32[] memory)
    {
        bytes32[] memory arr = new bytes32[](maxLength);
        assembly {
            mstore(arr, 3)
        }
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        return arr;
    }

    function bytes32sWithMaxLength(uint256 maxLength, bytes32 a, bytes32 b, bytes32 c, bytes32 d)
        internal
        pure
        returns (bytes32[] memory)
    {
        bytes32[] memory arr = new bytes32[](maxLength);
        assembly {
            mstore(arr, 4)
        }
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        return arr;
    }

    function bytes32sWithMaxLength(uint256 maxLength, bytes32 a, bytes32 b, bytes32 c, bytes32 d, bytes32 e)
        internal
        pure
        returns (bytes32[] memory)
    {
        bytes32[] memory arr = new bytes32[](maxLength);
        assembly {
            mstore(arr, 5)
        }
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        return arr;
    }

    function bytes32sWithMaxLength(uint256 maxLength, bytes32 a, bytes32 b, bytes32 c, bytes32 d, bytes32 e, bytes32 f)
        internal
        pure
        returns (bytes32[] memory)
    {
        bytes32[] memory arr = new bytes32[](maxLength);
        assembly {
            mstore(arr, 6)
        }
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        arr[5] = f;
        return arr;
    }

    function bytes32sWithMaxLength(
        uint256 maxLength,
        bytes32 a,
        bytes32 b,
        bytes32 c,
        bytes32 d,
        bytes32 e,
        bytes32 f,
        bytes32 g
    ) internal pure returns (bytes32[] memory) {
        bytes32[] memory arr = new bytes32[](maxLength);
        assembly {
            mstore(arr, 7)
        }
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

    function truncate(bytes32[] memory arr, uint256 newLength) internal pure returns (bytes32[] memory _arr) {
        // truncate the array
        assembly {
            let oldLength := mload(arr)
            returndatacopy(returndatasize(), returndatasize(), gt(newLength, oldLength))
            mstore(arr, newLength)
            _arr := arr
        }
    }

    function truncateUnsafe(bytes32[] memory arr, uint256 newLength) internal pure returns (bytes32[] memory _arr) {
        // truncate the array
        assembly {
            mstore(arr, newLength)
            _arr := arr
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

    function copy(bytes32[] memory arr) internal pure returns (bytes32[] memory newArr) {
        uint256 length = arr.length;
        newArr = new bytes32[](length);
        for (uint256 i = 0; i < length;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function copyAndResize(bytes32[] memory arr, uint256 newLength) internal pure returns (bytes32[] memory newArr) {
        newArr = new bytes32[](newLength);
        uint256 length = arr.length;
        // allow shrinking a copy without copying extra members
        length = (length > newLength) ? newLength : length;
        for (uint256 i = 0; i < length;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        // TODO: consider writing 0-pointer to the rest of the array if longer for dynamic elements
    }

    function copyAndAllocate(bytes32[] memory arr, uint256 maxLength) internal pure returns (bytes32[] memory newArr) {
        newArr = new bytes32[](maxLength);
        uint256 originalLength = arr.length;
        for (uint256 i = 0; i < originalLength;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, originalLength)
        }
    }

    function pop(bytes32[] memory arr) internal pure returns (bytes32 value) {
        assembly {
            let length := mload(arr)
            returndatacopy(returndatasize(), returndatasize(), iszero(length))
            value := mload(add(arr, shl(5, length)))
            mstore(arr, sub(length, 1))
        }
    }

    function popUnsafe(bytes32[] memory arr) internal pure returns (bytes32 value) {
        // This function is unsafe because it does not check if the array is empty.
        assembly {
            let length := mload(arr)
            value := mload(add(arr, shl(5, length)))
            mstore(arr, sub(length, 1))
        }
    }

    function popLeft(bytes32[] memory arr) internal pure returns (bytes32[] memory newArr, bytes32 value) {
        assembly {
            let length := mload(arr)
            returndatacopy(returndatasize(), returndatasize(), iszero(length))
            value := mload(add(arr, 0x20))
            newArr := add(arr, 0x20)
            mstore(newArr, sub(length, 1))
        }
    }

    function popLeftUnsafe(bytes32[] memory arr) internal pure returns (bytes32[] memory newArr, bytes32 value) {
        // This function is unsafe because it does not check if the array is empty.
        assembly {
            let length := mload(arr)
            value := mload(add(arr, 0x20))
            newArr := add(arr, 0x20)
            mstore(newArr, sub(length, 1))
        }
    }

    function fromFixed(bytes32[1] memory arr) internal pure returns (bytes32[] memory newArr) {
        newArr = new bytes32[](1);
        for (uint256 i = 0; i < 1;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(bytes32[1] memory arr, uint256 maxLength)
        internal
        pure
        returns (bytes32[] memory newArr)
    {
        newArr = new bytes32[](maxLength);
        for (uint256 i = 0; i < 1;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 1)
        }
    }

    function fromFixed(bytes32[2] memory arr) internal pure returns (bytes32[] memory newArr) {
        newArr = new bytes32[](2);
        for (uint256 i = 0; i < 2;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(bytes32[2] memory arr, uint256 maxLength)
        internal
        pure
        returns (bytes32[] memory newArr)
    {
        newArr = new bytes32[](maxLength);
        for (uint256 i = 0; i < 2;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 2)
        }
    }

    function fromFixed(bytes32[3] memory arr) internal pure returns (bytes32[] memory newArr) {
        newArr = new bytes32[](3);
        for (uint256 i = 0; i < 3;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(bytes32[3] memory arr, uint256 maxLength)
        internal
        pure
        returns (bytes32[] memory newArr)
    {
        newArr = new bytes32[](maxLength);
        for (uint256 i = 0; i < 3;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 3)
        }
    }

    function fromFixed(bytes32[4] memory arr) internal pure returns (bytes32[] memory newArr) {
        newArr = new bytes32[](4);
        for (uint256 i = 0; i < 4;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(bytes32[4] memory arr, uint256 maxLength)
        internal
        pure
        returns (bytes32[] memory newArr)
    {
        newArr = new bytes32[](maxLength);
        for (uint256 i = 0; i < 4;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 4)
        }
    }

    function fromFixed(bytes32[5] memory arr) internal pure returns (bytes32[] memory newArr) {
        newArr = new bytes32[](5);
        for (uint256 i = 0; i < 5;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(bytes32[5] memory arr, uint256 maxLength)
        internal
        pure
        returns (bytes32[] memory newArr)
    {
        newArr = new bytes32[](maxLength);
        for (uint256 i = 0; i < 5;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 5)
        }
    }

    function fromFixed(bytes32[6] memory arr) internal pure returns (bytes32[] memory newArr) {
        newArr = new bytes32[](6);
        for (uint256 i = 0; i < 6;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(bytes32[6] memory arr, uint256 maxLength)
        internal
        pure
        returns (bytes32[] memory newArr)
    {
        newArr = new bytes32[](maxLength);
        for (uint256 i = 0; i < 6;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 6)
        }
    }

    function fromFixed(bytes32[7] memory arr) internal pure returns (bytes32[] memory newArr) {
        newArr = new bytes32[](7);
        for (uint256 i = 0; i < 7;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(bytes32[7] memory arr, uint256 maxLength)
        internal
        pure
        returns (bytes32[] memory newArr)
    {
        newArr = new bytes32[](maxLength);
        for (uint256 i = 0; i < 7;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 7)
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

    function addressesWithMaxLength(uint256 maxLength, address a) internal pure returns (address[] memory) {
        address[] memory arr = new address[](maxLength);
        assembly {
            mstore(arr, 1)
        }
        arr[0] = a;
        return arr;
    }

    function addressesWithMaxLength(uint256 maxLength, address a, address b) internal pure returns (address[] memory) {
        address[] memory arr = new address[](maxLength);
        assembly {
            mstore(arr, 2)
        }
        arr[0] = a;
        arr[1] = b;
        return arr;
    }

    function addressesWithMaxLength(uint256 maxLength, address a, address b, address c)
        internal
        pure
        returns (address[] memory)
    {
        address[] memory arr = new address[](maxLength);
        assembly {
            mstore(arr, 3)
        }
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        return arr;
    }

    function addressesWithMaxLength(uint256 maxLength, address a, address b, address c, address d)
        internal
        pure
        returns (address[] memory)
    {
        address[] memory arr = new address[](maxLength);
        assembly {
            mstore(arr, 4)
        }
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        return arr;
    }

    function addressesWithMaxLength(uint256 maxLength, address a, address b, address c, address d, address e)
        internal
        pure
        returns (address[] memory)
    {
        address[] memory arr = new address[](maxLength);
        assembly {
            mstore(arr, 5)
        }
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        return arr;
    }

    function addressesWithMaxLength(uint256 maxLength, address a, address b, address c, address d, address e, address f)
        internal
        pure
        returns (address[] memory)
    {
        address[] memory arr = new address[](maxLength);
        assembly {
            mstore(arr, 6)
        }
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        arr[5] = f;
        return arr;
    }

    function addressesWithMaxLength(
        uint256 maxLength,
        address a,
        address b,
        address c,
        address d,
        address e,
        address f,
        address g
    ) internal pure returns (address[] memory) {
        address[] memory arr = new address[](maxLength);
        assembly {
            mstore(arr, 7)
        }
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

    function truncate(address[] memory arr, uint256 newLength) internal pure returns (address[] memory _arr) {
        // truncate the array
        assembly {
            let oldLength := mload(arr)
            returndatacopy(returndatasize(), returndatasize(), gt(newLength, oldLength))
            mstore(arr, newLength)
            _arr := arr
        }
    }

    function truncateUnsafe(address[] memory arr, uint256 newLength) internal pure returns (address[] memory _arr) {
        // truncate the array
        assembly {
            mstore(arr, newLength)
            _arr := arr
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

    function copy(address[] memory arr) internal pure returns (address[] memory newArr) {
        uint256 length = arr.length;
        newArr = new address[](length);
        for (uint256 i = 0; i < length;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function copyAndResize(address[] memory arr, uint256 newLength) internal pure returns (address[] memory newArr) {
        newArr = new address[](newLength);
        uint256 length = arr.length;
        // allow shrinking a copy without copying extra members
        length = (length > newLength) ? newLength : length;
        for (uint256 i = 0; i < length;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        // TODO: consider writing 0-pointer to the rest of the array if longer for dynamic elements
    }

    function copyAndAllocate(address[] memory arr, uint256 maxLength) internal pure returns (address[] memory newArr) {
        newArr = new address[](maxLength);
        uint256 originalLength = arr.length;
        for (uint256 i = 0; i < originalLength;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, originalLength)
        }
    }

    function pop(address[] memory arr) internal pure returns (address value) {
        assembly {
            let length := mload(arr)
            returndatacopy(returndatasize(), returndatasize(), iszero(length))
            value := mload(add(arr, shl(5, length)))
            mstore(arr, sub(length, 1))
        }
    }

    function popUnsafe(address[] memory arr) internal pure returns (address value) {
        // This function is unsafe because it does not check if the array is empty.
        assembly {
            let length := mload(arr)
            value := mload(add(arr, shl(5, length)))
            mstore(arr, sub(length, 1))
        }
    }

    function popLeft(address[] memory arr) internal pure returns (address[] memory newArr, address value) {
        assembly {
            let length := mload(arr)
            returndatacopy(returndatasize(), returndatasize(), iszero(length))
            value := mload(add(arr, 0x20))
            newArr := add(arr, 0x20)
            mstore(newArr, sub(length, 1))
        }
    }

    function popLeftUnsafe(address[] memory arr) internal pure returns (address[] memory newArr, address value) {
        // This function is unsafe because it does not check if the array is empty.
        assembly {
            let length := mload(arr)
            value := mload(add(arr, 0x20))
            newArr := add(arr, 0x20)
            mstore(newArr, sub(length, 1))
        }
    }

    function fromFixed(address[1] memory arr) internal pure returns (address[] memory newArr) {
        newArr = new address[](1);
        for (uint256 i = 0; i < 1;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(address[1] memory arr, uint256 maxLength)
        internal
        pure
        returns (address[] memory newArr)
    {
        newArr = new address[](maxLength);
        for (uint256 i = 0; i < 1;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 1)
        }
    }

    function fromFixed(address[2] memory arr) internal pure returns (address[] memory newArr) {
        newArr = new address[](2);
        for (uint256 i = 0; i < 2;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(address[2] memory arr, uint256 maxLength)
        internal
        pure
        returns (address[] memory newArr)
    {
        newArr = new address[](maxLength);
        for (uint256 i = 0; i < 2;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 2)
        }
    }

    function fromFixed(address[3] memory arr) internal pure returns (address[] memory newArr) {
        newArr = new address[](3);
        for (uint256 i = 0; i < 3;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(address[3] memory arr, uint256 maxLength)
        internal
        pure
        returns (address[] memory newArr)
    {
        newArr = new address[](maxLength);
        for (uint256 i = 0; i < 3;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 3)
        }
    }

    function fromFixed(address[4] memory arr) internal pure returns (address[] memory newArr) {
        newArr = new address[](4);
        for (uint256 i = 0; i < 4;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(address[4] memory arr, uint256 maxLength)
        internal
        pure
        returns (address[] memory newArr)
    {
        newArr = new address[](maxLength);
        for (uint256 i = 0; i < 4;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 4)
        }
    }

    function fromFixed(address[5] memory arr) internal pure returns (address[] memory newArr) {
        newArr = new address[](5);
        for (uint256 i = 0; i < 5;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(address[5] memory arr, uint256 maxLength)
        internal
        pure
        returns (address[] memory newArr)
    {
        newArr = new address[](maxLength);
        for (uint256 i = 0; i < 5;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 5)
        }
    }

    function fromFixed(address[6] memory arr) internal pure returns (address[] memory newArr) {
        newArr = new address[](6);
        for (uint256 i = 0; i < 6;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(address[6] memory arr, uint256 maxLength)
        internal
        pure
        returns (address[] memory newArr)
    {
        newArr = new address[](maxLength);
        for (uint256 i = 0; i < 6;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 6)
        }
    }

    function fromFixed(address[7] memory arr) internal pure returns (address[] memory newArr) {
        newArr = new address[](7);
        for (uint256 i = 0; i < 7;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(address[7] memory arr, uint256 maxLength)
        internal
        pure
        returns (address[] memory newArr)
    {
        newArr = new address[](maxLength);
        for (uint256 i = 0; i < 7;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 7)
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

    function boolsWithMaxLength(uint256 maxLength, bool a) internal pure returns (bool[] memory) {
        bool[] memory arr = new bool[](maxLength);
        assembly {
            mstore(arr, 1)
        }
        arr[0] = a;
        return arr;
    }

    function boolsWithMaxLength(uint256 maxLength, bool a, bool b) internal pure returns (bool[] memory) {
        bool[] memory arr = new bool[](maxLength);
        assembly {
            mstore(arr, 2)
        }
        arr[0] = a;
        arr[1] = b;
        return arr;
    }

    function boolsWithMaxLength(uint256 maxLength, bool a, bool b, bool c) internal pure returns (bool[] memory) {
        bool[] memory arr = new bool[](maxLength);
        assembly {
            mstore(arr, 3)
        }
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        return arr;
    }

    function boolsWithMaxLength(uint256 maxLength, bool a, bool b, bool c, bool d)
        internal
        pure
        returns (bool[] memory)
    {
        bool[] memory arr = new bool[](maxLength);
        assembly {
            mstore(arr, 4)
        }
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        return arr;
    }

    function boolsWithMaxLength(uint256 maxLength, bool a, bool b, bool c, bool d, bool e)
        internal
        pure
        returns (bool[] memory)
    {
        bool[] memory arr = new bool[](maxLength);
        assembly {
            mstore(arr, 5)
        }
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        return arr;
    }

    function boolsWithMaxLength(uint256 maxLength, bool a, bool b, bool c, bool d, bool e, bool f)
        internal
        pure
        returns (bool[] memory)
    {
        bool[] memory arr = new bool[](maxLength);
        assembly {
            mstore(arr, 6)
        }
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        arr[5] = f;
        return arr;
    }

    function boolsWithMaxLength(uint256 maxLength, bool a, bool b, bool c, bool d, bool e, bool f, bool g)
        internal
        pure
        returns (bool[] memory)
    {
        bool[] memory arr = new bool[](maxLength);
        assembly {
            mstore(arr, 7)
        }
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

    function truncate(bool[] memory arr, uint256 newLength) internal pure returns (bool[] memory _arr) {
        // truncate the array
        assembly {
            let oldLength := mload(arr)
            returndatacopy(returndatasize(), returndatasize(), gt(newLength, oldLength))
            mstore(arr, newLength)
            _arr := arr
        }
    }

    function truncateUnsafe(bool[] memory arr, uint256 newLength) internal pure returns (bool[] memory _arr) {
        // truncate the array
        assembly {
            mstore(arr, newLength)
            _arr := arr
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

    function copy(bool[] memory arr) internal pure returns (bool[] memory newArr) {
        uint256 length = arr.length;
        newArr = new bool[](length);
        for (uint256 i = 0; i < length;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function copyAndResize(bool[] memory arr, uint256 newLength) internal pure returns (bool[] memory newArr) {
        newArr = new bool[](newLength);
        uint256 length = arr.length;
        // allow shrinking a copy without copying extra members
        length = (length > newLength) ? newLength : length;
        for (uint256 i = 0; i < length;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        // TODO: consider writing 0-pointer to the rest of the array if longer for dynamic elements
    }

    function copyAndAllocate(bool[] memory arr, uint256 maxLength) internal pure returns (bool[] memory newArr) {
        newArr = new bool[](maxLength);
        uint256 originalLength = arr.length;
        for (uint256 i = 0; i < originalLength;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, originalLength)
        }
    }

    function pop(bool[] memory arr) internal pure returns (bool value) {
        assembly {
            let length := mload(arr)
            returndatacopy(returndatasize(), returndatasize(), iszero(length))
            value := mload(add(arr, shl(5, length)))
            mstore(arr, sub(length, 1))
        }
    }

    function popUnsafe(bool[] memory arr) internal pure returns (bool value) {
        // This function is unsafe because it does not check if the array is empty.
        assembly {
            let length := mload(arr)
            value := mload(add(arr, shl(5, length)))
            mstore(arr, sub(length, 1))
        }
    }

    function popLeft(bool[] memory arr) internal pure returns (bool[] memory newArr, bool value) {
        assembly {
            let length := mload(arr)
            returndatacopy(returndatasize(), returndatasize(), iszero(length))
            value := mload(add(arr, 0x20))
            newArr := add(arr, 0x20)
            mstore(newArr, sub(length, 1))
        }
    }

    function popLeftUnsafe(bool[] memory arr) internal pure returns (bool[] memory newArr, bool value) {
        // This function is unsafe because it does not check if the array is empty.
        assembly {
            let length := mload(arr)
            value := mload(add(arr, 0x20))
            newArr := add(arr, 0x20)
            mstore(newArr, sub(length, 1))
        }
    }

    function fromFixed(bool[1] memory arr) internal pure returns (bool[] memory newArr) {
        newArr = new bool[](1);
        for (uint256 i = 0; i < 1;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(bool[1] memory arr, uint256 maxLength)
        internal
        pure
        returns (bool[] memory newArr)
    {
        newArr = new bool[](maxLength);
        for (uint256 i = 0; i < 1;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 1)
        }
    }

    function fromFixed(bool[2] memory arr) internal pure returns (bool[] memory newArr) {
        newArr = new bool[](2);
        for (uint256 i = 0; i < 2;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(bool[2] memory arr, uint256 maxLength)
        internal
        pure
        returns (bool[] memory newArr)
    {
        newArr = new bool[](maxLength);
        for (uint256 i = 0; i < 2;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 2)
        }
    }

    function fromFixed(bool[3] memory arr) internal pure returns (bool[] memory newArr) {
        newArr = new bool[](3);
        for (uint256 i = 0; i < 3;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(bool[3] memory arr, uint256 maxLength)
        internal
        pure
        returns (bool[] memory newArr)
    {
        newArr = new bool[](maxLength);
        for (uint256 i = 0; i < 3;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 3)
        }
    }

    function fromFixed(bool[4] memory arr) internal pure returns (bool[] memory newArr) {
        newArr = new bool[](4);
        for (uint256 i = 0; i < 4;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(bool[4] memory arr, uint256 maxLength)
        internal
        pure
        returns (bool[] memory newArr)
    {
        newArr = new bool[](maxLength);
        for (uint256 i = 0; i < 4;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 4)
        }
    }

    function fromFixed(bool[5] memory arr) internal pure returns (bool[] memory newArr) {
        newArr = new bool[](5);
        for (uint256 i = 0; i < 5;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(bool[5] memory arr, uint256 maxLength)
        internal
        pure
        returns (bool[] memory newArr)
    {
        newArr = new bool[](maxLength);
        for (uint256 i = 0; i < 5;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 5)
        }
    }

    function fromFixed(bool[6] memory arr) internal pure returns (bool[] memory newArr) {
        newArr = new bool[](6);
        for (uint256 i = 0; i < 6;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(bool[6] memory arr, uint256 maxLength)
        internal
        pure
        returns (bool[] memory newArr)
    {
        newArr = new bool[](maxLength);
        for (uint256 i = 0; i < 6;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 6)
        }
    }

    function fromFixed(bool[7] memory arr) internal pure returns (bool[] memory newArr) {
        newArr = new bool[](7);
        for (uint256 i = 0; i < 7;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(bool[7] memory arr, uint256 maxLength)
        internal
        pure
        returns (bool[] memory newArr)
    {
        newArr = new bool[](maxLength);
        for (uint256 i = 0; i < 7;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 7)
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

    function bytesArrayWithMaxLength(uint256 maxLength, bytes memory a) internal pure returns (bytes[] memory) {
        bytes[] memory arr = new bytes[](maxLength);
        assembly {
            mstore(arr, 1)
        }
        arr[0] = a;
        return arr;
    }

    function bytesArrayWithMaxLength(uint256 maxLength, bytes memory a, bytes memory b)
        internal
        pure
        returns (bytes[] memory)
    {
        bytes[] memory arr = new bytes[](maxLength);
        assembly {
            mstore(arr, 2)
        }
        arr[0] = a;
        arr[1] = b;
        return arr;
    }

    function bytesArrayWithMaxLength(uint256 maxLength, bytes memory a, bytes memory b, bytes memory c)
        internal
        pure
        returns (bytes[] memory)
    {
        bytes[] memory arr = new bytes[](maxLength);
        assembly {
            mstore(arr, 3)
        }
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        return arr;
    }

    function bytesArrayWithMaxLength(uint256 maxLength, bytes memory a, bytes memory b, bytes memory c, bytes memory d)
        internal
        pure
        returns (bytes[] memory)
    {
        bytes[] memory arr = new bytes[](maxLength);
        assembly {
            mstore(arr, 4)
        }
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        return arr;
    }

    function bytesArrayWithMaxLength(
        uint256 maxLength,
        bytes memory a,
        bytes memory b,
        bytes memory c,
        bytes memory d,
        bytes memory e
    ) internal pure returns (bytes[] memory) {
        bytes[] memory arr = new bytes[](maxLength);
        assembly {
            mstore(arr, 5)
        }
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        return arr;
    }

    function bytesArrayWithMaxLength(
        uint256 maxLength,
        bytes memory a,
        bytes memory b,
        bytes memory c,
        bytes memory d,
        bytes memory e,
        bytes memory f
    ) internal pure returns (bytes[] memory) {
        bytes[] memory arr = new bytes[](maxLength);
        assembly {
            mstore(arr, 6)
        }
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        arr[5] = f;
        return arr;
    }

    function bytesArrayWithMaxLength(
        uint256 maxLength,
        bytes memory a,
        bytes memory b,
        bytes memory c,
        bytes memory d,
        bytes memory e,
        bytes memory f,
        bytes memory g
    ) internal pure returns (bytes[] memory) {
        bytes[] memory arr = new bytes[](maxLength);
        assembly {
            mstore(arr, 7)
        }
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

    function truncate(bytes[] memory arr, uint256 newLength) internal pure returns (bytes[] memory _arr) {
        // truncate the array
        assembly {
            let oldLength := mload(arr)
            returndatacopy(returndatasize(), returndatasize(), gt(newLength, oldLength))
            mstore(arr, newLength)
            _arr := arr
        }
    }

    function truncateUnsafe(bytes[] memory arr, uint256 newLength) internal pure returns (bytes[] memory _arr) {
        // truncate the array
        assembly {
            mstore(arr, newLength)
            _arr := arr
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

    function copy(bytes[] memory arr) internal pure returns (bytes[] memory newArr) {
        uint256 length = arr.length;
        newArr = new bytes[](length);
        for (uint256 i = 0; i < length;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function copyAndResize(bytes[] memory arr, uint256 newLength) internal pure returns (bytes[] memory newArr) {
        newArr = new bytes[](newLength);
        uint256 length = arr.length;
        // allow shrinking a copy without copying extra members
        length = (length > newLength) ? newLength : length;
        for (uint256 i = 0; i < length;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        // TODO: consider writing 0-pointer to the rest of the array if longer for dynamic elements
    }

    function copyAndAllocate(bytes[] memory arr, uint256 maxLength) internal pure returns (bytes[] memory newArr) {
        newArr = new bytes[](maxLength);
        uint256 originalLength = arr.length;
        for (uint256 i = 0; i < originalLength;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, originalLength)
        }
    }

    function pop(bytes[] memory arr) internal pure returns (bytes memory value) {
        assembly {
            let length := mload(arr)
            returndatacopy(returndatasize(), returndatasize(), iszero(length))
            value := mload(add(arr, shl(5, length)))
            mstore(arr, sub(length, 1))
        }
    }

    function popUnsafe(bytes[] memory arr) internal pure returns (bytes memory value) {
        // This function is unsafe because it does not check if the array is empty.
        assembly {
            let length := mload(arr)
            value := mload(add(arr, shl(5, length)))
            mstore(arr, sub(length, 1))
        }
    }

    function popLeft(bytes[] memory arr) internal pure returns (bytes[] memory newArr, bytes memory value) {
        assembly {
            let length := mload(arr)
            returndatacopy(returndatasize(), returndatasize(), iszero(length))
            value := mload(add(arr, 0x20))
            newArr := add(arr, 0x20)
            mstore(newArr, sub(length, 1))
        }
    }

    function popLeftUnsafe(bytes[] memory arr) internal pure returns (bytes[] memory newArr, bytes memory value) {
        // This function is unsafe because it does not check if the array is empty.
        assembly {
            let length := mload(arr)
            value := mload(add(arr, 0x20))
            newArr := add(arr, 0x20)
            mstore(newArr, sub(length, 1))
        }
    }

    function fromFixed(bytes[1] memory arr) internal pure returns (bytes[] memory newArr) {
        newArr = new bytes[](1);
        for (uint256 i = 0; i < 1;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(bytes[1] memory arr, uint256 maxLength)
        internal
        pure
        returns (bytes[] memory newArr)
    {
        newArr = new bytes[](maxLength);
        for (uint256 i = 0; i < 1;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 1)
        }
    }

    function fromFixed(bytes[2] memory arr) internal pure returns (bytes[] memory newArr) {
        newArr = new bytes[](2);
        for (uint256 i = 0; i < 2;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(bytes[2] memory arr, uint256 maxLength)
        internal
        pure
        returns (bytes[] memory newArr)
    {
        newArr = new bytes[](maxLength);
        for (uint256 i = 0; i < 2;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 2)
        }
    }

    function fromFixed(bytes[3] memory arr) internal pure returns (bytes[] memory newArr) {
        newArr = new bytes[](3);
        for (uint256 i = 0; i < 3;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(bytes[3] memory arr, uint256 maxLength)
        internal
        pure
        returns (bytes[] memory newArr)
    {
        newArr = new bytes[](maxLength);
        for (uint256 i = 0; i < 3;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 3)
        }
    }

    function fromFixed(bytes[4] memory arr) internal pure returns (bytes[] memory newArr) {
        newArr = new bytes[](4);
        for (uint256 i = 0; i < 4;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(bytes[4] memory arr, uint256 maxLength)
        internal
        pure
        returns (bytes[] memory newArr)
    {
        newArr = new bytes[](maxLength);
        for (uint256 i = 0; i < 4;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 4)
        }
    }

    function fromFixed(bytes[5] memory arr) internal pure returns (bytes[] memory newArr) {
        newArr = new bytes[](5);
        for (uint256 i = 0; i < 5;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(bytes[5] memory arr, uint256 maxLength)
        internal
        pure
        returns (bytes[] memory newArr)
    {
        newArr = new bytes[](maxLength);
        for (uint256 i = 0; i < 5;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 5)
        }
    }

    function fromFixed(bytes[6] memory arr) internal pure returns (bytes[] memory newArr) {
        newArr = new bytes[](6);
        for (uint256 i = 0; i < 6;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(bytes[6] memory arr, uint256 maxLength)
        internal
        pure
        returns (bytes[] memory newArr)
    {
        newArr = new bytes[](maxLength);
        for (uint256 i = 0; i < 6;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 6)
        }
    }

    function fromFixed(bytes[7] memory arr) internal pure returns (bytes[] memory newArr) {
        newArr = new bytes[](7);
        for (uint256 i = 0; i < 7;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(bytes[7] memory arr, uint256 maxLength)
        internal
        pure
        returns (bytes[] memory newArr)
    {
        newArr = new bytes[](maxLength);
        for (uint256 i = 0; i < 7;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 7)
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

    function stringsWithMaxLength(uint256 maxLength, string memory a) internal pure returns (string[] memory) {
        string[] memory arr = new string[](maxLength);
        assembly {
            mstore(arr, 1)
        }
        arr[0] = a;
        return arr;
    }

    function stringsWithMaxLength(uint256 maxLength, string memory a, string memory b)
        internal
        pure
        returns (string[] memory)
    {
        string[] memory arr = new string[](maxLength);
        assembly {
            mstore(arr, 2)
        }
        arr[0] = a;
        arr[1] = b;
        return arr;
    }

    function stringsWithMaxLength(uint256 maxLength, string memory a, string memory b, string memory c)
        internal
        pure
        returns (string[] memory)
    {
        string[] memory arr = new string[](maxLength);
        assembly {
            mstore(arr, 3)
        }
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        return arr;
    }

    function stringsWithMaxLength(uint256 maxLength, string memory a, string memory b, string memory c, string memory d)
        internal
        pure
        returns (string[] memory)
    {
        string[] memory arr = new string[](maxLength);
        assembly {
            mstore(arr, 4)
        }
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        return arr;
    }

    function stringsWithMaxLength(
        uint256 maxLength,
        string memory a,
        string memory b,
        string memory c,
        string memory d,
        string memory e
    ) internal pure returns (string[] memory) {
        string[] memory arr = new string[](maxLength);
        assembly {
            mstore(arr, 5)
        }
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        return arr;
    }

    function stringsWithMaxLength(
        uint256 maxLength,
        string memory a,
        string memory b,
        string memory c,
        string memory d,
        string memory e,
        string memory f
    ) internal pure returns (string[] memory) {
        string[] memory arr = new string[](maxLength);
        assembly {
            mstore(arr, 6)
        }
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        arr[5] = f;
        return arr;
    }

    function stringsWithMaxLength(
        uint256 maxLength,
        string memory a,
        string memory b,
        string memory c,
        string memory d,
        string memory e,
        string memory f,
        string memory g
    ) internal pure returns (string[] memory) {
        string[] memory arr = new string[](maxLength);
        assembly {
            mstore(arr, 7)
        }
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

    function truncate(string[] memory arr, uint256 newLength) internal pure returns (string[] memory _arr) {
        // truncate the array
        assembly {
            let oldLength := mload(arr)
            returndatacopy(returndatasize(), returndatasize(), gt(newLength, oldLength))
            mstore(arr, newLength)
            _arr := arr
        }
    }

    function truncateUnsafe(string[] memory arr, uint256 newLength) internal pure returns (string[] memory _arr) {
        // truncate the array
        assembly {
            mstore(arr, newLength)
            _arr := arr
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

    function copy(string[] memory arr) internal pure returns (string[] memory newArr) {
        uint256 length = arr.length;
        newArr = new string[](length);
        for (uint256 i = 0; i < length;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function copyAndResize(string[] memory arr, uint256 newLength) internal pure returns (string[] memory newArr) {
        newArr = new string[](newLength);
        uint256 length = arr.length;
        // allow shrinking a copy without copying extra members
        length = (length > newLength) ? newLength : length;
        for (uint256 i = 0; i < length;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        // TODO: consider writing 0-pointer to the rest of the array if longer for dynamic elements
    }

    function copyAndAllocate(string[] memory arr, uint256 maxLength) internal pure returns (string[] memory newArr) {
        newArr = new string[](maxLength);
        uint256 originalLength = arr.length;
        for (uint256 i = 0; i < originalLength;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, originalLength)
        }
    }

    function pop(string[] memory arr) internal pure returns (string memory value) {
        assembly {
            let length := mload(arr)
            returndatacopy(returndatasize(), returndatasize(), iszero(length))
            value := mload(add(arr, shl(5, length)))
            mstore(arr, sub(length, 1))
        }
    }

    function popUnsafe(string[] memory arr) internal pure returns (string memory value) {
        // This function is unsafe because it does not check if the array is empty.
        assembly {
            let length := mload(arr)
            value := mload(add(arr, shl(5, length)))
            mstore(arr, sub(length, 1))
        }
    }

    function popLeft(string[] memory arr) internal pure returns (string[] memory newArr, string memory value) {
        assembly {
            let length := mload(arr)
            returndatacopy(returndatasize(), returndatasize(), iszero(length))
            value := mload(add(arr, 0x20))
            newArr := add(arr, 0x20)
            mstore(newArr, sub(length, 1))
        }
    }

    function popLeftUnsafe(string[] memory arr) internal pure returns (string[] memory newArr, string memory value) {
        // This function is unsafe because it does not check if the array is empty.
        assembly {
            let length := mload(arr)
            value := mload(add(arr, 0x20))
            newArr := add(arr, 0x20)
            mstore(newArr, sub(length, 1))
        }
    }

    function fromFixed(string[1] memory arr) internal pure returns (string[] memory newArr) {
        newArr = new string[](1);
        for (uint256 i = 0; i < 1;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(string[1] memory arr, uint256 maxLength)
        internal
        pure
        returns (string[] memory newArr)
    {
        newArr = new string[](maxLength);
        for (uint256 i = 0; i < 1;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 1)
        }
    }

    function fromFixed(string[2] memory arr) internal pure returns (string[] memory newArr) {
        newArr = new string[](2);
        for (uint256 i = 0; i < 2;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(string[2] memory arr, uint256 maxLength)
        internal
        pure
        returns (string[] memory newArr)
    {
        newArr = new string[](maxLength);
        for (uint256 i = 0; i < 2;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 2)
        }
    }

    function fromFixed(string[3] memory arr) internal pure returns (string[] memory newArr) {
        newArr = new string[](3);
        for (uint256 i = 0; i < 3;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(string[3] memory arr, uint256 maxLength)
        internal
        pure
        returns (string[] memory newArr)
    {
        newArr = new string[](maxLength);
        for (uint256 i = 0; i < 3;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 3)
        }
    }

    function fromFixed(string[4] memory arr) internal pure returns (string[] memory newArr) {
        newArr = new string[](4);
        for (uint256 i = 0; i < 4;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(string[4] memory arr, uint256 maxLength)
        internal
        pure
        returns (string[] memory newArr)
    {
        newArr = new string[](maxLength);
        for (uint256 i = 0; i < 4;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 4)
        }
    }

    function fromFixed(string[5] memory arr) internal pure returns (string[] memory newArr) {
        newArr = new string[](5);
        for (uint256 i = 0; i < 5;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(string[5] memory arr, uint256 maxLength)
        internal
        pure
        returns (string[] memory newArr)
    {
        newArr = new string[](maxLength);
        for (uint256 i = 0; i < 5;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 5)
        }
    }

    function fromFixed(string[6] memory arr) internal pure returns (string[] memory newArr) {
        newArr = new string[](6);
        for (uint256 i = 0; i < 6;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(string[6] memory arr, uint256 maxLength)
        internal
        pure
        returns (string[] memory newArr)
    {
        newArr = new string[](maxLength);
        for (uint256 i = 0; i < 6;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 6)
        }
    }

    function fromFixed(string[7] memory arr) internal pure returns (string[] memory newArr) {
        newArr = new string[](7);
        for (uint256 i = 0; i < 7;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
    }

    function fromFixedWithMaxLength(string[7] memory arr, uint256 maxLength)
        internal
        pure
        returns (string[] memory newArr)
    {
        newArr = new string[](maxLength);
        for (uint256 i = 0; i < 7;) {
            newArr[i] = arr[i];
            unchecked {
                ++i;
            }
        }
        assembly {
            mstore(newArr, 7)
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

    function uintsWithMaxLength(uint256 maxLength, uint256 a) internal pure returns (uint256[] memory) {
        uint256[] memory arr = new uint[](maxLength);
        assembly {
            mstore(arr, 1)
        }
        arr[0] = a;
        return arr;
    }

    function uintsWithMaxLength(uint256 maxLength, uint256 a, uint256 b) internal pure returns (uint256[] memory) {
        uint256[] memory arr = new uint[](maxLength);
        assembly {
            mstore(arr, 2)
        }
        arr[0] = a;
        arr[1] = b;
        return arr;
    }

    function uintsWithMaxLength(uint256 maxLength, uint256 a, uint256 b, uint256 c)
        internal
        pure
        returns (uint256[] memory)
    {
        uint256[] memory arr = new uint[](maxLength);
        assembly {
            mstore(arr, 3)
        }
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        return arr;
    }

    function uintsWithMaxLength(uint256 maxLength, uint256 a, uint256 b, uint256 c, uint256 d)
        internal
        pure
        returns (uint256[] memory)
    {
        uint256[] memory arr = new uint[](maxLength);
        assembly {
            mstore(arr, 4)
        }
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        return arr;
    }

    function uintsWithMaxLength(uint256 maxLength, uint256 a, uint256 b, uint256 c, uint256 d, uint256 e)
        internal
        pure
        returns (uint256[] memory)
    {
        uint256[] memory arr = new uint[](maxLength);
        assembly {
            mstore(arr, 5)
        }
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        return arr;
    }

    function uintsWithMaxLength(uint256 maxLength, uint256 a, uint256 b, uint256 c, uint256 d, uint256 e, uint256 f)
        internal
        pure
        returns (uint256[] memory)
    {
        uint256[] memory arr = new uint[](maxLength);
        assembly {
            mstore(arr, 6)
        }
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        arr[5] = f;
        return arr;
    }

    function uintsWithMaxLength(
        uint256 maxLength,
        uint256 a,
        uint256 b,
        uint256 c,
        uint256 d,
        uint256 e,
        uint256 f,
        uint256 g
    ) internal pure returns (uint256[] memory) {
        uint256[] memory arr = new uint[](maxLength);
        assembly {
            mstore(arr, 7)
        }
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

    function intsWithMaxLength(uint256 maxLength, int256 a) internal pure returns (int256[] memory) {
        int256[] memory arr = new int[](maxLength);
        assembly {
            mstore(arr, 1)
        }
        arr[0] = a;
        return arr;
    }

    function intsWithMaxLength(uint256 maxLength, int256 a, int256 b) internal pure returns (int256[] memory) {
        int256[] memory arr = new int[](maxLength);
        assembly {
            mstore(arr, 2)
        }
        arr[0] = a;
        arr[1] = b;
        return arr;
    }

    function intsWithMaxLength(uint256 maxLength, int256 a, int256 b, int256 c)
        internal
        pure
        returns (int256[] memory)
    {
        int256[] memory arr = new int[](maxLength);
        assembly {
            mstore(arr, 3)
        }
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        return arr;
    }

    function intsWithMaxLength(uint256 maxLength, int256 a, int256 b, int256 c, int256 d)
        internal
        pure
        returns (int256[] memory)
    {
        int256[] memory arr = new int[](maxLength);
        assembly {
            mstore(arr, 4)
        }
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        return arr;
    }

    function intsWithMaxLength(uint256 maxLength, int256 a, int256 b, int256 c, int256 d, int256 e)
        internal
        pure
        returns (int256[] memory)
    {
        int256[] memory arr = new int[](maxLength);
        assembly {
            mstore(arr, 5)
        }
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        return arr;
    }

    function intsWithMaxLength(uint256 maxLength, int256 a, int256 b, int256 c, int256 d, int256 e, int256 f)
        internal
        pure
        returns (int256[] memory)
    {
        int256[] memory arr = new int[](maxLength);
        assembly {
            mstore(arr, 6)
        }
        arr[0] = a;
        arr[1] = b;
        arr[2] = c;
        arr[3] = d;
        arr[4] = e;
        arr[5] = f;
        return arr;
    }

    function intsWithMaxLength(uint256 maxLength, int256 a, int256 b, int256 c, int256 d, int256 e, int256 f, int256 g)
        internal
        pure
        returns (int256[] memory)
    {
        int256[] memory arr = new int[](maxLength);
        assembly {
            mstore(arr, 7)
        }
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
