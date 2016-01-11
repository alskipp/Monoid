//  Copyright © 2016 Al Skipp. All rights reserved.

extension Array: Monoid {
  public static var mempty: [Element] {
    return []
  }

  public static func combine(a: [Element], _ b: [Element]) -> [Element] {
    return a + b
  }

  // The default mconcat has poor performance as it uses `reduce` to create an Array
  // Using a mutable [] and updating in a loop is significantly more performant
  public static func mconcat(a: [[Element]]) -> [Element] {
    var result: [Element] = []
    a.forEach { e in result += e }
    return result
  }
}
