//  Copyright © 2016 Al Skipp. All rights reserved.


// Extension to allow sort by **Ordering**

public extension SequenceType {
  func sortBy(@noescape f: (Generator.Element, Generator.Element) -> Ordering) -> [Generator.Element] {
    return sort { f($0, $1) == .LT }
  }
}
