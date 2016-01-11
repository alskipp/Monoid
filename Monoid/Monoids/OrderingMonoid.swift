//  Copyright © 2016 Al Skipp. All rights reserved.

extension Ordering: Monoid {
  public static var mempty: Ordering {
    return .EQ
  }

  public static func combine(a: Ordering, _ b: Ordering) -> Ordering {
    switch (a, b) {
    case (.EQ, _): return b
    default: return a
    }
  }
}
