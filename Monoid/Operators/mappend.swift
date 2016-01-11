//  Copyright © 2016 Al Skipp. All rights reserved.

infix operator <> { associativity left precedence 140 }

public func <> <A: Semigroup>(lhs: A, rhs: A) -> A {
  return .combine(lhs, rhs)
}
