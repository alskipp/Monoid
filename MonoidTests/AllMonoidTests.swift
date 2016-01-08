//  Copyright © 2016 Al Skipp. All rights reserved.

import XCTest
import Monoid

class AllMonoidTests: XCTestCase {

  func testMempty() {
    XCTAssertTrue(All.mempty.value == true)
  }
  
  func testMappend() {
    XCTAssertTrue(All(true) <> All(true) <> All(true) == All(true))
    XCTAssertTrue(All(true) <> All(true) <> All(false) == All(false))
  }
  
  func testMconcat() {
    XCTAssertTrue(.mconcat([All(true), All(true), All(true)]) == All(true))
    XCTAssertTrue(.mconcat([All(true), All(false), All(true)]) == All(false))
  }
  
  func testComparable() {
    XCTAssertTrue(All(false) < All(true))
  }
  
  func testDescription() {
    XCTAssertTrue(All(true).description == "All(true)")
  }

}
