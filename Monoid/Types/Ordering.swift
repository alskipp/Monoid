//  Copyright © 2016 Al Skipp. All rights reserved.

public enum Ordering: Equatable, Comparable, Orderable {
  case LT, EQ, GT
}

public func < (x: Ordering, y: Ordering) -> Bool {
  switch (x, y) {
  case (.LT, .EQ), (.LT, .GT), (.EQ, .GT): return true
  default: return false
  }
}
