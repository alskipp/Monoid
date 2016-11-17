/*:
**Note:** For **Monoid** to be imported into the Playground, ensure that the **Monoid-Mac** *scheme* is selected from the list of schemes.

[**<- Previous page**](@previous)
* * *
## Experimental Fold
*/
import Monoid

struct Fold<Input, M: Monoid, Output> {
  let monoid: (Input) -> M
  let summary: (M) -> Output

  func fold<S: Sequence>(_ xs: S) -> Output where S.Iterator.Element == Input {
    return summary(M.mconcat(xs.lazy.map(monoid)))
  }
}

//: * * *
//: An additional Monoid instance to play with.
struct Average<N: FloatingPoint> {
  let samples: N, value: N
}

extension Average: Monoid {
  static var mempty: Average {
    return Average(samples: 0, value: 0)
  }

  static func combine(_ a: Average, _ b: Average) -> Average {
    let x = (a.samples * a.value + b.samples * b.value) / (a.samples + b.samples)
    return Average<N>(samples: a.samples + b.samples, value: x)
  }
}
//: * * *
//: Functions to use with `Fold`
func average<N: FloatingPoint>() -> Fold<N, Average<N>, N> {
  let tally = { Average<N>(samples: 1, value: $0) }
  return Fold(monoid: tally) { $0.value }
}

func sum<N: NumberType>() -> Fold<N, Sum<N>, N> {
  return Fold(monoid: Sum.init) { $0.value }
}

func product<N: NumberType>() -> Fold<N, Product<N>, N> {
  return Fold(monoid: Product.init) { $0.value }
}
//: * * *
sum().fold(1...5)
sum().fold([2.5, 3.0, 6.25])

product().fold(1...5)
product().fold([2.5, 1.5, 2])

average().fold((1...100).lazy.map(Double.init))
average().fold([2,2,8,4])
//: * * *
/*
 // Currently not possible to define `Pair` as a Monoid
struct Pair<A,B> {
  let a: A
  let b: B
}

extension Pair: Monoid where A: Monoid, B: Monoid {
  public static var mempty: Pair {
    return Pair(a: A.mempty, b: B.mempty)
  }

  public static func combine(_ l: Pair, _ r: Pair) -> Pair {
    return Pair(a: l.a <> r.a, b: l.b <> r.b)
  }
}
 */

//: [**Next page ->** (Foldable)](@next)
