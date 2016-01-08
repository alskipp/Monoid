//  Copyright © 2016 Al Skipp. All rights reserved.

public struct All {
  public let value: Bool
  public init(_ v: Bool) { value = v }
}

extension All: Monoid {
  public static var mempty: All {
    return All(true)
  }
  
  public static func mappend(a: All, _ b: All) -> All {
    return All(a.value && b.value)
  }
}

extension All: CustomStringConvertible {
  public var description: String {
    return "All(\(value))"
  }
}

extension All: Equatable, Comparable, Orderable {}

public func == (rhs: All, lhs: All) -> Bool {
  return rhs.value == lhs.value
}

public func < (rhs: All, lhs: All) -> Bool {
  return rhs.value < lhs.value
}
