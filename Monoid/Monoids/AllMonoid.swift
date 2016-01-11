//  Copyright © 2016 Al Skipp. All rights reserved.

public struct All {
  public let value: Bool
  public init(_ v: Bool) { value = v }
}

extension All: Monoid {
  public static var mempty: All {
    return All(true)
  }

  public static func combine(a: All, _ b: All) -> All {
    return All(a.value && b.value)
  }
}

extension All: CustomStringConvertible {
  public var description: String {
    return "All(\(value))"
  }
}

extension All: Equatable, Comparable, Orderable {}

public func == (x: All, y: All) -> Bool {
  return x.value == y.value
}

public func < (x: All, y: All) -> Bool {
  return x.value < y.value
}
