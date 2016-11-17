//  Copyright © 2016 Al Skipp. All rights reserved.

public protocol Monoid: Semigroup {
  static var mempty: Self { get }
  static func mconcat<C: Collection>(_ xs: C) -> Self where C.Iterator.Element == Self
}

public extension Monoid {
  static func mconcat<C: Collection>(_ xs: C) -> Self where C.Iterator.Element == Self {
    return .sconcat(mempty, xs)
  }
}
