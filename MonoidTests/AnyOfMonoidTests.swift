//  Copyright © 2016 Al Skipp. All rights reserved.

import XCTest
import Monoid

class AnyOfMonoidTests: XCTestCase {

  func testMempty() {
    XCTAssertTrue(AnyOf.mempty.value == false)
  }

  func testMappend() {
    XCTAssertTrue(AnyOf(true) <> AnyOf(true) <> AnyOf(true) == AnyOf(true))
    XCTAssertTrue(AnyOf(false) <> AnyOf(true) <> AnyOf(false) == AnyOf(true))
    XCTAssertTrue(AnyOf(false) <> AnyOf(false) <> AnyOf(false) == AnyOf(false))
  }

  func testMconcat() {
    XCTAssertTrue(.mconcat([AnyOf(true), AnyOf(true), AnyOf(true)]) == AnyOf(true))
    XCTAssertTrue(.mconcat([AnyOf(false), AnyOf(false), AnyOf(true)]) == AnyOf(true))
    XCTAssertTrue(.mconcat([AnyOf(false), AnyOf(false), AnyOf(false)]) == AnyOf(false))
  }

  func testComparable() {
    XCTAssertTrue(AnyOf(false) < AnyOf(true))
  }

  func testDescription() {
    XCTAssertTrue(AnyOf(true).description == "AnyOf(true)")
  }

}
