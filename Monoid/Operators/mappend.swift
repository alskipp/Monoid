//  Copyright © 2016 Al Skipp. All rights reserved.

precedencegroup Monoidal {
  associativity: right
  higherThan: DefaultPrecedence
}
infix operator <> : Monoidal

//infix operator <> { associativity left precedence 140 }

public func <> <A: Semigroup>(lhs: A, rhs: A) -> A {
  return .combine(lhs, rhs)
}
