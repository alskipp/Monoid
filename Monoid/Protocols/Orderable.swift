//  Copyright © 2016 Al Skipp. All rights reserved.

public protocol Orderable: Comparable {
  func compare(other: Self) -> Ordering
}

public extension Orderable {
  func compare(other: Self) -> Ordering {
    if self == other { return .EQ }
    if self < other { return .LT }
    return .GT
  }
}
