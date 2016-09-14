//  Copyright © 2016 Al Skipp. All rights reserved.

import XCTest
import Monoid

class FirstMonoidTests: XCTestCase {

  func testMempty() {
    XCTAssertTrue(First<Int>.mempty.value == .none)
  }

  func testMappend() {
    XCTAssertTrue(First("a") <> First(.none) <> First(.none) == First("a"))
    XCTAssertTrue(First(.none) <> First("a") <> First("z") == First("a"))
    XCTAssertTrue(First(.none) <> First(.none) <> First("z") == First("z"))
    XCTAssertTrue(First(Optional<Int>.none) <> First(.none) <> First(.none) == First(.none))
  }

  func testMconcat() {
    XCTAssertTrue(.mconcat([First("a"), First(.none), First(.none)]) == First("a"))
    XCTAssertTrue(.mconcat([First(.none), First("a"), First("z")]) == First("a"))
    XCTAssertTrue(.mconcat([First(Optional<Int>.none), First(.none), First(.none)]) == First(.none))
  }

  func testDescription() {
    XCTAssertTrue(First("a").description == "First(\(Optional("a")))")
  }

}
