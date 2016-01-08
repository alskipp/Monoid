//  Copyright © 2016 Al Skipp. All rights reserved.

import XCTest
import Monoid

class MinMonoidTests: XCTestCase {

  func testMempty() {
    XCTAssertTrue(Min<Int>.mempty.value == .None)
  }

  func testMappend() {
    XCTAssertTrue(Min("a") <> Min(.None) <> Min(.None) == Min("a"))
    XCTAssertTrue(Min(.None) <> Min("a") <> Min("z") == Min("a"))
    XCTAssertTrue(Min(.None) <> Min(.None) <> Min("z") == Min("z"))
    XCTAssertTrue(Min(Optional<Int>.None) <> Min(.None) <> Min(.None) == Min(.None))
  }

  func testMconcat() {
    XCTAssertTrue(.mconcat([Min("a"), Min(.None), Min(.None)]) == Min("a"))
    XCTAssertTrue(.mconcat([Min(.None), Min("a"), Min("z")]) == Min("a"))
    XCTAssertTrue(.mconcat([Min(Optional<Int>.None), Min(.None), Min(.None)]) == Min(.None))
  }

  func testComparable() {
    XCTAssertTrue(Min("a") < Min("b"))
    XCTAssertTrue(Min("a") < Min(.None))
  }

  func testDescription() {
    XCTAssertTrue(Min("a").description == "Min(\(Optional("a")))")
  }

}
