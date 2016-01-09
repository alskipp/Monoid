//  Copyright © 2016 Al Skipp. All rights reserved.

import XCTest
import Monoid

class DownTests: XCTestCase {

  func testComparison() {
    XCTAssertTrue(Down(2) < Down(1))
    XCTAssertTrue(Down("a") > Down("z"))
  }

  func testEquality() {
    XCTAssertTrue(Down(1) == Down(1))
  }

  func testDescription() {
    XCTAssertTrue(Down("a").description == "Down(\("a"))")
  }

}
