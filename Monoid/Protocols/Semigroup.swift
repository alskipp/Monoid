//  Copyright © 2016 Al Skipp. All rights reserved.

public protocol Semigroup {
  static func combine(_ a: Self, _ b: Self) -> Self
  static func sconcat<C: Collection>(_ x: Self, _ xs: C) -> Self where C.Iterator.Element == Self
}

public extension Semigroup {
  static func sconcat<C: Collection>(_ x: Self, _ xs: C) -> Self where C.Iterator.Element == Self {
    return xs.reduce(x, combine)
  }

  // convenient but unsafe version of sconcat – Array must not be empty
  static func sconcat<C: Collection>(_ xs: C) -> Self where C.Iterator.Element == Self, C.SubSequence.Iterator.Element == Self {
    let x = xs.first!
    return xs.dropFirst().reduce(x, combine)
  }
}
