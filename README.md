# solarray 🥀

Wish Solidity had more concise array initialization?
Wish you could concisely combine two arrays?
Wish you could concisely make copies of arrays?
Wish you could dynamically resize arrays?
Wish you could dynamically resize arrays without making a copy?
Wish you could pop the last element off an array?


*Solarray* is a blazing-fast helper library for convenient Solidity dynamic arrays. Useful for writing `foundry` test cases that involve arrays.

## Usage

```solidity
// concisely initialize dynamic arrays of fixed length
uint8[] memory nums = Solarray.uint8s(1, 2, 3);
uint8[] memory nums2 = Solarray.uint8s(4, 5, 6);

// concisely combine two arrays into a new array using extend
uint8[] memory combined = Solarray.extend(nums, nums2);

// concisely create a copy of an array with an extra element using append
uint8[] memory nums3 = Solarray.append(nums, 4);

// use allocate to create a dynamic array that can be appended to later, up to a maximum length
// note that this will not revert if you attempt to append more than the maximum length
uint8[] memory nums = Solarray.allocateUints({maxLength: 3});
Solarray.appendUnsafe(nums, 1);
Solarray.appendUnsafe(nums, 2);
Solarray.appendUnsafe(nums, 3);

// concisely initialize an array that you can then append to later
nums = Solarray.uint8sWithMaxLength({maxLength:5, a:1, b:2, c:3});

// use truncate to shrink an array in-place; will revert with OutOfOffset if the new length is greater than the current length
Solarray.truncate(nums, 2);
// won't revert, slightly cheaper
Solarray.truncateUnsafe(nums, 1);

// copy an array
uint8[] memory numsCopy = Solarray.copy(nums);

// copy an array with a new length, longer or shorter. Longer will result in empty elements.
numsCopy = Solarray.copyAndResize(nums, 5);
numsCopy = Solarray.copyAndResize(nums, 1);

// make a copy of an array with a new maximum length allocation
// will result in an array of the same length.
numsCopy = Solarray.copyAndAllocate(nums, 5);

// pop the last element off an array. Will revert with OutOfOffset if the array is empty.
uint8 last = Solarray.pop(nums2);
// use unsafe when you are sure the array is not empty, for slight gas savings
last = Solarray.popUnsafe(nums2);

// pop the first element from an array. Will revert with OutOfOffset if the array is empty.
// Returns the pointer to the modified array, and the popped element.
uint8 first;
(nums2, first) = Solarray.popLeft(nums2);
// use unsafe when you are sure the array is not empty, for slight gas savings
(nums2, first) = Solarray.popLeftUnsafe(nums2);

// convert from a fixed length array to a dynamic array
uint8[] memory numsFromFixed = Solarray.fromFixed([1, 2, 3]);
// also allocate a max length for the new dynamic array
numsFromFixed = Solarray.fromFixedWithMaxLength([1, 2, 3], 5);
```

Supports 1-8 arguments for most of the common types.

## Installation

```sh
forge install emo-eth/solarray
```

## Usage

```sh
import {Solarray} from "solarray/solarray.sol";
```

## Adding new types

If you want to include a new type, you can use the [generator.py](https://github.com/emo-eth/solarray/blob/master/generator.py) script that
I used to make the helper library.
