//  Copyright © 2016 Al Skipp. All rights reserved.

import XCTest
import Monoid

class AnyMonoidTests: XCTestCase {

  func testMempty() {
    XCTAssertTrue(Any.mempty.value == false)
  }

  func testMappend() {
    XCTAssertTrue(Any(true) <> Any(true) <> Any(true) == Any(true))
    XCTAssertTrue(Any(false) <> Any(true) <> Any(false) == Any(true))
    XCTAssertTrue(Any(false) <> Any(false) <> Any(false) == Any(false))
  }

  func testMconcat() {
    XCTAssertTrue(.mconcat([Any(true), Any(true), Any(true)]) == Any(true))
    XCTAssertTrue(.mconcat([Any(false), Any(false), Any(true)]) == Any(true))
    XCTAssertTrue(.mconcat([Any(false), Any(false), Any(false)]) == Any(false))
  }

  func testComparable() {
    XCTAssertTrue(Any(false) < Any(true))
  }

  func testDescription() {
    XCTAssertTrue(Any(true).description == "Any(true)")
  }

}
