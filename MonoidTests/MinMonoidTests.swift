//  Copyright © 2016 Al Skipp. All rights reserved.

import XCTest
import Monoid

class MinMonoidTests: XCTestCase {

  func testMempty() {
    XCTAssertTrue(Min<Int>.mempty.value == .none)
  }

  func testMappend() {
    XCTAssertTrue(Min("a") <> Min(.none) <> Min(.none) == Min("a"))
    XCTAssertTrue(Min(.none) <> Min("a") <> Min("z") == Min("a"))
    XCTAssertTrue(Min(.none) <> Min(.none) <> Min("z") == Min("z"))
    XCTAssertTrue(Min(Optional<Int>.none) <> Min(.none) <> Min(.none) == Min(.none))
  }

  func testMconcat() {
    XCTAssertTrue(.mconcat([Min("a"), Min(.none), Min(.none)]) == Min("a"))
    XCTAssertTrue(.mconcat([Min(.none), Min("a"), Min("z")]) == Min("a"))
    XCTAssertTrue(.mconcat([Min(Optional<Int>.none), Min(.none), Min(.none)]) == Min(.none))
  }

  func testComparable() {
    XCTAssertTrue(Min("a") < Min("b"))
    XCTAssertTrue(Min("a") < Min(.none))
  }

  func testDescription() {
    XCTAssertTrue(Min("a").description == "Min(\(Optional("a")))")
  }

}
