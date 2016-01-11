//  Copyright © 2016 Al Skipp. All rights reserved.

public protocol Monoid: Semigroup {
  static var mempty: Self { get }
  static func mconcat(a: [Self]) -> Self
}

public extension Monoid {
  static func mconcat(xs: [Self]) -> Self {
    return .sconcat(mempty, xs)
  }
}
