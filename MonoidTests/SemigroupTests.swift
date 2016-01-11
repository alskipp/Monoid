//  Copyright © 2016 Al Skipp. All rights reserved.

import XCTest
import Monoid

class SemigroupTests: XCTestCase {

  func testSconcat() {
    // unsafe convenience `sconcat` which fails with an empty Array
    XCTAssert(String.sconcat(["a"]) == "a")
    XCTAssert(String.sconcat(["a", "b", "c"]) == "abc")

    // safe version requires an initial value & an Array
    XCTAssert(String.sconcat("a", []) == "a")
    XCTAssert(String.sconcat("a", ["b", "c"]) == "abc")
  }

}
