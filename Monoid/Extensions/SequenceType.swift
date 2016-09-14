//  Copyright © 2016 Al Skipp. All rights reserved.


// Extension to allow sort by **Ordering**

public extension Sequence {
  func sortBy(_ f: (Iterator.Element, Iterator.Element) -> Ordering) -> [Iterator.Element] {
    return sorted { f($0, $1) == .lt }
  }
}
