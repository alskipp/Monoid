//  Copyright © 2016 Al Skipp. All rights reserved.

public protocol Monoid {
  static var mempty: Self { get }
  static func mappend(a: Self, _ b: Self) -> Self
  static func mconcat(a: [Self]) -> Self
}

public extension Monoid {
  static func mconcat(a: [Self]) -> Self {
    return a.reduce(mempty, combine: mappend)
  }
}
