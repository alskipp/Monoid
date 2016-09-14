//  Copyright © 2016 Al Skipp. All rights reserved.

public protocol Orderable: Comparable {
  func compare(_ other: Self) -> Ordering
}

public extension Orderable {
  func compare(_ other: Self) -> Ordering {
    if self == other { return .eq }
    if self < other { return .lt }
    return .gt
  }
}
