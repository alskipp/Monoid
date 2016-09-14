//  Copyright © 2016 Al Skipp. All rights reserved.

public struct Min<Element: Comparable> {
  public let value: Element?
  public init(_ v: Element?) { value = v }
}

extension Min: Monoid {
  public static var mempty: Min {
    return Min(.none)
  }

  public static func combine(_ a: Min, _ b: Min) -> Min {
    return min(a, b)
  }
}


extension Min: CustomStringConvertible {
  public var description: String {
    return "Min(\(value))"
  }
}

extension Min: Equatable, Comparable, Orderable {
  public static func == <T: Equatable>(x: Min<T>, y: Min<T>) -> Bool {
    return x.value == y.value
  }

  public static func < <T: Comparable>(x: Min<T>, y: Min<T>) -> Bool {
    switch (x.value, y.value) {
    case (.none, .none): return false
    case (.none, .some): return false
    case (.some, .none): return true
    case let (.some(a), .some(b)): return a < b
    }
  }
}
