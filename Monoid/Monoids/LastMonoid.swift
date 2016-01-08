//  Copyright © 2016 Al Skipp. All rights reserved.

public struct Last<T> {
  public let value: Optional<T>
  public init(_ v: Optional<T>) { value = v }
}

extension Last: Monoid {
  public static var mempty: Last {
    return Last(.None)
  }
  
  public static func mappend(a: Last, _ b: Last) -> Last {
    return b.value.map { _ in b } ?? a
  }
}

extension Last: CustomStringConvertible {
  public var description: String {
    return "Last(\(value))"
  }
}

// It's not currently possible to make `Last` Equatable, this is just an override of ==
public func == <T: Equatable>(rhs: Last<T>, lhs: Last<T>) -> Bool {
  return rhs.value == lhs.value
}
