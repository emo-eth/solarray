base = """// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

library Solarray {{
    {}
}}
"""

types = [
    "uint8",
    "uint16",
    "uint32",
    # "uint40",
    # "uint48",
    # "uint56",
    "uint64",
    # "uint72",
    # "uint80",
    # "uint88",
    # "uint96",
    # "uint104",
    # "uint112",
    # "uint120",
    "uint128",
    # "uint136",
    # "uint144",
    # "uint152",
    # "uint160",
    # "uint168",
    # "uint176",
    # "uint184",
    # "uint192",
    # "uint200",
    # "uint208",
    # "uint216",
    # "uint224",
    # "uint232",
    # "uint240",
    # "uint248",
    "uint256",
    "int8",
    "int16",
    "int32",
    # "int40",
    # "int48",
    # "int56",
    "int64",
    # "int72",
    # "int80",
    # "int88",
    # "int96",
    # "int104",
    # "int112",
    # "int120",
    "int128",
    # "int136",
    # "int144",
    # "int152",
    # "int160",
    # "int168",
    # "int176",
    # "int184",
    # "int192",
    # "int200",
    # "int208",
    # "int216",
    # "int224",
    # "int232",
    # "int240",
    # "int248",
    "int256",
    "bytes1",
    # "bytes2",
    # "bytes3",
    "bytes4",
    # "bytes5",
    # "bytes6",
    # "bytes7",
    "bytes8",
    # "bytes9",
    # "bytes10",
    # "bytes11",
    # "bytes12",
    # "bytes13",
    # "bytes14",
    # "bytes15",
    # "bytes16",
    # "bytes17",
    # "bytes18",
    # "bytes19",
    "bytes20",
    # "bytes21",
    # "bytes22",
    # "bytes23",
    # "bytes24",
    # "bytes25",
    # "bytes26",
    # "bytes27",
    # "bytes28",
    # "bytes29",
    # "bytes30",
    # "bytes31",
    "bytes32",
    "address",
    "bool",
    "bytes memory",
    "string memory",
]

shorthand = ["uint", "int"]


def get_suffix(t_name):
    if t_name[-2:] == "ss":
        return "es"
    elif t_name[-1] == "s":
        return "Array"
    else:
        return "s"


def append_array_constructors(_type: str, functions: list[str], length: int):
    type_name = _type.split()[0]
    suffix = get_suffix(type_name)
    for i in range(1, length):
        arguments = ",".join([f"{_type} {chr(ord('a') + j)}" for j in range(i)])
        copying = "\n".join([f"\t\tarr[{j}] = {chr(ord('a') + j)};" for j in range(i)])

        functions.append(
            f"""
    function {type_name}{suffix}({arguments}) internal pure returns ({type_name}[] memory) {{
        {type_name}[] memory arr = new {type_name}[]({i});
{copying}
        return arr;
    }}
"""
        )


def append_allocated_array_constructors(_type: str, functions: list[str], length: int):
    type_name = _type.split()[0]
    suffix = get_suffix(type_name)
    for i in range(1, length):
        arguments = "uint256 maxLength, " + ",".join(
            [f"{_type} {chr(ord('a') + j)}" for j in range(i)]
        )
        copying = "\n".join([f"\t\tarr[{j}] = {chr(ord('a') + j)};" for j in range(i)])

        functions.append(
            f"""
    function {type_name}{suffix}WithMaxLength({arguments}) internal pure returns ({type_name}[] memory) {{
        {type_name}[] memory arr = new {type_name}[](maxLength);
        assembly {{
            mstore(arr, {i})
        }}
{copying}
        return arr;
    }}
"""
        )


def append_extend(_type: str, functions: list[str]):
    type_name = _type.split()[0]
    functions.append(
        f"""
    function extend({type_name}[] memory arr1, {type_name}[] memory arr2) internal pure returns ({type_name}[] memory newArr) {{
        uint256 length1 = arr1.length;
        uint256 length2 = arr2.length;
        newArr = new {type_name}[](length1+ length2);
        for (uint256 i = 0; i < length1;) {{
            newArr[i] = arr1[i];
            unchecked {{
                ++i;
            }}
        }}
        for (uint256 i = 0; i < arr2.length;) {{
            uint256 j;
            unchecked {{
                j = i + length1;
            }}
            newArr[j] = arr2[i];
            unchecked {{
                ++i;
            }}
        }}
    }}
"""
    )


def append_alloc(type: str, functions: list[str]):
    type_name = type.split()[0]
    capitalized_type_name = type_name[0].upper() + type_name[1:]
    suffix = get_suffix(type_name)
    functions.append(
        f"""
    function allocate{capitalized_type_name}{suffix}(uint256 length) internal pure returns ({type_name}[] memory arr) {{
        arr = new {type_name}[](length);
        assembly {{
            mstore(arr, 0)
        }}
    }}
"""
    )


def append_append(_type: str, functions: list[str]):
    type_name = _type.split()[0]
    functions.append(
        f"""
    function append({type_name}[] memory arr, {_type} value) internal pure returns ({type_name}[] memory newArr) {{
        uint256 length = arr.length;
        newArr = new {type_name}[](length + 1);
        newArr[length] = value;
        for (uint256 i = 0; i < length;) {{
            newArr[i] = arr[i];
            unchecked {{
                ++i;
            }}
        }}
    }}

    function appendUnsafe({type_name}[] memory arr, {_type} value) internal pure returns ({type_name}[] memory modifiedArr) {{
        uint256 length = arr.length;
        modifiedArr = arr;
        assembly {{
            mstore(modifiedArr, add(length, 1))
            mstore(add(modifiedArr, shl(5, add(length, 1))), value)
        }}
    }}
"""
    )


def append_copy(_type: str, functions: list[str]):
    type_name = _type.split()[0]
    functions.append(
        f"""
    function copy({type_name}[] memory arr) internal pure returns ({type_name}[] memory newArr) {{
        uint256 length = arr.length;
        newArr = new {type_name}[](length);
        for (uint256 i = 0; i < length;) {{
            newArr[i] = arr[i];
            unchecked {{
                ++i;
            }}
        }}
    }}

    function copyAndResize({type_name}[] memory arr, uint256 newLength) internal pure returns ({type_name}[] memory newArr) {{
        newArr = new {type_name}[](newLength);
        uint256 length = arr.length;
        // allow shrinking a copy without copying extra members
        length = (length > newLength) ? newLength : length;
        for (uint256 i = 0; i < length;) {{
            newArr[i] = arr[i];
            unchecked {{
                ++i;
            }}
        }}
        // TODO: consider writing 0-pointer to the rest of the array if longer for dynamic elements
    }}

    function copyAndAllocate({type_name}[] memory arr, uint256 maxLength) internal pure returns ({type_name}[] memory newArr) {{
        newArr = new {type_name}[](maxLength);
        uint256 originalLength = arr.length;
        for (uint256 i = 0; i < originalLength;) {{
            newArr[i] = arr[i];
            unchecked {{
                ++i;
            }}
        }}
        assembly {{
            mstore(newArr, originalLength)
        }}
    }}
"""
    )


def append_truncate(_type: str, functions: list[str]):
    type_name = _type.split()[0]
    functions.append(
        f"""
    function truncate({type_name}[] memory arr, uint256 newLength) internal pure returns ({type_name}[] memory _arr) {{
        // truncate the array
        assembly {{
            let oldLength := mload(arr)
            returndatacopy(returndatasize(), returndatasize(), gt(newLength, oldLength))
            mstore(arr, newLength)
            _arr := arr

        }}
    }}

    function truncateUnsafe({type_name}[] memory arr, uint256 newLength) internal pure returns ({type_name}[] memory _arr) {{
        // truncate the array
        assembly {{
            mstore(arr, newLength)
            _arr := arr
        }}
    }}
"""
    )


def append_pop(_type: str, functions: list[str]):
    type_name = _type.split()[0]
    functions.append(
        f"""
    function pop({type_name}[] memory arr) internal pure returns ({_type} value) {{
        assembly {{
            let length := mload(arr)
            returndatacopy(returndatasize(),returndatasize(),iszero(length))
            value := mload(add(arr, shl(5, length)))
            mstore(arr, sub(length, 1))
        }}
    }}

    function popUnsafe({type_name}[] memory arr) internal pure returns ({_type} value) {{
        // This function is unsafe because it does not check if the array is empty. 
        assembly {{
            let length := mload(arr)
            value := mload(add(arr, shl(5, length)))
            mstore(arr, sub(length, 1))
        }}
    }}

    function popLeft({type_name}[] memory arr) internal pure returns ({type_name}[] memory newArr, {_type} value) {{
        assembly {{
            let length := mload(arr)
            returndatacopy(returndatasize(),returndatasize(),iszero(length))
            value := mload(add(arr, 0x20))
            newArr := add(arr, 0x20)
            mstore(newArr, sub(length, 1))
        }}
    }}

    function popLeftUnsafe({type_name}[] memory arr) internal pure returns ({type_name}[] memory newArr, {_type} value) {{
        // This function is unsafe because it does not check if the array is empty.
        assembly {{
            let length := mload(arr)
            value := mload(add(arr, 0x20))
            newArr := add(arr, 0x20)
            mstore(newArr, sub(length, 1))
        }}
        }}
"""
    )


def append_from_fixed(_type: str, functions: list[str]):
    length = 8
    type_name = _type.split()[0]
    for i in range(1, length):
        functions.append(
            f"""
        function fromFixed({type_name}[{i}] memory arr) internal pure returns ({type_name}[] memory newArr) {{
            newArr = new {type_name}[]({i});
            for (uint256 i = 0; i < {i};) {{
                newArr[i] = arr[i];
                unchecked {{
                    ++i;
                }}
            }}
        }}

        function fromFixedWithMaxLength({type_name}[{i}] memory arr, uint256 maxLength) internal pure returns ({type_name}[] memory newArr) {{
            newArr = new {type_name}[](maxLength);
            for (uint256 i = 0; i < {i};) {{
                newArr[i] = arr[i];
                unchecked {{
                    
                    ++i;
                }}
            }}
            assembly {{
                mstore(newArr, {i})
            }}
        }}
    """
        )


def generate_array_functions():
    length = 8
    functions = []
    for _type in types:
        append_array_constructors(_type, functions, length)
        append_allocated_array_constructors(_type, functions, length)
        append_extend(_type, functions)
        append_alloc(_type, functions)
        append_truncate(_type, functions)
        append_append(_type, functions)
        append_copy(_type, functions)
        append_pop(_type, functions)
        append_from_fixed(_type, functions)
    for _type in shorthand:
        append_array_constructors(_type, functions, length)
        append_allocated_array_constructors(_type, functions, length)
        append_alloc(_type, functions)

    print(base.format("\n".join(functions)))


generate_array_functions()
