//  Copyright © 2016 Al Skipp. All rights reserved.

/*
Curried version of `comparing`.
Most useful when comparing by a single property.

  items.sortBy(comparing { $0.property })

It's equivalent too:

  items.sort { $0.property < $1.property }
*/
public func comparing<A, B: Orderable>(property: A -> B) -> (A, A) -> Ordering {
  return { x, y in property(x).compare(property(y)) }
}

/*
Uncurried version of `comparing`.
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