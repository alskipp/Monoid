//  Copyright © 2016 Al Skipp. All rights reserved.

extension Ordering: Monoid {
  public static var mempty: Ordering {
    return .equal
  }

  public static func combine(_ a: Ordering, _ b: Ordering) -> Ordering {
    switch (a, b) {
    case (.equal, _): return b
    default: return a
    }
  }
}
