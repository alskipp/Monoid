//  Copyright © 2016 Al Skipp. All rights reserved.

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
