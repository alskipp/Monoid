/*:
 **Note:** For **Monoid** to be imported into the Playground, ensure that the **Monoid-Mac** *scheme* is selected from the list of schemes.

 [**<- Previous page**](@previous)
 * * *
 ## Experimental Fold
 */
import Monoid
//: We'll need `id` and `curry` functions
func id<A>(_ a: A) -> A { return a }

func curry<A,B,C>(_ f: @escaping (A,B) -> C) -> (A) -> (B) -> C {
  return { a in { b in f(a,b) } }
}
//: * * *
protocol Foldable {
  associatedtype Element
  func foldMap<M: Monoid>(_ f: (Element) -> M) -> M
}

/*: All Foldables get many functions for free 🍻 */
extension Foldable {
  func foldr<B>(_ initial: B, combine: (Element) -> (B) -> B) -> B {
    return foldMap { Endo(combine($0)) }.value(initial)
  }

  func foldMap<M: Monoid>(_ f: (Element) -> M) -> M {
    let mappend = curry(M.combine)
    return foldr(M.mempty) { mappend(f($0)) }
  }

  func any(_ p: (Element) -> Bool) -> Bool {
    return foldMap { AnyOf(p($0)) }.value
  }

  func all(_ p: (Element) -> Bool) -> Bool {
    return foldMap { All(p($0)) }.value
  }

  var isEmpty: Bool {
    return foldr(true) { _ in { _ in false } }
  }

  var count: Int {
    return foldr(0) { _ in { c in c + 1 } }
  }
}


extension Foldable where Element: Monoid {
  func fold() -> Element {
    return foldMap(id)
  }
}

extension Foldable where Element: NumberType {
  var sum: Element {
    return foldMap(Sum.init).value
  }

  var product: Element {
    return foldMap(Product.init).value
  }
}

extension Foldable where Element: Equatable {
  func contains(_ x: Element) -> Bool {
    return any { $0 == x }
  }
}

extension Foldable where Element: Comparable {
  func minElement() -> Element? {
    return foldMap { Min.init($0) }.value
  }

  func maxElement() -> Element? {
    return foldMap { Max.init($0) }.value
  }
}
//: * * *
enum List<Element> {
  case Nil
  indirect case Cons(Element, List<Element>)

  // Used to make `List` a `Monoid`
  func append(_ ys: List) -> List {
    switch self {
    case .Nil: return ys
    case let .Cons(head, tail): return
      .Cons(head, tail.append(ys))
    }
  }
}

/*: Make List a `Monoid` */
extension List: Monoid {
  static var mempty: List {
    return .Nil
  }

  static func combine(_ a: List, _ b: List) -> List {
    return a.append(b)
  }
}

/*: Make List `Foldable` */
extension List: Foldable {
  func foldMap<M: Monoid>(_ f: (Element) -> M) -> M {
    switch self {
    case .Nil: return .mempty
    case let .Cons(head, tail): return
      .combine(f(head), tail.foldMap(f))
    }
  }
}

/*: build some lists */
let listA = List.Cons(1,.Cons(2, .Nil))
let listB = List.Cons(5,.Cons(11,.Cons(3,.Nil)))
let listC = listA <> listB // use Monoid method to append lists

/*: As List implements both Monoid and Foldable we get lots of functions for free! */
listC.sum
listB.product
listB.contains(4)
listA.isEmpty
List<Int>.Nil.isEmpty
listC.count
listC.maxElement()
listC.minElement()
listB.any { $0 > 4 }
listA.all { $0 > 1 }

let listD = List.Cons("Hel",.Cons("lo",.Cons(" world",.Nil)))
listD.fold()

//: [Next](@next)
