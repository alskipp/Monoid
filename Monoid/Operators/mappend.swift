//  Copyright © 2015 Al Skipp. All rights reserved.

infix operator <> { associativity left precedence 140 }

public func <> <A: Monoid>(lhs: A, rhs: A) -> A {
  return .mappend(lhs, rhs)
}
