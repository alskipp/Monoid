//  Copyright © 2016 Al Skipp. All rights reserved.

public struct First<T> {
  public let value: Optional<T>
  public init(_ v: Optional<T>) { value = v }
}

extension First: Monoid {
  public static var mempty: First {
    return First(.None)
  }

  public static func mappend(a: First, _ b: First) -> First {
    return a.value.map { _ in a } ?? b
  }
}

extension First: CustomStringConvertible {
  public var description: String {
    return "First(\(value))"
  }
}

// It's not currently possible to make `First` Equatable, this is just an override of ==
public func == <T: Equatable>(x: First<T>, y: First<T>) -> Bool {
  return x.value == y.value
}
