//  Copyright © 2016 Al Skipp. All rights reserved.

public struct Min<Element: Comparable> {
  public let value: Element?
  public init(_ v: Element?) { value = v }
}

extension Min: Monoid {
  public static var mempty: Min {
    return Min(.None)
  }

  public static func mappend(a: Min, _ b: Min) -> Min {
    return min(a, b)
  }
}


extension Min: CustomStringConvertible {
  public var description: String {
    return "Min(\(value))"
  }
}

extension Min: Equatable, Comparable, Orderable {}

public func == <T: Equatable>(x: Min<T>, y: Min<T>) -> Bool {
  return x.value == y.value
}

public func < <T: Comparable>(x: Min<T>, y: Min<T>) -> Bool {
  switch (x.value, y.value) {
  case (.None, .None): return false
  case (.None, .Some): return false
  case (.Some, .None): return true
  case let (.Some(a), .Some(b)): return a < b
  }
}
