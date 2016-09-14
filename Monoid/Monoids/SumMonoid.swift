//  Copyright © 2016 Al Skipp. All rights reserved.

public struct Sum<T: NumberType> {
  public let value: T
  public init(_ v: T) { value = v }
}

extension Sum: Monoid {
  public static var mempty: Sum {
    return Sum(T.zero)
  }

  public static func combine(_ a: Sum, _ b: Sum) -> Sum {
    return Sum(a.value + b.value)
  }
}

extension Sum: CustomStringConvertible {
  public var description: String {
    return "Sum(\(value))"
  }
}

extension Sum: Equatable, Comparable, Orderable {
  public static func == <N: NumberType>(x: Sum<N>, y: Sum<N>) -> Bool {
    return x.value == y.value
  }

  public static func < <N: NumberType>(x: Sum<N>, y: Sum<N>) -> Bool {
    return x.value < y.value
  }
}
