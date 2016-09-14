//  Copyright © 2016 Al Skipp. All rights reserved.

public protocol NumberType: Equatable, Comparable {
  static var zero: Self { get }
  static var one: Self { get }
  static func +(lhs: Self, rhs: Self) -> Self
  static func -(lhs: Self, rhs: Self) -> Self
  static func *(lhs: Self, rhs: Self) -> Self
}
