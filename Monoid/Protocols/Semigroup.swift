//  Copyright © 2016 Al Skipp. All rights reserved.

public protocol Semigroup {
  static func combine(a: Self, _ b: Self) -> Self
  static func sconcat(x: Self, _ xs: [Self]) -> Self
}

public extension Semigroup {
  static func sconcat(x: Self, _ xs: [Self]) -> Self {
    return xs.reduce(x, combine: combine)
  }

  // convenient but unsafe version of sconcat – Array must not be empty
  static func sconcat(xs: [Self]) -> Self {
    let x = xs.first!
    return xs.dropFirst().reduce(x, combine: combine)
  }
}
