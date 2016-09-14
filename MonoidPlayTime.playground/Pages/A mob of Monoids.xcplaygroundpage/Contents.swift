/*:
 **Note:** For **Monoid** to be imported into the Playground, ensure that the **Monoid-Mac** *scheme* is selected from the list of schemes.

 [**<- Previous page**](@previous)
 * * *

 ## A mob of Monoids

 **TODO:** More explanation!
 */
import Monoid
//: * * *
"Hello" <> " " <> "World" <> "!"
//: * * *
[1,2] <> [] <> [3] <> []
[1,2,3] <> [4] <> [5,6] <> [7,8,9]
//: * * *
Set(["a", "b"]) <> Set() <> Set(["c"])
Set(["a", "b"]) <> Set() <> Set(["a", "c", "d"])
//: * * *
Sum<Int>(0) <> Sum(0) <> Sum(1)
Sum<Int>(10) <> Sum(2) <> Sum(1)

Product<Int>(1) <> Product(1) <> Product(1)
Product<Int>(10) <> Product(2) <> Product(3)
//: * * *
Ordering.equal <> .equal <> .less <> .greater <> .equal
Ordering.equal <> .equal <> .greater <> .less <> .equal
//: * * *
All(true) <> All(true) <> All(true)
All(true) <> All(true) <> All(false)

AnyOf(false) <> AnyOf(false) <> AnyOf(true)
AnyOf(false) <> AnyOf(false) <> AnyOf(false)
//: * * *
let arr: [Int?] = [.none, .none, 1, 2, .none]

First(.none) <> First(1) <> First(7) <> First(.none)
First.mconcat(arr.map(First.init))

Last(.none) <> Last(1) <> Last(7) <> Last(.none)
Last.mconcat(arr.map(Last.init))
//: * * *
let nums: [Int?] = [.none, 4, 7, .none, 1]
Min(.none) <> Min<Int>(9) <> Min(2) <> Min(.none) <> Min(5) <> Min(.none)
Min.mconcat(nums.map(Min.init))

Max(.none) <> Max<Int>(2) <> Max(1) <> Max(.none) <> Max(5) <> Max(.none)
Max.mconcat(nums.map(Max.init))
//: * * *
let plusTwo = { (i: Int) in i + 2 }
let timesThree = { (i: Int) in i * 3 }

(Endo(plusTwo) <> Endo(timesThree) <> Endo(plusTwo)).value(2)
Endo<Int>.mconcat([Endo(plusTwo), Endo(timesThree), Endo(timesThree)]).value(2)

//: [**Next page ->** (Nuclear Error!)](@next)
