//  Copyright © 2016 Al Skipp. All rights reserved.

public enum Ordering: Equatable, Comparable, Orderable {
  case less, equal, greater
}

public func < (x: Ordering, y: Ordering) -> Bool {
  switch (x, y) {
  case (.less, .equal), (.less, .greater), (.equal, .greater): return true
  default: return false
  }
}
