/*:
**Note:** For **Monoid** to be imported into the Playground, ensure that the **Monoid-Mac** *scheme* is selected from the list of schemes.

* * *
*/
import Monoid

"Hello" <> " " <> "World" <> "!"

[1,2,3] <> [4] <> [5,6] <> [7,8,9]

Sum<Int>(10) <> Sum(2) <> Sum(1)

Product<Int>(10) <> Product(2) <> Product(1)

Ordering.EQ <> .EQ <> .LT <> .GT <> .EQ
Ordering.EQ <> .EQ <> .GT <> .LT <> .EQ

All(true) <> All(true) <> All(true)
All(true) <> All(true) <> All(false)

Any(false) <> Any(false) <> Any(true)
Any(false) <> Any(false) <> Any(false)


let a: Int? = 1
let b: Int? = 7

First(.None) <> First(a) <> First(b) <> First(.None)

Last(.None) <> Last(a) <> Last(b) <> Last(.None)

Min<Int>(2) <> Min(1) <> Min(.None) <> Min(3)
Min(.None) <> Min<Int>(9) <> Min(1) <> Min(.None) <> Min(5) <> Min(.None)

Max<Int>(2) <> Max(1) <> Max(.None) <> Max(3)
Max(.None) <> Max<Int>(2) <> Max(1) <> Max(.None) <> Max(5) <> Max(.None)
