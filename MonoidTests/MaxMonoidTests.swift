//  Copyright © 2016 Al Skipp. All rights reserved.

import XCTest
import Monoid

class MaxMonoidTests: XCTestCase {

  func testMempty() {
    XCTAssertTrue(Max<Int>.mempty.value == .none)
  }

  func testMappend() {
    XCTAssertTrue(Max("a") <> Max(.none) <> Max(.none) == Max("a"))
    XCTAssertTrue(Max(.none) <> Max("a") <> Max("z") == Max("z"))
    XCTAssertTrue(Max(.none) <> Max(.none) <> Max("z") == Max("z"))
    XCTAssertTrue(Max(Optional<Int>.none) <> Max(.none) <> Max(.none) == Max(.none))
  }

  func testMconcat() {
    XCTAssertTrue(.mconcat([Max("a"), Max(.none), Max(.none)]) == Max("a"))
    XCTAssertTrue(.mconcat([Max(.none), Max("a"), Max("z")]) == Max("z"))
    XCTAssertTrue(.mconcat([Max(Optional<Int>.none), Max(.none), Max(.none)]) == Max(.none))
  }

  func testComparable() {
    XCTAssertTrue(Max("a") < Max("b"))
    XCTAssertTrue(Max(.none) < Max("a"))
  }

  func testDescription() {
    XCTAssertTrue(Max("a").description == "Max(\(Optional("a")))")
  }
  
}
