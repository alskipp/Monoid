/*:
**Note:** For **Monoid** to be imported into the Playground, ensure that the **Monoid-Mac** *scheme* is selected from the list of schemes.

[Back to previous the page](@previous)
* * *

## A mob of Monoids.

**TODO:** More explanation!
*/
import Monoid
//: * * *
"Hello" <> " " <> "World" <> "!"
//: * * *
[1,2,3] <> [4] <> [5,6] <> [7,8,9]
//: * * *
Sum<Int>(10) <> Sum(2) <> Sum(1)

Product<Int>(10) <> Product(2) <> Product(1)
//: * * *
Ordering.EQ <> .EQ <> .LT <> .GT <> .EQ
Ordering.EQ <> .EQ <> .GT <> .LT <> .EQ
//: * * *
All(true) <> All(true) <> All(true)
All(true) <> All(true) <> All(false)

Any(false) <> Any(false) <> Any(true)
Any(false) <> Any(false) <> Any(false)
//: * * *
let arr: [Int?] = [.None, .None, 1, 2, .None]

First(.None) <> First(1) <> First(7) <> First(.None)
First.mconcat(arr.map(First.init))

Last(.None) <> Last(1) <> Last(7) <> Last(.None)
Last.mconcat(arr.map(Last.init))
//: * * *
let nums: [Int?] = [.None, 4, 7, .None, 1]
Min(.None) <> Min<Int>(9) <> Min(2) <> Min(.None) <> Min(5) <> Min(.None)
Min.mconcat(nums.map(Min.init))

Max(.None) <> Max<Int>(2) <> Max(1) <> Max(.None) <> Max(5) <> Max(.None)
Max.mconcat(nums.map(Max.init))
//: * * *
let plusTwo = { (i: Int) in i + 2 }
let timesThree = { (i: Int) in i * 3 }

(Endo(plusTwo) <> Endo(timesThree) <> Endo(plusTwo)).value(2)
Endo<Int>.mconcat([Endo(plusTwo), Endo(timesThree), Endo(timesThree)]).value(2)
//: [Back to previous the page](@previous)
