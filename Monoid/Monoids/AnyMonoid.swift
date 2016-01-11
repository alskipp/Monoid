//  Copyright © 2016 Al Skipp. All rights reserved.

public struct Any {
  public let value: Bool
  public init(_ v: Bool) { value = v }
}

extension Any: Monoid {
  public static var mempty: Any {
    return Any(false)
  }

  public static func combine(a: Any, _ b: Any) -> Any {
    return Any(a.value || b.value)
  }
}

extension Any: CustomStringConvertible {
  public var description: String {
    return "Any(\(value))"
  }
}

extension Any: Equatable, Comparable, Orderable {}

public func == (x: Any, y: Any) -> Bool {
  return x.value == y.value
}

public func < (x: Any, y: Any) -> Bool {
  return x.value < y.value
}
