//  Copyright © 2016 Al Skipp. All rights reserved.

public struct Max<Element: Comparable> {
  public let value: Element?
  public init(_ v: Element?) { value = v }
}

extension Max: Monoid {
  public static var mempty: Max {
    return Max(.none)
  }

  public static func combine(_ a: Max, _ b: Max) -> Max {
    return max(a, b)
  }
}


extension Max: CustomStringConvertible {
  public var description: String {
    return "Max(\(value))"
  }
}

extension Max: Equatable, Comparable, Orderable {
  public static func == <T: Equatable>(x: Max<T>, y: Max<T>) -> Bool {
    return x.value == y.value
  }

  public static func < <T: Comparable>(x: Max<T>, y: Max<T>) -> Bool {
    switch (x.value, y.value) {
    case (.none, .none): return false
    case (.none, .some): return true
    case (.some, .none): return false
    case let (.some(a), .some(b)): return a < b
    }
  }
}
