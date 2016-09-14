//  Copyright © 2016 Al Skipp. All rights reserved.

public struct AnyOf {
  public let value: Bool
  public init(_ v: Bool) { value = v }
}

extension AnyOf: Monoid {
  public static var mempty: AnyOf {
    return AnyOf(false)
  }

  public static func combine(_ a: AnyOf, _ b: AnyOf) -> AnyOf {
    return AnyOf(a.value || b.value)
  }
}

extension AnyOf: CustomStringConvertible {
  public var description: String {
    return "AnyOf(\(value))"
  }
}

extension AnyOf: Equatable, Comparable, Orderable {
  public static func == (_ x: AnyOf, y: AnyOf) -> Bool {
    return x.value == y.value
  }

  public static func < (_ x: AnyOf, y: AnyOf) -> Bool {
    return x.value < y.value
  }
}
