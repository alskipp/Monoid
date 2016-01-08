//  Copyright © 2016 Al Skipp. All rights reserved.

public struct Any {
  public let value: Bool
  public init(_ v: Bool) { value = v }
}

extension Any: Monoid {
  public static var mempty: Any {
    return Any(false)
  }
  
  public static func mappend(a: Any, _ b: Any) -> Any {
    return Any(a.value || b.value)
  }
}

extension Any: CustomStringConvertible {
  public var description: String {
    return "Any(\(value))"
  }
}

extension Any: Equatable, Comparable, Orderable {}

public func == (rhs: Any, lhs: Any) -> Bool {
  return rhs.value == lhs.value
}

public func < (rhs: Any, lhs: Any) -> Bool {
  return rhs.value < lhs.value
}
