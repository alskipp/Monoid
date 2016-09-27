//  Copyright © 2016 Al Skipp. All rights reserved.

precedencegroup Monoidal {
  associativity: right
  lowerThan: AdditionPrecedence
}
infix operator <> : Monoidal

public func <> <A: Semigroup>(lhs: A, rhs: A) -> A {
  return .combine(lhs, rhs)
}
