//  Copyright © 2016 Al Skipp. All rights reserved.

public protocol NumberType: Equatable, Comparable {
  static var zero: Self { get }
  static var one: Self { get }
  func +(lhs: Self, rhs: Self) -> Self
  func -(lhs: Self, rhs: Self) -> Self
  func *(lhs: Self, rhs: Self) -> Self
}
