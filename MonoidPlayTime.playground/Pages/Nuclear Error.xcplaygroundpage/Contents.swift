/*:
**Note:** For **Monoid** to be imported into the Playground, ensure that the **Monoid-Mac** *scheme* is selected from the list of schemes.

[**<- Previous page**](@previous)
* * *

## Nuclear Error Monoid
*/
import Monoid
/*: 
Monoids are not just for the regular Swift types like String and Array etc.
Custom types can also be Monoids. Here's an example of a Monoid for the 
core status of a nuclear power station. 😁

The simple rule is that the 'default' status is **DontPanic** and when 
combining two **CoreStatus** values the most alarming is chosen. When combining
**CoreStatus** values that are equally alarming their associated warnings 
should also be combined.
*/
enum CoreStatus {
  case DontPanic
  case Worry(warnings: [String])
  case Panic(warnings: [String])
}

extension CoreStatus: Monoid {
  static var mempty: CoreStatus { return .DontPanic }

  static func combine(a: CoreStatus, _ b: CoreStatus) -> CoreStatus {
    switch (a, b) {
    case let (Panic(x), .Panic(y)): return .Panic(warnings: x <> y)
    case let (Worry(x), .Worry(y)): return .Worry(warnings: x <> y)
    case (_, .Panic), (.DontPanic, _): return b
    case (Worry, _), (Panic, _): return a
    }
  }
}
//: A status report consisting of an Array of **CoreStatus** messages
let statusReport: [CoreStatus] = [
  .DontPanic,
  .Worry(warnings: ["Spilt tea on console"]),
  .DontPanic,
  .Worry(warnings: ["Core over-heating"]),
  .Panic(warnings: ["Meltdown!"]),
  .Panic(warnings: ["We're all doomed!"]),
]
//: Combine the full status report into a single, definitive **CoreStatus** message
CoreStatus.mconcat(statusReport)

//: [**Next page ->** (Anarcho-Syndicalist-Commune-Monoid)](@next)
