//  Copyright © 2016 Al Skipp. All rights reserved.

public protocol Monoid: Semigroup {
  static var mempty: Self { get }
  static func mconcat(_ a: [Self]) -> Self
}

public extension Monoid {
  static func mconcat(_ xs: [Self]) -> Self {
    return .sconcat(mempty, xs)
  }
}
