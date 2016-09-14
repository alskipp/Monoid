//  Copyright © 2016 Al Skipp. All rights reserved.

extension String: Monoid {
  public static var mempty: String {
    return ""
  }

  public static func combine(_ a: String, _ b: String) -> String {
    return a + b
  }

  // The default mconcat uses `reduce` and has to create and dispose of Strings each iteration
  // Using a mutable "" and updating in a loop is more efficient
  public static func mconcat(_ a: [String]) -> String {
    var result = ""
    a.forEach { s in result += s }
    return result
  }
}
