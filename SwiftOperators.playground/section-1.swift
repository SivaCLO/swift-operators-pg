
import UIKit


/*
Swift supports most standard C operators and improves them in few cases to eliminate common coding errors.

# Assignment Operator

The assignment operator (a = b) initializes or updates the value of a with the value of b:
*/

let b = 10
var a = 5
a = b

/*
The assignment operator doesn't return a value. It returns an empty tuple. Uncomment the below lines to see the actual compiler warning and output. This prevents us from accidentally using the assignment operator instead of equal to operator(==).
*/

//var c = a = b
//println(c)

/*
If the right side of the assignment is a tuple with multiple values, its elements can be decomposed into multiple constants or variables at once:
*/

let z = (1, 2)
let (x, y) = (1, 2)
x
y

// # Arithmetic Operators

2 + 3
10 - 3
2 * 4
20.0 / 2.5

/*
The addition operator is also supported for String concatenation (1 String & 1 Char / 2 Strings / 2 Chars):
*/

"hello, " + "world"

let dog: Character = "🐶"
let cow: Character = "🐮"
let dogCow = dog + cow

/* # Remainder Operator

The remainder operator (a % b) calculates how many multiples of b will fit inside a and returns the value that is left over (known as the remainder).
*/

9 % 4
-1 % 3 //It works with negative numbers
9 % 2.5 // and floating point numbers too

/*
Unlike the arithmetic operators in C and Objective-C, the Swift arithmetic operators do not allow values to overflow by default. The below statement will result in an error.
*/

//var potentialOverflow = UInt8.max
//potentialOverflow = potentialOverflow + 10

/*
You can opt in for value overflow behavior by using Swift’s overflow operators (&+, &-, &*, &/, &%). The same operators also work in underflow cases.
*/

var willOverflow = UInt8.max
willOverflow = willOverflow &+ 1 // willOverflow is now equal to 0

var willUnderflow = UInt8.min
willUnderflow = willUnderflow &- 1 // willUnderflow is now equal to 255

/*
The overflow operators (&/ and &%) also gaurd against divide by zero errors and return 0 as a result.
*/

let x1 = 1
let y1 = x1 &/ 0 // y is equal to 0


/* # Increment and Decrement Operators

Increment and Decrement operators are used as shortcut to increase or decrease the value of any integer or floating-point numbers by 1. These operators return the value after modifying it, if used as a prefix operator. If used as a postfix operator, they return and then modify the value. If you are not using the return value, the prefix operator is recomended by Apple.
*/

var i = 0
++i      // i now equals 1
--i

var j = ++i
var k = i++
j
k
i

var l = 8.5
++l

/* Unary Minus/Plus Operator

The sign of a numeric value can be toggled using a prefixed -, known as the unary minus operator. Unary plus operator has no significance other than providing symmetry for positive numbers when used with a unary minus operator for negative numbers.
*/

let three = 3
let minusThree = -three
let plusThree = -minusThree
let alsoMinusThree = +minusThree


/* Compound Assignment Operators

These are assignment operators combined with another operator. This operator can be used with Arithmetic operators (+,-,*,/,%), Bitwise operators (<<, >>, &, ^, |) and Logical operators (&&, ||) too.
*/

var a1 = 1
a1 += 2 //doesn't return anything
a1 = a1 + 2 // same effect as above statement

/*
# Comparison Operators

Swift supports the standard comparison operators (==, !=, >, <, >=, <=). All these operations return a Bool value. Swift also provided Identity comparison operators (=== and !==). These can be used to check if two object references refer to the same object instance.

*/

1 == 1
2 != 1

var firstObj = "test1"
var secondObj = "test1"

firstObj == secondObj // Same Value. So true
firstObj === secondObj // Different instances. So false

/*
# Ternary Conditional Operator
This is the only operator in Swift that takes 3 arguments. It is used as a shortcut for if expression1 { expression2 } else { expression3 }. This operator also returns the value of expression2 or expression3 once it is evaluated, unlike an if statement. Even though this is handy, it can produce hard-to-read code, if nested / overused.
*/

let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20)


/*
# Range Operators
Swift includes two range operators, which are shortcuts for expressing a range of values.

## Closed Range Operator
The closed range operator (a...b) is used to define a range from a to b, including both a and b. This operator is more analogous to a for-in loop, where all the values needs to be used.
*/

var total = 0
for index in 1...10 {
    total++;
}
total

/*
## Half-Closed Range Operator
This range included only the first value and not its final value. (a..b) defines a range from a to b, including only a to b-1
*/

let places = ["SFO", "LAS", "BOS"]
var count = places.count
var result = ""
for index in 0..count { // Runs from 0 to 2, not including 3.
    result += places[index]
}
result

/*
# Logical Operator
Swift supports 3 basic logical operators (! - NOT, && - AND, || - OR). These are used to modify or combine Boolean logic values true and false.

## Logical NOT Operator
NOT operator inverts the value of Boolean. So true becomes false, and false becomes true. This is prefix operator. Like any prefix operator there should be no whitespace between the operator and the operand.

To make it more readable, avoid using "not" in the variable names like notAllowed = true. Imagine reading !notAllowed when you are walking through the code
*/

let allowed = true
!allowed
if !allowed {
    println("Access Deined")
}

/*
# Logical AND Operator
AND Operator creates expressions that return true only if both operands are true. If either one if false, the overall expression will be false.

When the first value is false, the second value won't even be evaluated, since the result of the expression is already known. This is called "short-circuit evaluation"
*/

let enteredDoorCode = true
let passedRetinaScan = false
if enteredDoorCode && passedRetinaScan {
println("Welcome!")
} else {
println("ACCESS DENIED") // This is printed in console
}

/*
# Logical OR Operator
Two pipe chars together denote an OR operator. It creates expressions that return true, even if one of the operand is true. Like AND above, OR also uses short-circuit evaluation. If the first operand is true, the other operand is not executed, because it cannot change the outcome of the overall expression.
*/

let hasDoorKey = false
let knowsOverridePassword = true
if hasDoorKey || knowsOverridePassword {
    println("Welcome!") // This is printed in console
} else {
    println("ACCESS DENIED")
}

/*
#  Combining Logical Operators
Multiple logical operators can be combined to create longer expressions. && and || still operates on 2 values. The below expression contains three seperate logical operations chained together.
*/

if enteredDoorCode && passedRetinaScan || hasDoorKey || knowsOverridePassword {
    println("Welcome!") // This is printed in console
} else {
    println("ACCESS DENIED")
}

/* 
# Explicit Parentheses
It is sometimes useful to explicitly include the parantheses when they are not needed. to make the intentions of the expression clear. Readability is always preferred over brevity.
*/

if (enteredDoorCode && passedRetinaScan) || hasDoorKey || knowsOverridePassword {
    println("Welcome!") // This is printed in console. No change in result.
} else {
    println("ACCESS DENIED")
}

/*
# Bitwise Operators
Bitwise operators are used to manipulate the individual bits with a data structure. They are often used in low-level programming, such as graphics programming and device driver creation. Bitwise operators can also be useful when you work with raw data from external sources, such as encoding and decoding data for communication over a custom protocol. Swift supports all standard (~ - NOT, & - AND, | - OR, ^ - XOR) bitwise operators.

# Bitwise NOT operator (~) is prefix operator. It inverts every bit in the given value. 1 becomes 0, 0 becomes 1. In case of a unsigned int, this operator returns a value of MAX - given value. If it is a UInt8 (8 bit integer), 255 - value is returned.
*/

let initialBits: UInt8 = 0b01010101 // 85
let invertedBit = ~initialBits // 255 - 85

/*
# Bitwise AND operator (&) is a binary operator that combines the bits of 2 numbers. It behaves like a logical AND operator. For each bit, if both of them are 1, the result will be 1.
*/

let firstSixBits: UInt8 = 0b11111100
let lastSixBits: UInt8  = 0b00111111
let middleFourBits = firstSixBits & lastSixBits  // equals 00111100

/*
# Bitwise OR operator (|) is a binary operator that compares the bits of 2 numbers. For each bit, if one of them is 1, result will be 1. This is similar to the logical OR operator.
*/

let someBits: UInt8 = 0b10110010
let moreBits: UInt8 = 0b01011110
let combinedbits = someBits | moreBits  // equals 11111110

/*
# Bitwise XOR operator (^) is a binary operator that compares the bits of 2 numbers. For each bit, if they are same, 0 is returned and if there are different, 1 is returned.
*/

let firstBits: UInt8 = 0b00010100
let otherBits: UInt8 = 0b00000101
let outputBits = firstBits ^ otherBits  // equals 00010001

/*
# Bitwise Left and Right Shift Operators
The Bitwise shift operators move all the bits in the given value to the left or the right by a certain number of places. They have the effect of multiplying or dividing an integer number by a factor of 2. Even though signed numbers have a different bitwise representation (two's complement), the shift operators produce the same result as unsigned numbers along with retaining their signs.
*/

let shiftBits: UInt8 = 4   // 00000100 in binary
shiftBits << 1             // 00001000
shiftBits << 2             // 00010000
shiftBits << 5             // 10000000
shiftBits << 6             // 00000000
shiftBits >> 2             // 00000001

let shiftBitsSigned: Int8 = -4   // 11111100 in binary
shiftBitsSigned << 1             // Negative sign is retained
shiftBitsSigned << 2
shiftBitsSigned << 5
shiftBitsSigned << 6
shiftBitsSigned >> 2             // negative sign is still retained


let color: UInt32 = 0xCC6699
let redComponent = (color & 0xFF0000) >> 16    // redComponent is 0xCC, or 204
let greenComponent = (color & 0x00FF00) >> 8   // greenComponent is 0x66, or 102
let blueComponent = color & 0x0000FF           // blueComponent is 0x99, or 153


