//  Copyright © 2015 Al Skipp. All rights reserved.

public protocol Monoid {
  static var mempty: Self { get }
  static func mappend(a: Self, _ b: Self) -> Self
  static func mconcat(a: [Self]) -> Self
}

public extension Monoid {
  static func mconcat(a: [Self]) -> Self {
    return a.reduce(mempty, combine: mappend)
  }
}


extension Array: Monoid {
  public static var mempty: [Element] {
    return []
  }
  
  public static func mappend(a: [Element], _ b: [Element]) -> [Element] {
    return a + b
  }
  
  // The default mconcat has poor performance as it uses `reduce` to create an Array
  // Using a mutable [] and updating in a loop is significantly more performant
  public static func mconcat(a: [[Element]]) -> [Element] {
    var result: [Element] = []
    a.forEach { e in result += e }
    return result
  }
}


extension String: Monoid {
  public static var mempty: String {
    return ""
  }
  
  public static func mappend(a: String, _ b: String) -> String {
    return a + b
  }
  
  // The default mconcat uses `reduce` and has to create and dispose of Strings each iteration
  // Using a mutable "" and updating in a loop is more efficient
  public static func mconcat(a: [String]) -> String {
    var result = ""
    a.forEach { s in result += s }
    return result
  }
}


extension Ordering: Monoid {
  public static var mempty: Ordering {
    return .EQ
  }
  
  public static func mappend(a: Ordering, _ b: Ordering) -> Ordering {
    switch (a, b) {
    case (.LT, _): return .LT
    case (.EQ, _): return b
    case (.GT, _): return .GT
    }
  }
}


public struct Sum<T: NumberType> {
  public let value: T
  public init(_ v: T) { value = v }
}

extension Sum: Monoid {
  public static var mempty: Sum {
    return Sum(T.zero)
  }
  
  public static func mappend(a: Sum, _ b: Sum) -> Sum {
    return Sum(a.value + b.value)
  }
}

extension Sum: Equatable, Comparable, Orderable {}

public func == <N: NumberType>(rhs: Sum<N>, lhs: Sum<N>) -> Bool {
  return rhs.value == lhs.value
}

public func < <N: NumberType>(rhs: Sum<N>, lhs: Sum<N>) -> Bool {
  return rhs.value < lhs.value
}


public struct Product<T: NumberType> {
  public let value: T
  public init(_ v: T) { value = v }
}

extension Product: Monoid {
  public static var mempty: Product {
    return Product(T.one)
  }
  
  public static func mappend(a: Product, _ b: Product) -> Product {
    return Product(a.value * b.value)
  }
}

extension Product: Equatable, Comparable, Orderable {}

public func == <N: NumberType>(rhs: Product<N>, lhs: Product<N>) -> Bool {
  return rhs.value == lhs.value
}

public func < <N: NumberType>(rhs: Product<N>, lhs: Product<N>) -> Bool {
  return rhs.value < lhs.value
}

