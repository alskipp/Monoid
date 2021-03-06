//  Copyright © 2016 Al Skipp. All rights reserved.

public struct Last<T> {
  public let value: Optional<T>
  public init(_ v: Optional<T>) { value = v }
}

extension Last: Monoid {
  public static var mempty: Last {
    return Last(.none)
  }

  public static func combine(_ a: Last, _ b: Last) -> Last {
    return b.value.map { _ in b } ?? a
  }
}

extension Last: CustomStringConvertible {
  public var description: String {
    return "Last(\(value))"
  }
}

// It's not currently possible to make `Last` Equatable, this is just an override of ==
public func == <T: Equatable>(x: Last<T>, y: Last<T>) -> Bool {
  return x.value == y.value
}
