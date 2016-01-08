//  Copyright © 2016 Al Skipp. All rights reserved.

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

extension Product: CustomStringConvertible {
  public var description: String {
    return "Product(\(value))"
  }
}

extension Product: Equatable, Comparable, Orderable {}

public func == <N: NumberType>(x: Product<N>, y: Product<N>) -> Bool {
  return x.value == y.value
}

public func < <N: NumberType>(x: Product<N>, y: Product<N>) -> Bool {
  return x.value < y.value
}
