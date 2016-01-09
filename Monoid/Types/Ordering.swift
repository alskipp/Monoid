//  Copyright © 2016 Al Skipp. All rights reserved.

public enum Ordering: Equatable, Comparable, Orderable {
  case LT, EQ, GT
}

public func < (x: Ordering, y: Ordering) -> Bool {
  switch (x, y) {
  case (.LT, .EQ), (.LT, .GT), (.EQ, .GT): return true
  default: return false
  }
}

/*:
Exension to SequenceType to allow sort by **Ordering**
*/
public extension SequenceType {
  func sortBy(@noescape f: (Generator.Element, Generator.Element) -> Ordering) -> [Generator.Element] {
    return sort { f($0, $1) == .LT }
  }
}

/*:
Curried version of **comparing**.
Most useful when comparing by a single property.
  items.sortBy(comparing { $0.property })

It's equivalent too:
  items.sort { $0.property < $1.property }
*/
public func comparing<A, B: Orderable>(property: A -> B) -> (A, A) -> Ordering {
  return { x, y in property(x).compare(property(y)) }
}

/*:
Uncurried version of **comparing**.
Reads better when comparing several properties using the Ordering Monoid instance.

  items.sortBy { x, y in
    comparing(x, y) { $0.property1 } <>
    comparing(x, y) { $0.property2 } <>
    comparing(x, y) { $0.property3 }
  }
*/
public func comparing<A, B: Orderable>(x: A, _ y: A, property: A -> B) -> Ordering {
  return property(x).compare(property(y))
}
