//  Copyright © 2016 Al Skipp. All rights reserved.

/*
A simple type that inverts the usual comparison order of a type.
For example:

  Down(2) < Down(1) // true

It can be used to sort in reverse order:

  records.sortBy(comparing { Down($0.height) })

Which is equivalent to:

  records.sort { $0.height > $1.height }

It might be more useful here (compare by height in descending order):

  records.sortBy { x, y in
    comparing(x, y) { Down($0.height) } <>
    comparing(x, y) { $0.weight } <>
    comparing(x, y) { $0.age }
  }

Which is equivalent to the following (where it's easy to miss the flipped 'x' and 'y')
  records.sortBy { x, y in
    comparing(y, x) { $0.height } <>
    comparing(x, y) { $0.weight } <>
    comparing(x, y) { $0.age }
  }
*/

public struct Down<T: Orderable> {
  public let value: T
  public init (_ v: T) { value = v }
}

extension Down: Equatable, Comparable, Orderable {}

public func == <T: Equatable>(x: Down<T>, y: Down<T>) -> Bool {
  return x.value == y.value
}

public func < <T: Comparable>(x: Down<T>, y: Down<T>) -> Bool {
  return y.value < x.value
}

extension Down: CustomStringConvertible {
  public var description: String {
    return "Down(\(value))"
  }
}
