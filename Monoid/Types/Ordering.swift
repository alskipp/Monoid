//  Copyright © 2016 Al Skipp. All rights reserved.

public enum Ordering: Equatable, Comparable, Orderable {
  case lt, eq, gt
}

public func < (x: Ordering, y: Ordering) -> Bool {
  switch (x, y) {
  case (.lt, .eq), (.lt, .gt), (.eq, .gt): return true
  default: return false
  }
}
