//  Copyright © 2016 Al Skipp. All rights reserved.

public struct Max<Element: Comparable> {
  public let value: Element?
  public init(_ v: Element?) { value = v }
}

extension Max: Monoid {
  public static var mempty: Max {
    return Max(.None)
  }
  
  public static func mappend(a: Max, _ b: Max) -> Max {
    return max(a, b)
  }
}


extension Max: CustomStringConvertible {
  public var description: String {
    return "Max(\(value))"
  }
}

extension Max: Equatable, Comparable, Orderable {}

public func == <T: Equatable>(x: Max<T>, y: Max<T>) -> Bool {
  return x.value == y.value
}

public func < <T: Comparable>(x: Max<T>, y: Max<T>) -> Bool {
  switch (x.value, y.value) {
  case (.None, .None): return false
  case (.None, .Some): return true
  case (.Some, .None): return false
  case let (.Some(a), .Some(b)): return a < b
  }
}
