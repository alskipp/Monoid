//  Copyright © 2015 Al Skipp. All rights reserved.

public enum Ordering: Equatable, Comparable, Orderable {
  case LT, EQ, GT
}

public func < (x: Ordering, y: Ordering) -> Bool {
  switch (x, y) {
  case (.LT, .EQ), (.LT, .GT), (.EQ, .GT): return true
  default: return false
  }
}


public protocol Orderable: Comparable {
  func compare(other: Self) -> Ordering
}

public extension Orderable {
  public func compare(other: Self) -> Ordering {
    if self == other { return .EQ }
    if self < other { return .LT }
    return .GT
  }
}


extension String: Orderable {}

extension Int: Orderable {}
extension Int64: Orderable {}
extension Int32: Orderable {}
extension Int16: Orderable {}
extension Int8: Orderable {}

extension UInt64: Orderable {}
extension UInt32: Orderable {}
extension UInt16: Orderable {}
extension UInt8: Orderable {}

extension Double: Orderable {}
extension Float: Orderable {}
extension Float80: Orderable {}


extension Bool: Comparable, Orderable {}

public func < (x: Bool, y: Bool) -> Bool {
  switch (x, y) {
  case (false, true): return true
  default: return false
  }
}
