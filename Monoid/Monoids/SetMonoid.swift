//  Copyright © 2016 Al Skipp. All rights reserved.

extension Set: Monoid {
  public static var mempty: Set {
    return Set()
  }

  public static func combine(_ a: Set, _ b: Set) -> Set {
    return a.union(b)
  }

  // Using a mutable Set to improve performance
  public static func mconcat(_ a: [Set]) -> Set {
    var result = Set()
    a.forEach { e in result.formUnion(e) }
    return result
  }
}
